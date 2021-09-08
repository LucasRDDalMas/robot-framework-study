import requests

def random_number():
    response = requests.get("http://www.randomnumberapi.com/api/v1.0/random")
    res = response.json()
    num = int(res[0])
    
    print("------------")
    print(num)
    print("------------")

    if num % 2 == 0:
        return True

    return False
