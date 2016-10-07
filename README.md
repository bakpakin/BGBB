# Boston Gay Basketball League

This is the Boston Gay Basketball league iOS app. It's gonna be awesome, with shiny bells and whistles.
Right now it does literally nothing.
This README has some probably redundant instruction on how to get started and start developing our app,
as well as some tips and tricks on how we do things at GAI-BGBB. There aren't so many tips and tricks
yet because we haven't decided on how we are going to do things.

## Getting Started

I'm not going to assume any level of experience, so here are some potentially useful
resources if you are having trouble following the below instructions. Or you can ask me during a meeting (Calvin).

If you just want to get started quickly, you can skip these. But you will need them later, especially the git stuff.

* [Team Treehouse OSX Command Line introduction](http://blog.teamtreehouse.com/introduction-to-the-mac-os-x-command-line)
* [Try Git - Interactive Tutorial](https://try.github.io/levels/1/challenges/1)
* [Git Course (Treehouse)](https://teamtreehouse.com/library/git-basics)
* [Carthage tutorial](https://www.raywenderlich.com/109330/carthage-tutorial-getting-started)

-----

To get ready to develop, you are going to need to download this repository, install
Xcode, [homebrew](http://brew.sh/index.html), and [carthage](https://github.com/Carthage/Carthage).

1. Install Xcode from the Mac App store. Get the latest version (8.something) I think you might have to create a free Apple
 Developer account.
2. Install [homebrew](http://brew.sh/index.html). There is a command to paste into a terminal on the main site.
 If you were wondering, homebrew is a [package manager](https://en.wikipedia.org/wiki/Package_manager) for mac. It just allows us to install lots of (mostly) developer-facing software really easily and consistently.
3. Use homebrew to install carthage. Carthage is one of several dependency managers for Swift, and will
 make it easier for us to use other open source code to make our app awesome with minimal work. I have already
 added one depedency called Alamofire that will make doing HTTP networking much easier.
   ```bash
   brew install carthage
   ```
4. Clone this project from Github. This can be done very easily from the terminal. (The pound signs are comments)
   ```bash
   # Change Directory to the Desktop (you don't have to put it on your desktop)
   cd ~/Desktop

   # Clone the respository
   git clone https://github.com/bakpakin/BGBB.git
   ```
5. Use carthage to set up the dependencies. Alamofire is not included in the repository because it is not part
 of our app. So after you clone the repository, you have to tell carthage to donwload the dependencies. From
 the project directory (inside ~/Desktop/BGBB if you follow the above instruction verbatim), run the following command:
   ```bash
   # Note: the terminal (or shell) is always 'in' a directory - the current directory.
   # You can set that directory with the cd command. For example, "cd ~/Desktop/BGBB". The tilda
   # is an alias for your home directory, which is where the terminal probably starts.

   carthage bootstrap --platform iOS
   ```
6. Now open up Xcode and File>Open the iOS app. You should be able to run the app on the simulator and see
  a whole lot of nothing interesting.

## Halp

It could be that something is unclear, these instructions are wrong, or something else entirely.
Whatever the problem, there are a lot of smart, experienced people at GAI, and they can probably help you.
If there is something wrong in here, help me correct it.