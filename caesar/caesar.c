#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

//initiate functions
int rotate(char input, int key);
int trueFalse(int argument, string insert);

int main(int argc, string argv[])
{
    //check to see if only a number was given
    if (trueFalse(argc, argv[1]) == true)
    {
        //turn argv into an intiger
        int key = atoi(argv[1]);
        //get the phrase to cypher
        string plaintext = get_string("plaintext: ");
        char newtext[30];
        //cypher the phrase
        for (int i = 0; i < strlen(plaintext); i++)
        {
            //each time it loops grab a new character
            char newltr = rotate(plaintext[i], key);
            strncat(newtext, &newltr, 1);
        }
        //print cyphertext
        printf("ciphertext: %s\n", newtext);
        return 0;
    }
    else

    {
        //error message
        printf("Usage: ./caesar key\n");
        return 1;
    }
}

// cypher each individual character given
int rotate(char input, int key)
{
    // if the letter is an uppercase:
    if (isupper(input) != 0)
    {
        //turn it into an intiger and add the key
        int output = input + key;
        // if the output intiger is no longer within the proper alphabet area, subtract 26 until it is
        while (output > 90)
        {
            output = output - 26;
        }
        return output;
    }
    // if the letter lis lowercase:
    else if (islower(input) != 0)
    {
        // turn it into an intiger and add the key
        int output = input + key;
        // if the output did not stay within the character range, subtract 26 until it is
        while (output > 122)
        {
            output = output - 26;
        }
        return output;
    }
    else

    {
        return input;
    }
}

//Check to see if the ARGC was a number
int trueFalse(int argument, string insert)
{
    //make sure only 1 argument was given and that ARGC was a digit.
    if (argument == 2 && atoi(insert) != 0)
    {
        int j = 0;
        while (j < strlen(insert))
        {
            if (insert[j] > 47 && insert[j] < 58)
            {
                j++;
            }
            else
            {
                return false;
            }
        }
        return true;
    }
    else

    {
        return false;
    }
}