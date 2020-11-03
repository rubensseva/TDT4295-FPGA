width = 16
height = 12 

template = [0, 4, 8, 15]

out_path = "./image.txt"

with open(out_path, 'w') as file:
    index = 0
    file.write(" "*4)
    file.write("val image = VecInit(\n")
    for i in range(height):
        file.write(" "*8)
        for j in range(width):
            if (i < height // 2) and (j < width // 2):
                index = 0 
            elif (i < height // 2) and (j >= width // 2):
                index = 1 
            elif (i >= height // 2) and (j < width // 2):
                index = 2 
            elif (i >= height // 2) and (j >= width // 2):
                index = 3 
            file.write("{}.U(4.W),".format(str(template[index])))
        file.write("\n")
    file.write(" "*4)
    file.write(")\n")

