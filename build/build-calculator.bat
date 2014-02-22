ECHO "Building calculator"
rd .\build\Calculator /S /Q
mkdir .\build\Calculator\interfaces\root
msbuild .\src\CalculatorDemo\CalculatorDemo.sln
xcopy .\src\calculatordemo\calculatordemo\*.* .\build\Calculator\interfaces\root /I /S /-Y
copy .\src\calculatordemo\DeploymentManifest.xml .\build\Calculator /Y
del .\build\Calculator.zip
cd .\build\Calculator
"C:\Program Files\7-Zip\7z.exe" a -tZip -y build\Calculator.zip build\Calculator\*
cd ..
cd ..