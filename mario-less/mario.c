#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int n;
    do
    {
        n =
        
    }

    while (n < 1 || n > 8);
    //Row
    for (int i = 0; i < n; i++)
    {
        //Column
        // Print Spaces
        for (int k = 0; k <= n - (i + 2); k++)
        {
            printf(" ");
        }
        //Print Bricks
        for (int l = 0; l < n - ((n - 1) - i); l++)
        {
            printf("#");
        }
        //Move to next row
        printf("\n");

    }
}