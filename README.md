# CompuTUrome

Tu's efficiency tricks and utilities to work on the HPC [Computerome 2.0](https://www.computerome.dk/display/C2W/Computerome+2.0+Wiki)

## Running R script from the shell

- Write R in a `.R` document. Remark: be careful with path (realative or absolute) and loading all needing packages. It's where the errors often happen.

- Write another shell script (my_cool_R_job.sh)

```
cd /home/projects/ku_00015/data/ad-microbiome/ # the working directory for the R project
module load intel/perflibs/2020_update4  gcc/9.3.0  R/4.1.0
Rscript the_path_to_the.R
```

- qsub the `.sh` according to the [WiKi](https://www.computerome.dk/display/C2W/Batch+System)

## RStudio Server (**Superseded. I recommend using RStudio via ThinLinc virtual desktop instead of this method**)

Computerome started supporting RStudio since late 2020. Please refer to the [official Wiki page](https://www.computerome.dk/display/C2W/Rstudio+Server).

Here is my quick receipe:

- Open an interative session
  
  - `iqsub`

- Install RStudio on the **interactive node**, using the following command:

    `module load tools rstudio-server/1.3.1073`
    
    `rstudio1.3.1073-R.4.0.0-install`

- Open a **new** terminal
  
  `ssh -L 8787:<your interactive node name>:8787 <your username>@ssh.computerome.dk`

  You'll need to type in pw and one-time passcode in this step.

- Open a browser. Go to `http://localhost:8787`
  
- Type in your Computerome usr name and pw

## .bashRC

### quickly go back to the project/data folder
alias myproject="cd /home/projects/ku_00015/people/tuhu/"
alias mydata="cd /home/projects/ku_00015/data/"
alias rmodule="module load intel/perflibs/64/2020_update2 gcc/9.3.0 R/4.1.0-GCC-MKL libxkbcommon/1.0.3 cuda/toolkit/11.4.1 rstudio/1.4.1717"

## utilities

### find large files

`find ~ -type f -size +100M`

### check usage
`module load tools usage_script/2.0`

`usage -u <username> -y 2021`

## Running RStudio
`module load intel/perflibs/64/2020_update2 gcc/9.3.0 R/4.1.0-GCC-MKL libxkbcommon/1.0.3 cuda/toolkit/11.4.1 rstudio/1.4.1717`

`rstudio_swrender`

### Less is more?

I noticed that `DEseq2` (a Bioconductor package for RNA-seq data) merely increase efficiency using more than 20 cores.
## VSCode
`module load vscode` doesn't work!


