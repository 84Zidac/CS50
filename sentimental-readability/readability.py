# TODO

def readability():
    # Get the text to grade
    text = input("Text: ")
    # Count number of words
    words = get_words(text.casefold())
    # Count number of letters
    letters = get_letters(text.casefold())
    # Count number of sentences
    sens = get_sentences(text.casefold())
    # Calculate the grade level
    calc = round((0.0588 * (letters / words * 100)) - (0.296 * (sens / words * 100)) - 15.8)
    # Return the grade level
    if calc < 1:
        return ("Before Grade 1")
    elif calc > 15:
        return ("Grade 16+")
    else:
        return (f"Grade {calc}")

# Function to get number of words


def get_words(text):
    count = 1
    # Count number of spaces
    for i in range(0, len(text)):
        if text[i] == " ":
            count += 1
    # Return number of words
    return count

# Function to get number of letters


def get_letters(text):
    count = 0
    # Count number of letters
    for i in range(0, len(text)):
        if text[i].isalpha():
            count += 1
    # Return number of letters
    return count

# Function to get number of sentences


def get_sentences(text):
    count = 0
    # Count number of sentences by looking for . ? or !
    for i in range(0, len(text)):
        if text[i] == "." or text[i] == "?" or text[i] == "!":
            count += 1
    # Return number of sentences
    return count


# Run the main program and print out the final answer
print(readability())