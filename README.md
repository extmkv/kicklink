# quicklink

**quicklink** is a command-line script crafted to simplify the sending of deeplinks on both Android and iOS platforms. It eliminates the need to memorize intricate `adb` and `xcrun` commands by introducing a consistent command-line interface for dispatching deeplinks to the respective platforms. Under the hood, it seamlessly directs deeplinks to Android devices using `adb` and to iOS devices using `xcrun`, all achieved with a single, easy-to-recall command. 

## Installation

### Prerequisite

Before installing **quicklink**, make sure you have the following prerequisites:
- **Homebrew**: If you don't have Homebrew installed, you can install it by following the instructions at [https://brew.sh](https://brew.sh).
- **adb**
- **XCode**

### Install via Homebrew

Add new tap repository.

```bash
brew tap extmkv/brew
```

Install quicklink:

```bash
brew install quicklink
```

This will download and install the quicklink script on your system.

## Usage

### Basic Usage

To use **quicklink**, you can run it from the command line with the following syntax:

```bash
quicklink -p [platform] -d [deeplink]
```

- `-p`: Specify the platform (android or ios). If not provided, it will dispatch to both Android and iOS.
- `-d`: Specify the deeplink you want to dispatch.

### Examples

Dispatch a deeplink to Android:

```bash
quicklink -p android -d myapp://example.com/page
```

Dispatch a deeplink to iOS:

```bash
quicklink -p ios -d myapp://example.com/page
```

Dispatch a deeplink to both Android and iOS:

```bash
quicklink -d myapp://example.com/page
```

### Help

You can view the help message by running:

```bash
quicklink -h
```

## License

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


If you encounter any issues or have suggestions for improvement, please feel free to open an issue on this repository.

Happy deeplinking!