#! /bin/sh

usage() {
    echo "usage:"
    echo "    gitdown <markdown file>"
}

if test $# -lt 1; then
    usage;
    exit;
fi

echo '<head>'
echo '    <link rel="stylesheet" type="text/css" href="http://gist.githubusercontent.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css">'
echo '</head>'

markdown "$1"
