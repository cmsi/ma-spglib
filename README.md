# ma-spglib
C library for crystal symmetry determination

1. Preparation of source file

        VERSION=1.15.1
        wget https://github.com/atztogo/spglib/archive/v$VERSION.tar.gz
        tar zxvf v$VERSION.tar.gz
        mv -f spglib-$VERSION spglib_$VERSION
        tar zcvf spglib_$VERSION.orig.tar.gz spglib_$VERSION
        rm -rf v$VERSION.tar.gz* spglib_$VERSION
        mv spglib_$VERSION.orig.tar.gz $HOME/vagrant/data/src/
