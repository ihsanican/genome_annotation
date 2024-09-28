#!/bin/bash

prodigal_dir="/home/maulanmi/genome_annotation/prodigal_output"
prokka_dir="/home/maulanmi/genome_annotation/prokka_output"

total_prokka=0
for filename in "$prokka_dir"/*; do
    file=$(find "$filename" -name "*tbl")
    number_of_genes_prokka=$(grep -c "CDS" "$file")
    total_prokka=$((total_prokka+$number_of_genes_prokka))
done

total_prodigal=0
for filename in "$prodigal_dir"/*.fna; do
    number_of_genes_prodigal=$(grep -c ">" "$filename")
    total_prodigal=$((total_prodigal+$number_of_genes_prodigal))
done

echo "total prodigal = $total_prodigal"
echo "total prokka = $total_prokka"
