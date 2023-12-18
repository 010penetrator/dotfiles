
bytearray.fromhex("aa bb cc 01 02 03")

# Run the other script
import subprocess
subprocess.run(["python", "other.py"])

# This will run the other.py script as a separate process
with open("C:\scripts\other.py") as f:
    exec(f.read())

# read file ignore BOM
    bytes = min(32, os.path.getsize(slovarname))
    raw = open(slovarname, 'rb').read(bytes)
    print(raw)
    if raw.startswith(codecs.BOM_UTF8):
        encoding = 'utf-8-sig'
        print(1111)
    else:
        # encoding = 'utf-8'
        result = charset.detect(raw)
        encoding = result['encoding']
    slovar = open(slovarname, 'r', encoding=encoding)
    
import sys,getopt
opts, args = getopt.getopt(sys.argv[1:], 'f:d:s:', ['debug','full'])
for opt, arg in opts:
    if opt == "-f":
        filenames.append(arg)
    if opt == "-d":
        dirnames.append(arg)
    if opt == '-s':
        slovarname = arg
    if opt == "--debug":
        DEBUG = True
    if opt == "--full":
        full = True

def round_up(arg):
    if arg > round(arg):
        return round(arg) + 1
    else:
        return round(arg)

s = "stuff\nmore\nverbose\ncmon"
s = '\n'.join( s.split('\n')[i] for i in [0,2,3] )

