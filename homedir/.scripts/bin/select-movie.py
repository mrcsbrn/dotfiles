#!/usr/bin/env python

import os
import shutil
import subprocess

vid_ext = ['.mp4', '.avi', '.mkv', '.flv', '.wmv', '.mov']


def main():

    mpath = "/run/media/mrcsbrn/mrcshd/Videos/Movies"
    cwd = mpath

    while has_dir_inside(cwd):
        ctmp = dmenu_select_dir(cwd, '-p movies -l 30')
        if not ctmp:
            return 1
        cwd = os.path.join(cwd, ctmp)

    # mpv_cmd = os.path.expandvars("command $PLAYER")
    mpv_cmd = 'mpv'

    for f in os.listdir(cwd):
        f_ext = os.path.splitext(f)[-1]
        if f_ext in vid_ext:
            subprocess.Popen(
                mpv_cmd + ' ' + os.path.join(cwd, f),
                shell=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL)
            return 0


def has_dir_inside(path):
    # checa se há diretório com vídeos dentro
    for f in os.listdir(path):
        if os.path.isdir(os.path.join(path, f)):
            for ff in os.listdir(os.path.join(path, f)):
                if os.path.splitext(ff)[-1] in vid_ext:
                    return True
    return False


def dmenu_select_dir(path, args):
    movies = [
        f for f in os.listdir(path) if os.path.isdir(os.path.join(path, f))
    ]
    if len(movies) == 1:
        return movies[0]

    tmp = ''
    for m in movies:
        tmp += m + '\n'

    _s = subprocess.run(
        'echo "' + tmp.rstrip() + '" | sort -f | dmenu -i ' + args,
        shell=True,
        stdout=subprocess.PIPE).stdout
    return str(_s, 'utf-8').rstrip()


if __name__ == '__main__':
    main()
