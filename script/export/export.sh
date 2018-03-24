#!/bin/sh
#            _ __ _
#        ((-)).--.((-))
#        /     ''     \
#       (   \______/   )
#        \    (  )    /
#        / /~~~~~~~~\ \
#   /~~\/ /          \ \/~~\
#  (   ( (            ) )   )
#   \ \ \ \          / / / /
#   _\ \/  \.______./  \/ /_
#   ___/ /\__________/\ \___
#  *****************************

#SCRIPT CALL :
#export.sh ProjectPath sourceFolder webFolder outputFolder

#EXEMPLE :
#export.sh /opt/web/symfony/Symfony_TestProject src public output
#
# If trouble with ^M in file this is the command to remove them all :
# remove ^M : sed -i -e "s/\r//g" filename

# GLOBAL CONFIG VARS
# -------------------------
# project path
vendor="/opt/web/tool/TEST/vendor"
index="index.html"
# -------------------------

# GLOBAL ARGUMENTS
# -------------------------
# project path
project=$1
# project file path to analyze
src=$2
# project file path to analyze
web=$3
# project output path
out=$4
# -------------------------

# EXEMPLE :
# -------------------------
# set project=/opt/web/symfony/Symfony_TestProject
# set src=src
# set web=public
# set out=output
# -------------------------

# VARIABLE REWRITE
# -------------------------
srcfull=${project}/${src}
webfull=${project}/${web}
outfull=${project}/${web}/${out}
export=${outfull}/${index}
# -------------------------

echo " "
echo "##################"
echo "## SCRIPT START ##"
echo "##################"
echo " "

mkdir -p ${outfull}

echo "<html><body>" > $export

echo "------------------------------"
echo "----Processing PHP Metrics----"
echo "------------------------------"
echo " "
echo "${vendor}/phpmetrics/phpmetrics/bin/phpmetrics --report-html=${outfull}/phpmetrics ${srcfull}"
echo " "
php ${vendor}/phpmetrics/phpmetrics/bin/phpmetrics --report-html=${outfull}/phpmetrics ${srcfull}
echo "<h1>PHP Metrics</h1>" >> ${export}
echo "<a href=\"/${out}/phpmetrics/index.html\">PHP Metrics results</a>" >> ${export}

echo "------------------------------"
echo "--Processing PHP CodeSniffer--"
echo "------------------------------"
echo " "
echo "${vendor}/squizlabs/php_codesniffer/bin/phpcs -s --standard=PSR2 --report=summary ${srcfull}"
echo " "
echo "<h1>PHP CodeSniffer</h1>" >> ${export}
echo "<pre>" >> ${export}
php ${vendor}/squizlabs/php_codesniffer/bin/phpcs -s --standard=PSR2 --report=summary ${srcfull} >> ${export}
echo "</pre>" >> ${export}

echo "------------------------------------"
echo "--Processing PHP CopyPasteDetector--"
echo "------------------------------------"
echo " "
echo "${vendor}/sebastian/phpcpd/phpcpd ${srcfull}"
echo " "
echo "<h1>PHP CopyPasteDetector</h1>" >> ${export}
echo "<pre>" >> ${export}
php ${vendor}/sebastian/phpcpd/phpcpd ${srcfull} >> ${export}
echo "</pre>" >> ${export}

echo "------------------------------"
echo "-Processing  PHP MessDetector-"
echo "------------------------------"
echo " "
echo "php ${vendor}/phpmd/phpmd/src/bin/phpmd ${srcfull} text cleancode,codesize,controversial,design,naming,unusedcode"
echo " "
echo "<h1>PHP MessDetector</h1>" >> ${export}
echo "<pre>" >> ${export}
php ${vendor}/phpmd/phpmd/src/bin/phpmd ${srcfull} text cleancode,codesize,controversial,design,naming,unusedcode >> ${export}
echo "</pre>" >> ${export}

echo "------------------------------"
echo "----Processing  PHP Depend----"
echo "------------------------------"
echo " "
echo "php ${vendor}/pdepend/pdepend/src/bin/pdepend --summary-xml=${outfull}/summary.xml --jdepend-chart=${outfull}/jdepend.svg --overview-pyramid=${outfull}/pyramid.svg ${srcfull}"
echo " "
echo "<h1>PHP Depend</h1>" >> ${export}
php ${vendor}/pdepend/pdepend/src/bin/pdepend --summary-xml=${outfull}/summary.xml --jdepend-chart=${outfull}/jdepend.svg --overview-pyramid=${outfull}/pyramid.svg ${srcfull}
echo "<h2>Depend</h2>" >> ${export}
echo "<img src=\"/${out}/jdepend.svg\"/>" >> ${export}
echo "<h2>Pyramid</h2>" >> ${export}
echo "<img src=\"/${out}/pyramid.svg\"/>" >> ${export}

echo "</body></html>" >> ${export}

echo " "
echo "#################"
echo "## SCRIPT DONE ##"
echo "#################"
echo " " 
echo "Result should be available at the url /${out}/%index% of your project"