width = 16
height = 12 

r = [15, 0, 0, 15]
g = [0, 15, 0, 15]
b = [0, 0, 15, 15]
templates = [r, g, b]
out_paths = ["r.txt", "g.txt", "b.txt"]
k=0
for template in templates:
    out_path = out_paths[k] 
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
    k += 1

