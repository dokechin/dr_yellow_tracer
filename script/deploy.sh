#!/bin/bash

export RSYNC_RSH="ssh -p 10022"
rsync -av ./ tatsumi@49.212.196.217:/home/tatsumi/dyt
ssh -p 10022 tatsumi@49.212.196.217 supervisorctl restart dyt
