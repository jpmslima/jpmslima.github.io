# Installing the programs on your own computer

From now on we will assume that you have already installed Linux<sup>1</sup> and have some basics of how the system works. We can then install some basic programs that we will use in our course. Let's start with the easiest ones to install. We'll use the `sudo apt install` tool to get some basic programs.

>*<sup>1</sup>If you prefer Windows based systems, you can install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) and execute these commands from the Linux Terminal. Note that the GUI from some programs won´t execute in this environment. Just install their Windows version. In MacOS based systems, most of the commands will work either.*

- Open a terminal window or *shell*:
- When the terminal is open a screen like the one below will be seen:

```shell
Last login: Tue Jul 3 11:56:50 2018 on ttys000
user@host:~$
```

> *The screen is not exactly like this, but quite similar.*

- Now type the command below:

```none
sudo apt update
```

- The system will prompt you for a password, which is the same as your user password created when you installed the system. Type the password carefully, as when you type it, there is no indication of how many characters you have typed<sup>2</sup> (this demonstrates the security of the system).

><sup>2</sup>*In some Linux distributions (like LinuxMint), the default shell shows you the number of characters as you type.*
>
> The `apt` package manager is a package manager for the Debian GNU/Linux operating system. It allows you to install packages quickly and easily by already solving all of their dependencies. The `update` argument is for updating the list of packages that are available on the servers.
> 
> Linux `sudo` allows ordinary users to obtain system administrator privileges. You won´t have this permission at the public machines or university's servers.

- Now we are going to upgrade installed packages with the `upgrade` argument. To do this, type the command below:

```none
sudo apt upgrade
```

- After you are done with the previous command, type the following commands to install the programs and tools you will need:

```none
sudo apt install make
sudo apt install openbabel
sudo apt install gromacs
sudo apt install autodock-vina
sudo apt install grace
sudo apt install avogadro
sudo apt install gabedit
```

Now that the easiest programs to install are ready, we can download some others that cannot be obtained via `apt install`.

## Programs for drawing molecules in two dimensions:

