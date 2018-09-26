import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Dialogs 1.3 as Dialogs
import QtQuick.Controls 2.4 as QQC2
import QtQuick.Dialogs 1.3 as Dialogs
import QtWebEngine 1.7 as QWE

Item {

QQC2.ScrollView {
	id: scroller
	height: 400
	width: parent.width

		QQC2.TextArea {
		id: aboutText
		width: parent.width
		height: 400
		textFormat: TextEdit.RichText
		wrapMode: TextEdit.Wrap
		
		
		text: "<img src=\"bjarne.png\" align=\"right\"/>" 
		+ "\"Fortune\" (or more correctly, \'fortune\') was a small program that would display a humorous "
		+ "or interesting message on a user\'s screen. It was introduced with the release of Unix 7, in 1979. "
		+ "In those days, users logged into to a text terminal where they did most of their work.  Even email was"
		+ "done all on the terminal. Windowing systems and graphic user interfaces were still in their infancy."
		+ "<p>"
		+ "Fortune typically had a variety of sources available, with different themes. These themes were directed "
		+ "at the Unix userbase of the era: computer scientists and hardcore nerds. As a result, the contents of "
		+ "\"fortune\" were computer jokes and anecdotes, and quotes from fan-favorite sources like Star Trek, "
		+ "The Hitchhiker's Guide To The Galaxy, and The Simpsons. Also included were random jokes, quotations "
		+ "from famous people, and general random silliness."
		+ "<p>"
		+ "The various sources available in this widget are all authentic fortune source files from that era. As "
		+ "such, the jokes and references may be out-of-date, no longer relevant, or refer to technical topics that "
		+ "have long since become obsolete. It seemed important to recreate \"fortune\" as accurately as possible, "
		+ "without modernizing it aside from how it's presented."

         
         }


       
        
   
   }

   Layout.RowLayout {
   		anchors.top: scroller.bottom
   		height: 50
   		Text { 
   			text: "KDE Plasmoid version of fortune <a href=\"1\">\(c\)<\/a> 2018 Scott P Harvey. Licensed under the GPLv3."
   			onLinkActivated: {eggDialog.open(); }
   		}
}

   		Dialogs.Dialog {
   			id: eggDialog
   			visible: false;
   			title: "Easter Egg!"
   			height: 250
   			width: 600
   			
   			
   				Rectangle {
   					anchors.fill: parent

   					ExclusiveGroup { id: people }
   					Layout.RowLayout {
   						id: msgRow
   						height: 25
   					Label {
   						
   						text: "<b>Congratulations!</b> You found the Easter egg! But before we continue, a brief quiz:<p>"
   							+ "<b>Who is the man shown in the photo above, and what is he best known for?</b>"
   					}
   				}
   					Layout.GridLayout {
   						columns: 2
   					anchors.top: msgRow.bottom
   					anchors.topMargin: 40
   					
   						RadioButton {
							id: ritchieButton
							text: "<b>Dennis Ritchie</b><br>Inventor of the C programming language"
							exclusiveGroup: people
   						}

   						RadioButton {
							id: stallmanButton
							text: "<b>Richard Stallman</b><br>Activist and founder of the Free Software Project"
							exclusiveGroup: people
   						}

   						RadioButton {
							id: bjarneButton
							text: "<b>Bjarne Stroustrup</b><br>Creator of the widley-used C++ language"
							exclusiveGroup: people
   						}

   						RadioButton {
							id: wallButton
							text: "<b>Larry Wall</b><br>Creator of the Perl programming language"
							exclusiveGroup: people
   						}

   						
   				}
   			
   			}
   		
   			onAccepted: {
   				eggDialog.close();
   				if (bjarneButton.checked) {
   					console.log("Correct!");
   					rightDialog.open();
   				} else {
   					if (ritchieButton.checked) {
   						wrongDialog.open()
   						wrongPicture.source = "Dennis_Ritchie.jpg";
   						wrongMsg.text = "Dennis Ritchie created the C language,<p>and with a colleague, Unix<p>He passed away in 2011."
   					} else if (wallButton.checked) {
   						wrongDialog.open()
   						wrongPicture.source = "Larry_Wall.jpg";
   						wrongMsg.text = "Larry Wall developed Perl in 1987.<p>He continues to oversee the project."

   					} else if (stallmanButton.clicked) {
   						wrongDialog.open();
   						wrongPicture.source = "Richard_Stallman.jpg"
   						wrongMsg.text = "Richard Stallman is a free software advocate,<p>founder of the GNU project,<p>and the Free Software Foundation."
   					}

   				}
   			}
}
   			Dialogs.Dialog {
   				id: wrongDialog
   				height: 300
   				width: 250
					
   					Label {
   						id: wrongTitle
   						anchors.horizontalCenter: parent.horizontalCenter
   						font.pointSize: 14
   						font.bold: true
   						text: "Wrong!"
   						}

   					Image {
   						anchors.top: wrongTitle.bottom
   						anchors.horizontalCenter: parent.horizontalCenter
   						id: wrongPicture
   						height: implicitHeight
   						width: implicitWidth
   						}
   					Label {
   						anchors.top: wrongPicture.bottom
   						anchors.horizontalCenter: wrongPicture.horizontalCenter
   						id: wrongMsg
   						height: implicitHeight
   					}
   				onAccepted: {wrongDialog.close();}
   				}
   			
   				Dialogs.Dialog {
   					id: rightDialog
   					

   						Label {
   							id: rightTitle
   							anchors.horizontalCenter: parent.horizontalCenter
   							font.pointSize: 14
   							font.bold: true
							text: "Correct!"
							}

						Label {
							id: rightText
							anchors.top: rightTitle.bottom
							anchors.horizontalCenter: parent.horizontalCenter
							text: "It's Bjarne! Good job finding the Easter egg."
								+ "<p><p>"
								+ "As a reward, here's a photo of Bjarne Stroustrup looking thoughtful."
								+ "<p><p>"
						
  						}

  						Image {
  							id: thumbnail
  							anchors.top: rightText.bottom
  							width:800
  							height:480
  							source: "bjarne-wallpaper.jpg"
  						}

  						
   				


   			}
   				
}
   			

   			

   		

   	


   	

	

