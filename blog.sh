#!/bin/bash

BLOGS_DIR="$HOME/Developer/Blog"
BLOG_MARKDOWN_DIR="$BLOGS_DIR/Posts/Markdown"
BLOG_HTML_DIR="$BLOGS_DIR/Posts/HTML"
BLOG_TEMPLATE="$BLOGS_DIR/Templates/blog.html"
TEMP_SCRIPT="/tmp/blog_converter_$$.sh"

cleanup() {
    if [ -n "$entr_pid" ]; then
        pkill -P "$entr_pid" 2>/dev/null
        kill -TERM "$entr_pid" 2>/dev/null
        wait "$entr_pid" 2>/dev/null
    fi
    [ -f "$TEMP_SCRIPT" ] && rm "$TEMP_SCRIPT"
}

trap cleanup EXIT

format_title() {
    echo "$1" | sed 's/\<./\u&/g'
}

generate_html() {
    local output_file="$1"
    local title="$2"
    local current_date=$(date +"%d-%b-%Y")
    
    cp "$BLOG_TEMPLATE" "$output_file"
    sed -i '' "s|TITLE|$title|g" "$output_file"
    sed -i '' "s|DATE|$current_date|g" "$output_file"
}

setup_converter() {
    local md_file="$1"
    local html_file="$2"
    
    cat > "$TEMP_SCRIPT" << 'EOF'
#!/bin/bash

md_file="$1"
html_file="$2"

if [ -f "$md_file" ]; then
    temp_file=$(mktemp)
    sed -n '1,/<!-- CONTENT_START -->/p' "$html_file" > "$temp_file"
    
    # Converting Markdown to HTML with specific options
    echo "        $(pandoc -f markdown -t html --wrap=none "$md_file" 2>/dev/null)" >> "$temp_file"
    
    sed -n '/<!-- CONTENT_END -->/,$p' "$html_file" >> "$temp_file"
    
    if [ $? -eq 0 ]; then
        mv "$temp_file" "$html_file"
        osascript -e 'tell application "Brave Browser" to tell active tab of front window to reload' &>/dev/null
        exit 0
    else
        rm "$temp_file"
        exit 1
    fi
fi
exit 1
EOF

    chmod +x "$TEMP_SCRIPT"
}

update_homepage() {
    local title="$1"
    local temp_file=$(mktemp)
    local current_date=$(date +"%d-%b-%Y")
    
    {
        grep -B 1000 '<main class="blog-list">' "$BLOGS_DIR/index.html"
        echo "            <article class=\"blog-item\" style=\"--animation-order: 1\">"
        echo "                <a href=\"Posts/HTML/${title}.html\" class=\"blog-link\">${title}</a>"
        echo "                <span class=\"blog-date\">${current_date}</span>"
        echo "            </article>"
        grep -A 1000 '<main class="blog-list">' "$BLOGS_DIR/index.html" | tail -n +2
    } > "$temp_file"
    
    mv "$temp_file" "$BLOGS_DIR/index.html"
}

start_preview() {
    local md_file="$1"
    local html_file="$2"
    
    setup_converter "$md_file" "$html_file"
    "$TEMP_SCRIPT" "$md_file" "$html_file" &>/dev/null
    
    echo "$md_file" | entr -s "$TEMP_SCRIPT '$md_file' '$html_file'" &>/dev/null &
    entr_pid=$!
}

main() {
    mkdir -p "$BLOG_MARKDOWN_DIR" "$BLOG_HTML_DIR" &>/dev/null
    echo
    read -p "Enter Blog Title: " input_title
    title=$(format_title "$input_title")
    
    md_file="$BLOG_MARKDOWN_DIR/${title}.md"
    html_file="$BLOG_HTML_DIR/${title}.html"
    
    touch "$md_file"
    generate_html "$html_file" "$title"
    
    open -na "Brave Browser" --args --new-window "file://$html_file" &>/dev/null
    sleep 2
    
    start_preview "$md_file" "$html_file"
    alacritty -e nvim "$md_file" &>/dev/null  
    "$TEMP_SCRIPT" "$md_file" "$html_file" &>/dev/null
    
    echo -n "Publish The Blog? (Y/N) "
    stty raw
    char=$(dd bs=1 count=1 2>/dev/null)
    stty -raw
    echo "$char"
    
    if [[ "$char" =~ ^[yY]$ ]]; then
        update_homepage "$title"
        cd ~/Developer/blog
        git add . &>/dev/null && git commit -m 'Changes made' &>/dev/null && git push origin main &>/dev/null
        cd
        echo "Published"
        echo
    else
        echo "Not Published"
        echo
    fi
}

main
