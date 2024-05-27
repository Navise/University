import os
from zipfile import ZipFile 

def zf(fp , op):

    with ZipFile(op + '.zip',  'w') as zp:
        for fn , sf , filenames in os.walk(fp):
            print(fn)
            print(filenames)
            for filename in filenames:
                filepath = os.path.join(fn , filename)
                print(filepath)
                zp.write(filepath , os.path.relpath(filepath , fp))
                print("done")

fp = "the path of the folder you want "
op = 'xyz'
zf(fp, op)
