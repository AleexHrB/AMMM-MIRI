import re



def main():
    alpha = "0.40"
    i = "3"
    name = f"output_iteration_alpha={alpha}_{i}.log"
    f = open(name, "r")

    b = False
    for x in f:
        x = x.strip()

        if b:
            b = False
            num = re.search(r"\d+\.\d+", x)
            if num:
                val = str(float(num.group())).replace('.',',')
                print(val)
            else:
                print("0,00")
            
        if x == "GRASP":
            b = True


    f.close()



main()
