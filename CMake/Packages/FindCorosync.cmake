# - Try to find the Corosync libraries
# Once done this will define
#
# COROSYNC_FOUND - system has Corosync
# COROSYNC_INCLUDE_DIR - the Corosync include directory
# COROSYNC_LIBRARIES - Corosync library

MESSAGE(STATUS "Looking for COROSYNC...")

FIND_PATH(COROSYNC_INCLUDE_DIR cpg.h PATHS 
	/usr/include/ 
	/usr/local/include/
	PATH_SUFFIXES "corosync"
	)
     
FIND_LIBRARY(COROSYNC_LIBRARY_CPG NAMES cpg PATHS
    /usr/lib/
    /usr/local/lib/ 
    )
    
FIND_LIBRARY(COROSYNC_LIBRARY_EVS NAMES evs PATHS
    /usr/lib/
    /usr/local/lib/ 
    )
    
FIND_LIBRARY(COROSYNC_LIBRARY_COROIPCC NAMES coroipcc PATHS
    /usr/lib/
    /usr/local/lib/ 
    )
    
FIND_LIBRARY(COROSYNC_LIBRARY_QUORUM NAMES quorum PATHS
    /usr/lib/
    /usr/local/lib/ 
    )
    
FIND_LIBRARY(COROSYNC_LIBRARY_CONFDB NAMES confdb PATHS
    /usr/lib/
    /usr/local/lib/ 
    )

FIND_LIBRARY(COROSYNC_LIBRARY_CFG NAMES cfg PATHS
    /usr/lib/
    /usr/local/lib/ 
    )
    
IF(COROSYNC_INCLUDE_DIR AND COROSYNC_LIBRARY_CPG AND COROSYNC_LIBRARY_EVS AND COROSYNC_LIBRARY_COROIPCC AND COROSYNC_LIBRARY_QUORUM AND COROSYNC_LIBRARY_CONFDB AND COROSYNC_LIBRARY_CFG)
	SET(COROSYNC_FOUND 1)
	SET(COROSYNC_LIBRARIES "")
	LIST(APPEND COROSYNC_LIBRARIES ${COROSYNC_LIBRARY_CPG} ${COROSYNC_LIBRARY_EVS} ${COROSYNC_LIBRARY_COROIPCC} ${COROSYNC_LIBRARY_QUORUM} ${COROSYNC_LIBRARY_CONFDB} ${COROSYNC_LIBRARY_CFG})
	SET(COROSYNC_LIBRARIES ${COROSYNC_LIBRARIES} CACHE STRING "Corosync libraries" FORCE)
	IF(NOT COROSYNC_FIND_QUIETLY)
		MESSAGE(STATUS "Found Corosync: libraries = ${COROSYNC_LIBRARIES}")
	ENDIF(NOT COROSYNC_FIND_QUIETLY)
ELSE()
	SET(COROSYNC_FOUND 0 CACHE BOOL "Corosync not found")
	IF(COROSYNC_FIND_REQUIRED)
	    MESSAGE(FATAL_ERROR "Could NOT find COROSYNC, error")
	ELSE()
	    MESSAGE(STATUS "Could NOT find COROSYNC, disabled")
	ENDIF()
ENDIF()

MARK_AS_ADVANCED(COROSYNC_INCLUDE_DIR COROSYNC_LIBRARIES)

