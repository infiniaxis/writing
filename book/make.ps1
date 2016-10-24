dir *.md | ForEach -process { pandoc -o ($_.BaseName+".rst") $_.Name }
mv *.rst ..\..\rtd\book-avocet\ -Force
cd ..\..\rtd\book-avocet
.\make.bat html
cd ..\..\writing\book
Invoke-Item ..\..\rtd\book-avocet\_build\html\index.html
