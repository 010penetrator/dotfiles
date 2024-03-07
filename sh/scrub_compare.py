#!/usr/bin/env python
# compare 2 files which have filename and hashsum entries
# file format is "filename:hashsum" in each line
# file contents must be already sorted by alphabet

import os, sys
import getopt
DEBUG = False

def parse_options():
    global DEBUG, fileA, fileB
    try:
        long_options = ['left', 'right']
        opts, plain_args = getopt.getopt(sys.argv[1:], "l:r:", long_options)
        for key, val in opts:
            if key in ("-r", "--right"):
                # print('right', key, val)
                fileB = val
                serv = val
            elif key in ("-l", "--left"):
                # print("left")
                fileA = val
            elif key == "--debug":
                DEBUG = True
            else:
                print('extra key/val given! ', key, val)
        if plain_args:
            # Argument not prefixed with key goes here
            # file = plain_args[0]
            pass
    except getopt.GetoptError:
        print("Usage: python scrub_compare.py -l one_log -r other_log")
        sys.exit(3)
    if not fileA or not fileB:
        print("Usage: python scrub_compare.py -l one_log -r other_log")
        sys.exit(3)


def get_entry(fd):
    line = fd.readline()
    if not line:
        return None
    spl = line.split(":",1)
    # print(11, x,y)
    if len(spl) != 2:
        errpanic("bad line"+line)
    return [spl[0].strip("./"),spl[1]]

def errpanic(str):
    print("panik!", str)
    exit(1)

def summary():
    global listOnlyA, listOnlyB, listDifer, listUniq, okayCnt
    print("Okay", okayCnt)
    print("Only Left", len(listOnlyA))
    print("Only Right", len(listOnlyB))
    print("Different", len(listDifer))
    # global fileA, fileB
    outfile = open("outfile___", 'w', encoding="utf-8")
    # for name in listOnlyA:
    #     outfile.write("eL:"+name+"\n")
    # for name in listOnlyB:
    #     outfile.write("eR:"+name+"\n")
    for ent in listDifer:
        outfile.write("difer:"+ent+"\n")
    for ent in listUniq:
        outfile.write(ent+"\n")
    outfile.close()
    exit(0)

if __name__ == '__main__':
    fileA = ""
    fileB = ""
    listEqual = []
    listDifer = []
    listUniq = []
    listOnlyA = []
    listOnlyB = []
    okayCnt = 0

    parse_options()
    fdA = open(fileA, 'r', encoding="utf-8")
    fdB = open(fileB, 'r', encoding="utf-8")
    
    heapA = []
    heapB = []
    eofA = eofB = False
    stayA = stayB = False
    # for lineA in fdA:

    paraA = get_entry(fdA)
    paraB = get_entry(fdB)
    if not paraA or not paraB:
        errpanic("cant begin")
    # print(paraA)

    for i in range(1000000):
        if (i%10000==0):
            if eofA:
                print("inc ", i, "eof left")
            elif eofB:
                print("inc ", i, "eof right")
            else:
                print("inc ",i, paraA[0], "vs", paraB[0])
            print ("stayA", stayA, "stayB", stayB)
        if not paraA and not paraB:
            print("Complete  at inc ",i)
            summary()
        elif not paraA:
            eofA = True
            listOnlyB.append(paraB)
        elif not paraB:
            eofB = True
            listOnlyA.append(paraA)
        if paraA and paraB:
            if paraA[0] == paraB[0]:
                if paraA[1] == paraB[1]:
                    # listEqual.append(paraA[0])
                    # print(paraA[0], "okay")
                    okayCnt +=1
                    stayA = False
                    stayB = False
                else:
                    listDifer.append(paraA[0])
            else:
                if paraA[0] > paraB[0]:
                    listOnlyB.append(paraB[0])
                    listUniq.append("eR:"+paraB[0])
                    # paraB = get_entry(fdB)
                    stayA = True
                    stayB = False
                elif paraA[0] < paraB[0]:
                    listOnlyA.append(paraA[0])
                    listUniq.append("eL:"+paraA[0])
                    stayB = True
                    stayA = False
                    # paraA = get_entry(fdA)
        # else:
        #     errpanic("on inc"+str(i))
        if eofA:
            stayB = False
        if eofB:
            stayA = False
        if not eofA and not stayA:
            paraA = get_entry(fdA)
        if not eofB and not stayB:
            paraB = get_entry(fdB)

        # heapA.append(paraA)
        # heapB.append(heapB)



