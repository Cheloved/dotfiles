#!/bin/bash

xwininfo -root |sed -n -e 's/.*Window.*id: \(0x[a-f0-9]\+\).*/\1/p'
