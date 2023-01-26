# TODO
from cs50 import get_int

# Set origional size to zero
size = 0
# Loop unitl you get a good size
while size < 1 or size > 8:
    size = get_int("Height: ")
# Set number of spaces and pounds
spaces = size - 1
pounds = size + 1 - size
# Loop through printing each line of the structure
for i in range(size):
    print((" " * spaces) + ("#" * pounds))
    spaces -= 1
    pounds += 1