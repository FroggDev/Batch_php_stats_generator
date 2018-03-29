@echo off

set selenium=C:\dev\tool\selenium\selenium-server-standalone.jar

IF EXIST %selenium% (
java -jar %selenium%
) else (
echo file %selenium% not found.
)