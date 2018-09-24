import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1 as Layout
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0



Item {

 

  property var savedFortune: plasmoid.configuration.savedFortune;


  Timer {
    id: intervalTimer
    interval: delay * 60
    running: false
    repeat: false
    onTriggered: {
      newOK = true;
      console.log("Timer triggered.");
    }
  }

   PlasmaCore.IconItem {
    id: cookieImg
    source:  newOK ? Qt.resolvedUrl("../images/fortune-cookie.png") : Qt.resolvedUrl("../images/broken-cookie.png")
    anchors.fill: parent
    ToolTip.text: "This is <b>Fortune</b>"

   }

    function getFortune() {

      console.log("newOK" + newOK);

      if (!newOK) {
        fortune = savedFortune;

        return;
      } else {
        intervalTimer.running = true;
        newOK = false;
      }



    console.log(plasmoid.configuration.groupstring);
    cmd = "bash " + exec+ "code/fortuneQuery.sh " + groupList + " " + exec + "code/";
    queryDB.interval = 500;
    queryDB.connectedSources = [cmd];
    queryDB.interval = 0;

   // cookieIcon = Qt.resolvedUrl("../images/broken-cookie.png");
  }


  PlasmaCore.DataSource {
    id: queryDB
    engine: "executable"
    interval: 250
    connectedSources: []

    onNewData: {

  console.log(cmd);


/*
      // lorem.txt is 10 lines and 78 characters
      fortune = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\n"
+ "incididunt ut labore et dolore magna aliqua. Rhoncus est pellentesque elit\n"
+ "ullamcorper dignissim cras. Dis parturient montes nascetur ridiculus mus\n"
+ "mauris. Viverra accumsan in nisl nisi scelerisque eu. Felis donec et odio\n"
+ "pellentesque diam volutpat commodo. In hac habitasse platea dictumst quisque\n"
+ "sagittis purus sit. Ullamcorper morbi tincidunt ornare massa eget egesta\n"
+ "purus. Facilisi etiam dignissim diam quis enim. Tristique et egestas qui\n"
+ "ipsum. Tellus elementum sagittis vitae et. Mauris rhoncus aenean vel elit."

*/

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
     // end