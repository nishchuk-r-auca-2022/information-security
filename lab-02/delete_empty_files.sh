if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir=$1

if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' not found!"
    exit 1
fi

find "$dir" -type f -empty -print -delete
echo "Empty files deleted."
