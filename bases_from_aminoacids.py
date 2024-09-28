def aminoacids_to_seq(aminoacids):
	number_of_aa = 0
	stop = "*"
	for i in aminoacids:
		if i!=stop:
			number_of_aa+=1
	print(f'number of amino acids in the encoded peptide is {number_of_aa}')
	return number_of_aa

def bases_in_ORF(aminoacids):
	start_found = False
	number_of_bases = 0
	for i in aminoacids:
		if i=="M":
			start_found = True
		if i=="*":
			break
		if start_found==True:
			number_of_bases+=3
	print(f'number of bases in the ORF is {number_of_bases}')
	return number_of_bases

