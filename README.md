# note

## environment

- Haskell stack v1.9.3
- node v11.15.0
- npm v6.7.0
- yarn 1.16.0

Node v7-v11 should work but I haven't tried. node v12 did not work (2019/06/01).

## Install and Run

```
git clone https://github.com/reouno/note.git
cd note/frontend
yarn # install dependencies
yarn webpack # build frontend
cd ../
stack build # build backend
stack exec note-exe
```
