function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
    set -l suffix
    set color_cwd $fish_color_cwd
    set suffix ' $'
 

    echo -n -s (set_color yellow) (date +%H:%M:%S) ' ' (set_color $color_cwd) (prompt_pwd) "$suffix "
end
