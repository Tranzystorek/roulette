# Fake Linux Russian Roulette

Do you have a gullible/overly confident friend you want to prank?
Look no further!

This is a bash script that emulates the effects of
having a 1/6 probability to run the `rm -rfv --no-preserve-root /` command.
Not for the faint of heart!

### Prerequisites

You need only the most obvious and widely available
Linux tools:

* bash
* GNU Findutils

### Execution

Run it with sudo permissions (it will complain otherwise).
For increased danger feel set its permissions
to 711 so that only the owner can read or modify it.

### How it works

Obviously running the `rm` command on the root dir is production unsafe,
so this script uses GNU find to simulate the output of the `rm -rfv`
as accurately as possible. *No files are ever removed.* 

### Killing the program

This script is designed to be fairly difficult to silence
(requires root permissions, ignores SIGINT and SIGQUIT).
Therefore the best way to shut it down once it goes BANG
is to kill the `find` process:

`sudo pkill find`