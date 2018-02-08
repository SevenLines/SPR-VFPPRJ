LParameters Phrase, OptLen

Local i, PhLen, lcchar, lcKOL, RetPhrase, notAv
Local curword 

if empty(OptLen)
 OptLen = 0
endif

curword = ""
RetPhrase = ""
lcchar = ""
notAv = .F.
i = len(Phrase)
if i <= OptLen
 i = 0
 RetPhrase = Phrase
endif
do while i > 0 
 lcchar = substr(Phrase, i, 1)
 lcKOL = KindOfLetter(lcchar)
 if lcKOL < 0
  if notAv or len(curword) < 5 && curword - сокращение
   RetPhrase = curword + RetPhrase
  else  
   RetPhrase = getshort(curword) + RetPhrase 
   if len(left(Phrase,i))+len(RetPhrase) <= OptLen
    exit
   endif
  endif 
  RetPhrase = lcchar + RetPhrase
  curword = ""
  if lcKOL = -2 
   notAv = .T.
  else
   notAv = .F. 
  endif
 else
  curword = lcchar + curword 
 endif

 i = i - 1 
enddo

if i = 0
 if empty(curword)
  RetPhrase = iif(empty(lcchar),"",lcchar) + curword + RetPhrase
 else
  if notAv and len(curword) < 6 && curword - сокращение
   RetPhrase = curword + RetPhrase
  else  
   RetPhrase = getshort(curword) + RetPhrase 
  endif 
 endif 
else
 RetPhrase = left(Phrase,i) + RetPhrase
endif
return RetPhrase