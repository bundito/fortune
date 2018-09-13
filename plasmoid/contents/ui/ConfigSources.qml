import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout



Item {

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);
	property string path;
	property var countSource: 'bash '+exec+"code/getCounts.sh" + " " + exec + "code";
	property var display;
	property var groupList: []
	property var groupString
	property var modeCount: 0
	property int sampleGroup: 0
	property var grp;

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
	//property alias cfg_activeGroups: startList;
	// GROUP20	

	

	


	Layout.GridLayout {
		columns: 5
		
			CheckBox {
			 		id: group12
			 		
			 		onClicked: {
			 			plasmoid.configuration[cfg_group12] = !plasmoid.configuration[cfg_group12];
			 			groupsUpdate(12);
			 		}	
			 	}
				Label {
					text: "fortunes"
					}
				Label {
					text: "A classic fortune file"
				}
				Label {
					text: "(862)"
				}
				Label {
					
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: console.log(link)
				}



			CheckBox {
	 		id: group1
	 		onClicked: {
	 			plasmoid.configuration[cfg_group1] = !plasmoid.configuration[cfg_group1];
	 			groupsUpdate(1);
	 		}	
	 	}
			Label {
				text: "chalkboard"
				}
			Label {
				text: "Bart Simpson at the chalkboard"
			}
			Label {
				text: "(354)"
			}
			Label {
				
				text: "<a href=\"1\">Sample</a>"
				onLinkActivated: {
					sampleBox.sampleGroup = 1;
					sampleBox.open();
				}
				
			}
			
			CheckBox {
			 		id: group2
			 		onClicked: {
			 			plasmoid.configuration[cfg_group2] = !plasmoid.configuration[cfg_group2];
			 			groupsUpdate(2);
			 		}	
			 	}
				Label {
					text: "disclaimer"
					}
				Label {
					text: "Product & Service disclaimers"
				}
				Label {
					text: "(568)"
				}
				Label {
					
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: console.log(link)
				}

					CheckBox {
					 		id: group4
					 		onClicked: {
					 			plasmoid.configuration[cfg_group4] = !plasmoid.configuration[cfg_group4];
					 			groupsUpdate(4);
					 		}	
					 	}
						Label {
							text: "starwars"
							}
						Label {
							text: "Star Wars quotations (original trilogy)"
						}
						Label {
							text: "(118)"
						}
						Label {
							
							text: "<a href=\"1\">Sample</a>"
							onLinkActivated: console.log(link)
						}

						CheckBox {
						 		id: group5
						 		onClicked: {
						 			plasmoid.configuration[cfg_group5] = !plasmoid.configuration[cfg_group5]
						 			groupsUpdate(5);
						 		}	
						 	}
							Label {
								text: "computers2"
								}
							Label {
								text: "(Old) computer jokes"
							}
							Label {
								text: "(1790)"
							}
							Label {
								
								text: "<a href=\"1\">Sample</a>"
								onLinkActivated: console.log(link)
							}

							CheckBox {
							 		id: group6
							 		onClicked: {
							 			plasmoid.configuration[cfg_group6] = !plasmoid.configuration[cfg_group6];
							 			groupsUpdate(6);
							 		}	
							 	}
								Label {
									text: "humorists"
									}
								Label {
									text: "Classic funny people like Mark Twain"
								}
								Label {
									text: "(360)"
								}
								Label {
									
									text: "<a href=\"1\">Sample</a>"
									onLinkActivated: console.log(link)
								}

								CheckBox {
								 		id: group7
								 		onClicked: {
								 			plasmoid.configuration[cfg_group7] = !plasmoid.configuration[cfg_group7];
								 			groupsUpdate(7);
								 		}	
								 	}
									Label {
										text: "perl"
										}
									Label {
										text: "Perl and perl hackers"
									}
									Label {
										text: "(544)"
									}
									Label {
										
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

									CheckBox {
									 		id: group8
									 		onClicked: {
									 			plasmoid.configuration[cfg_group8] = !plasmoid.configuration[cfg_group8]
									 			groupsUpdate(8);
									 		}	
									 	}
										Label {
											text: "startrek"
											}
										Label {
											text: "Star Trek (TOS) quotations"
										}
										Label {
											text: "(128)"
										}
										Label {
											
											text: "<a href=\"1\">Sample</a>"
											onLinkActivated: console.log(link)
										}

										CheckBox {
										 		id: group9
										 		onClicked: {
										 			plasmoid.configuration[cfg_group9] = !plasmoid.configuration[cfg_group9];
										 			groupsUpdate(9);
										 		}	
										 	}
											Label {
												text: "science"
												}
											Label {
												text: "Science jokes, long and short"
											}
											Label {
												text: "(1140)"
											}
											Label {
												
												text: "<a href=\"1\">Sample</a>"
												onLinkActivated: console.log(link)
											}
								CheckBox {
								 		id: group10
								 		onClicked: {
								 			plasmoid.configuration[cfg_group10] = !plasmoid.configuration[cfg_group10];
								 			groupsUpdate(10);
								 		}	
								 	}
									Label {
										text: "definitions"
										}
									Label {
										text: "Unusual or funny definitions"
									}
									Label {
										text: "(2342)"
									}
									Label {
										
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

								CheckBox {
								 		id: group11
								 		onClicked: {
								 			plasmoid.configuration[cfg_group11] = !plasmoid.configuration[cfg_group11];
								 			groupsUpdate(11);
								 		}	
								 	}
									Label {
										text: "hitchhiker"
										}
									Label {
										text: "The Hitchhiker's Guide To The Galaxy"
									}
									Label {
										text: "(154)"
									}
									Label {
										
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

								


							CheckBox {
							 		id: group15
							 		onClicked: {
							 			plasmoid.configuration[cfg_group15] = !plasmoid.configuration[cfg_group15];
							 			groupsUpdate(15);
							 		}	
							 	}
								Label {
									text: "work"
									}
								Label {
									text: "Jokes, etc, about the workplace"
								}
								Label {
									text: "(1164)"
								}
								Label {
									
									text: "<a href=\"1\">Sample</a>"
									onLinkActivated: console.log(link)
								}

					CheckBox {
					 		id: group17
					 		onClicked: {
					 			plasmoid.configuration[cfg_group17] = !plasmoid.configuration[cfg_group17];
					 			groupsUpdate(17);
					 		}	
					 	}
						Label {
							text: "linux"
							}
						Label {
							text: "Linux-themed messages and quotes"
						}
						Label {
							text: "(200)"
						}
						Label {
							
							text: "<a href=\"1\">Sample</a>"
							onLinkActivated: console.log(link)
						}

				CheckBox {
				 		id: group18
				 		onClicked: {
				 			plasmoid.configuration[cfg_group18] = !plasmoid.configuration[cfg_group18];
				 			groupsUpdate(18);
				 		}	
				 	}
					Label {
						text: "einsteins"
						}
					Label {
						text: "Quotations from Albert Einstein"
					}
					Label {
						text: "(362)"
					}
					Label {
						
						text: "<a href=\"1\">Sample</a>"
						onLinkActivated: console.log(link)
					}

				CheckBox {
				 		id: group19
				 		onClicked: {
				 			groupsUpdate(19);
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
						text: "(170)"
					}
					Label {
						
						text: "<a href=\"1\">Sample</a>"
						onLinkActivated: console.log(link)
					}


				}

				
	

		 
		function groupsUpdate(grp) {
			
			if (groupList.indexOf(grp) == -1) {
				groupList.push(grp);
			} else {
				groupList.splice(grp, 1);
			}

			groupString = groupList.join();

			var configString = "'group_id IN (" + groupString + ")'";

			console.log(configString);

		}

			PlasmaComponents.QueryDialog {
				id: sampleBox
				property var sampleGroup;
				acceptButtonText: "Another";
				rejectButtonText: "Done";
				message: "Group " + sampleGroup;		
			}


	
}
	
