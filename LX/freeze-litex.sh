#/bin/bash

echo "In this use-todays-lx branch, don't use this script."
echo "Instead, create"
echo
echo "  microwatt-gists$ virtualenv --prompt uW .venv"
echo
echo "then activate:"
echo
echo "  microwatt-gists$ source .venv/bin/activate"
echo
echo "then in the virtualenv install LX:"
echo "....."

exit 0

# Get LiteX at the SHA at which DRAM worked.

rm -rf migen
rm -rf litex
rm -rf litex-boards
rm -rf liteiclink
rm -rf litescope
rm -rf liteeth
rm -rf litedram

git clone https://github.com/m-labs/migen.git
cd migen
git checkout 7bc4eb1387b39159a74c1dbd1b820728e0bfbbaa
# for Python3.11
git cherry-pick 0fb91737090fe45fd764ea3f71257a4c53c7a4ae
python3 setup.py install --user
cd ..


git clone  git@github.com:shingarov/litex.git
cd litex
git checkout fb05fbc # c19c343 right after this breaks C (#1842),
                     # and c6fb9 next breaks write leveling
git cherry-pick 19e7b53 # lx length modifier, so that C compiles
python3 setup.py install --user
cd ..


git clone https://github.com/enjoy-digital/litedram.git
cd litedram
git checkout 5a114be
python3 setup.py install --user
cd ..


git clone --depth=1 https://github.com/litex-hub/litex-boards.git
cd litex-boards
git fetch --depth=1 origin 929e55d7e62b7430b917d8a28604f315d4bb64b5
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..


git clone --depth=1 https://github.com/enjoy-digital/liteiclink.git
cd liteiclink
git fetch --depth=1 origin 6756b4a7ba1b6474d0a4a3f8f9759baf282f9b06
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..


git clone --depth=1 https://github.com/enjoy-digital/litescope.git
cd litescope
git fetch --depth=1 origin 14e8af8dd95f96b917d25f7626e910fb1c108456
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..


git clone  git@github.com:shingarov/liteeth.git
cd liteeth
git checkout eth2
python3 setup.py install --user
cd ..

echo "Now let's generate lx cores."

