        @echo off
        for %%a in ("%CD%") do set "PARENT_FOLDER=%%~nxa"
        title %PARENT_FOLDER%

        set GITBRANCH=
        for /f "tokens=2" %%I in ('git.exe branch 2^> NUL ^| findstr /b "* "') do set GITBRANCH=%%I

        set ELEVATED=
        net.exe session 1>NUL 2>NUL && set ELEVATED=1

        if "%ELEVATED%" == "" (
            if "%GITBRANCH%" == "" (
                prompt $E[30;44m$S$E[0m$E[30;44m$P$S$E[0m$E[34m$E[0m$S
            ) else (
                prompt $E[30;44m$S$E[0m$E[30;44m$P$S$E[0m$E[34;43m$S$E[0m$E[30;43m%GITBRANCH%$S$E[0m$E[33m$E[0m$S
            )
        ) else (
            if "%GITBRANCH%" == "" (
                prompt $E[30;41m$S$E[0m$E[30;41m$P$S$E[0m$E[31m$E[0m$S
            ) else (
                prompt $E[30;41m$S$E[0m$E[30;41m$P$S$E[0m$E[31;43m$S$E[0m$E[30;43m%GITBRANCH%$S$E[0m$E[33m$E[0m$S
            )
        )
