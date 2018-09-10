import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami

Item {



	

	id: baseItem
	Layout.preferredWidth: Kirigami.Units.smallSpacing * 175;
	Layout.preferredHeight: Kirigami.Units.smallSpacing * 35;
	



	
	RowLayout {

		id: fortuneRow

		anchors.centerIn: parent
		

		



		

	Rectangle {
		

		Label {
			id: fortuneLabel
			anchors.centerIn: parent
	
			
			font.family: "Courier"
			text: fortune


		}

	}	


	}

	


}
	





	
			


	




	
