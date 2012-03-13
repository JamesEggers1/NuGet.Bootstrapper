# NuGet.Bootstrapper

## Overview

This project is to create a PowerShell module that enhances NuGet's package management console and allow for bulk package installation from the console window.  Currently, when a person starts a new project in Visual Studio, the developer has to manually install any packages by hand, individually via the Package Management Console prompt or through the Manage Packages dialog window.  NuGet.Bootstrapper aims to allow developers to create a packages.bootstrap file that represent the packages he or she wishes to install in their new project, run one command, and all of the packages in that file are installed into the project.

## Planned Concept

The concept is fairly simple.  Like Ruby's Gems, Node's NPM, and Python's PIP, I would like be able able to create a package manifest file that I can add to my .Net projects, type a simple command, and have the packages installed unto my project.  Since the Package Manager Console inside of Visual Studio is PowerShell, it makes the most sense to me to create a PowerShell Module that can be installed and ran from that console.

## Current Iteration

Since this project is still very young, the PowerShell module isn't ready to be created yet.  In it's place is the proof of concept PowerShell script that I'm building from.

## (Current) Usage Workflow

1. 	Create a new Project in Visual Studio
2.		Add/Copy the packages.bootstrap file containing your standard packages to the project.
3. 	Open Package Management Console
4. 	`cd <projectName>`
5. 	`.\NuGet.BootStrapper.ps1`

## Packages.Bootstrap

The packages.bootstrap file should be located in the project directory for which it'll update.  It follows the same xml syntax rules as the packages.config file that NuGet maintains normally.

Below is an example of the packages.bootstrap file:

	<?xml version="1.0" encoding="utf-8"?>
	<packages>
		<package id="Moq" version="4.0.10827" />
		<package id="ShouldFluent" version="1.1.12.0" />
		<package id="Unity" version="2.1.505.0" />
		<package id="jQuery" version="1.7.1" />
	</packages>
	
When the (current) script is ran and finds this file, it'll install the 4 packages automatically for you.  In addition, it'll properly add the references to the project file and run any scripts the packages contain that add/update files of the project (i.e. jQuery adds the Scripts directory and adds 3 jQuery scripts into it.).

## Contributors
[James Eggers](https://github.com/jameseggers1)
[Joshua Poehls](https://github.com/jpoehls)