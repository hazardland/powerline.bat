        @echo off
        for %%a in ("%CD%") do set "PARENT_FOLDER=%%~nxa"
        title %PARENT_FOLDER%

        set GITBRANCH=
        for /f "tokens=2" %%I in ('git.exe branch 2^> NUL ^| findstr /b "* "') do set GITBRANCH=%%I
        set SVNREV=
        for /f %%I in ('svn info --show-item revision 2^> nul') do set SVNREV=%%I

        set ELEVATED=
        net.exe session 1>NUL 2>NUL && set ELEVATED=1

        chcp 65001 1>NUL 2>NUL
        if "%ELEVATED%" == "" (set CLR=4) else (set CLR=1)
        if "%GITBRANCH%" == "" (SET GIT=) else (set GIT=;43m$S$E[0m$E[30;43m%GITBRANCH%$S$E[0m$E[33)
        if "%SVNREV%" == "" (SET SVN=) else (set SVN=;46m$S$E[0m$E[30;46mr.%SVNREV%$S$E[0m$E[36)

        prompt $E[30;4%CLR%m$S$E[0m$E[30;4%CLR%m$P$S$E[0m$E[3%CLR%%GIT%%SVN%m$E[0m$S

        chcp 850 1>NUL 2>NUL

