SET (CTEST_PROJECT_NAME "z")
SET (CTEST_DROP_METHOD "http")
SET (CTEST_DROP_SITE "buildbot")
SET (CTEST_DROP_LOCATION "/CDash/submit.php?project=${CTEST_PROJECT_NAME}")
SET (CTEST_TRIGGER_SITE "http://localhost/cgi-bin/Submit-CMake-TestingResults.pl")
SET (CTEST_DEOP_SITE_CDASH TRUE)
