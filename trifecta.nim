import argparse

var p = newParser("Trifecta"):
    flag("-c", "--compile", help="Compile Trifecta app package.")
    option("-n", "--name", help="Project/App name to output.")
    run:
        echo opts.name

p.run()