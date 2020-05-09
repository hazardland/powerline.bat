@echo off
set POWERLINE_DIR=%CD%
doskey git=%POWERLINE_DIR%\_git.bat $*
doskey cd=%POWERLINE_DIR%\_cd.bat $*
chcp 65001 >> nul
%POWERLINE_DIR%\_set.bat
