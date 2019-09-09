# Trifecta

Build framework/tool for cross-platform PHP/HTML5/Python apps glued together with Nim. Trifecta allows you to write
code once and deploy everywhere, even to your website front/back-ends. This means the same code you write for your app
can power your website without modification.

## Features

* Super fast & efficient Nim core.
* Python 3.x runtime.
* PHP 7.x runtme.
* .NET Core runtime w/C# interop (PeachPie).
* NodeJS runtime.
* Webkit UI thread.
* Inter-process communication (IPC) between all runtimes & UI.
* Builds to Windows/OSX/Linux/Android/iOS with one simple command.

## Why

I'm always creating cross-platform apps for Android/iOS/Windows/Mac/Linux lately. To do this, I use:

* Nim for low-level systems programming (Very fast binaries).
* Python for Kivy (Android & iOS), machine learning, and the vast amount of modules.
* NWJS for cross-platform desktop UIs powered by Chromium and access to NodeJS.
* Apache Cordova for mobile apps with webview UIs.
* PHP for REST APIs. Trifecta will use PeachPie, also exposing .NET.

I want an easy-to-use build tool that will allow me to quickly bootstrap a cross-platform mobile/desktop/web app. I
want my existing back-end APIs (PHP & Python) to work out-of-the-box. I want to be able to use any or all of my
favorite programming frameworks in the same app. Trifecta will make this possible.

## Current Status

This framework is not yet stable but it is in active development. Check back frequently.

## Todo

* Getting a working webview communicating from to/from the RPC server on mobile.