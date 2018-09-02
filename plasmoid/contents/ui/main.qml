import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.4 as Kirigami

Item {

	id: root

	property var url:Qt.resolvedUrl(".");
	property var exec:url.substring(7,url.length);
	property var groupQuery: "'group_id IN \(19\)' ";
	property var oneGroup: "'group_id=20' "
	property var cmd:"bash " + exec+ "code/fortuneQuery.sh " + groupQuery + exec + "code/"
	property var fortune;
	property var msgHeight;
	property var msgWidth;


	


	Plasmoid.compactRepresentation : CompactRepresentation {}
	Plasmoid.fullRepresentation : FullRepresentation {}
	Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

	


  
  
 


}


//}
