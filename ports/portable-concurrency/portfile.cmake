vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO VestniK/portable_concurrency
    REF 380e1f1d95cd0e5446cb1426c68a332d309749c1
    SHA512 6bc1c37b124a749bd083ded0885b258e24e35342b2f643a5d64cc2509b6c2ed5a1993ec53f6d11bed505d75fd430c015e9c61f13ea46883a0dab50536b6e39cc
    HEAD_REF master
)


vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DPC_BUILD_TESTS=OFF
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/portable_concurrency TARGET_PATH share/portable_concurrency)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)


# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/portable-concurrency RENAME copyright)
