#!/bin/bash

base_dir="/home/maulanmi/genome_annotation/data"
output_dir="/home/maulanmi/genome_annotation/prokka_output"

mkdir -p "$output_dir"

for filename in "$base_dir"/*/GCA*; do
    fna_file=$(find "$filename" -name "*.fna")

    if [[ -f "$fna_file" ]]; then
        base_name=$(basename "$fna_file" .fna)
        # Define the output file paths
        output_file="$output_dir/${base_name}_output"

	prokka "$fna_file" --outdir "$output_file"
    fi
done
