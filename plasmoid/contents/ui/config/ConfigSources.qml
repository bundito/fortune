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
		

	property var display;
	
	property var groupString
	property var modeCount: 0
	property int sampleGroup: 0
	property var grp;
	property string cmd;
	property string sampleText;
	property var activeGroups: []

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
	property bool firstRun: plasmoid.configuration.firstRun
	property string workingGroup: plasmoid.configuration.activeGroups
	
	

	// GROUP20	


	function getSample(sampleGroup) {
		cmd = "bash " + exec+ "code/fortuneQuery.sh " + sampleGroup + " " + exec + "code/";
		console.log(cmd)
		console.log("sampleGroup " + sampleGroup);
		sampleDB.interval = 250
		sampleDB.connectedSources = cmd;
		//console.log(sampleText);

		//sampleDB.interval = 0;

		console.log("getsample")
		console.log(sampleText)
		
		slowdown.running = true;		
	}

	Timer {
			id: slowdown
	        interval: 100
	        running: false
	        repeat: false
	        onTriggered:{
	       		sampleBox.visible = true;
	   }
	}


	Dialogs.MessageDialog {
		id: sampleBox

		title: "Sample Fortune"
		visible: false;

		//standardButtons: Dialogs.StandardButton.ok
		


		onAccepted: {
			sampleBox.visible = false;
		}
	}
	

	PlasmaCore.DataSource {
			id: sampleDB
			engine: "executable"
			interval: 250
			connectedSources: cmd
		

			onNewData: {
				sampleText = data.stdout;
				console.log(sampleText);
				//sampleBox.text = sampleText;
				sampleDB.connectedSources = [];
				sampleDB.interval = 0;
				console.log("datasource");
				console.log(sampleText);
				sampleBox.text = sampleText;

			
				
			}

		} // end DataSource

		


		




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
			

		



	Layout.GridLayout {
		columns: 4
		columnSpacing: 25
				
		// COLUMN HEADER
		Label {
			text: ""
		}
		Label {
			font.bold: true
			text: "Description"
		}
		Label {
			font.bold: true
			text: "Items"
		}
		Label{
			text: ""
		}


		// #12 - Fortune
		CheckBox {
			id: group12
			onClicked: {
				groupsUpdate("12", group12);
			}	
		}		
		Label {
			text: "A classic fortune file"
		}
		Label {
			text: "862"
		}
		Label {
			text: "<a href=\"1\">Sample</a>"
			onLinkActivated: {
				getSample(12);
					}	
		}


				

				// #1 - Chalkboard
				CheckBox {
				id: group1
				onClicked: {
				groupsUpdate("1", group1);
					}	
				}
				
			    Label {
					text: "Bart Simpson at the chalkboard"
				}
				Label {
					text: "354"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
				getSample(1);
					}	
		}
			

				// #2 - Disclaimers				
				CheckBox {
					id: group2
					onClicked: {
						groupsUpdate("2", group2);
					}	
				}
				
				Label {
					text: "Product & Service disclaimers"
				}
				Label {
					text: "568"
				}
				Label {
				text: "<a href=\"1\">Sample</a>"
				onLinkActivated: {
					getSample(2);
						}	
				}
		

				// #4 - Star Wars
				CheckBox {
					id: group4
					onClicked: {
			 			groupsUpdate("4", group4);
			 		}	
			 	}
				Label {
					text: "Star Wars quotations"
				}
				Label {
					text: "118"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(4);
							}	
				}

				
				// #5 - Computer Jokes
				CheckBox {
					id: group5
					onClicked: {
						groupsUpdate("5", group5);
					}	
				}
				Label {
					text: "Old computer jokes"
				}
				Label {
					text: "1790"
					}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(5);
							}	
						}				


				// #6 - Humorists
				CheckBox {
					id: group6
					onClicked: {
						groupsUpdate("6", group6);
					}	
				}
				Label {
					text: "Classic funny people like Mark Twain"
				}
				Label {
					text: "360"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(6);
							}	
				}
				

				// #7 - Perl
				CheckBox {
					id: group7
					onClicked: {
						groupsUpdate("7", group7);
					}	
				}
				Label {
					text: "Perl and Larry Wall"
				}
				Label {
					text: "544"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(7);
							}	
				}


				// #8 - Star Trek
				CheckBox {
					id: group8
					onClicked: {
						groupsUpdate("8", group8);
					}	
				}
				Label {
					text: "Star Trek (TOS) quotations"
				}
				Label {
					text:  "128"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(8);
					}	
				}
					


				// #9 - Science Jokes
				CheckBox {
					id: group9
					onClicked: {
						groupsUpdate("9", group9);
					}	
				}
				Label {
					text: "Science jokes, long and short"
				}
				Label {
					text: "1140"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(9);
							}	
				}
					

				// #10 - Definitions
				CheckBox {
					id: group10
					onClicked: {
						groupsUpdate("10", group10);
					}	
				}
				Label {
					text: "Unusual or funny definitions"
				}
				Label {
					text: "2342"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(10);
							}	
				}


				// #11 - HHGTTG
				CheckBox {
					id: group11
					onClicked: {
						groupsUpdate("11", group11);
					}	
				}
				Label {
					text: "The Hitchhiker's Guide To The Galaxy"
				}
				Label {
					text: "154"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(11);
							}	
				}
					
								

				// #15 - Work
				CheckBox {
					id: group15
					onClicked: {
						groupsUpdate("15", group15);
					}	
				}
				Label {
					text: "Jokes, etc, about the workplace"
				}
				Label {
					text: "1164"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(15);
							}	
				}

				// #17 - Linux
				CheckBox {
				id: group17
				onClicked: {
					groupsUpdate("17", group17);
						}	
					}
				Label {
					text: "Linux-themed messages and quotes"
				}
				Label {
					text: "200"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(17);
							}	
				}
						

				// #18 - Einstein
				CheckBox {
				id: group18
				onClicked: {
					groupsUpdate("18", group18);
					}	
				}
				Label {
					text: "Quotations from Albert Einstein"
				}
				Label {
					text: "362"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(18);
							}	
				}


				// #19 - Homer
				CheckBox {
				id: group19
				onClicked: {
					groupsUpdate("19", group19);
						}	
					}
				Label {
					text: "Homer Simpson quotations"
				}
				Label {
					text: "170"
				}
				Label {
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: {
						getSample(19);
							}	
				}


			}

			Timer {
				id: waitClick
				interval: 250
				running: false
				repeat: false
			}

		 
		function groupsUpdate(grp, box) {

			

			if (plasmoid.configuration.firstRun == true) {
				plasmoid.configuration.firstRun = false;
				activeGroups.push("12");
			} 

			console.log("AG: " +activeGroups);

			var index = activeGroups.indexOf(grp);

			if (index == -1) {
				activeGroups.push(grp);
			} else {
				activeGroups.splice(index, 1)
			}

			console.log("AG After: " + activeGroups);
			plasmoid.configuration.activeGroups = activeGroups;

	}

		/*	var activeGroups = workingGroup.split(",");

			
			console.log("FR: " + firstRun);
			

			if (firstRun == true) {
				plasmoid.configuration.firstRun = false;
				
				
				console.log("Initial set of activeGroups: " + activeGroups);
			} 
			
			waitClick.running = true;

			if ((activeGroups.length == 1) && activeGroups.indexOf(grp) >= 0) {
				box.checked = true;
				noSourcesDialog.visible = true;
				return false;
				
			}
			console.log("AG Type: " +  typeof activeGroups);
			console.log("INDEX: " + activeGroups.indexOf(grp));


			console.log("Type: " + typeof grp);

			
			console.log("Box " + box.checked);
			
			if (!box.checked) {
				console.log("Checked: no - ADD");
				activeGroups.push(grp);
				
			} else {
				console.log("Box CHECKED - REMOVE");
				for (var i = 0; i < activeGroups.length-1; i++) { 
				   if (activeGroups[i] == grp) {
				     activeGroups.splice(i, 1);
				   }
				}
			}

			// var configString = activeGroups.join();

			console.log("GroupString: " + activeGroups);

			plasmoid.configuration.activeGroups = activeGroups;
			//plasmoid.configuration["cfg_savedList"] = activeGroups;
		}

*/
		

		
			
	

	} // END MAIN ITEM
				
	