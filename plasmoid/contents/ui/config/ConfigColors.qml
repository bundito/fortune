import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs



Item {

	

	property var overriding: plasmoid.configuration.useThemeColors

	property int sampleWidth: 50
	property int sampleHeight: 25


	

	Layout.GridLayout {
		id: overrideLabel
		columns: 2

		CheckBox {
			id: overrideTheme
		}

		Label {
			text: "Override Theme Colors"
			
		}
}

		Layout.GridLayout {
			id: colorGrid
			columns: 2
		
		Layout.ColumnLayout {
			id: leftColumn

			anchors.top: overrideLabel.top

			

			Layout.RowLayout {
				id: topRow
				anchors.right: parent.right

			Label {
				text: "Background"
			}

			Rectangle {
				id: bgColorSquare
		
				height: sampleHeight
				width: sampleWidth
				color: plasmoid.configuration.backgroundColor
				border.color: theme.highlightColor
				
				}

				MouseArea {
					anchors.fill: bgColorSquare;
					onClicked: colorDialog.visible = true;
				}
			}

			Layout.RowLayout {
				anchors.right: parent.right

			Label {
				text: "Text"
			}

			Rectangle {
				id: textColorSquare
				color: plasmoid.configuration.textColor
				height: sampleHeight
				width: sampleWidth
				border.color: theme.highlightColor
			}

			MouseArea {
				anchors.fill: textColorSquare
				onClicked: textColorDialog.visible = true;
			}

		}

			Layout.RowLayout {
				anchors.right: parent.right

			Label {
				text: "Border"
			}

			Rectangle {
				id: borderColorSquare
				color: plasmoid.configuration.borderColor
				height: sampleHeight
				width: sampleWidth
				border.color: theme.highlightColor
				}

			MouseArea {
				anchors.fill: borderColorSquare
				onClicked: borderColorDialog.visible = true;
				}
			}
		}
		

	// END OF LEFT COLUMN

		Layout.ColumnLayout {
			anchors.top: leftColumn.top
						

			Layout.RowLayout {

			Rectangle {
				id: goldenExample
				width: 250
				height: 150

				color: plasmoid.configuration.backgroundColor
				border.color:plasmoid.configuration.borderColor

			}

			Label {
				id: exampleLabel
				anchors.centerIn: goldenExample
				color: plasmoid.configuration.textColor
				font.pointSize: 10.0
				font.family: "Courier"
				text: "This is an example message.\n\nThe font cannot be changed,\nin memory of old terminals."
				//text:"test"
			}
		}
	
}

Layout.RowLayout {
	
	anchors.top: colorGrid.bottom
	

	Button {
		text: "Revert to Theme Colors"
		onClicked: {
			bgColorSquare.color = theme.backgroundColor;
			plasmoid.configuration.backgroundColor = theme.backgroundColor

			textColorSquare.color = theme.textColor;
			plasmoid.configuration.textColor = theme.textColor;

			borderColorSquare.color = theme.highlightColor;
			plasmoid.configuration.borderColor = theme.highlightColor;
		}
	}
}

}






		// -------------------------------------------
		// TODO: I'm sure I could make just one ColorDialog, but I'm tired.


		// Background
		Dialogs.ColorDialog {
			id: colorDialog
			title: "Pick A Color"
			currentColor: theme.backgroundColor
			visible: false;
			onAccepted: {
				bgColorSquare.color = colorDialog.color;
				colorDialog.visible = false;
				//slowdown.running = true;
				plasmoid.configuration.backgroundColor = colorDialog.color;
			}
		}

		// Text
		Dialogs.ColorDialog {
			id: textColorDialog
			title: "Pick A Color"
			currentColor: theme.textColor
			visible: false;
			onAccepted: {
				textColorSquare.color = textColorDialog.color;
				textColorDialog.visible = false;
				plasmoid.configuration.textColor = textColorDialog.color;
		}
		}

	// Border
	Dialogs.ColorDialog {
		id: borderColorDialog
		title: "Pick A Color"
		currentColor: theme.highlightColor
		visible: false;
		onAccepted: {
			borderColorSquare.color = borderColorDialog.color;
			borderColorDialog.visible = false;
			//slowdown.running = true;
			plasmoid.configuration.borderColor = borderColorDialog.color;
	}
}

	

}



