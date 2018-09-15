import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.4 as Kirigami

Item {

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);
	//property var plasmoid.configuration["activeGroups"]: groupQuery;
	property string groupList: plasmoid.configuration.groupList;


	
	//property var groupQuery: "'group_id IN \(1,3,5,7,9,11,13,15,17\)' ";
	//property var oneGroup: "'group_id=20' "
	//property var cmd:"bash " + exec+ "code/fortuneQuery.sh " + groupQuery + " " + exec + "code/";
	property var fortune: "";
	property var cookieIcon: Qt.resolvedUrl("../images/fortune-cookie.png");
	//property var groupQuery
	property var cmd;


	id: root

	


	


	Plasmoid.compactRepresentation : CompactRepresentation {}
	Plasmoid.fullRepresentation : FullRepresentation {}
	Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

			
			
	


  
  
 


}


//}
