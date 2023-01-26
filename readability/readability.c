#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    //Information Dump
    string para = get_string("Text: ");
    float letters = count_letters(para);
    float words = count_words(para);
    float sens = count_sentences(para);
    int index = round((0.0588 * (letters / words * 100)) - (0.296 * (sens / words * 100)) - 15.8);

    // Return Answers
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index > 15)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", index);
    }
}

// Count Letters
int count_letters(string text)
{
    int counter = 0;
    //Loop through text
    for (int i = 0; i < strlen(text); i++)
    {
        if (isupper(text[i]) != 0 || islower(text[i]) != 0)
        {
            counter++;
        }
    }
    //return number of letters
    return counter;
}

//Count Words
int count_words(string text)
{
    int counter = 1;
    //Loop through text
    for (int i = 0; i < strlen(text); i++)
    {
        if (text[i] == 32)
        {
            counter++;
        }
    }
    //return number of words
    return counter;
}

//Count Sentences
int count_sentences(string text)
{
    int counter = 0;
    //loop through text
    for (int i = 0; i < strlen(text); i++)
    {
        if (text[i] == 46 || text[i] == 33 || text[i] == 63)
        {
            counter++;
        }
    }
    //return number of sentences
    return counter;
}

