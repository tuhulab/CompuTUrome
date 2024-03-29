# CompuTUrome

Tu's efficiency tricks and utilities to work on the HPC [Computerome 2.0](https://www.computerome.dk/display/C2W/Computerome+2.0+Wiki)

## HPC general introduction (from SIB)

The general idea and principle of how HPC works, from [SIB](https://edu.sib.swiss/pluginfile.php/6533/mod_resource/content/3/hpc/index.html?utm_source=pocket_mylist)

## Running R script from the shell

- Write R in a `.R` document. Remark: be careful with path (realative or absolute) and loading all needed packages. It's where the errors often occur.

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

### quickly go back to the project/data folder`
`alias myproject="cd /home/projects/ku_00015/people/tuhu/"`
`alias mydata="cd /home/projects/ku_00015/data/"`
`alias rmodule="module load intel/perflibs/64/2020_update2 gcc/9.3.0 R/4.1.0-GCC-MKL libxkbcommon/1.0.3 cuda/toolkit/11.4.1 rstudio/1.4.1717"`

## utilities

### find large files

`find ~ -type f -size +100M`

### check usage
`module load tools usage_script/2.0`

`usage -u <username> -y 2021`

## Running RStudio
`module load intel/perflibs/64/2020_update2 gcc/9.3.0 R/4.1.0-GCC-MKL libxkbcommon/1.0.3 cuda/toolkit/11.4.1 rstudio/1.4.1717`

`rstudio_swrender`

### Notes on BiocParallel 

- `Core number`: I noticed that `DEseq2` merely increase efficiency using more than a handful of cores (4-8), meanwhile the RAM is somtimes the bottleneck for `DEseq2` and `dada2`. So I recommend using fatnode when using `DESeq2` and `dada2`, or generally for any heavy lifting backended by `BiocParallel`.
- Avoid using `pipe (%>%)`
- Avoid using `purrr::map` based functional programming though it is very elegent in style.
- Executing from `.R` file instead of RStudio
- Avoid transmitting `large amount of data`. If unavoidable, use fewer cores to avoid dumping cores.
- Check availabilities of `dependency packages`

## VSCode
`module load vscode` doesn't work anymore!

## Bashrc
`alias ssidata="cd /home/projects/cu_10181/data"`

