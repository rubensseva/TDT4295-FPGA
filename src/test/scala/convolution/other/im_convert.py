import cv2
import numpy as np
import matplotlib as plt

def quarter_res_avg(im):

    original_width = im.shape[1]
    original_height = im.shape[0]

    width = original_width // 4
    height = original_height // 4

    resized_image = np.zeros(shape=(height, width, 3), dtype=np.uint8)

    scale = 4

    for i in range(0, original_height, scale):
        for j in range(0, original_width, scale):
           resized_image[i//scale, j//scale] = np.mean(im[i:i + scale, j:j+scale], axis=(0, 1))

    return resized_image

# im = rgb2gray(imread('image.png'))
im = cv2.imread("in.png", 1)
cv2.imwrite('out.png', quarter_res_avg(im))
