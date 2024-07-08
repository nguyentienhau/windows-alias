@echo off

set venv_dir=.\.venv
set activate=%venv_dir%\Scripts\activate.bat
set deactivate=%venv_dir%\Scripts\deactivate.bat

if "%1" == "help" (
	echo Usage: venv ^<command^>
	echo Some useful venv commands are:
	echo     help        Show python venv help screen
	echo     commands    List all available venv commands
	echo     init        Initialize new virtual environment
	echo     on          Turn on current virtual environment
	echo     off         Turn off current virtual environment
	echo     remove      Remove current virtual environment
	echo For full documentation, see: https://docs.python.org/3/library/venv.html         
) else if "%1" == "commands" (
	echo Some useful venv commands are:
	echo     help        Show python venv help screen
	echo     commands    List all available venv commands
	echo     init        Initialize new virtual environment
	echo     on          Turn on current virtual environment
	echo     off         Turn off current virtual environment
	echo     remove      Remove current virtual environment
) else if "%1" == "init" (
	python -m venv .venv
	echo Virtual environment has been initialized
) else if exist %venv_dir% (
	if "%1" == "on" (
		if exist %activate% (
			%activate%
			echo Virtual environment is on
		) else (
			echo python venv: %activate% not found
			echo Error when initialize virtual environment
		)
	) else if "%1" == "off" (
		if exist %deactivate% (
			%deactivate%
			echo Virtual environment is off
		) else (
			echo python venv: %deactivate% not found
			echo Error when initialize virtual environment
		)
	) else if "%1" == "remove" (
		venv off
		rmdir /s %venv_dir%
	) else (
		echo python venv: no such command "%1"
	)
) else (
	echo python venv: %venv_dir% not found
	echo Use command "venv init" to initialize new virtual environment
)

exit /b
