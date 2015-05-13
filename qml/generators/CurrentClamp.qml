import QtQuick 2.0
import QtQuick.Controls 1.0

import Neuronify 1.0

import ".."
import "../controls"

/*!
    \qmltype CurrentClamp
    \inqmlmodule Neuronify
    \ingroup neuronify-generators
    \brief A direct current generator which can suply input to neurons

    The DC generator can be connected to neurons, and will then suply the neurons with current.
    The generator has a control panel where you can adjust the current output.
\endlist
*/

Node {
    property alias currentOutput: engine.currentOutput

    fileName: "generators/CurrentClamp.qml"

    width: 62
    height: 62
    color: "#dd5900"

    engine: NodeEngine {
        id: engine
        currentOutput: 75.0
    }

    controls: Component {
        Item {
            anchors.fill: parent

            Column {
                anchors.fill: parent
                Text {
                    text: "Current output: " + currentOutput.toFixed(0) + " mA"
                }

                BoundSlider {
                    target: engine
                    property: "currentOutput"
                    minimumValue: 0.0
                    maximumValue: 200.0
                }
            }
        }
    }

    Component.onCompleted: {
        dumpableProperties = dumpableProperties.concat("currentOutput")
    }

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/generators/current_clamp.png"
    }

    Connector {

    }
}
