vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO dennisferron/antlr4-testrig-runner
	
	REF 4c0f384236c8b555b3b3a156a91af7cd43d695dc
	
	SHA512 aad0471dcd8aa947a894a1536be28b9aa801fea3f4ef0a3e635f9329756dca9ef4cf34b1c1a167b604400849c3b31a3bc87561b7ee89e0f9b6dc82b50857a5dc
	
	HEAD_REF main
)

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()
vcpkg_copy_tools(
    TOOL_NAMES antlr4-testrig-runner
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)
 