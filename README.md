###Overview
You will write a program to check for spelling mistakes. This program will ask the user to enter a sentence to be checked. The program will then find the misspelled words and return them along with the correct spelling(s).
Here is an example showing the I/O behavior of this program:

```
Enter a sentence to check:
The mrn went to the hiuse on tusday.
```

```
The misspelled words are:

mrn: man, men
hiuse: house
tusday: tuesday
```

Here are some simplifying assumptions you can make:
. You do not need to handle misspelled words resulting from grammatical errors. For example, "The man want to the house."
. Input sentences will not contain any numbers -- 1, 12, 13.45
. Input sentences will not contain any punctuations except (.).

####Grading
This assignment is worth 18 points. 
. Dictionary - 3 points
. Spell Checker - 8 points
. Efficiency - 3 points
. Documentation - 2 points
. Test Cases - 2 points
Each component is described in more detail below.

####Dictionary (3 Points)
You will build a "dictionary" for the spell checker. The dictionary is a text file containing words used by the spell checker. You must use the dictionary provided (dictionary.txt It is on blackboard).
Your program will read the words contained in this file and store them in some data structure used by the spell checker. You can use whatever data structure (Hash, array… ) you want to store and retrieve information from the dictionary.
Spell Checker (8 points)
This is the main part of the assignment. For each word in the input sentence, the spell checker will do the following.
. It will test if the word exists in the dictionary.
. If the word exists, then there is no spelling mistake and it will move on to the next word.
. If the word does not exist in the dictionary, then the word is misspelled. The spell checker will compare the misspelled word against words in the dictionary and return the most similar ones. The spell checker will use string edit distance for this comparison. The most similar words (according to the string edit distance) are the correct spellings.
. Once all the misspelled words and their correct spellings are found, the spell checker will print them out to screen.

####Efficiency (3 points)
Efficiency is always important. Comparisons and lookups can become expensive, so you should try to optimize the code. Hashes are one way to improve lookups. There are many other techniques which can be used.
Documentation (2 points)
When writing large or complicated programs, it is good practice to include comments describing what the program and its subroutines do. Hence, comments are expected for this assignment.
Code that is uncommented will have points deducted.

####Test Cases (2 points)
You must also turn in a test case file for this assignment. This file will contain sample test cases and their expected outputs.
Failure to turn in a test case file will result in the loss of points.
