# Multi-Scale-Edge-Based-SSIM(MS-ESSIM)
It is the repository of an objective image quality assessment: Multi-Scale Edge-Based SSIM. All the codes are MATLAB codes and it is the first project of Digital Image Processing course.

# Functions
All the functions can be used for 2D gray images, we didn't try them on 3D color images.

### ms_essim.m
It is the overall function to calculate the MS-ESSIM value of an image. 
It needs several functions in the same file:
+ img2edge.m calculate the edge image of an original image.
+ mean_img.m calculate the average of an image block.
+ var_img.m calculate the variance of an image block.
+ convar_img.m calculate the covariance of two different image blocks.
+ edge_ssim.m calculate the ESSIM of an image block.

### ms_ssim.m
It is the overall functon to calculate the Multi-Scale SSIM of an image.
It needs several functions in the same file:
+ mean_img.m calculate the average of an image block.
+ var_img.m calculate the variance of an image block.
+ convar_img.m calculate the covariance of two different image blocks.
+ ssim.m calculate the SSIM of an image block.
+ mean_ssim.m calculate the average of blocks' SSIM values in an image.
