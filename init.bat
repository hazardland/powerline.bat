        @echo off
        chcp 65001 >> nul
        set ELEVATED=
        net.exe session 1>NUL 2>NUL && set ELEVATED=1
        set POWERLINE_DIR=%~dp0
        doskey git=%POWERLINE_DIR%\_git.bat $*
        doskey cd=%POWERLINE_DIR%\_cd.bat $*
        %POWERLINE_DIR%\_set.bat
