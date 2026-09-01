# MRI-reconstruction-from-kspace
MATLAB script for reconstructing an MRI image from raw k-space data and comparing denoising filters.

## Overview

1. **Q2 – Reconstruction:** Reconstructs an image from k-space data (`dat`) using 2D inverse FFT (`ifft2` + `ifftshift`), displayed as a grayscale magnitude image.
2. **Q3 – Histograms:** Plots intensity histograms for four sample images in a 2×2 grid to compare their distributions.
3. **Q4.3–Q4.6 – Filters:** Applies four denoising filters to a test image (`lenna.jpg`, then `image2.png`):
   - Mean filter (3×3 box average)
   - Median filter (3×3)
   - Gaussian filter (3×3, weighted)
   - Non-local means filter
4. **Q47 – Evaluation:** Applies all four filters to the reconstructed MRI image and computes PSNR against a reference (`kneeMRI.jpg`), including a baseline PSNR for the unfiltered noisy image.

## Requirements

- MATLAB with the Image Processing Toolbox (`imnlmfilt`, `medfilt2`, `psnr`, `imhist`)
