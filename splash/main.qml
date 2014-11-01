/****************************************************************************
 * This file is part of Plasma Phone Splash.
 *
 * Copyright (C) 2014 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:GPL2+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.0

Rectangle {
    id: root
    color: "black"

    Image {
        id: mlogo
        anchors.fill: parent
        sourceSize.width: width
        sourceSize.height: height
        source: "mlogo.png"
        scale: 0.2
        fillMode: Image.PreserveAspectFit

        SequentialAnimation {
            running: mlogo.visible

            NumberAnimation {
                target: mlogo
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 500
            }

            NumberAnimation {
                target: mlogo
                property: "scale"
                from: 0.2
                to: 1.0
                easing.type: Easing.OutBounce
                duration: 2000
            }

            NumberAnimation {
                target: mlogo
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 500
            }

            ScriptAction {
                script: {
                    klogo.visible = true;
                    mlogo.visible = false;
                    mlogo.scale = 0.2;
                }
            }
        }
    }

    Image {
        id: klogo
        anchors.fill: parent
        sourceSize.width: width
        sourceSize.height: height
        source: "klogo.png"
        fillMode: Image.PreserveAspectFit
        scale: 0.2
        visible: false

        SequentialAnimation {
            running: klogo.visible

            ParallelAnimation {
                NumberAnimation {
                    target: klogo
                    property: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 500
                }

                NumberAnimation {
                    target: klogo
                    property: "scale"
                    from: 0.2
                    to: 1.0
                    duration: 2000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: klogo
                    property: "rotation"
                    from: 0
                    to: 360
                    duration: 2000
                }

                NumberAnimation {
                    target: klogo
                    property: "scale"
                    from: 1.0
                    to: 0.2
                    duration: 2000
                }
            }

            ScriptAction {
                script: {
                    klogo.visible = false;
                    klogo.scale = 0.2;
                    mlogo.visible = true;
                }
            }
        }
    }
}
