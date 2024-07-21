#include "src/PlayerController.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  PlayerController *playerController = new PlayerController(&app);
  qmlRegisterSingletonInstance<PlayerController>(
      "src", 0, 1, "PlayerController", playerController);

  const QUrl url(QStringLiteral("qrc:/qt/qml/test_project/Main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
      []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
  engine.load(url);

  return QGuiApplication::exec();
}
