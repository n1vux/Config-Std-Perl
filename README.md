# Build status of dev branch

* Linux [![Build Status](https://travis-ci.org/n1vux/Config-Std-Perl.svg?branch=dev)](https://travis-ci.org/n1vux/Config-Std-Perl.svg?branch=dev)
* Windows [![Build Status](https://ci.appveyor.com/api/projects/status/github/n1vux/config-std-perl)](https://ci.appveyor.com/project/n1vux/config-std-perl)

# Config::Std

This configuration-file module is designed to not only read `section:name:value` triples like any other INI parser, but to also write changed values back out, and to preserve line comments when re-writing. The latter is the special sauce.

## Damian Conway's Description

This module implements yet another damn configuration-file system.

The configuration language is deliberately simple and limited, and the
module works hard to preserve as much information (section order,
comments, etc.) as possible when a configuration file is updated.

See Chapter 19 of "Perl Best Practices" (O'Reilly, 2005) for the
rationale for this approach.

(Above is original description by original author, Damian Conway. `Config::Std` was conceived as a companion example for `Class::Std`, his proposed OO Perl base-class in the PBP book. He has newer Class Classes since then. If C::S did not have the unique ability to re-write with round-trip comments, it would be just a(n) historic novelty.)

# Building

To install this module, run the following commands:

    perl Makefile.PL
    make
    make test
    make install


Alternatively, to install with `Module::Build`, you can use the following commands:

    perl Build.PL
    ./Build
    ./Build test
    ./Build install

Parallel Testing with multi-threading in `HARNESS_OPTIONS` will not work (yet).
`HARNESS_OPTIONS=j1` and/or `HARNESS_RULESFILE=$PWD/t/testrules.yml` should correct parallel test failures.

# DEPENDENCIES

    * File::Spec 3.13+ (with Perl 5.10 or later 
    * Class::Std

## Optional

    * Module::Build (Core in Perl 5.10 - 5.18)

## Optional for development

    * Test::Distribution
    * Test::Pod::Coverage
    * Test::Pod

# COPYRIGHT AND LICENCE (License in USA)

 Copyright (C) 2005, Damian Conway;
 Copyright (C) 2011,2013,2017 William Ricker + Tom Metro, maintainers for Boston.PM

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
