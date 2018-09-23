	Rectangle {
		id: goldenExample
		

	Label {
		id: exampleLabel
		anchors.centerIn: goldenExample
		color: plasmoid.configuration.textColor
		font.pointSize: 10.0
		font.family: "Courier"
		text: "This is an example message.\n\nThe font cannot be changed,\nin memory of old terminals."
		//text:"test"
	}
}