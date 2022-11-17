        @echo off
        for %%a in ("%CD%") do set "PARENT_FOLDER=%%~nxa"
        title %PARENT_FOLDER%

        set GITBRANCH=
        for /f "tokens=2" %%I in ('git.exe branch 2^> NUL ^| findstr /b "* "') do set GITBRANCH=%%I

        set ELEVATED=
        net.exe session 1>NUL 2>NUL && set ELEVATED=1

        chcp 65001 1>NUL 2>NUL
        if "%ELEVATED%" == "" (set CLR=44) else (set CLR=41)
        if "%GITBRANCH%" == "" (SET GIT=) else (set GIT=;43m$S$E[0m$E[30;43m%GITBRANCH%$S$E[0m$E[33m)

        prompt $E[30;%CLR%m$S$E[0m$E[30;%CLR%m$P$S$E[0m$E[31m%GIT%$E[0m$S

        chcp 850 1>NUL 2>NUL
