vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO dennisferron/WebGPU-distribution
	
	REF fb39c1fcbd3c48da8e87fe614194a217a6e04fae
	
	SHA512 bf4bd2fef864e8120bfe65d11e9c370ab167da86e376c901eb4d45643f80008df0cdd09aad70fd0a1ed55cc962bf981eb46f76371feaad7ba2dc86c6fc78e646
	
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
 