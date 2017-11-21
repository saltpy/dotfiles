#!/usr/bin/env python3

import shlex
import glob
import os
import shutil
import subprocess
import errno

HOME = os.path.expanduser(os.environ["HOME"])
SRC = "/srv/src/dotfiles"
if not os.path.exists(SRC):
    with open("/dev/null", "w") as devnull:
        chmod = subprocess.Popen(shlex.split("sudo chmod 777 /srv"), stdout=devnull, stderr=devnull)
        chmod.wait()
        os.makedirs("/srv/src")
        clone = subprocess.Popen(shlex.split("git clone http://github.com/saltpy/dotfiles " + SRC), stdout=devnull, stderr=devnull)
        clone.wait()

    for fp in glob.glob(os.path.join(SRC, "*")):
        print(fp)
        if os.path.isfile(fp) and not fp.endswith(".py"):
            shutil.copyfile(fp, os.path.join(HOME, "." + os.path.basename(fp)))
