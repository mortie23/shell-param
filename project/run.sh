#!/bin/bash

## Name:    Shell script with paramters
## Author:  Christopher Mortimer
## Date:    2018-07-19
## Desc:  
## Notes:  
## Usage:  ./run -o -p test
## Param:  
##        -o :  option
##        -p :  parameter with value

## Include script with common functions
. ../common/common-functions.sh
## Parse arguments passed
parseArgs "$@"

echoLog "INFO" "arguments: ${option} ${param} ${help}"

if [[ ${help} ]]
then
	error_code=1
	echo "
  This project code is used to demostrate simple argument passing to a shell script
  Arguments
  -o --option:  An option to set a flag to Y
  -p --param:   Pass a parameter value using '-p value'
  "
	exit ${error_code}
fi