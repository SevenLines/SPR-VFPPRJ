LParameters pString, pPointer, RetArray

Local lcString, lcPos, lcElem, lcECount, lcPointer
lcString = UPPER(pString)
lcPointer = UPPER(pPointer)
lcPos = AT(lcPointer, lcString)
lcECount = 1

do while lcPos > 0
 lcElem = LEFT(lcString, lcPos-1)
 DIMENSION RetArray[lcECount]
 RetArray[lcECount] = trim(lcElem)
 lcString = RIGHT(lcString, Len(lcString)-Len(lcElem)-Len(pPointer))
 lcECount = lcECount + 1
 lcPos = AT(lcPointer, lcString)
enddo
DIMENSION RetArray[lcECount]
RetArray[lcECount] = lcString

return .T.
