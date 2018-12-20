# AHK Keyboard Navigation

[![](https://img.shields.io/github/release/bressio/ahk-keyboard-navigation.svg)](https://github.com/bressio/ahk-keyboard-navigation/releases)
[![](https://img.shields.io/github/license/bressio/ahk-keyboard-navigation.svg)](https://github.com/bressio/ahk-keyboard-navigation/blob/master/LICENSE)

## Introduction
A keyboard navigation AHK script inspired by Vim

## Features

![ahk-kb-nav-min](https://user-images.githubusercontent.com/45995771/50303713-13b7ad00-0475-11e9-9e6c-22478323e12f.png)

### Basic Commands
| Combination | Function |
| :-: | :- |
| CapsLock + j | Move left |
| CapsLock + l | Move right |
| CapsLock + i | Move up |
| CapsLock + k | Move down |
| CapsLock + u | Move to the start of the line |
| CapsLock + o | Move to the end of the line |
| CapsLock + c | Copy |
| CapsLock + v | Paste |
| CapsLock + x | Cut |
| CapsLock + n | Move left while selecting |
| CapsLock + m | Move right while selecting |
| CapsLock + y | Move a page up |
| CapsLock + h | Move a page down |
| CapsLock + BackSpace | Delete the next character |
| CapsLock + p | Combine the current line with the next line |

### Extended Commands
| Combination | Function |
| :-: | :-- |
| CapsLock + Alt + j | Move left by n words (default: 1) |
| CapsLock + Alt + l | Move right by n words (default: 1) |
| CapsLock + Alt + i | Move up by n lines (default: 10) |
| CapsLock + Alt + k | Move down by n lines (default: 10) |
| CapsLock + Alt + u | Move to the start of the file |
| CapsLock + Alt + o | Move to the end of the file |
| CapsLock + Alt + c | Copy from the current character to the end of the line |
| CapsLock + Alt + v | Clone the current line in the next line |
| CapsLock + Alt + x | Cut from the current character to the end of the line |
| CapsLock + Alt + n | Move left while selecting by n words (default: 1) |
| CapsLock + Alt + m | Move right while selecting by n words (default: 1) |
| CapsLock + Alt + y | Move up while selecting |
| CapsLock + Alt + h | Move down while selecting |
| CapsLock + Alt + BackSpace | Delete the current line |
| CapsLock + Alt + p | Replace the current word with the text on clipboard |