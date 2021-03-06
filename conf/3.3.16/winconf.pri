# Adapt these paths on Windows

INCLUDEPATH += $$quote(D:/qBittorrent/install_msvc64/base/include)
INCLUDEPATH += $$quote(D:/qBittorrent/install_msvc64/base/include/boost-1_64)
# Point this to the zlib include folder
#INCLUDEPATH += $$quote(C:/qBittorrent/Zlib/include)
# Point this to the openssl include folder
#INCLUDEPATH += $$quote(C:/qBittorrent/openssl/include)

LIBS += $$quote(-LD:/qBittorrent/install_msvc64/base/lib)
# Point this to the boost lib folder
#LIBS += $$quote(-LC:/qBittorrent/boost_1_51_0/stage/lib)
# Point this to the libtorrent lib folder
#LIBS += $$quote(-LC:/qBittorrent/RC_0_16/bin/path-according-to-the-build-options-chosen)
# Point this to the zlib lib folder
#LIBS += $$quote(-LC:/qBittorrent/Zlib/lib)
# Point this to the openssl lib folder
#LIBS += $$quote(-LC:/qBittorrent/openssl/lib)

# BOOST DEFINES
DEFINES += BOOST_ALL_NO_LIB
DEFINES += BOOST_ASIO_HASH_MAP_BUCKETS=1021
# Disable this if building against libtorrent 1.1.x (RC_1_1)
DEFINES += BOOST_ASIO_SEPARATE_COMPILATION
# After 1.55 some Windows users reported regular UI freezes.
# This makes ASIO use the pre-1.56 way of doing things. See issue #2003
DEFINES += BOOST_ASIO_DISABLE_CONNECTEX
# Boost 1.60+ defaults to Vista+ support. The define below enables XP support again.
DEFINES += BOOST_USE_WINAPI_VERSION=0x0501
DEFINES += BOOST_EXCEPTION_DISABLE
DEFINES += BOOST_SYSTEM_STATIC_LINK=1

# LIBTORRENT DEFINES
DEFINES += TORRENT_USE_OPENSSL
DEFINES += TORRENT_DISABLE_GEO_IP
DEFINES += TORRENT_DISABLE_RESOLVE_COUNTRIES

# QBT DEFINES
DEFINES += UNICODE
DEFINES += _UNICODE
DEFINES += WIN32
DEFINES += _WIN32
DEFINES += WIN32_LEAN_AND_MEAN
DEFINES += NTDDI_VERSION=0x05010000
DEFINES += _WIN32_WINNT=0x0501
DEFINES += _WIN32_IE=0x0501
DEFINES += _CRT_SECURE_NO_DEPRECATE
DEFINES += _SCL_SECURE_NO_DEPRECATE
DEFINES += __USE_W32_SOCKETS
DEFINES += _FILE_OFFSET_BITS=64

CONFIG(debug, debug|release) {
  DEFINES += TORRENT_DEBUG
} else {
  DEFINES += NDEBUG
}

# Enable backtrace support
CONFIG += strace_win

win32-g++* {
    include(winconf-mingw.pri)
}
else {
    include(winconf-msvc.pri)
}
