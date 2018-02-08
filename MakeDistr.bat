
set TEMP_FOLDER="C:\VFPPRJ\TEMP\"
set DISTR_FOLDER="C:\VFPPRJ\RELEASE\JD\“αβ ­®Άª  ‘„+\"
set ZIP_COMMAND="C:\Program Files\7-Zip\7z"


mkdir %TEMP_FOLDER%"SPR\" 

xcopy *.exe %TEMP_FOLDER%"SPR\" /Y 
xcopy *.dll %TEMP_FOLDER%"SPR\" /Y 
xcopy *.ini %TEMP_FOLDER%"SPR\" /Y 

xcopy .\Classes\genrep_new.dll %TEMP_FOLDER%"SPR\Classes\" /Y
xcopy .\Classes\genrep_old.dll %TEMP_FOLDER%"SPR\Classes\" /Y
xcopy .\Classes\*.ocx %TEMP_FOLDER%"SPR\Classes\" /Y

del .\FreeTables\_*.dbf /Y
del .\FreeTables\*.tmp /Y
del .\FreeTables\*.bak /Y
xcopy .\FreeTables\*.dbf %TEMP_FOLDER%"SPR\FreeTables\" /Y
xcopy .\FreeTables\*.fpt %TEMP_FOLDER%"SPR\FreeTables\" /Y

xcopy .\Templates %TEMP_FOLDER%"SPR\Templates\" /Y

del /Q .\Reports\*.* 
mkdir %TEMP_FOLDER%"SPR\Reports\" 



cd %TEMP_FOLDER%
%ZIP_COMMAND% a -tzip SPR.jar .\SPR

move /Y .\SPR.jar %DISTR_FOLDER% 

cd %DISTR_FOLDER%

%ZIP_COMMAND% a  ..\SPR.zip

copy /B ..\7zS.sfx + ..\config.txt + ..\SPR.zip ..\try.exe

del ..\SPR.zip