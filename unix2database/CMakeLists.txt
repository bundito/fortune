cmake_minimum_required (VERSION 3.0 FATAL_ERROR)

project(fortune2db)

set(QT_MIN_VERSION "5.3.0")
find_package(ECM ${KF5_MIN_VERSION} REQUIRED NO_MODULE)

# Settings variables / QT & KF5 minimum versions
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(QT_MIN_VERSION "5.3.0")
set(KF5_MIN_VERSION "5.2.0")
find_package(ECM 1.0.0 REQUIRED NO_MODULE)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# CMake includes
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMInstallIcons)
include(ECMSetupVersion)
include(FeatureSummary)

# QT packages
find_package(
    Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
    Core
    Gui
    Sql
)


add_executable(fortune2db main.cpp)

# Link libraries
target_link_libraries(
    fortune2db
        Qt5::Core
        Qt5::Gui
        Qt5::Sql
        )





