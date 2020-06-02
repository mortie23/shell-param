## Name:    Common Functions
## Author:  Christopher Moirtimer
## Date:    2019-05-20
## Desc:    Standard functions for use across all scripts
## Usage:  . commonFunctions.sh

## Echo a info log level message with the current time
## usage echoLog "<loglevel>" "<message>"
## where log level is [INFO,WARN,ERROR,etc]
logfile=./logs/log-`date +'%Y%m%d_%H%M%S'.log`
function echoLog() {
  logLevel=${1}
  message=${2}
  strdtm=`date +'%Y-%m-%d_%H:%M:%S'`
  echo "${logLevel}, ${strdtm}, func(${FUNCNAME[1]}), ${message}" |& tee -a ${logfile}
}

## to parse arguments
function parseArgs() {
  POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
  key="$1"

  case $key in
    -h|--help)
    help=Y
    shift # past argument
    ;;
    -o|--option)
    option=Y
    shift # past argument
    ;;
    -p|--param)
    param="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
  esac
  done
  set -- "${POSITIONAL[@]}" # restore positional parameters

  #echo option = "${option}"
  #echo param = "${param}"
}