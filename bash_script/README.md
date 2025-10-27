# Bash Scripting

## References
- [Bash Scripting Tutorial for Beginners](https://youtu.be/tK9Oc6AEnR4?si=f7Tx6viOyRJUXBrT)

## Table of Contents
- [1. Basic commands](#1-basic-commands)
    - [1.1. echo](#11-echo)
    - [1.2. cat](#12-cat)
- [2. Writing first bash script](#2-writing-first-bash-script)
- [3. Variables](#3-variables)
- [4. Positional Arguments](#4-positional-arguments)
- [5. Output/Input Redirection](#5-outputinput-redirection)
    - [5.1. Piping](#51-piping)
    - [5.2. Output Redirection](#52-output-redirection)

## 1. Basic commands
### 1.1. echo
- Display text in the command line (pass text as an argument) 
    ```bash
        $ echo <text-to-display>
    ```
### 1.2. cat
- Display the contents of a file
    - First, create a file with text editor Vim:
        ```bash
        $ vim textfile.txt
        # Hit enter and it will open the file. 
        # To write somthing in it, press "i" button on the keyboard and you will enter the INSERT mode.
        # For example, type:
            Hello World!
        # Then press Escape button to exit the INSERT mode and back to REGULAR COMMAND mode.
        ```
    - Then, save the file and exit:
        ```bash   
            # Type:
                :w
            # Hit enter, this will make sure that the changes are actually done and saved to disk.
            # it'll show something like:   "textfile.txt" [New] 1L, 13B written
            # Then type:
                :q
            # Hit enter to exit the file (quit the Vim).
        ```
    - Faster way, type:
        ```bash
            # Type:
                :wq
            # To write the changes to file and quit Vim at the same time
        ```
    > *If you made any changes and you don't want to save it, you can ignore the changes by typing:*
        ```bash
                :q!
            # Quit Vim while ignoring any changes made
        ```
- Now we can print the contents in the file
    - Type:
        ```bash
            $ cat textfile.txt
            # And hit enter to see the contents
        ```
## 2. Writing first bash script
- Create a shell script file (.sh):
    ```bash
        $ vim shelltest.sh
        # Now let's try another mode of writing text in Vim: the APPEND mode
        # Instead of pressing "i" on the keyboard, press "a" button, this will append your text rather than insert it. 
        # With the INSERT mode ("i"), you write the character before the cursor.
        # With the APPEND mode ("a"), you write the character after the cursor
    ```
- Write the contents:
    ```c
    // Inside the file, type:
        #!/bin/bash // telling the shell script which interpreter to use
        echo Hello World!
    // Then press the Escape button, write ":wq" to save and quit
    ```
- Run the file:
    ```bash
        $ ./shelltest.sh

        #if it shows: Permission denied, following the steps below:
        $ chmod u+x <name-of-file>.sh
        # this will give only the owner user permission to execute the file rather than the entire group or anybody on the system.
    ```
## 3. Variables
- Create a shell script file with the contents:
    ```c
        $ vim hello_there.sh

        // Contents:
            #!/bin/bash
            FIRST_NAME=Hieu
            LAST_NAME=Do
            echo Hello $FIRST_NAME $LAST_NAME
        
        $ ./hello_there.sh
    ```
- The above is static variables, but we can actually also ask the user for input:
    ```c
        $ vim interactive_shell.sh

        // Contents:
            #!/bin/bash
            echo What is your first name?
            read FIRST_NAME
            echo What is your last name?
            read LAST_NAME
            echo Hello $FIRST_NAME $LAST_NAME

        // save, quit and run it
            :wq
        $ ./interactive_shell.sh
        // It then shows:
        // What is your first name?
        // You can type in and hit enter 
        // finally it shows: Hello ... ...

    ```
## 4. Positional Arguments
- Arguments are a specific  positions. Commands can take it arguments at a specific position, counting from one (0 reserved for the shell).
- The positions are always separated by a space.

    ```bash
        $ echo Hello There
           0     1     2  
    ```
- Let's look at one of these positional arguments:
    - Create new bash scripts file:

        ```bash
            $ vim pos_argu.sh
        ```

    - Contents:
        ```c
            #!/bin/bash
            echo Hello $1 $2
        ```
    - Run scripts:
        ```bash
            $ ./pos_argu.sh Hieu Do
            # It then shows: Hello Hieu Do
        ```

## 5. Output/Input Redirection
### 5.1. Piping
- One of the most frequently used features in Bash is piping. It makes a very easy way to perform a specific action on the output of the command.
- Let's say the output of a command is very long and you wish to filter something out. Piping if going to give you that option.
- How it works:
    - Command one: `$ echo Hello There`
    - Pipe symbol: `|`
    - Command two (combine with one): `$ echo Hello There | grep there`
- For example:
    - Let's say we want to look at a specific directory, but we just want to filter out certain files or subdirectories. We could use a command like this:
        ```c
            $ ls -l /usr/bin | grep bash
        ```
### 5.2. Output Redirection
- Symbols used:
    -  Symbol to write to a file: *>*
        - e.g.
            ```c
            $ echo Hello World! > hello.txt
            ```
            - Write/Overwrite contents to a file
    - Symbol to append to a file: *>>*
        - e.g.
            ```c
            $ echo Hello World >> hello.txt
            ```
            - Append contents to a file (newline) 
- These command will send the output from a command to a file. This can have many potential use cases:
    - Logging to a logfile (for ex. using timestamps).
    - Dynamically creating (config) file.
