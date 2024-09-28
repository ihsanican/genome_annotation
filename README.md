# genome_annotation

Run prodigal on one of the genomes.
	
	prodigal -i data/GCA_000006745.1/GCA_000006745.1_ASM674v1_genomic.fna -d my_nucleotide.fna

Count how many genes were annotated by prodigal
	
	grep -c ">" my_nucleotide.fna
