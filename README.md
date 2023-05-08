# MAC Address Scanner and Wake-on-LAN Utility

This utility consists of a set of bash scripts that can be used to scan your local network for devices and perform Wake-on-LAN (WOL) operations on them. The scripts are designed to run on FreeBSD.

## Prerequisites

- Bash
- [Nmap](https://nmap.org/)
- Sudo

To download the prerequisites, you can use the following commands:

```
pkg install bash nmap sudo
```

## Installation

To use these scripts, clone this repository to your local machine.

```bash
git clone https://github.com/Nobuyoshi-Lab/freebsd-wake-computer.git
cd freebsd-wake-computer
```

## Usage

1. Edit the `data/mac-vendor.txt` file to add your desired MAC vendors. The `default.sh` script initializes this file with some common vendors.

2. Run the `mac-search.sh` script to scan your local network and store the results in the `data/nmap-output.txt` file.

```bash
./scripts/mac-search.sh
```

3. Run the `mac-test.sh` script to filter the MAC addresses by the specified vendors and store the results in the `data/found-mac.txt` file.

```bash
./scripts/mac-test.sh
```

4. Run the `mac-wake.sh` script to perform WOL on the devices with the filtered MAC addresses.

```bash
./scripts/mac-wake.sh
```

## Making the scripts available system-wide

To make the scripts available system-wide, you can create symbolic links in `/usr/local/bin`. First, ensure that the scripts are executable by running:

```bash
chmod +x scripts/*.sh
```

Next, navigate to the root directory of the repository, and then create symbolic links:

<pre>
cd /path/to/your_repository_directory
</pre>

```bash
sudo ln -s "$(pwd)/scripts/mac-search.sh" /usr/local/bin/mac-search
sudo ln -s "$(pwd)/scripts/mac-test.sh" /usr/local/bin/mac-test
sudo ln -s "$(pwd)/scripts/mac-wake.sh" /usr/local/bin/mac-wake
```

Now, you can use the `mac-search`, `mac-test`, and `mac-wake` commands from anywhere in your system.
