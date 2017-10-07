#! /bin/bash
# personal regression testing tool, not in included in distribution
# Assumes perlbrew in use, and several libs exist ...
#$ perlbrew create lib $perl@class-std
#   - which contains exactly needed prereqs, primarily Class::Std hence the name;  e.g. 
#$  prereqs=File::Path File::Spec~'>= 3.13' Module::Build Class::Std Test::Distribution Test::Pod::Coverage Test::Pod 
#$ nice perlbrew exec --with "perl-5.26.1-threads@class-std" cpanm $prefreqs
# and for (Perl < 5.21.1) Test::Harness~'>= 3.31' (or turn off HARNESS_OPTIONS=j9)

if [ -z "$1" ]
then
    list=`perlbrew lib list | perl  -E '@a=<>; chomp for @a; s/^ +// for @a; print join q(,), grep /class-std/, @a'`;
else
    list=`perlbrew lib list | fgrep $1| head -1`
    echo $list
fi
export PERL5LIB=''
export HARNESS_OPTIONS=j9  # Allow parallel tests which should be suppressed by 
export HARNESS_RULESFILE=$PWD/t/testrules.yml
perlbrew exec --with $list 'perl Makefile.PL && make && ( perl -V | egrep "pthread|ithreads";  make test )'

echo Build ...

perlbrew exec --with $list 'perl Build.PL && ./Build && ./Build test'

./Build clean
perl -I "$HOME/perl5/lib/perl5" Makefile.PL && make

