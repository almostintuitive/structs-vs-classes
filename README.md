# Structs vs Classes - Array operations

So, structs over classes, right?

Well, yes. Structs are super hard to create, because they're allocated on stack.
But, what happens if you want to structure your data around structs ( ;) ) and you want to do some sorting? Or, inserting structs at a specific index?

It seems like structs can be a hell of a lot slower in specific cases like this.

Reason?

Copying all the data every time the array changes?
Or? What's your guess?:)

![Alt text](Result.png?raw=true "Result")

