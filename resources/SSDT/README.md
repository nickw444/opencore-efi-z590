# SSDT Patches

This directory contains machine specific SSDT patches. These were generated on machine in Windows via [SSDTTime](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html).

## SSDT-EC.dsl Quirks

The generated `SSDT-EC` doesn't contain the USBX patches to fix power. These are obtained with the precompiled SSDT from [here](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-USBX.aml)
