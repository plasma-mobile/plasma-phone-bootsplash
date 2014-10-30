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
        sourceSize.width: width
        sourceSize.height: height
        x: parent.width / 4
        y: 0
        width: parent.width / 2
        height: parent.height / 2
        source: "mlogo.png"
        fillMode: Image.PreserveAspectFit

        SequentialAnimation {
            running: mlogo.visible

            NumberAnimation {
                target: mlogo
                property: "y"
                to: root.height / 2
                easing.type: Easing.OutBounce
                duration: 1500
            }

            ParallelAnimation {
                NumberAnimation {
                    target: mlogo
                    property: "x"
                    to: root.width
                    duration: 2000
                }

                NumberAnimation {
                    target: mlogo
                    property: "rotation"
                    from: 0
                    to: 360
                    duration: 3000
                }
            }

            ScriptAction {
                script: {
                    klogo.visible = true;
                    mlogo.visible = false;
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
        opacity: 0.0
        visible: false

        SequentialAnimation {
            running: klogo.visible
            loops: Animation.Infinite

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
        }
    }
}
