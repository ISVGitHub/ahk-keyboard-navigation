# AHK Keyboard Navigation

[![](https://img.shields.io/github/release/bressio/ahk-keyboard-navigation.svg)](https://github.com/bressio/ahk-keyboard-navigation/releases)
[![](https://img.shields.io/github/license/bressio/ahk-keyboard-navigation.svg)](https://github.com/bressio/ahk-keyboard-navigation/blob/master/LICENSE)

## Introduction
AHK Keyboard Navigation (AHKeyNav, for short) is an easily customizable AutoHotKey script for Windows that features Vim-like hotkeys. Hotkeys are executed with CapsLock as a modifier. Therefore, if you want to restore the CapsLock function, you would have to create a hotkey for this purpose or simply assign another modifier. We will see more about that in a later section.

## Features
AHKeyNav provides 30 hotkeys by default, however, you can add new ones afterwards. They are categorized into basic and extended commands. The difference is that extended commands require a second modifier, which is by default the Alt key.

![ahk-kb-nav-min](https://user-images.githubusercontent.com/45995771/50303713-13b7ad00-0475-11e9-9e6c-22478323e12f.png)

### Basic Commands
| # | Combination | Function |
| :- | :-: | :- |
| 0 | CapsLock + j | Move left |
| 1 | CapsLock + l | Move right |
| 2 | CapsLock + i | Move up |
| 3 | CapsLock + k | Move down |
| 4 | CapsLock + u | Move to the start of the line |
| 5 | CapsLock + o | Move to the end of the line |
| 6 | CapsLock + c | Copy |
| 7 | CapsLock + v | Paste |
| 8 | CapsLock + x | Cut |
| 9 | CapsLock + n | Move left while selecting |
| 10 | CapsLock + m | Move right while selecting |
| 11 | CapsLock + y | Move a page up |
| 12 | CapsLock + h | Move a page down |
| 13 | CapsLock + BackSpace | Delete the next character |
| 14 | CapsLock + p | Combine the current line with the next line |

### Extended Commands
| # | Combination | Function |
| :- | :-: | :-- |
| 0 | CapsLock + Alt + j | Move left by n words (default: 1) |
| 1 | CapsLock + Alt + l | Move right by n words (default: 1) |
| 2 | CapsLock + Alt + i | Move up by n lines (default: 10) |
| 3 | CapsLock + Alt + k | Move down by n lines (default: 10) |
| 4 | CapsLock + Alt + u | Move to the start of the file |
| 5 | CapsLock + Alt + o | Move to the end of the file |
| 6 | CapsLock + Alt + c | Copy from the current character to the end of the line |
| 7 | CapsLock + Alt + v | Clone the current line in the next line |
| 8 | CapsLock + Alt + x | Cut from the current character to the end of the line |
| 9 | CapsLock + Alt + n | Move left while selecting by n words (default: 1) |
| 10 | CapsLock + Alt + m | Move right while selecting by n words (default: 1) |
| 11 | CapsLock + Alt + y | Move up while selecting |
| 12 | CapsLock + Alt + h | Move down while selecting |
| 13 | CapsLock + Alt + BackSpace | Delete the current line |
| 14 | CapsLock + Alt + p | Replace the current word with the text on clipboard |

## Running the script

To run the script, you must download the program [AutoHotKey](https://www.autohotkey.com/).

You can put the script to run every time you turn on the computer. To do this, refer to [AutoHotKey's FAQ](https://autohotkey.com/docs/FAQ.htm#Startup).

## Modifying hotkeys
You should first look for the hotkey number in the tables above. In the `config` file, locate the line `hotkey[number]` and change its value to modify the hotkey. To change its function, open the file `navigation.ahk` and locate the block `Hotkey[number]`.

You can also change the modifiers through the `config` file. To do this, edit the values of `primaryModifier` and `secondaryModifier`.

## Creating new hotkeys

Before you can create a new hotkey, you must first set its key in the `config` file, e.g., `hotkey16=r`. Note that the number must follow the sequence.

Then, create a block of code in the `navigation.ahk` file within the condition `#If (CheckActiveWindow())`. It should follow the format:

    Hotkey[number]:
        if GetKeyState(secondaryModifier, ksMode)
            ; Extended command
        else
            ; Basic command
    return

## Disabling the script

To suspend or restore the script, press `CapsLock + Esc` at any time.

You can prevent hotkeys from executing when certain programs are active. To do this, open the `config` file and add the line `program=[window title]`. For instance: `program=LibreOffice Calc`. Doing so will prevent hotkeys from being triggered when a LibreOffice Calc window is active.

## Changing extended command variables

In the `config` file, you can change the extended command variables through the following lines: `linesUp`, `linesDown`, `wordsLeft`, `wordsRight`, `wordsLeftSel`, `wordsRightSel`.

For instance, if you change the value of `wordsRight` to 5 and then execute the hotkey `CapsLock + Alt + l`, the movement will be 5 words to the right.