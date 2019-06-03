#!/usr/bin/env bash

# This is a basic script to ensure everything is loaded right.
#
# It should exit non-zero on failure, and zero on success.
#
# Run like so
#
# ```
# ./test.sh
# ```

# TODO: test all the things

run_vader_tests() {
  vim -Nu test/temp_vimrc -c 'Vader! test/*' > /dev/null
}

run_basic_setup() {
  temp_dir=tmp

  mkdir -p "$temp_dir"

  cd "$temp_dir" || echo "'cd $temp_dir' failed!" || exit 1

  rm -f error

  vim -c 'so ../test/test.vim' && echo 'Success!' || echo 'Failure'

  if [ -s error ]
  then
    echo
    echo 'Errors:'
    echo
    cat error
  fi

  cd - &>/dev/null || echo "'cd -' failed!" || exit 1

  rm -rf "$temp_dir"
}

main() {
  echo
  echo '------------------------------------------------------------'

  run_basic_setup && (yes | run_vader_tests)

  echo '------------------------------------------------------------'
}
main "$@"
