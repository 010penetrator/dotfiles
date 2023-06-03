
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
    






