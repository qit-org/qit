/**
 * The MIT License (MIT)
 *
 * Copyright © 2018 Ruben Van Boxem
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 **/

import QtQuick 2.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0

import "qrc:/qml"
import "qrc:/qml/styling"

Item
{
  id: overlayMenu

  property real contentOffset: 40

  width: contentOffset

  property real menuWidth: contentOffset

  Behavior on menuWidth
  {
    SmoothedAnimation
    {
      velocity: 2000
    }
  }

  function toggleState()
  {
    menuWidth = menuWidth === contentOffset ? 400
                                            : contentOffset
  }

  Rectangle
  {
    id: menu

    height: parent.height
    width: menuWidth

    clip: true

    LinearGradient
    {
      anchors.fill: parent

      cached: true
      start: Qt.point(0, 0)
      end: Qt.point(200, 0)
      gradient: Gradient
      {
        GradientStop { position: 0.0; color: MenuStyle.backgroundColor }
        GradientStop { position: 1.0; color: "transparent" }
      }
    }

    Column
    {
      anchors.right: parent.right
      anchors.left: parent.left
      anchors.top: parent.top

      MenuButton
      {
        icon.source: "qrc:/icons/menu.svg"
        onClicked: overlayMenu.toggleState()
      }

      MenuButton
      {
        icon.source: "qrc:/icons/folder-open.svg"
        text: qsTr("Open Repository")
      }
    }

    Column
    {
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      anchors.left: parent.left

      MenuButton
      {
        icon.source: "qrc:/icons/settings.svg"
        text: qsTr("Settings")
      }
    }
  }
}

