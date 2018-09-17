import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0


Item {


	property alias cfg_textColor: fortuneLabel.color;
	
	property alias cfg_borderColor: bgImageColor.color;
	property alias cfg_backgroundColor: bgColorOverLay.color
	

	id: baseItem
	Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 75
	Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 12

	Image {
			id: bgImage
			anchors.centerIn: parent
			source: Qt.resolvedUrl("../images/background.svg")
			sourceSize.width: parent.width 
			sourceSize.height: parent.height
				}

	ColorOverlay {
			id: bgImageColor
			
			anchors.fill: bgImage
			source: bgImage
			
	}

	
	


		
		
		


		Image {
			id: foreground
			//anchors.centerIn: bgImage
			source: Qt.resolvedUrl("../images/background.svg")
			width: bgImage.width - 4
			height: bgImage.height - 4
		}

		ColorOverlay {
				id: bgColorOverLay
				
				//anchors.fill: foreground
				source: foreground
				
				
			}

			Blend {
		 anchors.fill: bgImage
        source: bgImage
        foregroundSource: foreground
        mode: "subtract"
    }





			Label {
				id: fortuneLabel
				padding: 1
				
				anchors.centerIn: parent
				
				 
				font.family: "Courier"
				//color: txtColor
				//color: textColor
				text: fortune
			}

				MouseArea {
					anchors.fill: fortuneLabel
					onClicked: {
						console.log("txtColor " + txtColor);
					   plasmoid.expanded = !plasmoid.expanded;
					   //cookieIcon = Qt.resolvedUrl("../images/fortune-cookie.png")
					  
				}

			}


	}	


	

	











	
			


	




	
