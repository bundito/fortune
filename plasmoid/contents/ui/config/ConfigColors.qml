import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs


Item {

		property var textColor
		property var backgroundColor

		property var changeColors

	//	property alias cfg_themeColors: themeButton.checked;
	//	property alias cfg_bwColors: bwButton.checked;
	//	property alias cfg_greenColors: greenButton.checked;
	//	property alias cfg_amberColors: amberButton.checked

	
			

		function applyColorScheme() {

			console.log("func: " + changeColors);

		if (changeColors == "theme") {
				plasmoid.configuration.backgroundColor = theme.backgroundColor;
				plasmoid.configuration.textColor = theme.textColor;
				exampleLabel.color = theme.textColor;
				goldenExample.color = theme.backgroundColor;
		} else if (changeColors == "bw") {
				plasmoid.configuration.backgroundColor = "#000000";
				plasmoid.configuration.textColor = "#ffffff";
				exampleLabel.color = "white";
				goldenExample.color = "black";
		} else if (changeColors == "green") {
				plasmoid.configuration.backgroundColor = "#000000";
				plasmoid.configuration.textColor = "#51ce3d";
				exampleLabel.color = "#51ce3d";
				goldenExample.color = "black";
		} else if (changeColors == "amber") {
				plasmoid.configuration.backgroundColor = "#000000";
				plasmoid.configuration.textColor = "#c6ba4f";
				exampleLabel.color = "#c6ba4f";
				goldenExample.color = "black";
				}

			return;
		}

	

		Layout.GridLayout {
			id: colorGrid
			columns: 2
			columnSpacing: 25

			

		Layout.ColumnLayout {
			anchors.top: parent.top
			
			ExclusiveGroup { id: colorScheme }

			RadioButton {
				id: themeButton
				text: "Theme Colors"
				exclusiveGroup: colorScheme
				onClicked: { 
					changeColors = "theme"; 
					console.log("click theme");
					Qt.callLater(function() {
						applyColorScheme();
						});
					
				}
				}
			

			RadioButton {
				id: bwButton
				text: "Black & White Terminal"
				exclusiveGroup: colorScheme

				onClicked: {
					console.log("bw clicked");
					changeColors = "bw";
					Qt.callLater(function() {
						applyColorScheme();
						});
				}
				}


			

			RadioButton {
				id: greenButton
				text: "Green Terminal"
				exclusiveGroup: colorScheme
				onClicked: {
					changeColors = "green"; 
					Qt.callLater(function() {
						applyColorScheme();
						});
					
				}
				
				}
			

			RadioButton {
				id: amberButton
				text: "Amber Terminal"
				exclusiveGroup: colorScheme
				onClicked: {
					changeColors = "amber"; 
					 Qt.callLater(function() {
						applyColorScheme();
						});
					
				}
				
				}

		}

		

	// END OF LEFT COLUMN

		Layout.ColumnLayout {
			
	

				Rectangle {
					id: goldenExample
					width: 250
					height: 150
					border.width: 1
					border.color: exampleLabel.color
		
					
						}

				Label {
					id: exampleLabel
					anchors.centerIn: goldenExample
					
					font.pointSize: 10.0
					font.family: "Courier"
					
					text: "This is an example message.\n\nThe font cannot be changed,\nin memory of old terminals."
					
					onColorChanged: {
						console.log("label:" + exampleLabel.color);
					}

					



				}

				

				}
			


			
}
	Component.onCompleted: {
				applyColorScheme();
				console.log("C.oc");
			}	

}
		
		
		





