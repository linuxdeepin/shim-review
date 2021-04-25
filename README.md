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
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Wuhan Deepin Technology Co., Ltd.

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
Deepin V20.

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Deepin is yet another linux distribution based on Debian GNU/Linux. It has been actively maintained since 2011. Deepin has kept in the top 20 on distrowatch for last few years. It is an amazing distribution, and for compatible reason, we here submit our siging request for shim.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Yan Bowen
- Position: Elder Developer
- Email address: yanbowen@uniontech.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
AhUmqPmm0Iw8txIXbw==
=bv4a
-----END PGP PUBLIC KEY BLOCK-----

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Li Chenggang
- Position: Developer
- Email address: lichenggang@uniontech.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQGNBGCCeLQBDACb/jqaP4Dmm0PcgqiBnFTksUwydcSX/A7B3y5DwelhXYxnkC61
KvLAYgPtlFGYkMZlJ/nDsSdjKBInq/NJ2sTiNsdzyegBhIc27PEp6axndO3BgHnK
9sHCC/vH9XWxCNKBDS8stxsewPacjcMAQ3L4aeCcrr+0krpDc64sDU4zUdB2GlkG
2ep+j/iSXUOSEbvnLbL99azytNYEiYbft+sQqFR6HxM95RCUSlQa4muniiTQtpHF
W5keWb/bN+PonoLICzVnR1FnS57y+dsAl5mubxh9Q7ugzzGVJN8+/KUA4MOJ4Zp4
DYKcx5tK5UuVyklJCI927VoxHz84i8BiKO8d6lOyB8H1AFUNO2Gn6WtVmdLUu8Qq
I9mdcsIHLtSDJmFyzv/Y/illkEhE3gcaiQe4LUFjmQoKGxWOyxYX/z3OB9o4k8eh
v8IxRCn8we0R5JhAad24l1S/b3+hDz2oFUUY6Qduvyk533Af1yxx/8ASbucKjJlg
aLsv7fEk9ZjPrA8AEQEAAbQnbGljaGVuZ2dhbmcgPGxpY2hlbmdnYW5nQHVuaW9u
dGVjaC5jb20+iQHUBBMBCgA+FiEEPIrRozsv7i/w81FI++yGqgmIBKQFAmCCeLQC
GwMFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ++yGqgmIBKTQywv8
CRAKKcAE61SX8BK6cupLyjAwEh/AgilYvZrAlrwceRMFruEMGQcU1YkjusKAizwQ
jKF8mJQHV/KxlVGHqphsHsQ48uK0U3ZX1JczNI7nAuxnn0/lT8ZxswdHET9V3TTo
y1RwZWiQvSutc/NXIfmTmKHiCjsKITXe2Jruy0P6JBZrylIE4djSy7X4vaKdHn8s
Metr1S+SjNFE+V9fS2aK+kA87w017V30Uod8l9babKK79q9V1MG5MGivA9Q6To8A
rIDE/yJHu5D+qBYn3kD1rSgk0THi1lIDQ16PTqzpQXRbqNAqeamsTtD+0CeJ4ixF
ZJ2+HXogJN0+MmPAl9vmG7alE8Pb7Hj07RajJCxpteNAsOEXB3C5YxtyrljzAxvg
jVsUZqv/Nf0Hpy0aVupbsy01Z/h7FU1/m+2HGIu6eOey74nFSP5HBHMbLbXNkpde
xPrPje3h0plSDd9uHccvtA2TFpDJLlXao1v8VKy1lfC1+rrWALhfOvuvgEUAx85S
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
+xA=
=NPYy
-----END PGP PUBLIC KEY BLOCK-----

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------
We use git repository https://github.com/rhboot/shim/releases/tag/15.4 with gnu-efi submodule updated to the appropriate version

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
We use upstream https://github.com/rhboot/shim/tree/shim-15.4

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
No additional patches

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,

 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
Yes, all included.

Grub is branched from 2.01

-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
* Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------
We use upstream grub2 lockdown + shim_lock verifier.

We also pull patches from Debian for the linux loader, but the verification code of those patches will only get used if secureboot is active but lockdown is not. (To our knowledge this should never happen.)

We disable most loaders as it is done in the Debian downstream code.

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:

* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------
were old shims hashes provided to Microsoft for verification and to be added to future DBX update:
Hashes for SHIMs signed before July 2020 provided through keybase No SHIM signed Between July 2020 and February 2021

Shim 15.3 has not been distributed.

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"

upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
Yes, we currently use linux lts kernel 5.10:

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,

available in public with anonymous access for verification
-------------------------------------------------------------------------------
Not used, no binaries allow-listed

-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not

apply. Please describe your strategy.
-------------------------------------------------------------------------------
This problem does not occur, we are submitting for the first time

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and the differences would be.
-------------------------------------------------------------------------------
We use Debian Bullseye on x86_64 as build environment for shim.

You can use the Dockerfile to verify the build.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
The file 'logs.txt' holds the complete build run

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
sha256 hash: 55c8267a5e1f427a00abae043d07e6228c8807889850e5a03260ba384ce3ee2a

Submission ID: 16eeafe28c552bca36953d75581500887631a7f1

Name: Shim 2021-03-C (15.4)
