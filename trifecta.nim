import argparse
import elvis
import templates
import moustachu

var tmpl_py = """# -*- coding: utf-8 -*-
from kivy.app import App

"""
var tmpl_php = """

"""

var arg_parser = newParser("Trifecta"):
    flag("-c", "--compile", help="Compile Trifecta app package.")
    option("-n", "--name", help="Project/App name to output.")
    run:
        echo opts.name

arg_parser.run()