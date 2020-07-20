#!/usr/bin/env
set -u
#
# Build a toolbox container to build Zyn-Fusion
#


export cont=ZynBuild

# Generic part
toolbox create -c $cont
toolbox run   -c $cont sudo -- sh -c 'dnf config-manager --set-disabled  updates-testing ; dnf -y update ; dnf -y install zsh fzf vim-airline glibc-all-langpacks'

# Zyn-Fusion Specific
# Copied from https://github.com/zynaddsubfx/zyn-fusion-build/wiki/Building-on-Linux#rpm-based
toolbox run   -c $cont sudo dnf -y install @"C Development Tools and Libraries" git ruby libtool mxml-devel automake cmake fftw-devel jack-audio-connection-kit-devel liblo-devel zlib-devel alsa-lib-devel  libX11-devel  mesa-libGL-devel cairo-devel fontconfig-devel python bison

# Some they missed: (Python2 ... thanks containers)
toolbox run   -c $cont sudo dnf -y install rake python2  

# Need to patch the build file ...

echo -e "\nNow \"toolbox enter -c $cont\"  and run \"ruby build-linux.rb\"\n"

