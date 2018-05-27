#!/usr/local/bin/bash
declare -a missing_pkgs=()
declare -a pkg_list=()

FILE=$1
while read line; do
	pkg_list+=($line)
done < $FILE

echo List of packages to check are:
echo "${pkg_list[@]}"
echo $'\n'

for p in "${pkg_list[@]}"; do
	$(pkg info -e "$p")
	if [ $? -ne 0 ]; then
		missing_pkgs+=($p)
		echo $p added to install list
	else
		echo $p is present
	fi
done

echo $'\n'
echo The list of packages to install are:
echo "${missing_pkgs[@]}"
echo $'\n'

sudo pkg update


for o in "${missing_pkgs[@]}"; do
	$(pkg install "$o" -qy)
done

for p in "${missing_pkgs[@]}"; do
	$(pkg info -e "$p")
done

if [${#missing_pkgs[@]} -gt 0]; do
	echo The following packages are still missing:
	echo "${missing_pkgs[@]}"
else
	echo All packages successfully installed!
done
