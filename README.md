# phpStorm_configuration
Portable configuration for phpStorm for Windows or Linux.

more information on phpSotrm configuration : https://tool.frogg.fr/phpStorm

# description
The goal is to have : 
- composer.json with main dev tools (php metrics, phpcs, phpmd, ...) 
- usefull scripts (clean cache for symfony & source code statistics)
- minification (scss, min.css, min.js)
- the main binaries composer, git, php, gem, npm  (for Windows)
- you can even add your portable tools in an extra tool folder (like commander, putty, etc ...)

I choose to use DEV composer component but it can be change in composer.json

* more information on composer :  https://tool.frogg.fr/composer
* more information on phpSotrm :  https://tool.frogg.fr/phpStorm


# folders structure
```
dev/
+-- composer.json
+-- composer.lock
+-- settings.jar
+-- bin/
+-- script/
+-- vendor/
+-- tool/ (optional)
```
# Windows 'bin\' folder structure

/!\ this folder is only for Windows /!\
```
bin/
+-- add2path.bat
¦
+-- node/
¦   +-- npm
¦
+--ruby/
¦   +-- bin/
¦       +-- gem
¦
+-- composer/
¦   +-- composer.phar
¦   +-- composer.bat
¦
+-- git/
¦   +-- bin/
¦   ¦   +-- git.exe
¦   ¦   +-- (...)
¦   +-- (...)
¦
+-- php/
    +-- php.exe
    +-- (...)
    +-- ext/
        +-- php_xdebug.dll
        +-- (...)
```
The script add2path.bat	add automatically this structure to the PATH

# Scripts as external tools

- _cleanAll.bat	& _cleanAll.sh (cleanning symfony cache)
- export.bat & export.sh (exporting source code statistics)
	

# INSTALLATION

1- Copy project file to c:\dev

2- install composer component
```
composer install
```

3- install missing bin 
- PHP, Composer, Git installation : https://tool.frogg.fr/dev_tools/phpStorm_main_tool		
		
4- Import phpStorm settings
main settings : phpStorm_settings/phpSotrm_settings(windows).jar

5- Manual Plugins install
https://tool.frogg.fr/dev_tools/phpStorm_symfony

# BONUS INSTALLATION (optional)

##watcher settings
import file: phpSotrm_watchers.xml

install ruby & npm : https://tool.frogg.fr/dev_tools/phpStorm_more

## TODO: BeHat tools

# UPDATING
```
composer update
```
