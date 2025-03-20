import sys
sys.path.append("pythonservice")

if __name__ ==  "__main__":
    import jsonservice
    filemap = jsonservice.read_json("pythonservice/acceptedfileslist.json")

    with open("bashparams.txt", "w") as file:
        bashparams = "approvedfiles=\"" + " ".join(filemap["approvedfiles"]) + "\""
        bashparams = "approvedfolders=\"" + " ".join(filemap["approvedfolders"]) + "\""
        file.writelines(bashparams)
        file.flush()
