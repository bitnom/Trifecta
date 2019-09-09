import argparse
import elvis
import templates
import moustachu

var tmpl_py = """# -*- coding: utf-8 -*-
from kivy.app import App

"""
var tmpl_php = """

"""

var p = newParser("Trifecta"):
    flag("-i", "--init", help="Initialize Trifecta project with a trifecta.toml.")
    flag("-b", "--build", help="Build the project.")
    flag("-v", "--version", help="Print this Trifecta's version.")
    run:
        if opts.init:
            echo "init"
        elif opts.build:
            echo "build"
        elif opts.version:
            echo "Trifect v0.0.1"
        else:
            echo "No options specified. Use -h for help."
p.run()