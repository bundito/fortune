import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import org.kde.kirigami 2.4 as Kirigami

Item {

	id: baseItem

	height: msgHeight
	width: msgWidth

	PlasmaCore.DataSource {
	  id: queryDB
	  engine: "executable"
	  interval: 250
	  connectedSources: []

	  onNewData: {
	    fortune = "\n" + data.stdout;
	    //fortuneLabel.text = fortune;
	    console.log(data.stderr);

	    console.log("XXX CMD XXX "+cmd);

	    var longest = 0;
	    var len = 0;
	    var lines = fortune.split("\n");
	    for (var i=0; i<lines.length-1; i++) {
	      var line = lines[i];
	      console.log("Line " + i + " " + line);
	      len = line.length;
	      if (len > longest) {
	        longest = len;
	      }
	    }

	    root.msgWidth = ((Kirigami.Units.gridUnit + 7) * (longest/2));

	    var nCount = (fortune.split("\n").length - 0)

	    root.msgHeight = (Kirigami.Units.gridUnit  * 1.0) * (nCount + 2);

	    queryDB.connectedSources = [];

	    

	}
	}

	

	

	 
	

	Rectangle { 
		border.width: 2
		border.color: "white"
		color: "black"
		anchors.fill: parent


		Label {
			id: fortuneLabel
			anchors.centerIn: parent
			font.family: "Courier"
			text: root.fortune

	}


		}

	
		
		
	}	




	




	
