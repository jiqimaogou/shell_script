cat > ~/.inputrc << EOL
# do not show hidden files in the list
set match-hidden-files off
 
# auto complete ignoring case
set show-all-if-ambiguous on
set completion-ignore-case on
"\ep": history-search-backward
"\e[A": history-search-backward
"\e[B": history-search-forward
EOL