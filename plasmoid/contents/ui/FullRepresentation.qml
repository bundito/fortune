import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import org.kde.kirigami 2.4 as Kirigami

Item {

	id: baseItem

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);

	property var cmd:"bash -c '" + exec+ "code/fortuneQuery.sh group_id=4 '" + exec + "code/"

	property var fortune;

	//height: 10
	//width: 10	
	

	

	PlasmaCore.DataSource {
	  id: queryDB
	  engine: "executable"
	  connectedSources: []

	  onNewData: {
	    fortune = data.stdout;
	    fortuneLabel.text = fortune;
	    console.log(data.stderr);

	    var lines = (fortune.split("\n").length - 1);
	    baseItem.height = (Kirigami.Units.gridUnit * 3) * lines;
	    fortuneLabel.width =  Kirigami.Units.gridUnit * 40;
	    //disconnectSourcfe();
	  }

	}

	Label {
		id: fortuneLabel
		font.family: "Courier"
		
		
		
	}	

	Component.onCompleted: {
	  queryDB.connectedSources = cmd;
	  
	 // console.log(cmd);
	}


 




	
}