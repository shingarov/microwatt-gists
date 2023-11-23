#/bin/bash

# Show SHAs of all currently-checked-out LiteX components

for component in \
      migen litex litex-boards liteiclink litescope liteeth litedram ; \
  do echo -n "$component  \t" ; \
     cd $component ; \
     git rev-parse --short HEAD ; \
     cd .. ; \
  done

