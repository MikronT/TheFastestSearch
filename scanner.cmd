chcp 65001>nul

for %%i in (A B C D E F G H J L P Q S U V W X Y Z M I K R O N T) do (
  if exist "%%i:\" (
    start /d "%~dp0" /b /wait cmd /q /c "chcp 65001>nul & dir %%i:\ /a:%1 /s /b>>%2"
    for /l %%i in (5,-1,1) do echo.>>%2
  )
)