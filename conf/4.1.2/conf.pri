# Adapt these paths
# Point these to the include folders
INCLUDEPATH += $$quote(D:/qBittorrent/install_msvc64/base/include)
INCLUDEPATH += $$quote(D:/qBittorrent/install_msvc64/base/include/boost-1_64)
#INCLUDEPATH += $$quote(C:/qBittorrent/zlib/include)
#INCLUDEPATH += $$quote(C:/qBittorrent/openssl/include)
# Point these to the lib folders
LIBS += $$quote(-LD:/qBittorrent/install_msvc64/base/lib)
#LIBS += $$quote(-LC:/qBittorrent/libtorrent/lib)
#LIBS += $$quote(-LC:/qBittorrent/zlib/lib)
#LIBS += $$quote(-LC:/qBittorrent/openssl/lib)

# Adapt the lib names/versions accordingly
# If you want to use Boost auto-linking then disable
# BOOST_ALL_NO_LIB below and omit Boost libraries here
CONFIG(debug, debug|release) {
    LIBS += libtorrentd.lib \
            libboost_system-vc140-mt-sgd-1_64.lib
}
else {
    LIBS += libtorrent.lib \
            libboost_system-vc151-mt-s-1_64.lib
}
LIBS += libeay32.lib ssleay32.lib
LIBS += zlib.lib
# ...or if you use MinGW
#CONFIG(debug, debug|release) {
#    LIBS += libtorrent-rasterbar \
#            libboost_system-mt
#}
#else {
#    LIBS += libtorrent-rasterbar \
#            libboost_system-mt
#}
#LIBS += libcrypto libssl
#LIBS += libz

DEFINES += NTDDI_VERSION=0x05010000
DEFINES += _WIN32_WINNT=0x0501
DEFINES += _WIN32_IE=0x0501

# Disable to use Boost auto-linking
DEFINES += BOOST_ALL_NO_LIB
# Use one of the following options
DEFINES += BOOST_SYSTEM_STATIC_LINK
#DEFINES += BOOST_SYSTEM_DYN_LINK
# Boost 1.60+ defaults to Vista+ support. The define below enables XP support again.
DEFINES += BOOST_USE_WINAPI_VERSION=0x0501
# Enable if building against libtorrent 1.0.x (RC_1_0) (static linking)
DEFINES += BOOST_ASIO_SEPARATE_COMPILATION
# Enable if building against libtorrent 1.0.x (RC_1_0) (dynamic linking)
#DEFINES += BOOST_ASIO_DYN_LINK
# Enable if encountered build error with boost version <= 1.59
#DEFINES += BOOST_NO_CXX11_RVALUE_REFERENCES

# Enable if building against libtorrent 1.1.x (RC_1_1)
# built with this flag defined
#DEFINES += TORRENT_NO_DEPRECATE
# Enable if linking dynamically against libtorrent
#DEFINES += TORRENT_LINKING_SHARED

# Enable stack trace support
CONFIG += stacktrace

win32-msvc* {
    QMAKE_CXXFLAGS += "/guard:cf"
    QMAKE_LFLAGS += "/guard:cf"
    QMAKE_LFLAGS_RELEASE += "/OPT:REF /OPT:ICF"
}
