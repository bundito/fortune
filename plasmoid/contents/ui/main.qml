import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.4 as Kirigami

Item {

	id: root

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);
	property var groupQuery: "'group_id IN \(1,3,5,7,9\)' ";
	property var oneGroup: "'group_id=19' "
	property var cmd:"bash " + exec+ "code/fortuneQuery.sh " + oneGroup + exec + "code/"
	property var fortune;
	property var msgHeight;
	property var msgWidth;



	Plasmoid.compactRepresentation : CompactRepresentation {}
	Plasmoid.fullRepresentation : FullRepresentation {}
	Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

	PlasmaCore.DataSource {
	  id: queryDB
	  engine: "executable"
	  connectedSources: []

	  onNewData: {
	    fortune = data.stdout;
	    //fortuneLabel.text = fortune;
	    console.log(data.stderr);

	    console.log("XXX CMD XXX "+cmd);

	    var longest = 0;
	    var len = 0;
	    var lines = fortune.split("\n");
	    for (var i=0; i<lines.length; i++) {
	    	var line = lines[i];
	    	console.log(line);
    		len = line.length;
	    	if (len > longest) {
	    		longest = len;
	    	}
	    }

	    msgWidth = ((Kirigami.Units.gridUnit + 5) * (longest/2));

	    var nCount = (fortune.split("\n").length - 1)

	    msgHeight = (Kirigami.Units.gridUnit  * 1.5) * (nCount + 2);

	}
 }

 Component.onCompleted: {
   queryDB.connectedSources = cmd;

   
  // console.log(cmd);
 } 
  
  
 


}


//}
