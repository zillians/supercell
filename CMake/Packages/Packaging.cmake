GET_FILENAME_COMPONENT(__cmake_path ${CMAKE_COMMAND} PATH)
FIND_PROGRAM(CPACK_COMMAND cpack ${__cmake_path})
MESSAGE(STATUS "Found CPack at: ${CPACK_COMMAND}")
IF(NOT CPACK_COMMAND)
	MESSAGE(FATAL_ERROR "Need CPack!")
ENDIF(NOT CPACK_COMMAND)

IF(UNIX)
	SET(CPACK_GENERATOR "DEB")
ENDIF(UNIX)
IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	SET(CPACK_GENERATOR "DEB")
ENDIF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
IF(WIN32)
	SET(CPACK_GENERATOR "NSIS;ZIP")
ENDIF(WIN32)

ADD_CUSTOM_TARGET(ALL_PACKAGES)
MACRO(ADD_COMPONENT_PACKAGE __component __config)
	SET(PACKAGE_COMPONENT ${__component})
	SET(__packageTarget PACKAGE_${PACKAGE_COMPONENT})
	SET(__packageConfig ${CMAKE_CURRENT_BINARY_DIR}/CPackConfig-${PACKAGE_COMPONENT}.cmake)

	CONFIGURE_FILE(${__config} ${__packageConfig} @ONLY)
	ADD_CUSTOM_TARGET(${__packageTarget}
		${CPACK_COMMAND} --config "${__packageConfig}"
	)
	ADD_DEPENDENCIES(ALL_PACKAGES ${__packageTarget})
ENDMACRO(ADD_COMPONENT_PACKAGE)
