source /usr/share/cachyos-fish-config/cachyos-config.fish

export EDITOR=nvim
export VISUAL=nvim

# Configure terminal notifications (done.fish) for MangoWM
# Trigger notifications for commands taking 3+ seconds when window is unfocused
set -U __done_min_cmd_duration 3000
set -U __done_notification_urgency_level normal

function __done_get_focused_window_id
    if type -q mmsg
        mmsg get focusing-client 2>/dev/null | string match -rg '"id":(\d+)'
    else if test -n "$SWAYSOCK"; and type -q jq
        swaymsg --type get_tree | jq '.. | objects | select(.focused == true) | .id'
    else if test -n "$HYPRLAND_INSTANCE_SIGNATURE"
        hyprctl activewindow | awk '/^\tpid: / {print $2}'
    else if type -q xprop; and test -n "$DISPLAY"; and xprop -grammar >/dev/null 2>&1
        xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2
    else if set -q __done_allow_nongraphical
        echo 12345
    end
end

function fish_prompt
    if test "$PWD" != "$HOME"
        echo -n (basename "$PWD")
        set_color normal
        echo -n ' '
    end
    echo -n '❯ '
end

function fish_greeting
    # smth smth
end
stty -ixon

