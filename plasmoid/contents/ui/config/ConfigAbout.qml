import QtQuick 2.7
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtQuick.Layouts 1.1 as Layout
import QtQuick.Controls 2.4 as QQC2


Item {


QQC2.ScrollView {
	height: parent.height
	width: parent.width

		QQC2.TextArea {
		id: aboutText
		
		textFormat: TextEdit.RichText
		wrapMode: TextEdit.Wrap
		
		
		text: "\"Fortune\" (or more correctly, \'fortune\') was a small program that would display a humorous "
		+ "or interesting message on a user\'s screen. It was introduced with the release of Unix 7, in 1979. "
		+ "In those days, users logged into to a text terminal where they did most of their work.  Even email was"
		+ "done all on the terminal. Windowing systems and graphic user interfaces were still in their infancy."
		+ " "
		+ "Fortune typically had a variety of sources available, with different themes. These themes were directed "
		+ "at the Unix userbase of the era: computer scientists and hardcore nerds. As a result, the contents of "
		+ "\"fortune\" were computer jokes and anecdotes, and quotes from fan-favorite sources like Star Trek, "
		+ "The Hitchhiker's Guide To The Galaxy, and The Simpsons. Also included were random jokes, quotations "
		+ "from famous people, and general random silliness."
		+ " "
		+ "The various sources available in this widget are all authentic fortune source files from that era. As "
		+ "such, the jokes and references may be out-of-date, no longer relevant, or refer to technical topics that "
		+ "have long since become obsolete. It seemed important to recreate \"fortune\" as accurately as possible, "
		+ "without modernizing it aside from how it's presented."

         
         }

        
   
   }


	}

