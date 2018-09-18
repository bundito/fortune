import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs



Item {


	property int sampleSquare: 50

	Layout.GridLayout {
		columns: 2
	

	
	Layout.ColumnLayout{
		
		Layout.RowLayout {

		Label {
			text: "Background"
		}

		Rectangle {
			id: bgColorSquare
	
			height: sampleSquare
			width: sampleSquare
			color: theme.backgroundColor
			border.color: theme.highlightColor
			
			}

			MouseArea {
				anchors.fill: bgColorSquare;
				onClicked: colorDialog.visible = true;
			}
		}

		Layout.RowLayout {

		Label {
			text: "Text"
		}

		Rectangle {
			id: textSquare
			color: theme.textColor
			height: sampleSquare
			width: sampleSquare
			border.color: theme.highlightColor
		}

		MouseArea {
			anchors.fill: textSquare
			onClicked: colorDialog.visible = true;
		}

	}

		Layout.RowLayout {


		Label {
			text: "Border"
		}

		Rectangle {
			id: borderSquare
			color: theme.highlistColor
			height: sampleSquare
			width: sampleSquare
			border.color: theme.highlightColor
			}
		}
	}
	

// END OF LEFT COLUMN

	Layout.ColumnLayout {
		

		Layout.RowLayout {

		Rectangle {
			id: goldenExample
			width: 250
			height: 150

			color: colorDialog.color
			border.color: borderColorDialog.color

		}

		Label {
			id: exampleLabel
			//anchors.centerIn: goldenExample
			text: "test"
			//text:"test"
		}
	}
}

	// -------------------------------------------
	// TODO: I'm sure I could make just one ColorDialog, but I'm tired.

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