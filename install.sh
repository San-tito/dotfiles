#!/usr/bin/env bash

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

function main() {

  print_logo

  if confirm "Would you like to copy dotfiles to your home directory?"; then
     copy_dotfiles
  fi
}

function copy_dotfiles() {
  local download_dir="$(mktemp -d)"
  readonly download_dir

  echo "cloning dotfiles"
  if ! git clone --recurse-submodules --progress --depth 1 \
    "https://github.com/san-tito/dotfiles.git" "$download_dir/dotfiles"; then
    echo "Failed to clone repository."
    exit 1
  fi
  echo "copying dotfiles"
  pushd "$download_dir"
  rsync --exclude="README.md" \
            --exclude="LICENSE" \
            --exclude=".gitmodules" \
            --exclude=".git" \
            --exclude="install.sh" \
            -av --no-perms $download_dir/dotfiles/ ~;
  popd
  echo "dotfiles copy complete!"
}

function print_logo() {
  cat <<'EOF'

 █▀▄ ▄▀▄ ▀█▀ █▀ █ █   ██▀ ▄▀▀
 █▄▀ ▀▄▀  █  █▀ █ █▄▄ █▄▄ ▄██

EOF
}

main "$@"
