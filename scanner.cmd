chcp 65001>nul

for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
  if exist "%%i:\" (
    start /d "%~dp0" /b /wait cmd /q /c "chcp 65001>nul & dir %%i:\ /a:%1 /s /b>>%2"
    for /l %%i in (5,-1,1) do echo.>>%2
  )
)