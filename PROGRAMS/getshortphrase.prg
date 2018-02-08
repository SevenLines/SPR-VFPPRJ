LParameters pPhrase, pOptLen

Local lcLastSelect
Local i, lcPhLen, curword, currest, lcShort, lcNumWords
Local lcKOL, lastKOL
Local i, lcchar, lcKOL, RetPhrase
Local wordscur

RetPhrase = pPhrase
if len(RetPhrase) < pOptLen
 return RetPhrase
endif


lcLastSelect = select()
* Создаем таблицу слов
wordscur = sys(2015)
CREATE TABLE (wordscur) (word C(200), restword C(200), isshort L)

lcPhLen = len(pPhrase)
curword = ""
currest = ""
i = 1
lastKOL = 1
do while i <= lcPhLen + 1
 if i > lcPhLen
  lcKOL = 0
 else
  lcchar = substr(pPhrase, i, 1)
  lcKOL = KindOfLetter(lcchar)
 endif

 if sign(lastKOL) <> sign(lcKOL)
  select (wordscur)
  if lastKOL > 0 
   APPEND BLANK
   REPLACE word WITH curword, isshort WITH iif(lcchar = '.' or upper(curword)==curword, .T., .F.)
   curword = ""
  else
   REPLACE restword WITH Replace(currest, ' ', 'a')
   currest = ""
  endif
 endif
 lastKOL = lcKOL
 if lcKOL < 0
  currest = currest + lcchar
 else
  curword = curword + lcchar
 endif
 i = i + 1
enddo

* Находим слова, которые требуется сокращать в первую очередь
select (wordscur)
go top
scan
 lcShort = GetShortCom(word, .T.)
 if !empty(lcShort)
  REPLACE word WITH lcShort, isshort WITH .T.  
  RetPhrase = GetShortS(wordscur)
  if len(RetPhrase) < pOptLen
   exit
  endif
 endif
endscan

if len(RetPhrase) < pOptLen
 droptable(wordscur)
 select (lcLastSelect)
 return RetPhrase
endif


* Сокращаем все остальные слова, начиная с конца фразы
select (wordscur)
lcNumWords = reccount()
go bottom
for i = 1 to lcNumWords
 select (wordscur)
 curword = rtrim(word)
 if len(curword) >= 5 and !isshort
  REPLACE word WITH GetShort(curword)
  RetPhrase = GetShortS(wordscur)
  if len(RetPhrase) < pOptLen
   exit
  endif
 endif
 skip -1
endfor

RetPhrase = GetShortS(wordscur)
droptable(wordscur)
select (lcLastSelect)
return RetPhrase
