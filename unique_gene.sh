#!/bin/bash

prokka_dir="/home/maulanmi/genome_annotation/prokka_with_genes"
output="/home/maulanmi/genome_annotation/list_of_genes.txt"

for filename in "$prokka_dir"/*; do
    file=$(find "$filename" -name "*tsv")
    cat "$file" | cut -f 4 | grep -v '^$' > "$output"
done


sort "$output" | uniq > "unique_genes.txt"
