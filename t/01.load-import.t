use Test::More tests => 1;

BEGIN {
    # Test classical use of use to load only read_config, to allow read only config usage
use_ok( 'Config::Std', 'read_config' );
}

diag( "Testing Config::Std $Config::Std::VERSION" );
