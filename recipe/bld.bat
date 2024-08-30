REM Prepare shortcuts. menuinst v2 shortcuts should only be used startings
REM at menuinst v2.1.1 due to bugs. The post-link script
REM will handle which shortcut to use. One file needs to be the default
REM menu file so that conda picks it up when running menuinst.
IF NOT EXIST %PREFIX%\Menu mkdir %PREFIX%\Menu
copy %RECIPE_DIR%\menu-v1.json %PREFIX%\Menu\%PKG_NAME%_menu-v1.json.bak
copy %RECIPE_DIR%\menu-v2.json %PREFIX%\Menu\%PKG_NAME%_menu-v2.json.bak
copy %RECIPE_DIR%\menu-v2.json %PREFIX%\Menu\%PKG_NAME%_menu.json
copy %RECIPE_DIR%\jupyter.ico %PREFIX%\Menu\
if errorlevel 1 exit 1

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

if errorlevel 1 exit 1

rd /s /q %SCRIPTS%
