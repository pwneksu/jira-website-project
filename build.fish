set -l COMPONENTS "components/"
set -l SOURCE "pages/"

echo "========= COMPONENTS START ========="
for FILE in (find $COMPONENTS -name '*.html');
  echo $FILE
end
echo "========= COMPONENTS END ========="

echo "========= pages/ START ========="
for FILE in (find $SOURCE -name '*.html' -not -path 'components/*');
  echo $FILE
end
echo "========= pages/ END ========="
