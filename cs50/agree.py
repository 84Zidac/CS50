s = input("Do you agree? ")
if s.lower() in ["y", "yes"]:
    print("Agree")
elif s.lower() in ["n", "no"]:
    print("Disagree")
else:
    print("Yes or no, its that easy, try again")
