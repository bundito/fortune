#include <QCoreApplication>
#include <QDirIterator>>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlQuery>
#include <QSqlError>
#include <QString>
#include <QFile>

#include <QDebug>

int main(int argc,char **argv)
{

    QString saveName;

    qDebug() << "Started";

    QSqlDatabase db;
    QString dbName = QString("/home/bundito/projects/fortune/fortune.db");

    db = QSqlDatabase::addDatabase(QString("QSQLITE"));
    db.setHostName(QString("localhost"));
    db.setDatabaseName(dbName);

    bool ok = db.open();

    if (!ok) {
        QString error = db.lastError().text();
            qDebug() << "Open DB failed - " << error;
            exit(1);
       }

    // OPEN fortune file

        int group_id = 0;

        QDirIterator iter("/home/bundito/projects/fortune/fortune_files/", QDir::NoDotAndDotDot | QDir::Files);



        qDebug() << "Inside iterator";


        while (iter.hasNext()) {
            QString file = iter.next();
            QFile fortune_file(file);

        saveName = file;


        group_id++;


        qDebug() << fortune_file;

            if (!fortune_file.open(QIODevice::ReadOnly | QIODevice::Text)) {
                qDebug() << "Open fortune file failed.";
                qDebug() << fortune_file.errorString();
                exit(1);
            }


            QString fortune;
            QString message;

            while (!fortune_file.atEnd()) {
                QString line = fortune_file.readLine();

                if (line == QString("%\n")) {
                    QSqlQuery sql(db);

                    sql.prepare(QString("INSERT INTO fortunes \
                                        ( message, group_id ) \
                                          VALUES (:message, :group_id) \
                                          "));

                    sql.bindValue(QString(":message"), message);
                    sql.bindValue((":group_id"), group_id);

                    bool insert = sql.exec();

                    if (!insert) {

                    QString err = sql.lastError().text();
                        qDebug() << "Insert failed: " << err;
                        exit(1);
                    }


                    db.commit();
                    message = "";


                } else { // END FOUND %

                    message.append(line);

            }


            }


            QSqlQuery sql(db);
            sql.prepare(QString("INSERT INTO groups \
                                ( group_id, group_name) \
                                  VALUES (:group_id, :group_name) \
                                "));

            sql.bindValue(QString(":group_id"), group_id);
            sql.bindValue(QString(":group_name"), saveName) ;

            bool insert = sql.exec();

            if (!insert) {

            QString err = sql.lastError().text();
                qDebug() << "Group insert failed: " << err;
                exit(1);

            }

            db.commit();

    }







}
