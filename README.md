# NuGet.Bootstrapper

## Overview

This project is to create a PowerShell module that enhances NuGet's package management console and allow for bulk package installation from the console window.  Currently, when a person starts a new project in Visual Studio, the developer has to manually install any packages by hand, individually via the Package Management Console prompt or through the Manage Packages dialog window.  NuGet.Bootstrapper aims to allow developers to create a packages.bootstrap file that represent the packages he or she wishes to install in their new project, run one command, and all of the packages in that file are installed into the project.

## Packages.Bootstrap

The packages.bootstrap file should be located in the project directory for which it'll update.  It follows the same xml syntax rules as the packages.config file that NuGet maintains normally.

Below is an example of the packages.bootstrap file:

'<?xml version="1.0" encoding="utf-8"?>
<packages>
	<package id="Moq" version="4.0.10827" />
	<package id="ShouldFluent" version="1.1.12.0" />
	<package id="Unity" version="2.1.505.0" />
	<package id="jQuery" version="1.7.1" />
</packages>'