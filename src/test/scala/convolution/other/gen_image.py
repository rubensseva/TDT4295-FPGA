width = 256
height = 144 

template = [0, 4, 8, 15]

out_path = "./image.txt"

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
            file.write("{}.U(4.W), ".format(str(template[index])))
        file.write("\n")

