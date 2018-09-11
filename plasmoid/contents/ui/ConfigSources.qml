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
	property var xrandr_str;
	property var modeList;
	property var modeCount: 0
	property int sampleGroup: 0

	


	Layout.GridLayout {
		columns: 5
		
			CheckBox {
	 		id: group1
	 		onClicked: {
	 			plasmoid.configuration[group1] = !plasmoid.configuration[group1];
	 			countUpdate();
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
			Label {
				textFormat: Text.richText;
				text: "<a href=\"1\">Sample</a>"
				onLinkActivated: {
					sampleBox.sampleGroup = 1;
					sampleBox.open();
				}
				
			}
			
			CheckBox {
			 		id: group2
			 		onClicked: {
			 			plasmoid.configuration[group2] = !plasmoid.configuration[group2];
			 			countUpdate();
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
				Label {
					textFormat: Text.richText;
					text: "<a href=\"1\">Sample</a>"
					onLinkActivated: console.log(link)
				}

				CheckBox {
				 		id: group3
				 		onClicked: {
				 			plasmoid.configuration[group3] = !plasmoid.configuration[group3];
				 			countUpdate();
				 		}	
				 	}
					Label {
						text: "literature"
						}
					Label {
						text: "Classic literary quotations"
					}
					Label {
						text: "494"
					}
					Label {
						textFormat: Text.richText;
						text: "<a href=\"1\">Sample</a>"
						onLinkActivated: console.log(link)
					}

					CheckBox {
					 		id: group4
					 		onClicked: {
					 			plasmoid.configuration[group4] = !plasmoid.configuration[group4];
					 			countUpdate();
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
						Label {
							textFormat: Text.richText;
							text: "<a href=\"1\">Sample</a>"
							onLinkActivated: console.log(link)
						}

						CheckBox {
						 		id: group5
						 		onClicked: {
						 			plasmoid.configuration[group5] = !plasmoid.configuration[group5]
						 			countUpdate();
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
							Label {
								textFormat: Text.richText;
								text: "<a href=\"1\">Sample</a>"
								onLinkActivated: console.log(link)
							}

							CheckBox {
							 		id: group6
							 		onClicked: {
							 			plasmoid.configuration[group6] = !plasmoid.configuration[group6];
							 			countUpdate();
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
								Label {
									textFormat: Text.richText;
									text: "<a href=\"1\">Sample</a>"
									onLinkActivated: console.log(link)
								}

								CheckBox {
								 		id: group7
								 		onClicked: {
								 			plasmoid.configuration[group7] = !plasmoid.configuration[group7];
								 			countUpdate();
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
									Label {
										textFormat: Text.richText;
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

									CheckBox {
									 		id: group8
									 		onClicked: {
									 			plasmoid.configuration[group8] = !plasmoid.configuration[group8]
									 			countUpdate();
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
										Label {
											textFormat: Text.richText;
											text: "<a href=\"1\">Sample</a>"
											onLinkActivated: console.log(link)
										}

										CheckBox {
										 		id: group9
										 		onClicked: {
										 			plasmoid.configuration[group9] = !plasmoid.configuration[group9];
										 			countUpdate();
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
											Label {
												textFormat: Text.richText;
												text: "<a href=\"1\">Sample</a>"
												onLinkActivated: console.log(link)
											}
								CheckBox {
								 		id: group10
								 		onClicked: {
								 			plasmoid.configuration[group10] = !plasmoid.configuration[group10];
								 			countUpdate();
								 		}	
								 	}
									Label {
										text: "definitions"
										}
									Label {
										text: "Unusual or funny definitions"
									}
									Label {
										text: "2342"
									}
									Label {
										textFormat: Text.richText;
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

								CheckBox {
								 		id: group11
								 		onClicked: {
								 			plasmoid.configuration[group11] = !plasmoid.configuration[group11];
								 			countUpdate();
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
									Label {
										textFormat: Text.richText;
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

								CheckBox {
								 		id: group12
								 		onClicked: {
								 			plasmoid.configuration[group12] = !plasmoid.configuration[group12];
								 			countUpdate();
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
									Label {
										textFormat: Text.richText;
										text: "<a href=\"1\">Sample</a>"
										onLinkActivated: console.log(link)
									}

							CheckBox {
							 		id: group13
							 		onClicked: {
							 			plasmoid.configuration[group13] = !plasmoid.configuration[group13];
							 			countUpdate();
							 		}	
							 	}
								Label {
									text: "magic"
									}
								Label {
									text: "Quips about magic, wizards, etc."
								}
								Label {
									text: "48"
								}	
								Label {
									textFormat: Text.richText;
									text: "<a href=\"1\">Sample</a>"
									onLinkActivated: console.log(link)
								}

							CheckBox {
							 		id: group14
							 		onClicked: {
							 			plasmoid.configuration[group14] = !plasmoid.configuration[group14];
							 			countUpdate();
							 		}	
							 	}
								Label {
									text: "aphorisms"
									}
								Label {
									text: "Folk style advice"
								}	
								Label {
									text: "54"
								}
								Label {
									textFormat: Text.richText;
									text: "<a href=\"1\">Sample</a>"
									onLinkActivated: console.log(link)
								}

							CheckBox {
							 		id: group15
							 		onClicked: {
							 			plasmoid.configuration[group15] = !plasmoid.configuration[group15];
							 			countUpdate();
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
								Label {
									textFormat: Text.richText;
									text: "<a href=\"1\">Sample</a>"
									onLinkActivated: console.log(link)
								}

						CheckBox {
						 		id: group16
						 		onClicked: {
						 			plasmoid.configuration[group16] = !plasmoid.configuration[group16];
						 			countUpdate();
						 		}	
						 	}
							Label {
								text: "cookie"
								}
							Label {
								text: "Another classic collection"
							}
							Label {
								text: "2120"
							}
							Label {
								textFormat: Text.richText;
								text: "<a href=\"1\">Sample</a>"
								onLinkActivated: console.log(link)
							}

					CheckBox {
					 		id: group17
					 		onClicked: {
					 			plasmoid.configuration[group17] = !plasmoid.configuration[group17];
					 			countUpdate();
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
						Label {
							textFormat: Text.richText;
							text: "<a href=\"1\">Sample</a>"
							onLinkActivated: console.log(link)
						}

				CheckBox {
				 		id: group18
				 		onClicked: {
				 			plasmoid.configuration[group18] = !plasmoid.configuration[group18];
				 			countUpdate();
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
					Label {
						textFormat: Text.richText;
						text: "<a href=\"1\">Sample</a>"
						onLinkActivated: console.log(link)
					}

				CheckBox {
				 		id: group19
				 		onClicked: {
				 			plasmoid.configuration[group19] = !plasmoid.configuration[group19];
				 			countUpdate();
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
					Label {
						textFormat: Text.richText;
						text: "<a href=\"1\">Sample</a>"
						onLinkActivated: console.log(link)
					}

				CheckBox {
				 		id: group20
				 		onClicked: {
				 			plasmoid.configuration[group20] = !plasmoid.configuration[group20];
				 			countUpdate();
				 		}	
				 	}
					Label {
						text: "matrix"
						}
					Label {
						text: "Quotations from 'The Matrix'"
					}
					Label {
						text: "70"
					}
					Label {
						textFormat: Text.richText;
						text: "<a href=\"1\">Sample</a>"
						onLinkActivated: console.log(link)
					}

			

		 
			PlasmaComponents.QueryDialog {
				id: sampleBox
				property var sampleGroup
				acceptButtonText: "Another";
				rejectButtonText: "Done";
				message: "Group " + sampleGroup;		
			}
	
}
	
}