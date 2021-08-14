# STM32 & QEMU based Virtual Platform
This project just integrates QEMU work by Askar and FreeRTOS work by Joseph

## Usage

* Open windows command-line (cmd).
* Change directory to any of your workspace folder.
* git clone https://github.com/aananthcn/stm32_qemu_platform.git
* Run `init-project` as command

The above steps should clone the modified Qemu by Askar and the modified FreeRTOS by Joseph into a single directory. The folder structure may look like this:

`stm21_qemu_platform`<br>
`   ├── FreeRTOS`<br>
`   ├── README.md`<br>
`   ├── init-project.bat`<br>
`   └── qemu`<br>

And you can move into Qemu and FreeRTOS folders and run `git branch` command and you should get `st_cm4_get` as response.
