#!/bin/sh -l

set -e

README=${INPUT_README:-./README.md}

printf -f "${README}"