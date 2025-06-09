#include "PlayerController.hpp"
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    PlayerController *playerController = new PlayerController(&app);
    qmlRegisterSingletonInstance<PlayerController>(
        "src", 0, 1, "PlayerController", playerController);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app,
                     &QGuiApplication::quit);

    engine.loadFromModule("Main", "Main");

    return app.exec();
}
