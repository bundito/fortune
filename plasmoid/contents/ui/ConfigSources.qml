import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs



Item {

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);
	property string path;
	property var sampleQuery;

	


		
		//property var groupQuery: "'group_id IN \(1,3,5,7,9,11,13,15,17\)' ";
		//property var oneGroup: "'group_id=20' "
		property var cmd:"bash " + exec+ "code/fortuneQuery.sh " + sampleQuery + " " + exec + "code/";
	property var display;
	//property var groupList;
	property var groupString
	property var modeCount: 0
	property int sampleGroup: 0
	property var grp;
	property string sampleText;
	

	property alias cfg_group1:	group1.checked
	property alias cfg_group2:	group2.checked
	
	property alias cfg_group4:	group4.checked
	property alias cfg_group5:	group5.checked
	property alias cfg_group6:	group6.checked
	property alias cfg_group7:	group7.checked
	property alias cfg_group8:	group8.checked
	property alias cfg_group9:	group9.checked
	property alias cfg_group10:	group10.checked
	property alias cfg_group11:	group11.checked
	property alias cfg_group12:	group12.checked
	
	
	property alias cfg_group15:	group15.checked
	
	property alias cfg_group17:	group17.checked
	property alias cfg_group18:	group18.checked
	property alias cfg_group19:	group19.checked
	//property alias cfg_activeGroups: groupList;
	property var groupList: plasmoid.configution["cfg_activeGroups"];
	// GROUP20	


	Layout.GridLayout {
		columns: 4
		columnSpacing: 25
				
				// COLUMN HEADER
				Label {
					text: ""
				}
				Label {
					font.bold: true
					text: "Old Filename"
				}
				Label {
					font.bold: true
					text: "Description"
				}
				Label {
					font.bold: true
					text: "# Of Fortunes"
				}


				// #12 - Fortune
				CheckBox {
					id: group12
					onClicked: {
						plasmoid.configuration[cfg_group12] = !plasmoid.configuration[cfg_group12];
						groupsUpdate(12, group12);
					}	
				}
				Label {
					text: "fortunes"
					}
				Label {
					text: "A classic fortune file"
				}
				Label {
					text: "862"
				}
				

				// #1 - Chalkboard
				CheckBox {
				id: group1
				onClicked: {
					plasmoid.configuration[cfg_group1] = !plasmoid.configuration[cfg_group1];
					groupsUpdate(1, group1);
					}	
				}
				Label {
					text: "chalkboard"
					}
				Label {
					text: "Bart Simpson at the chalkboard"
				}
				Label {
					text: "354"
				}
			

				// #2 - Disclaimers				
				CheckBox {
					id: group2
					onClicked: {
						plasmoid.configuration[cfg_group2] = !plasmoid.configuration[cfg_group2];
						groupsUpdate(2, group2);
					}	
				}
				Label {
					text: "disclaimer"
					}
				Label {
					text: "Product & Service disclaimers"
				}
				Label {
					text: "568"
				}
		

				// #4 - Star Wars
				CheckBox {
					id: group4
					onClicked: {
		 				plasmoid.configuration[cfg_group4] = !plasmoid.configuration[cfg_group4];
			 			groupsUpdate(4, group3);
			 		}	
			 	}
				Label {
					text: "starwars"
					}
				Label {
					text: "Star Wars quotations (original trilogy)"
				}
				Label {
					text: "118"
					}

				
				// #5 - Computer Jokes
				CheckBox {
					id: group5
					onClicked: {
						plasmoid.configuration[cfg_group5] = !plasmoid.configuration[cfg_group5]
						groupsUpdate(5, group5);
					}	
				}
				Label {
					text: "computers2"
					}
				Label {
					text: "(Old) computer jokes"
				}
				Label {
					text: "1790"
				}
				

				// #6 - Humorists
				CheckBox {
					id: group6
					onClicked: {
						plasmoid.configuration[cfg_group6] = !plasmoid.configuration[cfg_group6];
						groupsUpdate(6, group6);
					}	
				}
				Label {
					text: "humorists"
					}
				Label {
					text: "Classic funny people like Mark Twain"
				}
				Label {
					text: "360"
				}
				

				// #7 - Perl
				CheckBox {
					id: group7
					onClicked: {
						plasmoid.configuration[cfg_group7] = !plasmoid.configuration[cfg_group7];
						groupsUpdate(7, group7);
					}	
				}
				Label {
					text: "perl"
					}
				Label {
					text: "Perl and perl hackers"
				}
				Label {
					text: "544"
				}


				// #8 - Star Trek
				CheckBox {
					id: group8
					onClicked: {
						plasmoid.configuration[cfg_group8] = !plasmoid.configuration[cfg_group8]
						groupsUpdate(8, group8);
					}	
				}
				Label {
					text: "startrek"
					}
				Label {
					text: "Star Trek (TOS) quotations"
				}
				Label {
					text: "128"
				}
					


				// #9 - Science Jokes
				CheckBox {
					id: group9
					onClicked: {
						plasmoid.configuration[cfg_group9] = !plasmoid.configuration[cfg_group9];
						groupsUpdate(9, group9);
					}	
				}
				Label {
					text: "science"
					}
				Label {
					text: "Science jokes, long and short"
				}
				Label {
					text: "1140"
				}
					

				// #10 - Definitions
				CheckBox {
					id: group10
					onClicked: {
						plasmoid.configuration[cfg_group10] = !plasmoid.configuration[cfg_group10];
						groupsUpdate(10, group10);
					}	
				}
				Label {
					text: "Oddball definitions"
					}
				Label {
					text: "Unusual or funny definitions"
				}
				Label {
					text: "2342"
				}


				// #11 - HHGTTG
				CheckBox {
					id: group11
					onClicked: {
						plasmoid.configuration[cfg_group11] = !plasmoid.configuration[cfg_group11];
						groupsUpdate(11, group11);
					}	
				}
				Label {
					text: "hitchhiker"
					}
				Label {
					text: "The Hitchhiker's Guide To The Galaxy"
				}
				Label {
					text: "154"
				}
					
								

				// #15 - Work
				CheckBox {
					id: group15
					onClicked: {
						plasmoid.configuration[cfg_group15] = !plasmoid.configuration[cfg_group15];
						groupsUpdate(15, group12);
					}	
				}
				Label {
					text: "work"
					}
				Label {
					text: "Jokes, etc, about the workplace"
				}
				Label {
					text: "1164"
				}


				// #17 - Linux
				CheckBox {
				id: group17
				onClicked: {
					plasmoid.configuration[cfg_group17] = !plasmoid.configuration[cfg_group17];
					groupsUpdate(17, group17);
						}	
					}
				Label {
					text: "linux"
					}
				Label {
					text: "Linux-themed messages and quotes"
				}
				Label {
					text: "200"
				}

						
				// #18 - Einstein
				CheckBox {
				id: group18
				onClicked: {
					plasmoid.configuration[cfg_group18] = !plasmoid.configuration[cfg_group18];
					groupsUpdate(18, group18);
					}	
				}
				Label {
					text: "einsteins"
					}
				Label {
					text: "Quotations from Albert Einstein"
				}
				Label {
					text: "362"
				}


				// #17 - Homer
				CheckBox {
				id: group19
				onClicked: {
					groupsUpdate(19, group19);
					plasmoid.configuration[cfg_group19] = !plasmoid.configuration[cfg_group19];
						}	
					}
				Label {
					text: "homer"
					}
				Label {
					text: "Homer Simpson quotations"
				}
				Label {
					text: "170"
				}


			}

		 
		function groupsUpdate(grp, box) {

			if (plasmoid.configuration["firstRun"] == true) {
				plasmoid.configuration["firstRun"] = false;
				groupList = [12];
			} 
			
			if ((groupList.length == 1) && groupList.indexOf(grp) >= 0) {
				box.checked = true;
				noSourcesDialog.visible = true;
				return false;
				
			}


			if (groupList.indexOf(grp) == -1) {
				groupList.push(grp);
			} else {
				var splicePoint = groupList.indexOf(grp);
				groupList.splice(splicePoint, 1);
			}

			groupString = groupList.join();

			var configString = groupString;

			console.log(groupString);

			plasmoid.configuration.activeGroups = groupString;
			plasmoid.configuration["cfg_savedList"] = groupList;
		}


		Dialogs.MessageDialog {
			id: noSourcesDialog
			visible: false
			icon: Dialogs.StandardIcon.Warning

			title: "No Messages Chosen!"

			text: "You need to have at least one category of fortune messages selected. Otherwise, you won't get "
			+ "regular doses of wisdom.\n\n"
			+ "Please go back and select a category or two."


			onAccepted: {
				var reCheck = ("group" + grp).checked = true;
				noSourcesDialog.visible = false;

			}

		}
		


		
			
	

	} // END MAIN ITEM
				
	
