import Felgo 3.0
import QtQuick 2.12
import QtMultimedia 5.8
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.0 as QC2


App {
    NavigationStack {
        Page {
            id: page
            title: "PageControl"

            QC2.SwipeView {
                id: view
                currentIndex: 0
                anchors.fill: parent

                Rectangle {
                    id: settingPage
                    width: page.width
                    height: page.height
                    color: "transparent"

                    AppText {
                        anchors.centerIn: parent
                        text: "settingPage"
                    }


                    Grid {
                      id: grid
                      anchors.horizontalCenter: parent.horizontalCenter
                      columns: 2
                      spacing: dp(20)

                      horizontalItemAlignment: Grid.AlignHCenter
                      verticalItemAlignment: Grid.AlignVCenter


                      AppText {
                        text: "Background Video"
                      }

                      AppTextField {
                          id: backVid
                        inputMode: inputModeDefault
                        width: dp(200)
                      }

                      AppText {
                        text: "Over Video"
                      }

                      AppTextField {
                          id: overVid
                        inputMode: inputModeDefault
                        width: dp(200)
                      }
                    }




                }

                Rectangle {
                    id: renderPage
                    width: page.width
                    height: page.height
                    color: "transparent"

                    AppText {
                        anchors.centerIn: parent
                        text: "renderPage"
                    }
/*
                    Video {
                        id: video
                        //width : 800
                        //height : 600
                        fillMode: VideoOutput.PreserveAspectFit
                        source: backVid.text
                        loops: MediaPlayer.Infinite
                        autoPlay: false
                        MouseArea {
                            anchors.fill: parent
                            onDoubleClicked: {
                                video.play()
                            }
                        }

                        focus: true
                        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
                        Keys.onLeftPressed: video.seek(video.position - 5000)
                        Keys.onRightPressed: video.seek(video.position + 5000)
                    }
                    */
                    /*
                    VideoOutput {
                        id: overOutput
                        source: player2
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 4

                      width: dp(100)
                      height: dp(100)


                      DragHandler {
                        // Allow movement on both axis
                        xAxis.enabled: true
                        yAxis.enabled: true

                        // You can't move it outside of the top half
                        xAxis.minimum: 0
                        xAxis.maximum: page.width - parent.width
                        yAxis.minimum: 0
                        yAxis.maximum: page.height - parent.height
                      }

                      MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              //player.play()
                              player2.playbackState == MediaPlayer.PlayingState ? player2.pause() : player2.play()
                          }
                      }

                    }

*/
                    VideoOutput {
                        id: videoOutput
                        source: player
                        width: page.width
                        height: page.height
                        orientation: landscape
                        fillMode: VideoOutput.PreserveAspectFit
                        //fillMode: VideoOutput.PreserveAspectCrop
                        //fillMode: "Stretch"

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                //player.play()
                                player.playbackState == MediaPlayer.PlayingState ? player.pause() : player.play()
                            }
                        }



                        VideoOutput {
                            id: overOutput
                            source: player2
                            x: (parent.width - width) / 2
                            y: (parent.height - height) / 2

                          width: dp(100)
                          height: dp(100)



                          DragHandler {
                            // Allow movement on both axis
                            xAxis.enabled: true
                            yAxis.enabled: true

                            // You can't move it outside of the top half
                            xAxis.minimum: 0
                            xAxis.maximum: page.width - parent.width
                            yAxis.minimum: 0
                            yAxis.maximum: page.height - parent.height
                          }

                          MouseArea {
                              anchors.fill: parent
                              onClicked: {
                                  //player.play()
                                  player2.playbackState == MediaPlayer.PlayingState ? player2.pause() : player2.play()
                              }
                          }

                        }



                    }
                    MediaPlayer {
                        id: player
                        source: backVid.text
                        loops: MediaPlayer.Infinite
                        autoPlay: false
                    }
                    MediaPlayer {
                        id: player2
                        source: overVid.text
                        loops: MediaPlayer.Infinite
                        autoPlay: false
                    }






                    Row{
                        anchors{
                            horizontalCenter: parent.horizontalCenter
                            bottom: parent.bottom
                            bottomMargin: dp(20)
                        }
                        //spacing

                        AppButton {
                            height: dp(50)
                            width: dp(50)
                            text: "Play"
                            flat: true
                            radius: dp(15)
                             onClicked: {
                                //player.stop()
                                //page.navigationBarHidden = false
                                player.play()
                                 videoOutput.v
                            }
                        }

                        AppButton {
                            height: dp(50)
                            width: dp(50)
                            text: "Pause"
                            flat: true
                            radius: dp(15)
                            onClicked: {
                                //player.stop()
                                //page.navigationBarHidden = false
                                player.pause()
                            }
                        }

                        AppButton {
                            height: dp(50)
                            width: dp(50)
                            text: "Stop"
                            flat: true
                            radius: dp(15)
                            onClicked: {
                                //player.stop()
                                //page.navigationBarHidden = false
                                player.stop()
                                player2.stop()
                            }
                        }

                        AppButton {
                            height: dp(50)
                            width: dp(50)
                            text: "Over"
                            flat: true
                            radius: dp(15)
                            onClicked: {
                                //player.stop()
                                //page.navigationBarHidden = false
                                //player2.play()
                                player2.playbackState == MediaPlayer.PlayingState ? player2.pause() : player2.play()
                            }
                        }
                    }






                }
            }

            PageControl {
                pages: 2
                anchors {
                bottom: parent.bottom
                bottomMargin: dp(10)
                }
                currentPage: view.currentIndex
            }



// end of Page
        }
// end of NavigationStack
    }
// end of App
}
