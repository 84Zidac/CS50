try:
    x = int(input("Number: "))
except:
    print("No dumbass, a number! Dont spell the number, put the digits.")
    exit()
if x % 2 == 0:
    print("Even")
else:
    print("Odd")