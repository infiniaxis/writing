dir *.md | ForEach -process { pandoc -s -f markdown --wrap=preserve --filter pandoc-fignos -o ($_.BaseName+".rst") $_.Name metadata.yaml}
mv *.rst ..\..\rtd\ncbf\ -Force
copy _static\*.* ..\..\rtd\ncbf\_static\ -Force
cd ..\..\rtd\ncbf
.\make.bat html
cd ..\..\writing\ncbf
# Invoke-Item ..\..\rtd\ncbf\_build\html\index.html
