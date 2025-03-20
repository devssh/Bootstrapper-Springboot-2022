filename = "runreplacement.py"
with open(filename,"r") as f:
    filedata="".join(f.readlines())
    print(repr(filedata))
    import re
    filedata=re.sub(r"    ", "\t", filedata)
    with open(filename, "w") as out:
        out.writelines(filedata)
        out.flush()
