vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO absurdworlds/awlib
    REF ${VERSION}
    SHA512 1037e8558392b8f0abb2b9443ca9d71b34ee2a7387d08b18214a9f944089d54c43a7008e4958d465f6f737d11cd5230b8e7181b8c3f3b695c82c8248d16ad472
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    hudf             AW_ENABLE_HUDF
    graphics         AW_ENABLE_GRAPHICS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME ${PORT} CONFIG_PATH lib/cmake/${PORT})

vcpkg_fixup_pkgconfig()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_copy_pdbs()
