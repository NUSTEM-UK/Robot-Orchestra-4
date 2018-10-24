"""Output text version of full song list.

Parse the RTTTL song list and output out song names only, to the shell. 
Route to a file to produce songlist.txt. See songlist_formatted.pages for
a printable version whcih is sanitised for eg. sweary titles, as of 2018-10-24.
"""

from bigrtttl import *

for key, value in songdictEgg.items():
    print(key)
    