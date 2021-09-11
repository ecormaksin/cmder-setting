@echo off

set target_dir_path=%1

if "%target_dir_path%"=="" (
    echo.
    echo リンク先のディレクトリパスを指定してください。（例^: %%USERPROFILE%%^\scoop^\apps^\cmder-full^\^<version^>^\vendor^\conemu-maximus5）
    exit /b 1
)

if not exist "%target_dir_path%" (
    echo.
    echo 存在するディレクトリパスを指定してください。
    exit /b 1
)

set current_dir_path=%~dp0
set target_file_name=ConEmu.xml

set work1=%target_dir_path:"=%
set work2=%work1%\
set adjusted_target_dirpath=%work2:\\=\%

set target_file_path=%adjusted_target_dirpath%%target_file_name%

if exist %target_file_path% (
    echo リンク先にすでにファイルが存在しています。
    set /p exec_delete_file="ファイルを削除してもよろしいですか？（y/N）"
    if not "%exec_delete_file%"=="y" (
        echo 処理を中断します。
        exit /b 0
    )
    del /q %target_file_path%
)

mklink %target_file_path% %current_dir_path%%target_file_name%

pause
