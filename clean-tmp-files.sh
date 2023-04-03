# clean template files
find . -type f -regex ".*\.\(d\|o\|pdb\|ilk\|def\|ver\|pc\|exp\|lib\|dll\)$"  | xargs rm -rf
rm -f .version config.asm .config config.h config.fate config.mak config.log  