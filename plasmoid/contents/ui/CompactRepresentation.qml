import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import org.kde.kirigami 2.4 as Kirigami
import QtGraphicalEffects 1.0


Item {  




   PlasmaCore.IconItem {
    source:  Qt.resolvedUrl("../images/fortune-cookie.png")
    anchors.fill: parent
   }

    
    function getFortune() {
   
    queryDB.interval = 500;
    queryDB.connectedSources = cmd;
    queryDB.interval = 0;
    
  }


  PlasmaCore.DataSource {
    id: queryDB
    engine: "executable"
    interval: 250
    connectedSources: []

    onNewData: {
      var fortuneData = data.stdout;
      var fortuneLines = fortuneData.split("\|");
      var fortuneHeight = fortuneLines[0];
      var fortuneWidth = fortuneLines[1];
      var fortuneMsg =fortuneLines[2, fortuneHeight];

      console.log()  << fortuneMsg;

      fortune = "This is a test.";

      msgWidth= fortuneWidth * Kirigami.Units.smallSpacing;
      msgHeight = fortuneHeight * Kirigami.Units.smallSpacing;

      queryDB.connectedSources = [];

      //fortuneLabel.text = fortune;

      console.log("W: " + msgWidth + " H: " + msgHeight);


  }

}

    

   
    MouseArea {
      id: mousearea
      anchors.fill: parent

      onClicked: {
        getFortune();
        plasmoid.expanded = !plasmoid.expanded;
        //msgRectangle.visible = true;
      }
      
  }


     

}
     // end