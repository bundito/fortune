export PATH=/home/bundito/kde/install/bin:$PATH

# LD_LIBRARY_PATH only needed if you are building without rpath
# export LD_LIBRARY_PATH=/home/bundito/kde/install/lib64:$LD_LIBRARY_PATH

export XDG_DATA_DIRS=/home/bundito/kde/install/share:${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}
export XDG_CONFIG_DIRS=/home/bundito/kde/install/etc/xdg:${XDG_CONFIG_DIRS:-/etc/xdg}

export QT_PLUGIN_PATH=/home/bundito/kde/install/lib64/plugins:$QT_PLUGIN_PATH
export QML2_IMPORT_PATH=/home/bundito/kde/install/lib64/qml:$QML2_IMPORT_PATH
