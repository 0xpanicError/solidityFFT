import numpy as np
import matplotlib.pyplot as plt

# Given complex points
points = [0 + 0j, 1 + 1j, 3 + 3j, 4 + 4j, 4 + 4j, 3 + 3j, 1 + 1j, 0 + 0j]

# Compute FFT
fft_result = np.fft.fft(points)

# Frequencies corresponding to FFT result
frequencies = np.fft.fftfreq(len(fft_result))

# Plot
plt.figure(figsize=(10, 5))

# Magnitude Spectrum
plt.subplot(1, 2, 1)
plt.bar(frequencies, np.abs(fft_result), width=0.1)
plt.title("Magnitude Spectrum")
plt.xlabel("Frequency")
plt.ylabel("Magnitude")

# Phase Spectrum
plt.subplot(1, 2, 2)
plt.bar(frequencies, np.angle(fft_result), width=0.1)
plt.title("Phase Spectrum")
plt.xlabel("Frequency")
plt.ylabel("Phase (Radians)")

plt.tight_layout()
plt.show()
