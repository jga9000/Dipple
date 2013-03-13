#include <QGuiApplication>
#include <QQmlEngine>
#include <QQuickView>
#include <QQmlContext>
#include "game.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;

    GameData *game = new GameData();
    view.engine()->rootContext()->setContextObject(game);
    view.engine()->rootContext()->setContextProperty("gameData", game);

    view.connect(view.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    view.setSource(QUrl::fromLocalFile(QString("rsc/main.qml")));
    if (QGuiApplication::platformName() == QLatin1String("qnx") ||
          QGuiApplication::platformName() == QLatin1String("eglfs")) {
        view.setResizeMode(QQuickView::SizeRootObjectToView);
        view.showFullScreen();
    } else {
        view.show();
    }
    return app.exec();
}
