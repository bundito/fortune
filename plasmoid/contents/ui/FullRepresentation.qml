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
	//Layout.preferredWidth: Kirigami.Units.smallSpacing * 175;
	//Layout.preferredHeight: Kirigami.Units.smallSpacing * 35;





	

		

		

		Rectangle {

			anchors.centerIn: parent

			color: "black"

			Rectangle {
				Layout.minimumHeight: parent.height - 5;
				Layout.minimumWidth: parent.width - 5;
				color: theme.backgroundColor;
				//border: theme.textColor;
				
			

			

		
		
		Label {
			id: fortuneLabel
			// padding: 5
			anchors.centerIn: parent
	
			
			font.family: "Courier"
			color: "white"
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
}
	



	





	
			


	




	
