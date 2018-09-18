import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs



Item {


	property int sampleWidth: 50
	property int sampleHeight: 25


	




	Layout.GridLayout {
		columns: 2
	
	Layout.ColumnLayout {
		id: leftColumn

		anchors.top: parent.top

		Layout.RowLayout {
			CheckBox {
		id: overrideTheme
	}

	Label {
		text: "Override Theme Colors"
	}
		}

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
			color: theme.backgroundColor
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
			color: theme.textColor
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
			color: theme.highlistColor
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
		anchors.top: topRow.top
					

		Layout.RowLayout {

		Rectangle {
			id: goldenExample
			width: 250
			height: 150

			color: bgColorSquare.color
			border.color: borderColorSquare.color

		}

		Label {
			id: exampleLabel
			anchors.centerIn: goldenExample
			color: textColorSquare.color
			font.pointSize: 10.0
			font.family: "Courier"
			text: "This is an example message.\n\nThe font cannot be changed,\nin memory of old terminals."
			//text:"test"
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
			plasmoid.configuration.borderColor = borderColorDialog.color;
	}
}



}


}