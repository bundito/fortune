/*
 *  Copyright (C) 2018 Scott Harvey <scott@spharvey.me>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs
import "../code/moment.js" as Moment


Item {

	property alias cfg_override: override.checked
	property alias cfg_notify: showNotify.checked

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
				//currentIndex: plasmoid.configuration.intervalIndex
				width: 250
				model: ListModel {
					id: intervalItems
					ListElement { text: "Please Chose..."; msecs: 0;}
					ListElement { text: "5 minutes"; msecs: 300; }
					ListElement { text: "10 minutes"; msecs: 600; }
					ListElement { text: "30 minutes"; msecs: 1800; }
					ListElement { text: "1 hour"; msecs: 3600; }
					ListElement { text: "4 hours"; msecs: 14400; }
					ListElement { text: "8 hours"; msecs: 28800; }
					ListElement { text: "12 hours"; msecs: 43200;} // damn that's a lot of msecs
				}
		

				onCurrentIndexChanged: {
					
					var now = moment();
					//var add = intervalItems.get(currenttIndex)msecs;
					var future = moment().add((intervalItems.get(currentIndex).msecs), "seconds");

					//console.log(now);
					console.log(future);
					console.log("----");
					//future = moment().add(interval), "seconds";
					plasmoid.configuration.nextFortune = future.toString();
					console.log("======");
					console.log(plasmoid.configuration.nextFortune);
					console.log("======");
					console.log(plasmoid.configuration.nextFortune);
					console.log("======");


			}

		}

		Layout.RowLayout {
			CheckBox {
				id: showNotify
				text: "Show notification when new fortune is available"
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
			 + "However, feel free to set your own interval - from every 5 minutes to every 12 hours.\n\n"
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
		}