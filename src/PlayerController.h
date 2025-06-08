#pragma once

#include <QObject>
#include <qqmlintegration.h>

class PlayerController : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON

  Q_PROPERTY(
      int currentSongIndex READ currentSongIndex NOTIFY currentSongIndexChanged)
  Q_PROPERTY(int songCount READ songCount NOTIFY songCountChanged)
  Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)

public:
  explicit PlayerController(QObject *parent = nullptr);

  int currentSongIndex() const;
  int songCount() const;
  bool playing() const;

public slots:
  void switchToNextSong();
  void switchToPreviousSong();
  void playPause();

signals:
  void currentSongIndexChanged();
  void songCountChanged();
  void playingChanged();

private:
  int m_currentSongIndex = 0;
  int m_songCount = 3;
  bool m_playing = false;
};
