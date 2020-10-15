# CompuTUrome

Tu's efficiency tricks and utilities to work on a HPC: [Computerome 2.0](https://www.computerome.dk/display/C2W/Computerome+2.0+Wiki)

## R work

### For development

#### Method I: Using local RStudio to interact with Computerome (Recommended)

- `ssh USERNAME@ssh.computerome.dk` from the **local** RStudio terminal

- Open a [**screen**](https://www.gnu.org/software/screen/screen.html) session from the login node, preferably with a name (-S). 
  
  `screen -S myBeautifulWork`
  
- Start an interactive `job` session

  - A lite prototype environment
  `qsub -I -W group_list=MY_GROUP -A MY_GROUP -l nodes=1:ppn=8,walltime=4:00:00`
  
  - A powerful testing environment: `qsub -I -W group_list=MY_GROUP -A MY_GROUP -l nodes=1:ppn=40,walltime=4:00:00`

- Load modules and start R
  
  `module load tools intel/perflibs/64/2020_update2 gcc/9.3.0 R/4.0.0; R`

- Now R is ready. But still a few things need to be configured:

  - Change working directory to the project folder: `setwd("/home/projects/MY_GROUP/people/MY_NAME/MY_PROJECT")`

##### Job monitoring

- Temporary leave (detach) the **screen** session: `CTRL+A d`
- Reattach the **screen** session: `screen -r myBeautifulWork`
  
  - Check the work name if forget the work name or without giving it a name: `screen -ls`

#### Tu's secret receipe for Method I

- I recommend you to use an R Markdown to consolidate both bash script and R code. This provides  the opportunity for both documenting, and esay execution. Here is [my template](https://raw.githubusercontent.com/tuhulab/CompuTUrome/main/receipe/computerome_receipe_R.Rmd). You can download it from the **local** terminal. First `cd` to a **local** location where you want to store the template, preferably in your project's R code folder, then use `wget https://raw.githubusercontent.com/tuhulab/CompuTUrome/main/receipe/computerome_receipe_R.Rmd` 
  
  - Now you can open the R Markdown from your RStudio. You can execute the selected the code, or  send the current line (if nothing is selected) by using `Ctrl+Alt+Enter` (Windows) or `Cmd+Alt+Enter` (Mac). Check [here](https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#send) for more info.

### For production

(to be continued)

## NGS work

(to be continued)