#!/usr/bin/env python

import shlex
import glob
import os
import shutil
import subprocess
import errno

HOME = os.path.expanduser(os.environ["HOME"])
SRC = "/srv/src/dotfiles"
if not os.path.exists(SRC):
    os.makedirs("/srv/src")
    with open("/dev/null", "w") as devnull:
        clone = subprocess.Popen(shlex.split("git clone http://github.com/saltpy/dotfiles " + SRC), stdout=devnull, stderr=devnull)
        clone.wait()

    for fp in glob.glob(os.path.join(SRC, "*")):
        print(fp)
        if os.path.isfile(fp) and not fp.endswith(".py"):
            shutil.copyfile(fp, os.path.join(HOME, "." + os.path.basename(fp)))

    shutil.copytree(os.path.join(SRC, "ssh"), os.path.join(HOME, ".ssh")) 
