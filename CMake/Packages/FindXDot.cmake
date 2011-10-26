# - Try to find the XDOT script
# Once done this will define
#
# XDOT_SCRIPT - system has XDOT

IF(NOT WIN32)
    FIND_PATH(XDOT_SCRIPT "xdot.py" PATHS
        /usr/local/bin
        )
ENDIF()

IF(XDOT_SCRIPT)
    SET(XDOT_FOUND 1)
    IF(NOT XDOT_FOUND_QUIETLY)
        MESSAGE(STATUS "Found XDOT: script = ${XDOT_SCRIPT}")
    ENDIF()
ELSE()
    SET(XDOT_FOUND 0 CACHE BOOL "XDOT not found")
    MESSAGE(STATUS "XDOT not found, disabled")
ENDIF()

MARK_AS_ADVANCED(XDOT_SCRIPT)
