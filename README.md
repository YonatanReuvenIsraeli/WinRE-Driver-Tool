# WinRE Driver Tool v1.1.3
View/add/remove 3rd party WinRE drivers.

## Use cases
- Installing a Wi-Fi driver for quick machine recovery.
- Installing the Intel Serial IO driver for touchpad support on HP laptops in Windows Recovery Environment after reinstalling Windows.

## Notes
- This is not the same thing as https://github.com/YonatanReuvenIsraeli/Windows-PE-RE-Driver-Loader as that supports WinPE and WinRE and the loaded drivers only last until reboot while this only supports WinRE and changes persist after reboot.
- Windows Recovery Environment must be enabled for this batch file to work.
- This batch file may clear your auto-mount points.
