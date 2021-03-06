IMAGE=$1
if [ -z "$IMAGE" ]; then
    echo "IMAGE is empty"
    echo usage: $0 image style style_index
    echo e.g: $0 artist/input/tree.jpg varied 24
    echo ""
    echo "image is the path to an image file."
    echo "style can be monet or varied."
    echo "style_index from 0 to 9 for monet, and from 0 to 30 for varied."
    exit 1
fi

STYLE=$2
if [ -z "$STYLE" ]; then
    echo "STYLE is empty, defaulting to varied"
    STYLE="varied"
fi

STYLE_INDEX=$3
if [ -z "$STYLE_INDEX" ]; then
    echo "STYLE_INDEX is empty, defaulting to 1"
    STYLE_INDEX=1
fi

$(eval "curl -X POST -H X-style-name:$STYLE -H X-style-index:$STYLE_INDEX --data-binary @$IMAGE 'http://localhost:8080/function/artist' > styled/""$STYLE""_""$STYLE_INDEX""_""$(basename $IMAGE)" 2>/dev/null)
