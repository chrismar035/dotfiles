# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/workspace/mobile_defense/server_core"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "bg"
split_v 50
run_cmd "zeus start" 0
run_cmd "z s" 1

new_window "dev"
split_h 50
select_pane 0
split_v 50
run_cmd "z c" 0
run_cmd "vim" 2
run_cmd ",j" 2
select_pane 2

# Split window into panes.
#split_v 20
#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
