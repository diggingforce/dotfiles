function fish_prompt
    set_color white
    echo -n (basename $PWD)
    set_color normal
    echo -n ' > '
end
