This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
### What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Uniontech Technology Co., Ltd.

-------------------------------------------------------------------------------
### What product or service is this for:
-------------------------------------------------------------------------------
UOS.

-------------------------------------------------------------------------------
### What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
UOS is yet another linux distribution based on Debian GNU/Linux. It has been actively maintained since 2019.
It is an amazing distribution, and for compatible reason, we here submit our siging request for shim.

-------------------------------------------------------------------------------
### Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Zilong Zhou
- Position: Developer
- Email address: zhouzilong@uniontech.com
- PGP key: The file keys/ZilongZhou.pub in this git repo

-------------------------------------------------------------------------------
### Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Li Chenggang
- Position: Developer
- Email address: lichenggang@uniontech.com
- PGP key: The file keys/LiChenggang.pub in this git repo

-------------------------------------------------------------------------------
### Were these binaries created from the 15.6 shim release tar?
Please create your shim binaries starting with the 15.6 shim release tar file: https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.6 and contains the appropriate gnu-efi source.

-------------------------------------------------------------------------------
We use git repository https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2 with gnu-efi submodule updated to the appropriate version

-------------------------------------------------------------------------------
### URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
We use upstream https://github.com/rhboot/shim/tree/15.6

-------------------------------------------------------------------------------
### What patches are being applied and why:
-------------------------------------------------------------------------------
No patches are applied.

-------------------------------------------------------------------------------
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
-------------------------------------------------------------------------------
We are using the downstream GRUB2 from Debian.

-------------------------------------------------------------------------------
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, or the June 7th 2022 grub2 CVE list:
* CVE-2020-14372
* CVE-2020-25632
* CVE-2020-25647
* CVE-2020-27749
* CVE-2020-27779
* CVE-2021-20225
* CVE-2021-20233
* CVE-2020-10713
* CVE-2020-14308
* CVE-2020-14309
* CVE-2020-14310
* CVE-2020-14311
* CVE-2020-15705
* CVE-2021-3418 (if you are shipping the shim_lock module)

Because we are using grub2 2.04-17 version of Debian the following CVEs are
patched: CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705, CVE-2021-3418


* CVE-2021-3695
* CVE-2021-3696
* CVE-2021-3697
* CVE-2022-28733
* CVE-2022-28734

We backported these fixes from debian grub 2.06 to 2.04, including CVE-2021-3695,
CVE-2021-3696, CVE-2021-3697, CVE-2022-28733, CVE-2022-28734. Older versions of GRUB2 
are still around in UOS repos, but will be revoked via SBAT updates.


* CVE-2022-28735
* CVE-2022-28736

Patches for those CVEs are included in the Debian grub2 code based on 2.06. The
SBAT version was increased to allow revocation via SBAT updates.

* CVE-2022-28737

This is fixed by updating the Shim to 15.6.


### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
-------------------------------------------------------------------------------
> Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?

NO. The first shim submission was 15.4 and GRUB2 with SBAT support.

> Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?

All the newer CVEs for grub2 will be revoked via SBAT updates.

-------------------------------------------------------------------------------
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
-------------------------------------------------------------------------------
We are using kernel version 4.19 and 5.10.  
In version 4.19, the first two are fixed by patching, the third is not applied because kgdb is not even enabled in our 4.19 kernel.  
In version 5.10, all patches are applied.

-------------------------------------------------------------------------------
### Do you build your signed kernel with additional local patches? What do they do?
-------------------------------------------------------------------------------
We have added a kernel signing operation to the scripts in scripts/package/builddeb.
It sends the kernel to be signed to the intranet signing server via an https request,
and then compresses the signed kernel into a deb package.

-------------------------------------------------------------------------------
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
-------------------------------------------------------------------------------
NO. We do not use vendor_db functionality.

-------------------------------------------------------------------------------
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
-------------------------------------------------------------------------------
NO. We use the new certificate.

-------------------------------------------------------------------------------
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
-------------------------------------------------------------------------------
You can reproduce the binary by using the script file, which will use the dockerfile：
```
./build.sh
```
Versions used can be found in the build logs.

-------------------------------------------------------------------------------
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.

-------------------------------------------------------------------------------
See:
- `build-x86_64.log`
- `build-aarch64.log`

-------------------------------------------------------------------------------
### What changes were made since your SHIM was last signed?
-------------------------------------------------------------------------------
Uses the latest version of shim from upstream (15.6).

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
1e52957b078be3ba731690cbf93d936516a2fe8a2b90d12cea9f69339d3a0c15 shimx64.efi
76bc367e6adc2e83e2646558e414597f07095b1a324c927578b0d17a7458f60a shimaa64.efi

-------------------------------------------------------------------------------
### How do you manage and protect the keys used in your SHIM?
-------------------------------------------------------------------------------
Key is present in the purchased certified HSM with strict access control to that machine,
meets FIPS 140-2 Level 2 safety standards.

-------------------------------------------------------------------------------
### Do you use EV certificates as embedded certificates in the SHIM?
-------------------------------------------------------------------------------
No.

-------------------------------------------------------------------------------
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
-------------------------------------------------------------------------------
shim:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,2,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.uos,1,Uos,shim,15.6-1,mail:secureboot@uniontech.com
```

grub:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,1,Free Software Foundation,grub,2.04,https://www.gnu.org/software/grub/
grub.uos,2,Uos,grub2,2.04.25-18,mail:secureboot@uniontech.com
```
-------------------------------------------------------------------------------
### Which modules are built into your signed grub image?
-------------------------------------------------------------------------------
```
ntfs hfs appleldr  boot cat efi_gop efi_uga elf fat hfsplus iso9660 linux keylayouts memdisk minicmd part_apple ext2 extcmd xfs xnu part_bsd part_gpt search search_fs_file chain btrfs loadbios loadenv lvm minix minix2 reiserfs memrw mmap msdospart scsi loopback normal configfile gzio all_video efi_gop efi_uga gfxterm gettext echo boot chain eval ls test sleep png gfxmenu linuxefi jpeg gfxterm_background deepin_gfxmode efifwsetup password_pbkdf2
```

-------------------------------------------------------------------------------
### What is the origin and full version number of your bootloader (GRUB or other)?
-------------------------------------------------------------------------------
Our GRUB2 is based on the 2.04-17 version from Debian.

-------------------------------------------------------------------------------
### If your SHIM launches any other components, please provide further details on what is launched.
-------------------------------------------------------------------------------
Just GRUB2.

-------------------------------------------------------------------------------
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
-------------------------------------------------------------------------------
Just launch the linux kernel.

-------------------------------------------------------------------------------
### How do the launched components prevent execution of unauthenticated code?
-------------------------------------------------------------------------------
Our GRUB2 packages include secure boot patches, so they will only load properly signed binaries.

-------------------------------------------------------------------------------
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
-------------------------------------------------------------------------------
NO.

-------------------------------------------------------------------------------
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
-------------------------------------------------------------------------------
We are using 4.19.90 and 5.10.136. Lockdown patches applied in 5.10.136 kernel.

-------------------------------------------------------------------------------
### Add any additional information you think we may need to validate this shim.
-------------------------------------------------------------------------------
The primary contact is replaced from Yan Bowen to Zilong Zhou. Include contact email address and pgp key.  
Last accepted submission is: https://github.com/rhboot/shim-review/issues/173
