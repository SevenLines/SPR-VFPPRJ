Lparameters pVacWeeksTbl, pSem
Local lcoldsel, retVal
lcoldsel = select()

retVal = 0
select (pVacWeeksTbl)
locate for sem = pSem

if found()
 retVal = w
endif

select (lcoldsel)

return retVal
