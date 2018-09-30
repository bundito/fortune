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

import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.4 as Kirigami

Item {

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);
	property var groups: plasmoid.configuration.activeGroups;
	property var groupList: "\'" + groups + "\'";
	property var fortune: "";
	property var cookieIcon: Qt.resolvedUrl("../images/fortune-cookie.png");
	property var cmd;
	property int delay: 200;
	property var newOK: true;

	id: root

	Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

	Plasmoid.compactRepresentation : CompactRepresentation {}
	Plasmoid.fullRepresentation : FullRepresentation {}
	Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
	}
