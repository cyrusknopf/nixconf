{ pkgs, ... }:

# TuringDB development system
{

home = {

  packages = with pkgs; [
    gcc15
    cmake
    git-lfs
    gnum4
    clang-tools
    rr

    uv

    # Profiling and anaylsis
    gdb
    linuxPackages_latest.perf
    valgrind
    heaptrack
  ];
  
}; 

}
