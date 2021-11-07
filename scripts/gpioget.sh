#!/bin/bash
# script to set a gpio into output mode and set requested state value

#usage script
function usage {
  echo "usage: $0 gpionr value"
  echo "  example: $0 251 1"
}

#check input arguments
if [[ $# -ne 2 ]]; then usage; exit -1; fi

#define base dir
BASE=/sys/class/gpio

#export if gpio doesn't exists
if [[ ! -f ${BASE}/gpio$1/value ]] ;
then
  echo $1 > ${BASE}/export
  # this sleep is needed to make sure the needed sys fs is ready
  sleep 1
fi

#check if export was OK
if [[ ! -f ${BASE}/gpio$1/value ]] ;
then
  echo "ERROR: Failed to export gpio$1"
  exit -2
fi

#check direction, set to output if needed
# direction can only be set if file exists
if [[ -f ${BASE}/gpio${1}/direction ]];
then
  DIRECTION=`cat ${BASE}/gpio${1}/direction`
  VALUE=`cat ${BASE}/gpio${1}/value`
  if [[ "$DIRECTION" = "in" ]] ;
  then
    if [[ $VALUE == 1 ]];
    then
      echo high > $BASE/gpio$1/direction
    else
      echo low > $BASE/gpio$1/direction 
    fi
  fi
fi

#set the pins state
echo $2 > ${BASE}/gpio$1/value

#check result and report
if [[ $? == 0 ]];
then
  echo OK
else
  echo "ERROR: failed to set gpio $1 to $2"
  exit -3
fi
