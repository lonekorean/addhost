addhost
=======

Windows batch script for adding a new hostname binding to a website.

###What is this?

Just a simple script for getting new hostnames up and running. Doing this manually can be tedious. This script takes care of updating your hosts file, adding a new binding to IIS, and restarting the site for you. Takes about 1-2 seconds.

###How do I use this?

Before running, if you are not using "Default Web Site" as your site in IIS, then open up the script and edit line 4 as needed (no double quotes).

In most cases, the script needs to be run with admin privileges. Just right click on the script and select "Run as administrator".

You can also run the script from a command line, like so: addhost dev.potato.com
