@echo off

set target_dir_path=%1

if "%target_dir_path%"=="" (
    echo.
    echo �����N��̃f�B���N�g���p�X���w�肵�Ă��������B�i��^: %%USERPROFILE%%^\scoop^\apps^\cmder-full^\^<version^>^\vendor^\conemu-maximus5�j
    exit /b 1
)

if not exist "%target_dir_path%" (
    echo.
    echo ���݂���f�B���N�g���p�X���w�肵�Ă��������B
    exit /b 1
)

set current_dir_path=%~dp0
set target_file_name=ConEmu.xml

set work1=%target_dir_path:"=%
set work2=%work1%\
set adjusted_target_dirpath=%work2:\\=\%

set target_file_path=%adjusted_target_dirpath%%target_file_name%

if exist %target_file_path% (
    echo �����N��ɂ��łɃt�@�C�������݂��Ă��܂��B
    set /p exec_delete_file="�t�@�C�����폜���Ă���낵���ł����H�iy/N�j"
    if not "%exec_delete_file%"=="y" (
        echo �����𒆒f���܂��B
        exit /b 0
    )
    del /q %target_file_path%
)

mklink %target_file_path% %current_dir_path%%target_file_name%

pause
