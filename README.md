## FlipFlap HW

###Overview

This homework assignment asks you to create two files (a module and a class) that
are needed to run the two command lines applications you are given.

###Installing Basic HW files

First, make sure you have `git` installed (see our class notes) on your machine.

Then, install the files needed to start this homework project:

    $ git clone https://github.com/ISS-SOA/FlipFlap_HW.git

This will create a directory called `FlipFlap_HW` in your current directory.

*DO NOT FORK THIS REPO* because you will not submit your solution as pull requests! You may, however, fork the repo if you wish to submit pull requests that fix typos, etc.

Second, link the repo in your new folder with Github:
- create a new repo in your Github account (call it `SOA_flip_flap` for example), and copy the SSH URL
- `cd` into your local directory `FlipFlap_HW`
- set your new Github repo as the remote `origin` repo: `$ git remote add origin git@github.com/YOURACCOUNT/YOURREPO.git`

When working on your solution, keep adding changes, commiting, and pushing to Github.


### Files Given

You are given two complete code files: `tsv_to_yml.rb` and `yml_to_tsv.rb`.
These files are command line applications that convert between TSV and Yaml formats.
However, they require two more code files that you must create in this assignment:
`flip_flap.rb` and `tsv_buddy.rb`.

You are also given two data files to play with: `survey.tsv` and `survey.yml`

###Assignment:

Your task is to get `tsv_to_yml.rb` and `yml_to_tsv.rb` to work, without making
any modifications to these files.  Please study their code now.

They both require a file called `flip_flap.rb` that should contain a class called FlipFlap.
On of your tasks is to create a complete class FlipFlap. However, to complete
FlipFlap, you must first create a complete module called TsvBuddy in a file called
`tsv_buddy.rb`

#### 1. tsv_buddy.rb

This file already contains an instance variable called `@data` that will contain a
data structure to hold information loaded from TSV files. For example, you may want to make this
data strcuture an Array of Hashes that looks something like this:


```
[{"date"=>"9/12/2014 20:20:55",
  "student_id"=>"3452",
  "languages"=>"Java, C , HTML , JavaScript , ",
  "best_language"=>"Java",
  "app_experience"=>"Native GUI applications, Database Driven Applications",
  "tech_experience"=>
   "Unix-based OS, Database"},

      <more hashes here>

]
```

You must fill out two methods:

`def take_tsv(tsv)` : this method should take a String called `tsv` and convert
it into a data structure to store in `@data`.

`def to_tsv` : this method should take any data in `@data` and return a String
in TSV format.

Note that modules cannot be made into object instances (i.e., you cannot do
`mymod = TsvBuddy.new`.  So to test this module while you are developing it,
you can do something like this:

```
  class Tester
    include TsvBuddy
  end

  t = Tester.new.take_tsv(File.read('./data/survey.tsv'))
```

That should show you if `take_tsv` is creating the right structure for example.

#### 2. flip_flap.rb

This class should mixin (using `include`) TsvBuddy. That will give it access to
TsvBuddy's `@data` member variable and to its two methods `take_tsv` and `to_tsv`.

This class should then implement two methods (not provided):

`def take_yaml(yml)` : this method takes a Yaml string and create a data structure to put into `@data`.
You should be able to do this with one line of code using the `yaml` library's load method.

`def to_yaml` : this method should return `@data` in Yaml format.


And that's it!


### Verifying Your Solution

If your solution works, then you should be able to convert TSV files into Yaml,
and back into TSV with no change in information.

Test your code out by running the spec (test) that is provided:

```
$ bundle install
(only need to run this once; bundle should report sucess)

$ ruby flip_flap_spec.rb
```

Also, take a peek into `flip_flap_spec.rb` to see how it works -- you will soon start writing your own specs!

### Submission

Please submit the URL of your Github repo.

### What Did We Learn?

This assignment shows you the power of mixins in Ruby's object model.
You have created a class (FlipFlap) that can in the future incorporate code to
parse or create any kind of data format (CSV, Excel, etc.).  To keep FlipFlap short
and uncomplicated, we can make modules (like TsvBuddy) for other formats (CsvBuddy,
ExcelBuddy, etc.) and simply include them into FlipFlap. This cleanly seperates
our code by keeping the logic for parsing (the XyzBuddy modules) away from the code
needed by applications to handle the data (class FlipFlap).

Feel free to ask more questions on our Canvas board, and we will of course discuss
this in class!
