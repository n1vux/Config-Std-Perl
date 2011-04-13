#! perl

use Test::More;
plan skip_all => "Developer tests" unless -d ".svn" or -d ".git";


  BEGIN {
        eval {
                require Test::Distribution;
        };
        if($@) {
                plan skip_all => 'Test::Distribution not installed';
        }
        else {
                import Test::Distribution distversion=>1;
        }
   }


