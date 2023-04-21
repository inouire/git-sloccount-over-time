# Visualize your code mass evolution 📈

This little bash script uses SLOCCount and Git to **extract the code lines count** of you project over time, ready to be graphed by any tool you like.
It has been made and tested for Linux Mint (Ubuntu / Debian based). Feel free to test and adapt to your own platform.

## Setup

In order to make it work, you'll need to have **git** and **sloccount** installed + a git repository with clone access.

On a Debian based system, launching `sudo apt install git sloccount` will do the trick.

You can then clone or download this repository, and you're good to go!

```bash
git clone https://github.com/inouire/git-sloccount-over-time.git
cd git-sloccount-over-time
```

## Basic usage

```bash
./count_over_time.sh your-project git@gitlab.com.com/your-project.git main
```

* The script will start by making a fresh clone of your repository in a local folder

* Then it will go back in time in this local copy by 1-month steps and launch SLOCcount at each step, to get the total line count.

* The total will be reported in the output CSV file that you can send to any graphing tool, like LibreOffice Calc for example.

**Console output**

![Script console output](/doc/example_console_output.png)

**Rendering with Datawrapper**

![Graph generated with DataWrapper](/doc/example_graph_datawrapper.png)

**Rendering with LibreOffice calc**

![Graph generated with DataWrapper](/doc/example_graph_libreoffice.png)

## Considerations

💡 Git clones are not deleted automatically, so don't forget to clean them if you run the script multiple times.

💡 SLOCCount counts the line of codes in a certain way, which should be pretty accurate. Anyways, the exact count does not really matter, the most important being the evolution of you code mass.

⚙️ It's possible that measuring the default total line count does not suit you. In that case you'll have to modify the sloccount call & result parsing

⚙️ If one-month-steps are too short or too long for your needs, you'll have to modify the 'while' loop. Good luck with bash logic, but it should be doable 🙃

## Credits

* SLOCount https://dwheeler.com/sloccount/sloccount.html

* Git https://git-scm.com/

* LibreOffice calc https://www.libreoffice.org/

* Datawrapper https://app.datawrapper.de

* PPE analytics (I work there) https://www.ppe-analytics.com/