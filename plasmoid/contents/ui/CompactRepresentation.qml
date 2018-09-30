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
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1 as Layout
import org.kde.kirigami 2.4 as Kirigami

Item {

  property var savedFortune: plasmoid.configuration.savedFortune;
  property var foo: updateGroups(0,0);

  //-------------------------------------------------//
  // Notification stuff...                           //
  //-------------------------------------------------//

      PlasmaCore.DataSource {
          id: notificationSource
          engine: "notifications"
          connectedSources: "org.freedesktop.Notifications"
      }

      function loadGroupVars() {
        groups = plasmoid.configuration.activeGroups;
      }

      function createNotification() {
        var service = notificationSource.serviceForSource("notification");
        var operation = service.operationDescription("createNotification");

        operation.appName = "Fortune"
        operation["appIcon"] = Qt.resolvedUrl("../images/fortune-cookie.png");
        operation.summary = "Fortune"
        operation["body"] = "A new fortune is available.";
        operation["timeout"] = 1000;
        service.startOperationCall(operation);
      }

  Timer {
    id: intervalTimer
    interval: delay * 60
    running: false
    repeat: false
    onTriggered: {
      newOK = true;
      console.log("Timer triggered.");
      createNotification();
    }
  }

//----------------- END NOTIFICATION ----------------------//

   PlasmaCore.IconItem {
    ToolTip.text: "This is fortune."
    id: cookieImg
    source:  newOK ? Qt.resolvedUrl("../images/fortune-cookie.png") : Qt.resolvedUrl("../images/broken-cookie.png")
    anchors.fill: parent
   }

    function getFortune() {
      if (!newOK) {
        fortune = savedFortune;
        return;
      } else {
        intervalTimer.running = true;
        newOK = false;
        groups = plasmoid.configuration.activeGroups;
      }

    cmd = "bash " + exec+ "code/fortuneQuery.sh " + groupList + " " + exec + "code/";
    queryDB.interval = 500;
    queryDB.connectedSources = [cmd];
    queryDB.interval = 0;
  }


  PlasmaCore.DataSource {
    id: queryDB
    engine: "executable"
    interval: 250
    connectedSources: []
    onNewData: {
      console.log(cmd);

    fortune = data.stdout;
    fortune = fortune.slice(0, -1);

    plasmoid.configuration.savedFortune = fortune;

    queryDB.connectedSources = [];

  }

}

    MouseArea {
      id: mousearea
      anchors.fill: parent

      onClicked: {
        getFortune();
        plasmoid.expanded = !plasmoid.expanded;
      }
  }
}
