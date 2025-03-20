def readfile(filename):
	with open(filename) as f:
		return f.readlines()

def writefile(filename, filedata):
	with open(filename, "w") as file:
		file.writelines(filedata)
		file.flush()

def splitonce(somestring, separator):
	return somestring.split(separator, 1)

outputdir="compiled"

if __name__=="__main__":
	variables = {}
	varb = readfile("variables.txt")
	kv = [x.split("=") for x in varb]
	for i in range(len(kv)):
		keyvalue = kv[i]
		variables[keyvalue[0].strip()] = keyvalue[1].strip()

	filenames = [x.strip() for x in readfile("files.txt")]
	for filename in filenames:
		f = readfile(filename)
		filedata = "".join(f)
		import re
		for variable,replacevalue in variables.items():
			variableidentifier = r"\?\?\{" + variable + "\}"
			filedata = re.sub(variableidentifier, replacevalue, filedata)

		newfilename=outputdir + "/" + splitonce(filename, "/")[1]

		writefile(newfilename, filedata)

	def test1():
		text="".join(readfile(outputdir+"/abc.txt")).strip()
		if text=="hello world":
			print("Test 1 passed")
		else:
			print("Metaproc test 1 failed - basic substitution")

	def test2():
		text="".join(readfile(outputdir +"/def.txt")).strip()
		if text=="the quick brown fox jumps over the lazy dog":
			print("Test 2 passed")
		else:
			print("Metaproc test 2 failed - substitution")

	def test3():
		text="".join(readfile(outputdir+"/ghi.txt"))
		#print(repr(text))
		if text=="whitespace test\nhello world\nwhitespace test\n":
			print("Test 3 passed")
		else:
			print("Metaproc test 3 failed - whitespace alignment")

	#Test checker
	test1()
	test2()
	test3()

