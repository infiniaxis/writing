#!/bin/bash
echo "1. Transform markdown files to reStructuredText files..."
for file in ./*.md
do
	filename=$(basename "$file")
	filename="${filename%.*}"
	extension=".rst"
	pandoc -o "$filename$extension" ${file}
done
echo "2. Move reStructuredText files to the production folder..."
mv -f *.rst ../../rtd/book-avocet/
echo "3. Produce html with Sphinx..."
cd ../../rtd/book-avocet/
make html

echo "4. Detect any argument as git comment..."
size=${#1}
if [ "$size" -eq "0" ]; then
	echo "No Git Comment or Push."
else
	echo "Git Pushing with comment: $1"
	git add .
	git commit -a -m "$1"
	git push
fi

open _build/html/index.html