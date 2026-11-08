// Command cryptocore is the cryptographer's core. Subcommands arrive with the phases in docs/PHASES.md.
package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Fprintln(os.Stderr, "cryptocore: scaffold; nothing runs yet. See docs/PHASES.md.")
	if len(os.Args) > 1 {
		os.Exit(2)
	}
}
