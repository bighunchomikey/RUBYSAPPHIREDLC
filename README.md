# RUBYSAPPHIREDLC-WITH-COMMENTS-FOR-DEOXYS
**DISCLAIMER: THE LAST TIME I WORKED ON THIS PROJECT WAS AUGUST OF 2023, IF I MISS ANY DETAILS, OR INFO IS WRONG, I WILL DO MY BEST TO CORRECT IT
              This project has been completed for some time now, just haven't had the time to upload it**

***To access the files with comments: Go to code > Deoxys Event With Comments***

This fork is really just meant to comment out the eonticket.asm and scriptcommandsdeoxys.asm from the main repo. This has just about every resrouce that
I found useful when trying to understand the code and even write my own. I created this fork to give people an easy place to start if you are wanting to learn
how not_blisy was able to get his events working, and even if you wish to make your own (or at least make your own encounter lol).
The code featured in eonticketcommented.asm and scriptcommandsdeoxys.asm is heavily based on not_blisy's solution, but I did make minor edits.

Although this code is not 100% original, I broke it down into pieces that I could understand, and then tried to piece them back together to make my solution.
A big difference that you will between mine and not_blisy's code (that you will see in scriptcommandsdeoxyscommented.asm) is that they wrote the macros
using $db (define byte) for every instruction. When talking with not_blisy, they mentioned that this was an oversight and could've been written using
$dw and $dd, which would greatly reduce the line number and be easier to debug. So I took this suggestion and:

      1) Turned all of the machine code found in the original scriptcommandsdeoxys.asm into ARM/THUMB code.
      2) Once it was readable (in ARM/THUMB), I looked at the instruction set and learned what each line was doing
      3) Found all of the related websites & repos that would explain why certain values were used.
         e.g: mov r1, $4F was in the macro for setting the obedient flag. Why use r1? Why use 0x4F? What even is 0x4F representing?
         (answers to all of these questions are within the scriptcommandsdeoxyscommented.asm
      4) Move some lines around to see if I could create a solution that wasn't an exact copy of not_blisy's to see if I really understood what I learned.

If you plan to make your event ticket from this fork/my solution by building/compiling your own card - I would advise against using:
      - eonticketcommented.asm
      - scriptcommandsdeoxyscommented.asm

Both of these files are just commented versions of my own working deoxys event, and from my experience, adding comments will change the memory location
of the macros. Meaning that if you use these files to make an event ticket, they will most likely not work.

If you wish to compile the "event" that I made for debugging the code (I really don't know why you would, not_blisy has a very detailed event already made)
then you should use these files:
      - eonticket.asm
      - scriptcommandsdeoxys.asm
## RUBYSAPPHIREDLC (All of the info from blisy's repo)

Custom E-Card Events based on Eon Ticket Dissasembly

The E-READER CARDS folder contains printable .raw files which you print with dot code print by firefly
or can use in MGBAs link mode with an E-Reader ROM.  https://www.caitsith2.com/ereader/devtools.htm

E-READER SAVE INJECTIONS is for injecting a save to an E-Reader or Flashcart. Will update soon.

MYSTERY EVENT 3 EVENTS is for this tool
https://digiex.net/threads/pokemon-gen-3-mystery-gift-tool-download-inject-nintendo-events-wondercards-more.14863/
Inject with the INJECT ME3 Option. 


To build from source follow this thread: https://www.pokecommunity.com/showthread.php?t=455241

PRINTING: https://docs.google.com/document/d/10RraYTTzzivAPC-yVt82ENmBjryv4VX8Rw-eoNLW44k/edit

This google doc contains the dimension I printed it at, make a copy of the doc for yourself and 
line up the blisy face to the 3.5 inch marker. 

TO DO:

Comment Source code

Provide ASM SOURCE

Based on this PokeCardE fork: https://github.com/Artrios/pokecarde

Credits:

me - programmer

Shao - Programming assistance

Riley - programming assistance, pokeemerald files

Goppier - WC3 GBA Sender, setboxmondata informant and programming assistance

UndeadXReality - WC3 GBA Sender, programming assistance & .sav provider

happylappy - general assistance

Malicia - programming assistance
