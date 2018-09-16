import QtQuick 2.7
import org.kde.plasma.core 2.0 as Plasma
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami

Item {

	id: baseItem
	Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 75
	Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 12

		
Rectangle {

			id: displayRectangle
						color: "green"
						border.color: "white"
						border.width: 2
						anchors.centerIn: parent
						width: theme.mSize(theme.defaultFont).width * 74
						height: theme.mSize(theme.defaultFont).height * 11.5

		
		Label {
			id: fortuneLabel
			padding: 1
			
			anchors.centerIn: parent
			
			 
			font.family: "Courier"
			color: theme.highlightColor
			//color: theme.textColor
			text: fortune
		}

			MouseArea {
				anchors.fill: displayRectangle

				onClicked: {
				   plasmoid.expanded = !plasmoid.expanded;
				   //cookieIcon = Qt.resolvedUrl("../images/fortune-cookie.png")
				  
			}

		}

	}	


	}

	











	
			


	




	
