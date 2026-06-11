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
    python312

    uv

    # Profiling and anaylsis
    gdb
    perf
    valgrind
    heaptrack
  ];
  
  # Ensures headers are visible to cmake for nanobind, etc
  sessionVariables = {
    Python_ROOT_DIR = "${pkgs.python312}";
  };

}; 

}
