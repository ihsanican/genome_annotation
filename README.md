# Week 4 + 5: Genome annotation

## Prodigal
Don't forget to always load Prodigal before do the task

	module load prodigal
> To check modules availability

	module avail

Run Prodigal on one of the genomes.
	
	prodigal -i data/GCA_000006745.1/GCA_000006745.1_ASM674v1_genomic.fna -d my_nucleotide.fna

Count how many genes were annotated by Prodigal
	
	grep -c ">" my_nucleotide.fna
- Output: 3594

### - The highest number of genes
Finding the genome that has the highest number of genes from Prodigal output.

	./run_prodigal.sh

- Output: Vibrio cholerae O1 biovar El Tor str. N16961 has the highest number of genes, that is 3594 genes

## Prokka
Don't forget to always load prokka before do the task

	module load prokka
Firstly, let's run Prokka for each dataset we have.

	./run_prokka.sh

Then, compare the outputs from Prokka and Prodigal

 	./compare_prodigal_prokka.sh
  - Output:
    - total prodigal = 26915
    - total prokka = 26863
    
From the output, I conclude that Prokka has less CDS than Prodigal. Why? --

## Extract and list unique gene names annotated by Prokka
Firstly we have to re-run the Prokka, adding --addgenes properties to add gene features for each CDS. The steps are provided inside run_prokka_with_gene.sh script.

	./run_prokka_with_gene.sh

 Next, run the unique_gene.sh script to obtain the final unique list of genes.

 	./unique_gene.sh

And the output will be forwarded to unique_genes.txt file.
