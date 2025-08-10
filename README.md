# The Halting Solution
My [GMTK Game Jam 2025](https://itch.io/jam/gmtk-2025) entry.

The Halting Solution is a programming puzzle game where your goal is to make a Brainfuck program loop infinitely. 
There are 9 levels, an interactive tutorial, and a sandbox.

This is the source code. Please don't make fun of any bad practices you see. It was made as a jam game in mind. It would make me really sad if you do.

itch.io link:
https://skirlez.itch.io/the-halting-solution

## Results

|Criteria|Rank|Score|
|-|-|-|
|Creativity|#12|4.633|
|Enjoyment|#31|4.433|
|Audio|#996|3.533|
|Narrative|#1342|3.100|
|Artwork|#4490|2.867|

|Stars|Percent|
|-|-|
|5 star|38.7%|
|4 star|24%|
|3 star|14.7%|
|2 star|15.3%|
|1 star|7.3%|

Wow

## Home format
Homes (levels) are stored in `global.levels`, and they are all defined in `obj_manager`.
Index 0 is reserved for the tutorial, index 1 is reserved for the sandbox.

A home looks like this:
```gml
{
	program : "(Branefuck characters)",
	can_use : "(Branefuck characters)",
	char_limit : {
		"Character" : (number),
		"Character" : (number),
	},
}
```
You can include an 'l' before a character to add a lock.
Here's the final home as an example:
```gml
{
	program : ">>l+>>>>>>>+l+[+l+l]",
	can_use : "><",
	char_limit : {
		">" : 1,
		"<" : 3,
	},
}
```

The `can_use` variable is technically redundant (you could just get the names of the variables of the `char_limit` struct
and get the allowed characters that way) BUT IT USED TO NOT BE!!
Easier and safer to keep it rather than removing it mid-jam, as with many other things...

## License
AGPLv3

## Contributing
Please contribute
