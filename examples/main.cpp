#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/esterVtech.com/imports");

    qDebug()<<engine.importPathList();
    qmlRegisterSingletonType(QUrl(u"qrc:/esterVtech.com/imports/MyDesigns/qml/CustomStyle.qml"_qs), "CustomStyle", 1, 0, "CustomStyle"      );
    const QUrl url(u"qrc:/esterVtech.com/imports/example_app/window.qml"_qs);
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
			&app, [url](QObject *obj, const QUrl &objUrl) {
			if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
			}, Qt::QueuedConnection);

	engine.load(url);

	return app.exec();
}
