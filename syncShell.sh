#!/bin/bash

rsync -a8P --delete  ~/inbox/shell/* app01:~/shell/
rsync -a8P --delete  ~/inbox/shell/* app02:~/shell/
rsync -a8P --delete  ~/inbox/shell/* app03:~/shell/
