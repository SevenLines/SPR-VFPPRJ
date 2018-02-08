LParameters pTable

Local lcphrase, lcpos
select (pTable)
lcpos = recno()
go top
lcphrase = ""
scan
 lcphrase = lcphrase + rtrim(word) + Replace(rtrim(restword), 'a', ' ')
endscan
go lcpos
return lcphrase
