#!/bin/bash -e

OUTDIR=output

# wipe the output directory and old builds
rm -rf $OUTDIR
rm -rf tikzDevice_*
mkdir $OUTDIR

# Install the package so changes update
R CMD build --no-vignettes ../../
R CMD INSTALL tikzDevice_*.tar.gz

# Run the test suite
Rscript testRTikZDevice.R --output-prefix=$OUTDIR
Rscript testXeLaTeX.R --output-prefix=$OUTDIR
Rscript testUTF8.R --output-prefix=$OUTDIR

cp $OUTDIR/testXeLaTeX.pdf .
cp $OUTDIR/testUTF8.pdf .

echo
echo --------------------------------------------
echo All Tests ran successfully and combined into
echo tests.pdf, testXeLaTeX.pdf and testUTF8.pdf,
echo look at the pdfs for wierdness.
echo --------------------------------------------
