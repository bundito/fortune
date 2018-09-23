import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs


Item {
	
		property alias cfg_themeColors: themeButton.checked;
		property alias cfg_bwColors: bwButton.checked;
		property alias cfg_greenColors: greenButton.checked;
		property alias cfg_amberColors: amberButton.checked;

		property var textColor
		property var backgroundColor

		

		function changeColors(scheme) {

		switch(scheme) {
			case "theme":
				plasmoid.configuration.backgroundColor = theme.backgroundColor;
				plasmoid.configuration.textColor = theme.textColor;
				
				break;

			case "bw":
				plasmoid.configuration.backgroundColor = "#000000";
				plasmoid.configuration.textColor = "#ffffff";
				
				break;

			case "green":
				plasmoid.configuration.backgroundColor = "#000000";
				plasmoid.configuration.textColor = "#51ce3d";
				
				break;

			case "amber":
				plasmoid.configuration.backgroundColor = "#000000";
				plasmoid.configuration.textColor = "#c6ba4f";
				
				break;
		}

		return;

	}
		
		Timer {
			id: slowdown
			interval: 250
			running: false
			repeat: false
		}
		

		Layout.GridLayout {
			id: colorGrid
			columns: 2
			

		Layout.ColumnLayout {
			anchors.top: parent.top
			
			ExclusiveGroup { id: colorScheme }

			RadioButton {
				id: themeButton
				text: "Theme Colors"
				exclusiveGroup: colorScheme
				onCheckedChanged: {
					slowdown.running = true;
					changeColors("theme");
					
				}

			}

			RadioButton {
				id: bwButton
				text: "Black & White Terminal"
				exclusiveGroup: colorScheme
				onCheckedChanged: {
					slowdown.running = true;
					exampleLabel.color = "#ffffff";
					goldenExample.color = "#000000";
					changeColors("bw");
				}


			}

			RadioButton {
				id: greenButton
				text: "Green Terminal"
				exclusiveGroup: colorScheme
				onCheckedChanged: {
					slowdown.running = true;
					changeColors("green");
				}
			}

			RadioButton {
				id: amberButton
				text: "Amber Terminal"
				exclusiveGroup: colorScheme
				onCheckedChanged: {
					slowdown.running = true;
					changeColors("amber");
				}
			}


			
		}
		

	// END OF LEFT COLUMN

		Layout.ColumnLayout {
			
						

			

			

				Rectangle {
					id: goldenExample
					width: 250
					height: 150
					onColorChanged: {
						console.log("bg changed" + goldenExample.color);
					}
					color: plasmoid.configure.backgroundColor
					
					

					
						}

				Label {
					id: exampleLabel
					anchors.centerIn: goldenExample
					color: plasmoid.configuration.textColor
					font.pointSize: 10.0
					font.family: "Courier"
					
					text: "This is an example message.\n\nThe font cannot be changed,\nin memory of old terminals."
					
				}
			}
			
				}
			

		


	}





