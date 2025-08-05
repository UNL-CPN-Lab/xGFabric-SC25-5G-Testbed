# xGFabric-SC25-5G-Testbed

This repository contains artifacts and scripts used in the experiments presented in *xGFabric-SC25-5G-Testbed*.

- **`data/`** – Contains all the raw data generated from the experiments.
- **`visualize/`** – Includes the Jupyter Notebook (`.ipynb`) used for data processing and visualization.
- **`build-*G-network/`** – Contains Dockerfiles and related scripts for building and deploying the 4G/5G network.

## How to Reproduce the Plots

To generate the figures from the paper:

1. Open a terminal and navigate to the `visualize/` directory:
   ```bash
   cd visualize/
2. Launch Jupyter Notebook:
    ```bash 
    jupyter notebook
3. Run all cells

The visualizations are rendered directly within the notebook cells and also saved as image files in the same visualize/ directory.