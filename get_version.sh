#!/bin/sh

if [[ -z $1 || -z $2 ]]; then
  echo "usage: $(basename $0) [Mmp] major.minor.patch"
  exit 1
fi

if [[ "$1" -ne "M" && "$1" -ne "m" && "$1" -ne "p" ]]; then
  echo "usage: $(basename $0) [Mmp] major.minor.patch"
  exit 1
fi
version=$2
ver=( ${version//./ } )

if [ ${#ver[@]} -ne 3 ]
then
  echo "usage: $(basename $0) [Mmp] major.minor.patch"
  exit 1
fi

if [ "$1" == "M" ]
then
  ((ver[0]++))
  ver[1]=0
  ver[2]=0
fi

if [ "$1" == "m" ]
then
  ((ver[1]++))
  ver[2]=0
fi

if [ "$1" == "p" ]
then
  ((ver[2]++))
fi

new_version="${ver[0]}.${ver[1]}.${ver[2]}"
echo ${new_version}
