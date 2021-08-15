:: Disable echoes
@echo off

:: Global Variables
set qemu_url=https://github.com/AskarKani/qemu.git
set freertos_url=https://github.com/joechz/FreeRTOS.git
set branch_name=st_cm4_gen

:: Disable strict key checks as FreeRTOS cloning is failing
echo | set /p="Checking StrictHostKeyChecking in ~/.ssh/config ... "
findstr "StrictHostKeyChecking no" %HOMEDRIVE%%HOMEPATH%\.ssh\config
if %errorlevel% == 0 (
  rem echo Ok!
) else (
  echo No! Adding StrictHostKeyChecking = no for github.com!
  echo Host github.com\n\tStrictHostKeyChecking no >> %HOMEDRIVE%%HOMEPATH%\.ssh/config
)

:: Clone Repos
echo | set /p="Checking for Qemu ... "
if not exist qemu (
  git clone %qemu_url% --branch %branch_name%
) else (
  echo "Found!" 
)
echo | set /p="Checking for FreeRTOS ... "
if not exist FreeRTOS (
  echo "git clone %freertos_url% --branch %branch_name% --recurse-submodules"
  git clone %freertos_url% --branch %branch_name% --recurse-submodules
) else (
  echo "Found!" 
)


:: Check for build tools installation
echo | set /p="Checking for ARM compiler installation ..."
where arm-none-eabi-gcc >nul 2>&1 && (
	echo "Found!"
) || (
	echo "Error! ARM Compiler not installed!"
	goto:eof
)

echo | set /p="Checking if make is installed ..."
where make >nul 2>&1 && (
	echo "Found!"
) || (
	echo "Error! GNU Make is not installed!"
	goto:eof
)

echo .
echo ######################################################
echo ##  STM32 QEMU Virtual Platform is ready to build!  ##
echo ######################################################