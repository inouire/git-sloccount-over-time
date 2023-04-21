# git-sloccount-over-time

This little bash script uses SLOCCount and Git to count the lines of code in you project over time, ready to be graphed by any tool you like.
It has been made and tested for Linux Mint (Ubuntu / Debian based). Feel free to test and adapt to your own platform.

## Setup

In order to make it work, you'll need to have git and sloccount installed + a git repository with clone access.

If you have a debian based system, simply launch `make install` to install them.

## Basic usage

```bash
./count_over_time.sh project-name git@plop.com/project main
```

The script will start by making a fresh clone of your repository in a 

Then it will go back in time in this local copy by 1-month steps and launch SLOCcount at each step, to get the total line count.

The total will be reported in the output CSV file that you can send to any graphing tool, like LibreOffice Calc for example.

Here is an example of result with DatWrapper:

[[/doc/example_graph_datawrapper.png|Graph generated with DataWrapper]]

Or with LibreOffice calc

[[/doc/example_graph_libreoffice.png|Graph generated with LibreOffice]]

## Customisation

It's possible that measuring the default total line count does not suit you. In that case you'll have to modify the sloccount call & result parsing

If one month is too short or too long for your needs, you'll have to modify the 'while' loop. Good luck but it should be doable ;)

## Credits

* SLOCount https://dwheeler.com/sloccount/sloccount.html

* Git https://git-scm.com/

* LibreOffice calc https://www.libreoffice.org/

* DataWrapper https://app.datawrapper.de