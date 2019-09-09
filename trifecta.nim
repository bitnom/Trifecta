import argparse
import elvis
import templates
import moustachu

var tmpl_py = """# -*- coding: utf-8 -*-
from kivy.app import App

"""
var tmpl_php = """

"""

var tmpl_toml = """
# Build configuration file for Trifecta project.

title = "Trifecta Project Definition"

[app]
    [app.meta]
        name = "{{meta_name}}"
        version = {{meta_version}}"
        url = "{{meta_url}}"
        license = "{{meta_license}}"
    [app.config]
        fullscreen = {{app_fullscreen}}
        rpc = true  # reqired for inter-process communication.
        rpc-port = {{app_port}}

[build]
    build-targets = ["linux", "osx", "windows", "android", "ios", "http"]
    gui = "webview" # or: kivy
    ipx = false  # whether to use pyinstaller ipx compression for dekstop.
    ignore = ["*.git"]  # file/dir patterns to ignore.
    ignore-ext = [ ".git", ".md" ]  # file extensions to ignore.

"""

var p = newParser("Trifecta"):
    flag("-i", "--init", help="Initialize Trifecta project with a trifecta.toml.")
    flag("-b", "--build", help="Build the project.")
    flag("-v", "--version", help="Print this Trifecta's version.")
    run:
        if opts.init:
            echo "--init--"
            var c : Context = newContext()
            c["meta_name"] = "Trifecta"
            c["meta_version"] = "0.0.1"
            c["meta_url"] = "https://synthetisoft.com"
            c["meta_license"] = "gpl-3.0"
            c["app_fullscreen"] = false
            c["app_port"] = 42727
            echo render(tmpl_toml, c)
        elif opts.build:
            echo "build"
        elif opts.version:
            echo "Trifect v0.0.1"
        else:
            echo "No options specified. Use -h for help."
p.run()