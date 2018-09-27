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

	property alias cfg_themeColors: themeButton.checked;
	property alias cfg_bwColors: bwButton.checked;
	property alias cfg_greenColors: greenButton.checked;
	property alias cfg_amberColors: amberButton.checked;

	property var zed: initialColors();
		



	function initialColors() {
		if (plasmoid.configuration.themeColors) {
			applyColorScheme("theme");
		} else if (plasmoid.configuration.bwColors) {
			applyColorScheme("bw");
		} else if (plasmoid.configuration.greenColors) {
			applyColorScheme("green");
		} else if (plasmoid.configuration.amberColors) {
			applyColorScheme("amber");
		}
	}




		function applyColorScheme(changeColors) {

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
			spacing: 15

			ExclusiveGroup { id: colorScheme }

			RadioButton {
				id: themeButton
				exclusiveGroup: colorScheme
				text: "Theme Colors"
				onClicked: { 
					console.log("click theme");
					Qt.callLater(function() {
						applyColorScheme("theme");
						});
					
				}
				}

			RadioButton {
				id: bwButton
				exclusiveGroup: colorScheme
				text: "Black & White Terminal"
				onClicked: {
					console.log("bw clicked");
					Qt.callLater(function() {
						applyColorScheme("bw");
						});
				}
				}


			

			RadioButton {
				id: greenButton
				text: "Green Terminal"
				exclusiveGroup: colorScheme
				onClicked: {
					Qt.callLater(function() {
						applyColorScheme("green");
						});
					
				}
				
				}
			

			RadioButton {
				id: amberButton
				text: "Amber Terminal"
				exclusiveGroup: colorScheme
				onClicked: {
					 Qt.callLater(function() {
						applyColorScheme("amber");
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

				FontLoader { id: localFont; source: Qt.resolvedUrl("VT323-Regular.ttf");}

				Label {
					id: exampleLabel
					anchors.centerIn: goldenExample
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					font.pointSize: 13
					font.family: localFont.name
					
					text: "This is an example message.\n\nThe font cannot be changed,\nout of respect for old terminals."
					
					onColorChanged: {
						console.log("label:" + exampleLabel.color);
					}
	}	

}
		
		}
		

}


