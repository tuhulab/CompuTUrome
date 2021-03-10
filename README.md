# CompuTUrome

Tu's efficiency tricks and utilities to work on the HPC [Computerome 2.0](https://www.computerome.dk/display/C2W/Computerome+2.0+Wiki)

## RStudio
Computerome started supporting RStudio since late 2020. Please refer to the [official Wiki page](https://www.computerome.dk/display/C2W/Rstudio+Server).

Here is my quick receipe:

- Open an interative session
  
  - `qsub -W group_list=ku_00015 -A ku_00015 -X -I -l nodes=1:ppn=40,mem=180gb,walltime=99:00:00 -d /home/projects/ku_00015/people/tuhu -e /home/projects/ku_00015/people/tuhu/RStudio_log/$PBS_JOBID.e -o /home/projects/ku_00015/people/tuhu/RStudio_log/$PBS_JOBID.o -N RStudio` or

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

## utilities

### find large files

`find ~ -type f -size +100M`

### check usage
`module load tools usage_script/2.0`

`usage -u <username> -y 2021`

## Acknowledgement
