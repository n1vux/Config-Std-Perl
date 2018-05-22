use Test::More tests => 4;

BEGIN {
use_ok( 'Config::Std', 'read_config' , { def_gap=>1} );
}

is(    *no_such{CODE},     undef, "test the test");
is(ref *read_config{CODE}, 'CODE', "imports requested func");
is(    *write_config{CODE}, undef, "does NOT import non-requested func");


diag( "Testing Config::Std $Config::Std::VERSION" );
