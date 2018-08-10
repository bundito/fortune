import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1 as Layout
import org.kde.kirigami 2.4 as Kirigami

Item {

	id: baseItem

	

	width: root.msgWidth
	height: root.msgHeight

	//height: 10
	//width: 10	

	

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

 



	
