from cs50 import get_int

howMany = get_int("How many scores do you want to average? ")

scores = []
for i in range(howMany):
    scores += [score = get_int("Score: ")]

average = sum(scores) / len(scores)
print(f"Avarage: {average}")