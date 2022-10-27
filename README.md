# RemoveCutscenes
This mod allows you to remove intro and outro cutscenes from runs.

**This is not [leaderboard](https://speedrun.com/hades) legal, and any runs found to be using this mod _will_ be rejected** 

# Installation
To install RemoveCutscenes, go to the [Releases](https://github.com/Museus/RemoveCutscenes/releases) tab and download the latest .zip file. This will include the following files:

-   Mods/
    - RemoveCutscenes/
    - ModUtil/
    - PrintUtil/
-   modimporter.py

[A video tutorial on how to install mods is available from PonyWarrior here](https://www.youtube.com/watch?v=YF0ij7MgOrI)

If you prefer text instructions, follow these steps:

If you don't already have Python installed, download it from [python.org](https://www.python.org/downloads/) and install it.

Once you have downloaded the `RemoveCutscenes.zip` file, open up your Hades game directory. You can find this by launching Hades, then opening Task Manager, finding the Hades process, right-clicking on it, and selecting Open File Location.

Unzip the files into the `.../Hades/Content` folder. You should now have the standard folders such as `Scripts` and `Game` as well as a new folder called `Mods` and the `modimporter.py` script.

Run the `modimporter.py` script to install the mods, then load into your game. Whenever you want to uninstall the mods, simply delete the contents of the `Mods` folder, and run the `modimporter.py` script again.

# Configuration

You can toggle intro and outro cutscenes on and off. To change these options, open the `Mods` folder,  open the `RemoveCutscenes` folder, then open `RemoveCutscenes.lua` in Notepad. There will be a block at the top with `local config = {` followed by options that can be changed.
