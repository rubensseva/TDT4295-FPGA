import cv2
import numpy as np
import matplotlib as plt

def scale_image(im, scale):
    original_height = im.shape[0]
    original_width = im.shape[1]
    resized_image = np.zeros(shape=(original_height // scale, original_width // scale, 3), dtype=np.uint8)

    for i in range(0, original_height, scale):
        for j in range(0, original_width, scale):
            if i + scale < original_height and j + scale < original_width:
                resized_image[i//scale, j//scale] = np.mean(im[i:i + scale, j:j+scale], axis=(0, 1))

    return resized_image

def image2scala(im):
    colours= ["R", "G", "B"]
    for k in range(3):
        out_path = colours[k] + ".txt"
        with open(out_path, 'w') as file:
            file.write(" "*4)
            file.write("val image{} = RegInit(VecInit(\n".format(colours[k]))
            for i in range(im.shape[0]):
                file.write(" "*8)
                for j in range(im.shape[1]):
                    file.write("{}.U(4.W),".format(str(im[i][j][k] * 15 // 255)))
                file.write("\n")
            file.write(" "*4)
            file.write("))\n")

# Controls:
grey_scale = False
path_in = "crab.png"
path_out = "out.png"
scale = 1  

# Main:
if grey_scale:
    im_in = rgb2gray(imread(path_in, 1))
else:
    im_in = cv2.imread(path_in, 1)
print("going from {}x{} to {}x{}".format(im_in.shape[0], im_in.shape[1], im_in.shape[0] // scale, im_in.shape[1] // scale))
im_out = scale_image(im_in, scale)
cv2.imwrite(path_out, im_out)
image2scala(im_out)
