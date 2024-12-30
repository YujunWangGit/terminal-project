my first time using github, gitbash, vscode, git



notes: 

folders = directories

you can find where a folder or file is by using command "find -name <item you want to find>"
you can use find to find the folder trees

mv can be used to rename and also move things 

you can move folders by staying in the same folder and then use find to find where it is, you copy that and then use that as the first parameter, and then use the directory of where you want to move it as the second parameter. the "./" is needed and is important!

rm can be remove files, but you must use rmdir to remove directories

put path before file name to place it into where you want it to go when using touch when creating a file. example: "touch client/assets/fonts/roboto-bold.woff" this is adding a new font "roboto-bold.woff" into the fonts folder(directory)


rmdik is used to remove directories, but it must be empty, however you can use a -r flag that remove directories and their contents recursively. Using this removes the content inside the directories but the content inside does not go into the trash, it's just gone. must be careful when using -r

you can directly add text to files by "echo <message> >> <file>"
