if [ -f ~/.dir_colors ]; then
    eval `dircolors ~/.dir_colors`
fi

vman() {
   vim -c "SuperMan $*"

   if [ "$?" != "0" ]; then
  	 echo "No manual entry for $*"
   fi
}


alias ls='ls --color=auto'
source /home/shagai/.bazel/bin/bazel-complete.bash

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/bin"

export CUDA_HOME=/opt/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

export OPENAI_GYM_API_KEY=sk_4WYhUBanSJ1HiPocUAOWw

export VISUAL="vim"

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
