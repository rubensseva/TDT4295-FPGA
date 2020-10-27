width = 10
height = 10 

template = [0, 50, 100, 200]

out_path = "/home/katt/Desktop/image.txt"

with open(out_path, 'w') as file:
    index = 0
    for i in range(width):
        for j in range(height):
            if (i < int(width / 2)) and (j < int(width / 2)):
                index = 0 
            elif (i < int(width / 2)) and (j >= int(width / 2)):
                index = 1 
            elif (i >= int(width / 2)) and (j < int(width / 2)):
                index = 2 
            elif (i >= int(width / 2)) and (i >= int(width / 2)):
                index = 3 
            file.write("{}.U(16.W), ".format(str(template[index])))
        file.write("\n")

