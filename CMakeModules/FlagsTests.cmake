#INCLUDE(${CMAKE_ROOT}/Modules/CheckCCompilerFlag.cmake)

MACRO(CHECK_CFLAGS_APPEND DEST_FLAGS FLAG)
STRING(REGEX REPLACE "^-+(.*)$" "\\1" FLAG_NAME ${FLAG})
STRING(TOUPPER ${FLAG_NAME} FLAG_NAME)
SET(HAVE_FLAG "HAVE_FLAG_${FLAG_NAME}")

#CHECK_C_COMPILER_FLAG("${FLAG}" ${HAVE_FLAG})

SET(CMAKE_REQUIRED_FLAGS "${FLAG}")
CHECK_C_SOURCE_COMPILES(
"int main(){}
" ${HAVE_FLAG})
SET(CMAKE_REQUIRED_FLAGS "")


IF(${HAVE_FLAG})
  SET(${DEST_FLAGS} "${FLAG} ${${DEST_FLAGS}}")
ENDIF(${HAVE_FLAG})
ENDMACRO(CHECK_CFLAGS_APPEND)