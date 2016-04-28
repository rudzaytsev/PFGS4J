#!/usr/bin/bash

# Please setup JAVA_HOME
# export JAVA_HOME=PATH_TO_ORACLE_JDK_8+
export JAVA_HOME=/home/rudolph/jdk/jdk1.8.0_91

JAVA_VER_FULL_FORMAT=$(cat $JAVA_HOME/release | grep -o -E 'JAVA_VERSION=[\"0-9\._]{7,}' | grep -o -E '[\0-9\._]{7,}')

JAVA_VER_SECOND_NUM=$(echo $JAVA_VER_FULL_FORMAT | grep -o -E '\.[0-9]++\.' |  grep -o -E '[0-9]++')
JAVA_VER_THIRD_NUM=$(echo $JAVA_VER_FULL_FORMAT | grep -o -E '\.[0-9]++_' | grep -o -E '[0-9]++')
JAVA_VER_FOURTH_NUM=$(echo $JAVA_VER_FULL_FORMAT | grep -o -E '_[0-9]++' |  grep -o -E '[0-9]++')

if [[ $JAVA_VER_SECOND_NUM -lt 8 ]]; then
  echo "Error current java version is less than java 1.8.0_60. Please install java version >= 1.8.0_60" >&2
  exit 1
elif [[ $JAVA_VER_SECOND_NUM -eq 8 ]]; then  
  if [[ $JAVA_VER_THIRD_NUM -eq 0 && $JAVA_VER_FOURTH_NUM -lt 60 ]]; then
     echo "Error current java version is less than 1.8.0_60. Please install java version >= 1.8.0_60" >&2
     exit 3
  fi  
fi

# Install perf
yum -y install perf

# Install perf-map-agent
yum -y install cmake

AGENT_CLONE_DIR=/usr/lib/jvm
FGRAPH_CLONE_DIR=/usr/lib/jvm 

cd $AGENT_CLONE_DIR
rm -rf perf-map-agent
git clone --depth=1 https://github.com/jrudolph/perf-map-agent
cd perf-map-agent
cmake .
make

# Install FlameGraph
cd $FGRAPH_CLONE_DIR
rm -rf FlameGraph
git clone --depth=1 https://github.com/brendangregg/FlameGraph

UTILITY_NAME="profy.sh"

echo "Installation complited"
echo "Please configure utility file $UTILITY_NAME"
echo "Please set variable JAVA_HOME to $JAVA_HOME before run $UTILITY_NAME"
echo "Please set variable AGENT_HOME to $AGENT_CLONE_DIR/perf-map-agent before run $UTILITY_NAME"
echo "Please set variable FLAME_GRAPH_HOME to $FGRAPH_CLONE_DIR/FlameGraph before run $UTILITY_NAME"


