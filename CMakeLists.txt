cmake_minimum_required(VERSION 3.27)

project(starboard)
set(CMAKE_CXX_STANDARD 20)

message(STATUS "toolchain: ${CMAKE_TOOLCHAIN_FILE}")

find_package(antlr4-runtime CONFIG REQUIRED)
find_package(antlr4-generator CONFIG REQUIRED)

# Download the jar file for antlr4 generator.
include(FetchContent)
FetchContent_Declare(
        antlr4_jar
        URL https://www.antlr.org/download/antlr-4.13.1-complete.jar
        SOURCE_DIR ${PROJECT_SOURCE_DIR}/download
        DOWNLOAD_NO_EXTRACT TRUE
)
FetchContent_MakeAvailable(antlr4_jar)

# This variable is used both by antlr4_generate and test_rig.
set(ANTLR4_JAR_LOCATION ${PROJECT_SOURCE_DIR}/download/antlr-4.13.1-complete.jar)

# Many generated and input file names are implicit based on grammar name.
set(my_grammar "Lang")

# This is really only needed by the test_rig, but I put
# it here so that it's near the grammar name declaration.
set(my_grammar_start_rule "prog")

antlr4_generate(
        LangLexer
        ${CMAKE_CURRENT_SOURCE_DIR}/LangLexer.g4
        LEXER
        FALSE
        FALSE
        "Lang"
)

antlr4_generate(
        LangParser
        ${CMAKE_CURRENT_SOURCE_DIR}/LangParser.g4
        PARSER
        FALSE
        FALSE
        "Lang"
        "${ANTLR4_TOKEN_FILES_LangLexer}"
        "${ANTLR4_TOKEN_DIRECTORY_LangLexer}"
)

add_executable(starboard main.cpp)
target_link_libraries(starboard antlr4_static)
target_include_directories(starboard PRIVATE "${ANTLR4_INCLUDE_DIR_LangLexer}" "${ANTLR4_INCLUDE_DIR_LangParser}")
target_sources(starboard PRIVATE ${ANTLR4_SRC_FILES_LangLexer} ${ANTLR4_SRC_FILES_LangParser})
target_include_directories(starboard PRIVATE "${ANTLR4_INCLUDE_DIR}")
