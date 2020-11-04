import numpy as np
import matplotlib.pyplot as plt 

width = 6 
height = 6 
kernel_dim = 3
norm = 1
          # [1, 1, 1],
          # [1, 1, 1],
          # [1, 1, 1],
KERNEL = np.array(
         [
          [0, -1, 0],
          [-1, 4, -1],
          [0, -1, 0],
         ]
        )
IMAGE  = np.array(
         [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 15, 15, 15, 0],
          [0, 0, 15, 15, 15, 0],
          [0, 0, 15, 15, 15, 0],
          [0, 0, 0, 0, 0, 0],
         ]
        )

OUT  = np.zeros([height, width])

out_path = "./convolved.txt"

with open(out_path, 'w') as file:
    index = 0
    for i in range(height):
        for j in range(width):
            il = i-kernel_dim//2
            ir = i+kernel_dim//2 + 1
            jl = j-kernel_dim//2
            jr = j+kernel_dim//2 + 1
            kil = 0 
            kir = kernel_dim
            kjl = 0 
            kjr = kernel_dim
            if il < 0:
                kil += kernel_dim // 2 
                il = 0
            if ir > height:
                kir -= kernel_dim // 2
                ir = height  
            if jl < 0:
                kjl += kernel_dim // 2 
                jl = 0
            if jr > width:
                jr = width  
                kjr -= kernel_dim // 2 
            image = IMAGE[il:ir, jl:jr]
            kernel = KERNEL[kil:kir, kjl:kjr]
            OUT[i,j] = np.sum(image * kernel)
    OUT = np.abs(OUT)//4
    file.write("{}".format(str(OUT//norm)))
    file.write("\n")

print(OUT)
plt.imshow(OUT)
plt.show()
