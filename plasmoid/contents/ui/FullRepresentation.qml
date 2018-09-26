import QtQuick 2.7
import org.kde.plasma.core 2.0 as Plasma
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0


Item {

	FontLoader { id: localFont; source: Qt.resolvedUrl("VT323-Regular.ttf");}

	id: baseItem
	Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 60
	Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 8


	//layer.enabled: true;

	Rectangle {
			
			id: bgImage
			anchors.fill: baseItem
			Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 59
			Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 8.5
			color: plasmoid.configuration.backgroundColor
			
			
				}

	


			Label {
				id: textColor
				
				anchors.centerIn: baseItem
				
				color: plasmoid.configuration.textColor
				 font.pointSize: (theme.defaultFont.pointSize) * 1.3
				 
				 horizontalAlignment: Text.AlignHCenter
				 verticalAlignment: Text.AlignVCenter
				 font.family: localFont.name
				//color: txtColor
				//color: textColor
				text: fortune
			}

				MouseArea {
					anchors.fill: bgImage
					onClicked: {
					   plasmoid.expanded = false
					   //cookieIcon = Qt.resolvedUrl("../images/fortune-cookie.png")
					  
				}

			}

			


	}	


	

	











	
			


	




	
