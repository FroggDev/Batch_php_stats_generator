@echo off
REM             _ __ _
REM         ((-)).--.((-))
REM         /     ''     \
REM        (   \______/   )
REM         \    (  )    /
REM         / /~~~~~~~~\ \
REM    /~~\/ /          \ \/~~\
REM   (   ( (            ) )   )
REM    \ \ \ \          / / / /
REM    _\ \/  \.______./  \/ /_
REM    ___/ /\__________/\ \___
REM   *****************************

REM GLOBAL CONFIG VARS
REM List of folders to add to the PATH (Array separated by spaces !)
REM ================================================================
set LIST2ADD=C:\dev\bin\git\bin C:\dev\bin\php C:\dev\bin\composer
REM ================================================================

REM PREPARATION : Reset & init vars
REM -------------------------------
set "formatedPath="
set "originalPath=%PATH%"

REM STEP 1 : Display information to user
REM ------------------------------------
REM Clean screen
cls
REM ask user
echo You are going to add to the PATH the following folders (press Ctrl+C to cancel) :
REM Display list of folders to add to path
(for %%f in (%LIST2ADD%) do (
   echo - %%f
)) 
REM Make a pause
echo. 
pause
echo. 

REM STEP 2 : Formating informations
REM -------------------------------
REM Adding to path but check if already exist
(for %%a in (%LIST2ADD%) do (
REM Doing concatenation to formatedPath var with list of path to add
call set "formatedPath=%%formatedPath%%%%a;"
REM removing path if already exist to not add it multiple times
call set "originalPath=%%originalPath:%%a;=%%"
))

REM STEP 3 : Updating the PATH
REM --------------------------
set PATH=%originalPath%%formatedPath%
setx PATH %originalPath%%formatedPath%