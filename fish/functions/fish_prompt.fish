function fish_prompt
    set_color cyan
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' > '
end
