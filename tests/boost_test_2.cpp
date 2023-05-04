#define BOOST_TEST_MODULE MonTest
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(MonTest3)
{
    int a = 1;
    BOOST_CHECK(a == 1);
}

BOOST_AUTO_TEST_CASE(MonTest4)
{
    int a = 2;
    BOOST_CHECK(a == 2);
}