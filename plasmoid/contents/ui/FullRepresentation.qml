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
import org.kde.plasma.core 2.0 as Plasma
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0


Item {

	FontLoader { id: localFont; source: Qt.resolvedUrl("VT323-Regular.ttf");}

	id: baseItem
	Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 60
	Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 8


	//layer.enabled: true;

	Rectangle {
			
			id: bgImage
			anchors.fill: baseItem
			Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 59
			Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 8.5
			color: plasmoid.configuration.backgroundColor
			
			
				}

	


			Label {
				id: textColor
				
				anchors.centerIn: baseItem
				
				color: plasmoid.configuration.textColor
				 font.pointSize: (theme.defaultFont.pointSize) * 1.3
				 
				 horizontalAlignment: Text.AlignHCenter
				 verticalAlignment: Text.AlignVCenter
				 font.family: localFont.name
				//color: txtColor
				//color: textColor
				text: fortune
			}

				MouseArea {
					anchors.fill: bgImage
					onClicked: {
					   plasmoid.expanded = false
					   //cookieIcon = Qt.resolvedUrl("../images/fortune-cookie.png")
					  
				}

			}

			


	}	


	

	











	
			


	




	
