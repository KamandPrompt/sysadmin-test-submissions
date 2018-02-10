Problem 1:
	I know encrypting with some good hash key is a good idea but its not perfect as you can't protect anyone from stealing it. And once stolen it can be decrypted given a fair amount of time and effort. Also the danger of getting deleted remains.
	
	What to do now????? Lets try hiding it in open. Lets make two machines, one (machine1) that contacts the USERS, another one (machine2) that contacts machine1. machine1 contains a fake file with the same format as user data to be added in the original file. machine2 contains the original file with the actual data. machine2 is isolated and can be contacted by machine1 only. (Its just an idea when i suggest it) Now we use Turing machine to compare the data of this file with malicious code. Once authorized we update the original file of machine2. To avoid the danger of deletion we can put more backups, as we already know they are safe.
	
	Concept required:
		Working of an anti-virus: Anti-virus has a database of viruses (malicious code), Turing machine (as taught in MFOCS) is used to compare the malicious code with the already present in database.