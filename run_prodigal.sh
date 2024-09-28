#!/bin/bash

base_dir="/home/maulanmi/genome_annotation/data"
output_dir="/home/maulanmi/genome_annotation/prodigal_output"

mkdir -p "$output_dir"

for filename in "$base_dir"/*/GCA*; do
    fna_file=$(find "$filename" -name "*.fna")

    if [[ -f "$fna_file" ]]; then
        base_name=$(basename "$fna_file" .fna)
        # Define the output file paths
        output_file="$output_dir/${base_name}_output.fna"

	prodigal -i "$fna_file" -d "$output_file"
    fi
done

max=0
max_file=""
max_idx=0
idx=0
for filename in "$output_dir"/*.fna; do
    number_of_genes=$(grep -c ">" "$filename")
    idx=$((idx+1))
    if [[ number_of_genes -gt max ]]; then
	max="$number_of_genes"
	max_file="$filename"
	max_idx="$idx"
    fi
done

datasummary="/home/maulanmi/genome_annotation/data/data_summary.tsv"
name=$(cut -f 1 "$datasummary" | tail -n +$((max_idx+1)) | head -n 1)

echo "$name has the highest number of genes, that is $max genes"