- [MarvinSketch](https://chemaxon.com/products/marvin) (Registration will be required).
- [BKChem](http://bkchem.zirael.org/download_en.html) (A less sophisticated alternative).

To install Chemaxon's Marvin (recommended), first install Java on the machine, with the following command:

```none
sudo apt install default-jre
```

Then just install the `.deb` Marvin package you downloaded with the following command:

```none
sudo dpkg -i marvin_linux_18.14.deb
```

> *The version of the program may change, so stay tuned.*

- To run it just type in terminal:

```none
msketch
```

## Modeller

To install Modeller, download the file for your operating system version and follow the instructions described [HERE](https://salilab.org/modeller/9.17/release.html#deb). The tutorial is suitable for Modeller used on a Linux operating system.

After installation, verify the file `config.py`, inside the `../modeller9.XX/modlib/modeller` directory. On some Ubuntu systems, it can also be installed by the command:

```none
sudo apt install modeler
```

> *9.XX, where XX is the current version of Modeller.*

The installation directory is usually `/usr/lib/modeller9.XX/modlib/modeller`.

Inside this directory, the `config.py` file should contain the following lines:

```none
install_dir = r'/usr/lib/modeller9.XX'
license = 'MODELIRANJE'
```

##### IMPORTANT:

**This license is exclusively for academic and teaching purposes only and must be requested by everyone that use the program. The license can be requested [HERE](https://salilab.org/modeller/registration.html). Normally an institutional email address is required.**

## UCSF Chimera and UCSF ChimeraX

UCSF Chimera/ChimeraX are very versatile programs for visualizing and editing small molecules, macromolecules, and complexes. To install the old Chimera, you will need to download the program from:

[https://www.cgl.ucsf.edu/chimera/download.html](https://www.cgl.ucsf.edu/chimera/download.html).

- After downloading, go to the terminal and find the folder where the installation file was downloaded (usually the Downloads folder).

```none
cd downloads
chmod a+x chimera-1.XX-linux_x86_64.bin 
```

> *The version of the program may change, so stay tuned.*

Now just run it to install:
```
sudo ./chimera-1.XX-linux_x86_64.bin
```
- A few questions will appear, just press `Enter`, but one in particular makes sure the program is easy to run:

```none
Install symbolic link to chimera executable for command line use in which directory?
```

- Choose option 2 `- /usr/local/bin`, if you use Ubuntu or similar.
- Write `yes` to install the desktop shortcut option.

To run UCSF Chimera, simply click on the shortcut created on the desktop or type the following command in the terminal:

```none
chimera
```

>*UCSF Chimera is not on active development anymore (just bug fixes) and is slowly being substituted by Chimera X. However, not all functions are yet implemented in ChimeraX*

To install the new ChimeraX you will need to download the program from its site:

https://www.cgl.ucsf.edu/chimerax/download.html

- After downloading the version suitable for your OS (here we show Ubuntu 22.04-based OS installation procedure), go to the terminal and find the folder where the installation file was downloaded (usually the Downloads folder). Install on your *personal_ computer* with:

```
sudo apt-get install ~/Downloads/ucsf-chimerax_1.4ubuntu22.04_amd64.deb
```

- After installation, ChimeraX executable will be on: `/usr/bin/chimerax`. So, to run ChimeraX, simply click on the shortcut created on the desktop or type the following command in the terminal:

```none
chimerax
```

## VMD

Now let's install a similar program, VMD. Download the program from:

[http://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=VMD](http://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=VMD).

VMD is similar to UCSF Chimera in functionality, but can handle molecular dynamics simulations much better. Such simulations generate large files, which UCSF Chimera has some trouble opening. In addition, VMD has more sophisticated analysis tools for the specific interpretation of molecular dynamics simulations.

- Sign up, download the Linux package and extract the package directly from the terminal with the command:

```none
tar xvf vmd-1.9.X.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz
```

>*The version may be different. Pay attention.*

- Enter the install directory:

```none
cd vmd-1.9.3/
./configure
cd src/
sudo make install
```

- To run VMD, type in the terminal:

```none
vmd
```

## MOPAC2016

We will now install the program MOPAC2016, which is a semi-empirical quantum mechanics program with excellent tools for optimizing organic molecules. Get it from: [http://openmopac.net/Download_MOPAC_Executable_Step2.html](http://openmopac.net/Download_MOPAC_Executable_Step2.html). Download the 64bit version for Linux. To install, follow the procedure below (still in terminal), by typing the commands in sequence:

```none
mkdir mopac
mv MOPAC2016_for_Linux_64_bit.zip mopac/
cd mopac/
unzip MOPAC2016_for_Linux_64_bit.zip
sudo mkdir -p /opt/mopac
sudo cp MOPAC2016.exe /opt/mopac/
sudo cp libiomp5.so /usr/lib/
sudo chmod 777 /opt/mopac/
sudo chmod a+x /opt/mopac/MOPAC2016.exe
sudo cp /opt/mopac/MOPAC2016.exe /usr/local/bin/mopac
mopac 10656431a45074641
```

- When asked, type `Yes` to agree to the License terms.

## Balloon

Now let's install the program [Balloon](http://users.abo.fi/mivainio/balloon/download.php). Balloon is an excellent program to generate conformations for molecules from the 2D or 3D structure. It is very simple to install it. After downloading it from the link above, type the following commands:

```none
unzip Linux_64bit-Balloon.zip
cd Linux_64bit-Balloon
chmod a+x balloon
sudo ln -s $PWD/balloon /usr/local/bin/balloon
```

These are the essential programs for the course.

## Accounts on web servers or programming environments

### Swiss-Model

We will use Swiss-Model to model and evaluate different structures. We can do this without a specific account, but we recommend that you create your own account to have records of your work submitted to the server. The account is **_Free_** and does not require an institutional e-mail address.

- Go to the [Swiss-Model](https://swissmodel.expasy.org) website and click on **Create Account** in the upper right corner.

[Swiss-Model](https://drive.google.com/uc?id=1OqpxNsFQcIwmQFGu326rNYn98cJKwdSx)

- Enter your e-mail address, and then check it, because the password for logging in is sent right after registration.

### Automated Topology Builder (ATB) and Repository

The ATB and Repository is a server intended to facilitate the development of molecular force fields for molecular dynamics simulations of biological systems. The server is free to academic users (although an institutional email address is required). Be aware that molecules submitted to ATB by non-commercial users will be publicly available.

If you have an institutional email address (.edu; .edu.br; .br), create your account at:

[https://atb.uq.edu.au/index.py](https://atb.uq.edu.au/index.py)

- Go to the link in the upper right corner **Register** and follow the procedures indicated.

### Robetta

Robetta is a protein structure prediction service from the [BakerLab](https://www.bakerlab.org/) based on the program Rosetta, initially a *ab initio* tool, which lately included comparative modeling predictions. The server now includes RoseTTAFold predictions, the second place modeling predictor from [CASP14](https://predictioncenter.org/casp14/). Create an account by the following steps:
- Go to the [Robetta](https://robetta.bakerlab.org/) site.
- Click on **Register** and fill the required fields. As far as to my knowledge you will have to use an institutional mail address (.edu; .edu.br; .br).

### GoogleColab

[GoogleColab](https://colab.research.google.com/), or "Collaboratory," allows you to write and run Python in the browser (like [Jupyter](https://jupyter.org/)). No configuration is required and you have access to GPUs at no cost, using the free tier. You can also easily share your notebooks.

We will use Colab in order to access the features from [ColabFold](https://github.com/sokrypton/ColabFold), using the new AI modeling approaches from AlphaFold2, RoseTTAFold and ESMFold. If you have a Google Account, you just have to access Colab in order to use it. Using the free version you can perform at least one prediction per day, depending on the tool, and on the size of the target protein. We will also use Colab via UCSF ChimeraX to easily obtain protein models.