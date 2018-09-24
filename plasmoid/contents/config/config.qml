import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: "Fortune Sources"
        icon: "accessories-dictionary"
        source: "config/ConfigSources.qml"
    }

    ConfigCategory {
    	name: "Color Settings"
    	icon: "color-management"
    	source: "config/ConfigColors.qml"
    }

    ConfigCategory {
        name: "Time Settings"
        icon: "appointment-new"
        source: "config/ConfigTime.qml"
    }

    
}
