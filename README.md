# Workflow engine

## Encoding issues

run ```file -bi 2408_24_03_HR_Kulcsbér_ell_2024.07.31.xml``` to check the encoding of a file
if it is iso-8859-1 you can run ```iconv -f WINDOWS-1250 -t UTF-8 2408_24_03_HR_Kulcsbér_ell_2024.07.31.xml > 2408_24_03_HR_Kulcsbér_ell_2024.07.31-uj.xml``` to encode it in utf-8

Also you can use xmllint to format it and encode it in the right encoding:

```
xmllint --format --encode utf-8 2408_24_03_HR_Kulcsbér_ell_2024.07.31.xml > 2408_24_03_HR_Kulcsbér_ell_2024.07.31-format.xml
```

## reformat xml

you can use ```xmllint --format 2408_24_03_HR_Kulcsbér_ell_2024.07.31.xml ``` to format the xml file

## reformat mdf.csv

```conv -f iso-8859-1 -t UTF-8 mdf.csv > mdf-ok.csv```