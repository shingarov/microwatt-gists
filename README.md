# &#x1f4a1; + &#x1f427; = :heart:

## How to build Microwatt and run Linux

[Microwatt](https://github.com/antonblanchard/microwatt) is an
easy-to-understand OpenPOWER ISA processor softcore.
Microwatt support has been in the upstream Linux kernel since 5.14.

Shenki's [linux-on-microwatt](https://github.com/shenki/linux-on-microwatt)
already provides an excellent HOWTO for building Microwatt and running
Linux on it; so why yet another repo of gists?

The answer is, LiteX.  If you want to run this on some FPGA board less
common than the Arty-A7 (for which Shenki's instructions are written),
or port to a new board, or change something related to the uncore
(DRAM controller, Ethernet MAC, etc),
chances are you will need to generate your own LiteX IP cores.
And it turns out you can't just take anywhich SHA of LiteX and LiteDRAM
and so on, and just hope it will work with Microwatt; you will find yourself
in a revision-dependency hell trying to match a working combination of SHAs.

This repo started as a manually-collected list of SHA signatures of the
different dependencies for Microwatt. This evolved into the `freeze-litex.sh`
script.
*It works on my machine*&#8482;,
but is mainly there for human reading.

