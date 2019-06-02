#!/bin/sh
set -eu

cd frontend
yarn webpack
cd ../
stack build
stack exec note-exe
