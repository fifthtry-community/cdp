# shellcheck disable=SC2155
export PROJ_ROOT=$(pwd)

FASTN=${FASTN_BINARY:-fastn}


function pushd2() {
    PUSHED=$(pwd)
    cd "${PROJDIR}""$1" >> /dev/null || return
}

function popd2() {
    cd "${PUSHED:-$PROJDIR}" >> /dev/null || return
    unset PUSHED
}

function run-fastn() {
  pushd2 "${PROJ_ROOT}/www" || return 1

  echo "Using $FASTN to serve www/"

  WASMTIME_BACKTRACE_DETAILS=1 $FASTN serve --port 8003 --offline

  popd2
}
