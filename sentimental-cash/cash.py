# TODO
from cs50 import get_float

change = -1
# Loop until a good number is received
while change < 0:
    change = int(get_float("Change owed: ") * 100)

coins = 0
# Check to see how many quarters are needed then subtract that amount from change still due out
coins += int(change / 25)
change -= int(change / 25) * 25
# Check to see how many dimes are needed then subtract that amount from change still due out
coins += int(change / 10)
change -= int(change / 10) * 10
# Check to see how many nickels are needed then subtract that amount from change still due out
coins += int(change / 5)
change -= int(change / 5) * 5
# Check to see how many pennies are needed
coins += int(change / 1)

print(coins)
