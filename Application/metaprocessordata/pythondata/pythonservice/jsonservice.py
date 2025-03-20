import json

def init():
    pass

def read_json(filename):
    with open(filename, "r") as file:
        filestring = "".join([x.strip() for x in file.readlines()])
        #print(filestring)
        data = dict(json.loads(filestring))
        #print(data)
        return data
#Tests
if __name__== "__main__":
    def test_read_json():
        filemap = read_json("pythonservice/samplejsonfile.json")
        #print(filemap)
        
        print("Read json test passed without error")
        return filemap

    #print(repr(json.dumps({"test":"test", "test2":["hello", "hello"]})))
    test_read_json()

