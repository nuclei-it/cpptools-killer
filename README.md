# cpptools KILLER

Ever tried to open a Linux kernel source directory on a shared workstation using Visual Studio Code? If you or one of your colleages have, then you must know how it feels to have a thousand of `cpptools` process eating up all your CPU and memory.

With this script, all your troubles are gone! The script not only kills all the `cpptools` processes, but prevent all future `cpptools` processes from spawning as well.

## Requirements

- [Visual Studio Code](https://code.visualstudio.com/) and [the C/C++ extension](https://github.com/microsoft/vscode-cpptools) (if you do not have them, why do you need this script?)
- SystemTap

## Usage

Use the `run.sh` to run once. The effectiveness continues until the device is powered off or rebooted.

### Start on Boot

```
cp ./cpptools-killer.stp /etc/systemtap/script.d/
```

See [`man 8 systemtap-service`](https://man7.org/linux/man-pages/man8/systemtap-service.8.html) for details.

## Caveats

All processes with a name containing "cpptools" will be called.
