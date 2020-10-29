In this workshop you'll continue writing unit tests in Ruby using MiniTest.

## Instructions

1. Clone the repo to your MacBook.

2. Take a look at the code in `lego.rb`.

3. Create a PR and in it describe:
    * each class
    * the purpose of each method in the class
    - LegoHat would create an object that describes the hat a LegoMinifigure would be wearing. It has the attributes size, colour, and style. There is a mistake/error in the to_s method where it is calling for the `size_word` variable, but it should be `@size`, same with `colour` vs `@colour`
    - LegoItem would create an object describing somethign the minifigure would be holding in its left or right hand. Attributes are name and weight, methods are to_s, and is_heavy which returns a boolean, the result of comparing the object's weight with the passed in threshold.
    - LegoMinifigure describes a lego figure. It has attributes for its name, as well as a hat, and left and right items. Methods include to_s, hat_words, left_item_words, right_item_words to help build the string in to_s; also methods to determine if the hat is stylish, to swap the items in its hands, to place a hat and items on the left and right hands, and an is_strong? method that checks if either item in its hands is heavy.

4. Next, identify the following:
    * The expected behaviours (i.e. what does the method expect as input?).
    - All the `to_s` methods are there to help print out a description of each item/object, so they don't take an input, they use the object's attributes.
    - LegoItem has an `is_heavy` method that takes in a threshold and compares that to the object's weight attribute, returning the resulting boolean
    - LegoMinifigure has three helper methods: hat_words, left_item_words, and right_item_words. They don't take any arguments, so they just return a built string that is used by `to_s` to build the string that describes the minifigure object. `wear_hat`, `place_in_left_hand`, and `place_in_right_hand` methods take one input each and adds that inputted element to the appropriate attribute of the object. `is_strong?` doesn't take any inputs, it just checks if either of the object's items in its hands is heavy by using the item's `is_heavy` method.
    * The limits of the cases of expected behaviour (i.e. how many arguments can the method take?) .
    * Any exceptional/error cases.

5. Create a new file called `lego_test.rb`.

6. In it, create tests for each of the above cases that you've identified. Remember to make commits along the way!

7. Push `lego_test.rb` to GitHub.

8. Submit the link to your PR in Canvas.
