#!/bin/bash

search_term="$1"

get_files() {
    git status --porcelain |
        awk '{print $2}' |
        grep -i "$search_term"
}

files=($(get_files))

if [ ${#files[@]} -eq 0 ]; then
    echo "No files match '$search_term'"
    exit 0
fi

if [ ${#files[@]} -eq 1 ]; then
    git diff "${files[0]}"
    exit 0
fi

echo "Select file:"

select file in "${files[@]}" "Exit"; do
    [[ "$file" == "Exit" ]] && break
    [[ -n "$file" ]] && git diff "$file"
    break
done
