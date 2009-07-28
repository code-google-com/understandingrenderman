import glob
import os

for filename1 in glob.glob("*.png"):
    n = int(filename1.strip().replace("image","").replace(".png",""))
    if not (n % 2):
        #print n
        cmd = "mv %s bad/" % filename1
        #print cmd
        os.system(cmd)