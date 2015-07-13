#!/bin/bash

/opt/taskd/config.sh

taskd server &
taskd diagnostics
tail -f /taskdata/logs/taskd.log
