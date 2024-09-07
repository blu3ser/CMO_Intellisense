# CMO Lua API Autocompletion Library #

This project continues the work started by user KnightHawk75 on the [Command Modern Operations forum](https://www.matrixgames.com/forums/viewtopic.php?f=10236&t=372719). His efforts and expertise in Lua have paved the way for us to enjoy this tool today, where I have merely organized, corrected, and added new functions as they are implemented by the development team.

It provides a comprehensive implementation of the CMO Lua API documentation as a workspace library for use with Visual Studio Code (VSCode). By integrating this library with the sumneko Lua language extension, developers can benefit from enhanced autocompletion, inline documentation, and quick lookup features, improving their workflow without leaving the VSCode environment.

**DISCLAIMER**: This tool is an unofficial project and is not endorsed, sponsored, or affiliated with Matrix Pro Sims or its development team in any capacity. It is provided "as-is," and all contributions are made independently of the official developers.
### Prerequisites ###

  1. Visual Studio Code (VSCode): You can download it for free from here.
  2. sumneko Lua Language Server Extension: Available for free in the VSCode extensions marketplace.

### Installation Guide ###
#### Step 1: Install Visual Studio Code ####

If you haven't already installed VSCode, download it from Visual Studio Code's official website and follow the installation instructions for your operating system.

#### Step 2: Install the sumneko Lua Language Server Extension ####

  1. Open VSCode.
  2. Navigate to the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of the window or by pressing Ctrl+Shift+X.
  3. In the search box, type "Lua" and look for "Lua Language Server" by sumneko.
  4. Click the Install button to add the extension to your VSCode.

#### Step 3: Download and Configure the CMO Lua API Workspace Library####

 - Clone or Download the Repository: Clone this repository to your local machine or download it as a ZIP file and extract it to your desired location.

        git clone https://github.com/blu3ser/CMO_Intellisense

Open Your Workspace in VSCode: Open VSCode and go to File > Open Folder... and select the folder where you downloaded or extracted the repository.

Configure VSCode to Use the Workspace Library:

 1. Open the Command Palette by pressing Ctrl+Shift+P.
 2. Type "Preferences: Open Settings (JSON)" and select it.
 3. Add or modify the following configuration to include the CMO Lua workspace library:

        "Lua.workspace.library": [
            "/path/to/your/CMO_Lua_API_Autocompletion"
        ],
        "Lua.diagnostics.globals": ["CMO__Constants"]
   
Replace /path/to/your/CMO_Lua_API_Autocompletion with the actual path to the library files on your machine.

Restart VSCode: After making these changes, restart VSCode to apply the new settings.

You can also download a workspace file from this zip file attached to the message: [https://www.matrixgames.com/forums/viewtopic.php?f=10236&t=372719](https://www.matrixgames.com/forums/viewtopic.php?f=10236&t=372719)

#### Step 4: Using the Autocompletion Features ####

Once the workspace library is configured, you can start typing CMO Lua functions in any .lua file in your workspace. You'll see autocompletion suggestions, inline documentation, and quick lookup options as you type.
Additional Tips

EmmyLua Annotations: To get the most out of the autocompletion and diagnostics, use EmmyLua annotations (e.g., ---@type) in your Lua scripts.
Managing Deprecated Functions: Some deprecated functions are included in the library for backward compatibility. Be mindful when using them and refer to the inline documentation for any deprecation warnings.

### Contribution ###

Contributions to improve this project are welcome! Please feel free to submit issues, feature requests, or pull requests on the GitHub repository.

### License ###

This project is licensed under the MIT License. See the LICENSE file for more details.
