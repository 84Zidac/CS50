import csv
import sys
import copy


def main():

    # TODO: Check for command-line usage
    if len(sys.argv) != 3:
        sys.exit("Usage: python dna.py data.csv sequence.txt")

    # TODO: Read database file into a variable
    dictionary = []
    data = sys.argv[1]
    with open(data) as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            dictionary.append(row)
    woutNames = copy.deepcopy(dictionary)
    a = 1
    b = 1
    while a < len(dictionary):

        while b < len(dictionary[a]):
            dictionary[a][b] = int(dictionary[a][b])
            woutNames[a][b] = int(woutNames[a][b])
            b += 1
        del woutNames[a][0]
        a += 1
        b = 1

    # TODO: Read DNA sequence file into a variable
    f = open(sys.argv[2], 'r')
    sequence = f.read()

    # TODO: Find longest match of each STR in DNA sequence
    i = 1
    seqMatch = []
    while i < len(dictionary[0]):
        longMatch = longest_match(sequence, dictionary[0][i])
        seqMatch.append(longMatch)
        i += 1

    # TODO: Check database for matching profiles
    try:
        index = woutNames.index(seqMatch)
        print(dictionary[index][0])
    except ValueError:
        print("No match")
    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
