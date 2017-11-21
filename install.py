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
        chmod = subprocess.Popen(shlex.split("sudo chmod 777 /srv"), stdout=devnull)
        chmod.wait()
        assert chmod.returncode == 0
        mkdirsp = subprocess.Popen(shlex.split("mkdir -p /srv/src"), stdout=devnull)
        mkdirsp.wait()
        assert chmod.returncode == 0
        clone = subprocess.Popen(shlex.split("git clone http://github.com/saltpy/dotfiles " + SRC), stdout=devnull)
        clone.wait()
        assert clone.returncode == 0
        plug = subprocess.Popen(shlex.split("curl -fLo " + HOME + "/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"), stdout=devnull)
        plug.wait()
        assert plug.returncode == 0

    for fp in glob.glob(os.path.join(SRC, "*")):
        print(fp)
        if os.path.isfile(fp) and not fp.endswith(".py"):
            shutil.copyfile(fp, os.path.join(HOME, "." + os.path.basename(fp)))
