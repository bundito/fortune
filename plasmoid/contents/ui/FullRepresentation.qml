import QtQuick 2.7
import org.kde.plasma.core 2.0 as Plasma
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0


Item {


	id: baseItem
	Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 75
	Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 12


	//layer.enabled: true;

	Rectangle {
			
			id: bgImage
			anchors.fill: baseItem
			Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 75
			Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 12
			color: plasmoid.configuration.backgroundColor
			
			
				}

	


			Label {
				id: textColor
				
				anchors.centerIn: baseItem
				
				color: plasmoid.configuration.textColor
				 font.pointSize: 10
				 font.bold: true
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


	

	











	
			


	




	
