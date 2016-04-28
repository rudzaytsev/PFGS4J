# Profy
Profy is Perf and FlameGraph sticker for Java 8+ applications

## Requiments
RedHat based Linux distribution.

## How to install profy
1. Clone Profy from github (git clone https://github.com/rudzaytsev/Profy.git) or download it in zip file
2. Set path to Oracle JDK 8+ to JAVA_HOME variable in file install.sh . Java version should be greater or equal than "1.8.0_60"
3. Run installation: sudo ./install.sh

## How to configure profy before run
1. After installation, edit profy.sh file
2. Setup JAVA_HOME, AGENT_HOME and FLAME_GRAPH_HOME variables in profy.sh. Last three lines of install.sh output can help you.
3. Optional. Add profy.sh to PATH or make symlink and add it to PATH.

## How to run profy
0. Run java program that you want to profile (get overhead graph at svg format) with JDK option XX:+PreserveFramePointer
1. For example run: sudo ./profy.sh -F 1000 -p PID_OF_JAVA_APP -o outputGraphSvgFile
3. Don't worry about some error messages on output. 
4. Result of profy.sh work is graph or overhead that was build using samplings method and stored in svg file.
5. You can view graph by web-browser, such as Firefox or Chrome.

## Profy options

-h - help
-F - setup sampling frequency in Hz (default value = 99 Hz)
-p - setup pid of java application for profiling (without this aoption all java processes will be profiled)
-o - setup output file name, default value = flamegraph (don't specify extension, program specifies .svg to output file )
