#!/bin/sh

set -e

repo=$1

pkgCount=$(($(find "$repo" -type d | wc -l) - 1))
pkgs=$(find "$repo" -type d | tail -$pkgCount | sed "s|$repo/||g" | sort)

msg() {
  printf "\033[0;32m==>\033[1;37m $@\n\033[0m"
}

msg "Found $pkgCount packages: $(echo ${pkgs[@]} | xargs)"

[[ -d "out/$repo" ]] && rm -rf "out/$repo/"
mkdir -p "out/$repo/"

for pkg in ${pkgs[@]}; do
  msg "Building package: $pkg"
  pushd "$repo/$pkg" >/dev/null 2>&1
  makepkg
  buildpkgs=$(find . -name "*.pkg.tar.xz")
  for b in ${buildpkgs}; do
    mv "$b" "../../out/$repo/$b"
    repo-add "$repo.db.tar.gz" "$b"
  done
  folders=$(find . -type d | tail -$(($(find . -type d | wc -l) - 1)))
  rm -rf "${folders[@]}" >/dev/null 2>&1
  popd
done

# vim:set ts=2 sw=2 et:
