# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "$GOPATH/src/go-debts" 1

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "go-dev"

# Split window into panes.
split_h 70
select_pane 0
split_v 50

# Run commands.
run_cmd "cd $GOPATH/src/go-debts" 0
run_cmd "glitch" 0

# run_cmd "cd $GOPATH/src/github.com/manuelkiessling/go-cleanarchitecture/" 1
# run_cmd "vim src/usecases/usecases.go" 1

run_cmd "cd $GOPATH/src/go-debts" 1
run_cmd "gin" 1

run_cmd "cd $GOPATH/src/go-debts" 2
run_cmd "vim main.go" 2

# Set active pane.
select_pane 2
