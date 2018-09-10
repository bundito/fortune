import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.4 as Kirigami

Item {

	

	id: baseItem
	Layout.maximumHeight: fortune.length * 10
	Layout.maximumWidth: fortune.length * 10

	
	RowLayout {

		id: fortuneRow

		

		

		Label {
			id: fortuneLabel
			font.family: "Courier"
			text: fortune


		}



	}

	function getHeight() {
		var lines = fortune.split("");
		return lines.length;
	}


}
	





	
			


	




	
