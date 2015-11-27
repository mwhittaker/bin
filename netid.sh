#! /bin/bash

# A command line utility to convert netids to full names.

set -euo pipefail

usage() {
    echo "usage: netid <netid>..."
}

main() {
    if [[ $# -lt 1 ]]; then
        usage
        exit -1
    fi

    # This is an example of a vcard returned by Cornell's servers:
    #
    #     BEGIN:vCard
    #     VERSION:2.1
    #     FN:Michael John Whittaker
    #     N:Whittaker;Michael;John
    #     ADR;HOME:;;
    #     ADR;WORK:;;
    #     EMAIL;INTERNET:mjw297@cornell.edu
    #     TEL;FAX:
    #     TEL;CELL:
    #     TEL;HOME:
    #     ORG:O;
    #     NICKNAME:
    #     TITLE:
    #     URL:
    #     TEL;PAGER:
    #     NOTE:
    #     TEL;WORK:
    #     END:vCard
    #
    # We simply parse out the FN field.
    for netid in "$@"; do
        vcard=$(curl -s "https://www.cornell.edu/search/vcard.cfm?netid=$netid")
        name=$(echo "$vcard" | sed -n 's/FN:\(.*\)/\1/p')
        echo $name
    done
}

main "$@"
