#!./perl

BEGIN {
   if( $ENV{PERL_CORE} ) {
        chdir 't' if -d 't';
        @INC = qw(../lib);
    }
}

use FileCache;

END{
  unlink('foo');
}

print "1..1\n";

{# Test 4: that 2 arg format works, and that we cycle on mode change
     cacheout '>', "foo";
     print foo "foo 4\n";
     cacheout '+>', "foo";
     print foo "foo 44\n";
     seek(foo, 0, 0);
     print 'not ' unless <foo> eq "foo 44\n";
     print "ok 1\n";
     close foo;
}
