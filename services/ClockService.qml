import QtQuick
import Quickshell

pragma Singleton

Singleton {
    id: root

    property alias date: clock.date
    property alias hours: clock.hours
    property alias minutes: clock.minutes
    property alias seconds: clock.seconds

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}