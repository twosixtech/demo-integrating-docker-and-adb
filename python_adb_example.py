#!/usr/bin/env python3
"""
Purpose:
    TBD
"""

import os
import shutil
from functools import cached_property

from ppadb.client import Client as AdbClient
from sh import sed
from typing import Any, Dict, TypedDict


###
# Classes
###

class AndroidDeviceInfo(TypedDict):
    """Relevant Device Info for adb connected device"""

    serial: str
    model: str
    architecture: str
    sdk_version: int
    release_version: int


class AndroidDevice:
    """
    Purpose:
        The AndroidDevice Class is a representation of a connected Android
        Device
    """

    def __init__(self, adb_client: object, serial: str) -> None:
        """
        Purpose:
            Initialize the AndroidDevice object.
        Args:
            serial: Serial Number of the Device
        Returns:
            N/A
        """

        self.adb_client = adb_client
        self.adb_device = self.adb_client.device(serial)

        self.serial = serial
        self.device_properties = self.adb_device.get_properties()
        self.device_info = AndroidDeviceInfo(
            serial=self.device_properties["ro.serialno"],
            model=self.device_properties["ro.product.system.model"],
            architecture=self.device_properties["ro.product.cpu.abi"],
            sdk_version=int(self.device_properties["ro.build.version.sdk"]),
            release_version=int(self.device_properties["ro.build.version.release"]),
        )

    def __str__(self) -> str:
        """
        Purpose:
            Representation of the AndroidDevice object.
        Args:
            N/A
        Returns:
            AndroidDevice: String printable representation of AndroidDevice
        """

        return (
            f"<AndroidDevice {self.device_info['model']} - {self.serial}>"
        )

    def __repr__(self) -> str:
        """
        Purpose:
            Representation of the AndroidDevice object.
        Args:
            N/A
        Returns:
            AndroidDevice: String true representation of AndroidDevice
        """

        return f"<AndroidDevice: {self.device_info}>"


###
# Script Main Execution
###


def main():
    """"""

    adb_client = AdbClient(host="host.docker.internal", port=5037)

    android_devices = {}
    adb_devices = adb_client.devices()

    if adb_devices:
        for adb_device in adb_devices:
            android_device = AndroidDevice(adb_client, adb_device.serial)
            android_devices[android_device.serial] = android_device

            print("Device:")
            print(f"    device = {android_device}")
            print(f"    serial = {android_device.device_info['serial']}")
            print(f"    model = {android_device.device_info['model']}")
            print(f"    architecture = {android_device.device_info['architecture']}")
            print(f"    sdk_version = {android_device.device_info['sdk_version']}")
            print(f"    release_version = {android_device.device_info['release_version']}")
    else:
        print("No Android Devices Connected")


if __name__ == "__main__":
    main()
