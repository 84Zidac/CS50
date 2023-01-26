try:
    points = int(input("How many points did you lose? "))
except:
    print("No dumbass, POINTS, like a number! Dont spell out the number, put in the digits!!")
    exit()
if points < 2:
    print("You lost fewer points than me.")
elif points > 2:
    print("You lost more points than me.")
else:
    print("We lost the same amount of points.")