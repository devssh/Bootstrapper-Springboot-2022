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

