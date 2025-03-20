filedata = ""
with open("runreplacement.py","r") as f:
    filedata="".join(f.readlines())
    #print(repr(filedata))

testdata = ""
#print("\n\n\n")

with open("tests.mp", "r") as f:
    testdata="".join(f.readlines())
    #print(repr(filedata))

#print("\n\n\n")

with open("runreplacement.py","w") as f:
    import re
    filedata = re.sub(r"    ", "\t", filedata) +"\n"+ re.sub(r"    ", "\t", testdata)
    f.writelines(filedata)
    f.flush()
    #print(repr(filedata))
