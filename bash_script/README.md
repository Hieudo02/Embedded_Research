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
- [6. Test Operators](#6-test-operators)
- [7. If/Elif/Else](#7-ifelifelse)
- [8. Case statements](#8-case-statements)
- [9. Arrays](#9-arrays)
- [10. For loop](#10-for-loop)
- [11. Functions](#11-functions)
    - [11.1. Definition](#111-definition)
    - [11.2. Local variable](#112-local-variable)
    - [11.3. Arguments](#113-arguments)
- [12. Exit codes](#12-exit-codes)
- [13. AWK](#13-awk)
- [14. SED](#14-sed)

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

## 6. Test Operators
- In bash, we have a built in command called "Test", that will take in a couple of arguments and show if the expression is true or not.
- For example:

    ```bash
        $ [ hello = hello ] # Remember the space between context and square brackets
        # Hit enter will show nothing, till we type:
        $ echo $?
        # It'll show the output:
        # 0 mean nothing different (arguments are the same)
        # 1 mean different

        # We can use "-eq" instead of "="
        $ [ 10 -eq 20 ]
        $ echo $? # output: 1
    ```

## 7. If/Elif/Else
- Create new script called: `ifelifelse.sh`

    ```bash
        $ vim ifelifelse.sh
    ```
- Content:

    ```c
        #!/bin/bash

        if [ ${1,,} = hieu ]; then
                echo "Oh, Hi Hieu!"
        elif [ ${1,,} = help ]; then
                echo "Just type your username, duh!"
        else
                echo "Who are you? F**k off!"
        fi
    ```
    - This script will take in a positional argument, which is a way to test how the if statements will work.
    - `${1,,}`: this is how we provide the first positional argument. 
    - Take note of the double comma `,,` and the curly braces `{}`, this is  call parameter expansion, it will allow us to ignore upper and lower cases when comparing two values.
    - Remember the ending `fi`.
    - How to use:

        ```bash
            # After save and quit using: :wq
           $ ./ifelifelse.sh HIEU 
           # output: Oh, Hi Hieu!
        ```

## 8. Case statements
>*Better than if/elif/else when: **Checking for multiple values** & **Easier to read***
- Create `login.sh`:

    ```bash
        $ vim login.sh
    ```
- Content:

    ```c
        #!/bin/bash

        case ${1,,} in
                hieu | admin)
                        echo "Hello, you're the boss here!"
                        ;;
                help)
                        echo "Just type your username!"
                        ;;
                *)
                        echo "Hi there. You're not the boss of me, please enter a valid username!"
        esac
    ```
    - Case statements can be used with multiple options after `in` command, by using the pipe symbol `|` to separate options (Remember to close the option using double semicolons `;;`).
    - The star symbol (or asterisk `*`) is used to catch all the options (catch all the arguments or even nothing are given).
    - We close the case statements by `esac` (it's case but in reverse).

## 9. Arrays
- We can actually assign multiple values to one variable collected in a list. We call it `Array`.
- How to create in the command line:

    ```bash
        $ MY_FIRST_LIST=(one two three four five)
        # We use space to separate each item.

        # To see the output of this array, there're few ways:
        $ echo $MY_FIRST_LIST       # output: one
        $ echo ${MY_FIRST_LIST[@]}  # output: one two three four five
        $ echo ${MY_FIRST_LIST[1]}  # output: two
    ```

## 10. For loop
- Once we have an array and want to loop over the items in it, using `for loop`.
- For example:
    - Count the length of each word in the array, by piping the item output using echo to the command. 
    >Don't forget to specify the `-n` in echo command, otherwise it'll also count the newline characters.

    ```bash
        # Assume that we have created MY_FIRST_LIST array above
        $ for item in ${MY_FIRST_LIST[@]}; do echo -n $item | wc -c; done
        # Output:
            # 3
            # 3
            # 5
            # 4
            # 4
    ```

## 11. Functions
### 11.1. Definition
- In some scenarios, we have a lot of repeated code, we might want to do a specific  set of commands in a certain order. Or we want to run that through a set of if-else statements multiple times. For these scenarios, we have `functions`.

- Let's create a script: `functions.sh`

    ```bash
        $ vim functions.sh
    ```    
- Content:

    ```bash
        #!/bin/bash

        show_up_time(){
                up=$(uptime -p | cut -c4-)
                since=$(uptime -s)
                cat << EOF
        -----
        This machine has been up for ${up}
        It has been running since ${since}
        -----
        EOF
        }
        show_up_time
    ```

### 11.2. Local variable
- When we define a variable in our function, it's available to the entire script by default. If we want to define a variables inside the functions as a local variables (so that they're only available to our function and not to the entire script), simply add `local` before the variable inside the function.
- Here is how it works:

    ```bash
        #!/bin/bash
        up="Hi"
        since="Hello"
        echo $up
        echo $since
        show_up_time(){
                up=$(uptime -p | cut -c4-)
                since=$(uptime -s)
                cat << EOF
        -----
        This machine has been up for ${up}
        It has been running since ${since}
        -----
        EOF
        }
        show_up_time
        echo $up
        echo $since
    ```
    ```c
        // The Output:
        Hi
        Hello
        -----
        This machine has been up for 4 hours, 7 minutes
        It has been running since 2025-11-13 03:24:58
        -----
        4 hours, 7 minutes
        2025-11-13 03:24:58
    ```
    - The variable "up" and "since" inside the function "show_up_time" change the value of "up" and "since" that we declare global on the top.
    - To make "up" and "since" inside the function "show_up_time" be a local variable, add the keyword "local" before it.

    ```bash
        #!/bin/bash
        up="Hi"
        since="Hello"
        echo $up
        echo $since
        show_up_time(){
                local up=$(uptime -p | cut -c4-)
                local since=$(uptime -s)
                cat << EOF
        -----
        This machine has been up for ${up}
        It has been running since ${since}
        -----
        EOF
        }
        show_up_time
        echo $up
        echo $since
    ```
     ```c
        // The Output:
        Hi
        Hello
        -----
        This machine has been up for 4 hours, 7 minutes
        It has been running since 2025-11-13 03:24:58
        -----
        Hi
        Hello
    ```

### 11.3. Arguments
- Just like bash script that can have a positional argument, so can function.
- For example:
    - Create a new script called: `function_argument.sh`
    
        ```bash
            $ vim function_argument.sh
        ```
    
    - Content:
        
        ```bash
            #!/bin/bash

            show_name(){
                    echo hello $1
            }

            show_name Hieu

            # Output: hello Hieu
        ```

## 12. Exit codes
- Let's open the `function_argument.sh` and add an if statement:
    
    ```bash
        #!/bin/bash

        show_name(){
                echo hello $1
                if [ ${1,,} = hieu ]; then
                        return 0
                else
                        return 1
                fi
        }

        show_name $1

        if [ $? = 1 ]; then
                echo "Someone unknown called the function!"
        fi
    ```

    - Now we can run the script like this:
    
    ```bash
        $ ./function_argument.sh HIEU
        # Output: hello HIEU

        $ ./function_argument.sh hieune
        # Output: 
            # hello hieune
            # Someone unknown called the function!
    ```
## 13. AWK
- We use AWK to filter file contents, or the output of the command in such a way that we can print out the most essential parts and get the output the way we like.
- For example:
    >Default mode, AWK using a space character as a separator.
    - Create a `testfile.txt` which contains three words separated by a space:

        ```bash
            $ echo one two three > testfile.txt
        ```
    
    - Now use AWK:

        ```bash
            $ awk '{print $1}' testfile.txt
            # Output: one

            $ awk '{print $2}' testfile.txt
            # Output: two
        ```

    >In this example, AWK use comma as a separator character.
    - Create a CSV file and add three value in it separated by a comma:

        ```bash
            $ vim csvtest.csv

            # The content:
            one,two,three
        ```
    - Now we can use AWK to split the values in the CSV file by adding the `-F` and specifying the split character afterward:

        ```bash
            $ awk -F, '{print $1}' csvtest.csv

            # Output: one
        ```

    >Pipe command into AWK
    - Pipe AWK into echo command
        ```bash
            $ echo "Just get this word: Hello" | awk '{print $5}'
            # Output: Hello

            $ echo "Just get this word: Hello" | awk -F: '{print $1}'
            # Output: Just get this word
            $ echo "Just get this word: Hello" | awk -F: '{print $2}'
            # Output: Hello
        ```

## 14. SED
- There will come a times where you want to change certain values in text files, and that's where `SED` or `set` comes in.
- `SED` is a command line tool that will allow to modify values in a text files using `regular expressions`.
- For example:
    - Create `sedtest.txt`:

        ```bash
            $ vim sedtest.txt
        ```
    - The content:
    
        ```bash
            The fly flies like no fly flies.
            A fly is an insect that has wings and a fly likes to eat leftovers.
        ```
    - Now we'll replace the word "fly" with "grasshopper" just for demonstration purposes, by typing:
        
        ```bash
            $ sed 's/fly/grasshopper/g' sedtest.txt
        ```
        ```c
            // Output:
            The grasshopper flies like no grasshopper flies.
            A grasshopper is an insect that has wings and a grasshopper likes to eat leftovers.
        ```
    - syntax:
    
        ```
            sed '<mode_want_to_use>/<word_1>/<word_2>/g' <name_of_file>
        ```
        - mode_want_to_use: Here we use `s` which means substitute.
        - word_1: the word inside the file that we want it be replaced.
        - word_2: the word that we want to replace the word_1.
        - `g`: stand for `globally`, which means do this across the entire text file.
        - name_of_file: file that want to use SED.
    >**NOTE:  IT'S ONLY PRINT OUT THE CHANGE, NOT CHANGE THE REAL FILE**
    
    - In case we want to keep the original file as a backup. We can add the flag `-i` like:

        ```bash
            $ sed -i.ORIGINAL 's/grasshopper/fly/g' sedtest.txt
        ```
    >**NOTE:  This step will create 1 more file name sedtest.txt.ORIGINAL that contains the original content, and the old file sedtest.txt will have the changes we desired, not print out**
    