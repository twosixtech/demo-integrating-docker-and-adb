# Integrating Docker and ADB

Demonstration of using ADB in Docker

## Prerequisites

You must have the following installed:

- Docker (version 20.X or higher)
- Android debug bridge (adb) (any version compatible with adb protocol v1.0.41)

Ideally, connect an Android device and enable USB debugging. However, all
examples in this project will work without any Android devices present.

## To Build

Execute the `build_docker_image.sh` script to build the Docker image.

```shell
# ./build_docker_image.sh
```

## To Run

Execute the `run_docker_container.sh` to start the docker-compose project. With the
container running, use `docker exec` to run the Python script or run the Robot
tests.

```shell
# ./build_docker_image.sh
# ./run_docker_container.sh
Creating network "adb-docker-demo_default" with the default driver
Creating adb-docker-demo ... done
# docker exec adb-docker-demo ./python_adb_example.py
Device:
    device = <AndroidDevice Pixel 2 XL - XXX>
    serial = XXX
    model = Pixel 2 XL
    architecture = arm64-v8a
    sdk_version = 29
    release_version = 10
# docker exec adb-docker-demo robot robot_adb_example.robot
==============================================================================
Robot Adb Example                                                             
==============================================================================
Verify devices accessible through adb                                 | PASS |
------------------------------------------------------------------------------
Robot Adb Example                                                     | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Output:  /code/output.xml
Log:     /code/log.html
Report:  /code/report.html
```

