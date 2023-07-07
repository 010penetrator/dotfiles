#!/usr/bin/env python3
# Open files in existing NeoVim via RPC feature

import os, sys

# Env setup is lower merit, cli setup is higher
serv = (os.getenv('NVIMSERV'))
if (os.getenv('MODE')):
    mode = (os.getenv('MODE'))
else: # introduce default option here
    mode = 'newtabinsert'
file = ''

def get_cli_input():
    import getopt
    global serv,mode,file
    try:
        argv = sys.argv[1:]
        opts, args = getopt.getopt(argv, "s:m:")
    except getopt.GetoptError:
        print('Usage: nvimrpc.py -s /tmp/NVRPCSERVER -m newtab /etc/file')
        # sys.exit(2)
    for o, a in opts:
        print('stage c1', o, a)
        if o == '-s':
            serv = a
        if o == '-m':
            mode = a
    if args:
        file = args[0]
    else:
        # print('Target file not provided!')
        file = ''

def start_neovim():
    global serv,mode
    mode = ''
    print('serv is ', serv)
    os.system('NVIMSERV=' + serv + ' nvimnew')

# Okay, we will actually do stuff now

get_cli_input()

if not os.path.exists((serv)):
    print('RPC address', serv, 'is not present!\nWill launch nVim listening to that address.')
    start_neovim()
    sys.exit()
    # os.system('sleep .4')
# else:
    # os.system("ror.sh ' - NVIM$' ''")


if not file:
    print("no target file and server is probably running, so we are done")
    sys.exit()
print('file is', file)
# print('argv..', sys.argv, len(sys.argv) )

from pynvim import attach
print('attaching to ', serv)
nvim = attach('socket', path=serv)

file = os.path.join( os.getcwd(), file )
print('final address', file)
print('mode', mode)

# Select/create window for editing the file
if mode == 'cur':
    nvim.command('e ' + file)
elif mode == 'last':
    nvim.command('wincmd p')
    nvim.command('e ' + file)
elif mode == 'newtab':
    nvim.command('tabe ' + file)
elif mode == 'newtabinsert':
    nvim.command('-tabe ' + file)
elif mode == 'vert':
    nvim.command('vsplit ' + file)
elif mode == 'split':
    nvim.command('split ' + file)
else:
    nvim.command('e ' + file)

