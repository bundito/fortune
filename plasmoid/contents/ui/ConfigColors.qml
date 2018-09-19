import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs
import org.kde.kquickcontrols 2.0 as KQC




Item {

	property alias cfg_backgroundColor: bgColorButton.color
	property alias cfg_borderColor: borderColorButton.color
	property alias cfg_textColor: textColorButton.color

	

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
			id: colorControls
			columns: 2
			columnSpacing: 20

			anchors.top: overrideLabel.bottom

		
		Layout.ColumnLayout {
			id: leftColumn

			spacing: 10

			

			anchors.top: overrideLabel.top

			

			Layout.RowLayout {
				id: topRow
				anchors.right: parent.right

			Label {
				text: "Background"
			}

			
			KQC.ColorButton {
				id: bgColorButton

				}
			   	}
				
			

			Layout.RowLayout {
				anchors.right: parent.right

			Label {
				text: "Text"
			}

			
			KQC.ColorButton {
				id: textColorButton
			}

		}

			Layout.RowLayout {
				anchors.right: parent.right

			Label {
				text: "Border"
			}

			KQC.ColorButton {
				id: borderColorButton
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
		anchors.top: colorControls.bottom

		Button {

		id: resetButton

		text: "Reset to Theme Colors" 

		}

	}


}
}




