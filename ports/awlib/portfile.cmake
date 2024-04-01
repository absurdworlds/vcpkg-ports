vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO absurdworlds/awlib
    REF c98e7ac8277767d20b8c903f302e88bf3cf03ec2
    SHA512 a9c8be3c850a0512eb09c5ead8eda1bcb85ec8c2f8d7a06519dda77bef01b20f05e98fb6e8da286d49a8a9af368e5371b436e385057d99822254375a04e4dc5e
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
