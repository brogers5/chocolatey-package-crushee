# <img src="https://cdn.jsdelivr.net/gh/brogers5/chocolatey-package-crushee@0003137e29c562ab3ca618afd3ef4aee83840032/crushee.png" width="48" height="48"/> Chocolatey Package: [Crushee](https://community.chocolatey.org/packages/crushee)

[![Chocolatey package version](https://img.shields.io/chocolatey/v/crushee.svg)](https://community.chocolatey.org/packages/crushee)
[![Chocolatey package download count](https://img.shields.io/chocolatey/dt/crushee.svg)](https://community.chocolatey.org/packages/crushee)

---

This package is part of a family of packages published for Crushee. This repository is for the meta package.

* For the installer package, see [chocolatey-package-crushee.install](https://github.com/brogers5/chocolatey-package-crushee.install).
* For the portable package, see [chocolatey-package-crushee.portable](https://github.com/brogers5/chocolatey-package-crushee.portable).

See the [Chocolatey FAQs](https://docs.chocolatey.org/en-us/faqs) for more information on [meta packages](https://docs.chocolatey.org/en-us/faqs#what-is-the-difference-between-packages-no-suffix-as-compared-to.install.portable) and [installer/portable packages](https://docs.chocolatey.org/en-us/faqs#what-distinction-does-chocolatey-make-between-an-installable-and-a-portable-application).

---

## Install

[Install Chocolatey](https://chocolatey.org/install), and run the following command to install the latest approved version from the Chocolatey Community Repository:

```shell
choco install crushee --source="'https://community.chocolatey.org/api/v2'"
```

Alternatively, the packages as published on the Chocolatey Community Repository will also be mirrored on this repository's [Releases page](https://github.com/brogers5/chocolatey-package-crushee/releases). The `nupkg` can be installed from the current directory (with dependencies sourced from the Community Repository) as follows:

```shell
choco install crushee --source="'.;https://community.chocolatey.org/api/v2/'"
```

## Build

[Install Chocolatey](https://chocolatey.org/install), clone this repository, and run the following command in the cloned repository:

```shell
choco pack
```

A successful build will create `crushee.x.y.z.nupkg`, where `x.y.z` should be the Nuspec's `version` value at build time.

Note that Chocolatey package builds are non-deterministic. Consequently, an independently built package will fail a checksum validation against officially published packages.

## Update

This package should be automatically updated by the [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au), with update queries implemented by the [PowerShellForGitHub PowerShell Module](https://github.com/microsoft/PowerShellForGitHub). If it is outdated by more than a few days, please [open an issue](https://github.com/brogers5/chocolatey-package-crushee/issues).

AU expects the parent directory that contains this repository to share a name with the Nuspec (`crushee`). Your local repository should therefore be cloned accordingly:

```shell
git clone git@github.com:brogers5/chocolatey-package-crushee.git crushee
```

Alternatively, a junction point can be created that points to the local repository (preferably within a repository adopting the [AU packages template](https://github.com/majkinetor/au-packages-template)):

```shell
mklink /J crushee ..\chocolatey-package-crushee
```

Once created, simply run `update.ps1` from within the created directory/junction point. Assuming all goes well, all relevant files should change to reflect the latest version available. This will also build a new package version using the modified files.

Before submitting a pull request, please [test the package](https://docs.chocolatey.org/en-us/community-repository/moderation/package-verifier#steps-for-each-package) using the [Chocolatey Testing Environment](https://github.com/chocolatey-community/chocolatey-test-environment) first.
