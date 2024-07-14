vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO dennisferron/beison
	
	# THIS is the head of the Beison git repo
	REF dbe51578d79449a7d601dd7881f689f198fba1e6
	
	# THIS is (I think??) a hash of the expected content.
	# Docs say start with 0 and replace it with value from
	# the build error message when it complains...
	SHA512 a023efa034b63c3557113105003f657d622add13e43c2ee13fd706de5d4c5f44bd4e43ecec6093cebb0ce90fb4793d49fc777cb7739dc84249b0b5951166873f
	
	HEAD_REF main
)

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)
