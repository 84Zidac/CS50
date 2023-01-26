try:
    x = int(input("x: "))
except:
    print("Thats not an int!")
    exit()
try:
    y = int(input("y: "))
except:
    print("Thats not an INT!")
    exit()
z = x / y
print(z)