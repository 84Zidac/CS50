
while True:
    try:
        n = int(input("Height: "))
        if n > 0:
            break
    except ValueError:
        print("Thats not an intiger!")
for i in range(n):
    print("#")
