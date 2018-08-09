import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
   PlasmaCore.IconItem {
    source:  Qt.resolvedUrl("../images/fortune-cookie.png")
    anchors.fill: parent
   }

   
    MouseArea {
      id: mousearea
      anchors.fill: parent

      onClicked: {
        plasmoid.expanded = !plasmoid.expanded;
      }
      }
    } // end