SOURCE="pages/"
COMPONENTS="components/*"
BUILD_DIR="build"

for FILE in $(find $SOURCE -name '*.html' -not -path 'components/*'); do
  OUT_FILE="$(echo "$FILE" | sed 's|pages/||g')"
  echo "Creating: $BUILD_DIR/$(dirname $OUT_FILE)"
  mkdir -p "$BUILD_DIR/$(dirname $OUT_FILE)"
  cat "$FILE" > "$BUILD_DIR/$OUT_FILE"
done

for COMPONENT in $(find $COMPONENTS -name '*.html')
do
  echo "Processing Component: $COMPONENT"
  COMPONENT_BASENAME=$(basename $COMPONENT .html)
  for FILE in $(find $BUILD_DIR -name '*.html'); do
    echo "Processing Page: $FILE"
    sed -i "s|{{${COMPONENT_BASENAME}}}|cat ${COMPONENT}|e" $FILE
  done
done
