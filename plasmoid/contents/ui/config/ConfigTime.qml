import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs


Item {

	property alias cfg_override: override.checked

	property var have_warned: plasmoid.configuration.override_once;

	Layout.ColumnLayout {
		spacing: 15
		CheckBox {
			id: override
			text: "Override Daily Fortune"
			onClicked: {
				if (!have_warned) {
				warningDialog.open();

				}
			}
		}

	Label {
		id: noticeText
		text: { if (!override.checked) {
			intervalRow.visible = false;
			return "A new fortune will be unlocked at 12:01am";
			} else {
				intervalRow.visible = true;
				return "Choose a schedule...";
				
			}
		}
	}


	
	
		Layout.RowLayout {
			id: intervalRow
			visible: false
			Label {
				font.bold: true;
				text: "Interval:"
			}

			ComboBox {
				id: intervalBox
				currentIndex: plasmoid.configuration.intervalIndex
				width: 250
				model: ListModel {
					id: intervalItems
					ListElement { text: "5 minutes"; msecs: 5000 }
					ListElement { text: "10 minutes"; msecs: 10000 }
					ListElement { text: "30 minutes"; msecs: 30000 }
					ListElement { text: "1 hour"; msec: 60000 }
					ListElement { text: "4 hours"; msec: 240000 }
					ListElement { text: "8 hours"; msec: 480000 }
					ListElement { text: "12 hours"; msec: 720000 }
				}
			
				onAccepted: {
					plasmoid.configuration.intervalIndex = intervalBox.index;
				}

			}

		}
	}

	Dialogs.MessageDialog {
		id: warningDialog
		visible: false
		title: "Confirmation Needed"
		standardButtons: Dialogs.StandardButton.Yes | Dialogs.StandardButton.No
		icon: Dialogs.StandardIcon.Question

		text: "NOTICE: Historically, a new fortune was only shown once per day.\nIf you leave this box checked, " 
			 + "a new fortune will unlock each day at 12:01am.\n\n" 
			 + "However, feel free to set your own interval - including \"none\", \nwhich will give you a new fortune " 
			 + "each time you click the applet.\n\n" 
			 + "Do you want to unlock the interval options, or keep the traditional fortune schedule?"
			 

		onYes: {
			override.checked = true;
			plasmoid.configuration.override = true;
			plasmoid.configuration.override_once = true;
			warningDialog.close();
		}

		onNo: {
			override.checked = false;
			plasmoid.configuration.override = true;
			plasmoid.configuration.override_once = true;
			warningDialog.close();
		}

		}
		
	




} // end of main Item
		
		
		





