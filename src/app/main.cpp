#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app,
                     &QGuiApplication::quit);

    engine.loadFromModule("com.rpgroove", "Main");

    return app.exec();
}
