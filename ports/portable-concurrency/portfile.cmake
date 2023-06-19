vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO VestniK/portable_concurrency
    REF 380e1f1d95cd0e5446cb1426c68a332d309749c1
    SHA512 9fd3d05ac47d4c0e57633846fd87dc56235d971f0af2df37c9bc57f5aafd69c4edf4670cbb6b1a45a3117d7523870700e31270f213e9278a4eb007b91e7be16a
    HEAD_REF master
)


vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DPC_BUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/portable_concurrency TARGET_PATH share/portable_concurrency)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)


# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/portable-concurrency RENAME copyright)
