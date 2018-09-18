import QtQuick 2.7
import org.kde.plasma.core 2.0 as Plasma
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0


Item {


//	property var txtColorNew: plasmoid.configuration.textColor;
//property var backgroundColor: plasmoid.configuration.backgroundColor.color
//	property var borderColor: plasmoid.configuration.borderColor;
	
//	property alias cfg_borderColor: foreground.color;
//	property alias cfg_borderColor: bgImage.color
	//property alias cfg_textColor: textColor.color;

	

	id: baseItem
	Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 75
	Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 12


	//layer.enabled: true;

	Rectangle {
			
			id: bgImage
			anchors.centerIn: baseItem
			Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 75
			Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 12
			color: plasmoid.configuration.borderColor
			
				}

	Rectangle {
			opacity: 1.0
			id: foreground
			anchors.centerIn: bgImage
			width: bgImage.width - 4
			height: bgImage.height  -4
			color: plasmoid.configuration.backgroundColor

		}	


			Label {
				id: textColor
				padding: 1
				
				anchors.centerIn: foreground
				
				color: plasmoid.configuration.textColor
				 
				font.family: "Courier"
				//color: txtColor
				//color: textColor
				text: fortune
			}

				MouseArea {
					anchors.fill: textColor
					onClicked: {
					   plasmoid.expanded = !plasmoid.expanded;
					   //cookieIcon = Qt.resolvedUrl("../images/fortune-cookie.png")
					  
				}

			}


	}	


	

	











	
			


	




	
