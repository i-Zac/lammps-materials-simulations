# LAMMPS Molecular Dynamics on Google Colab with GPU Acceleration

## Overview
This notebook provides a complete workflow for running LAMMPS molecular dynamics simulations on Google Colab when facing hardware limitations on local systems. It leverages Colab's free Tesla T4 GPU to accelerate computations that would be impractical on typical personal computers.

## Key Features
- **GPU-accelerated LAMMPS** installation
- **System specification checks** to verify available resources
- **Pre-built packages** for quick setup
- **Tensile test simulation** example for Al-Cu alloy
- **Performance optimization** for Colab's environment

## Hardware Limitations Overcome
| Local System Limitation | Colab Solution |
|-------------------------|----------------|
| Limited CPU cores       | 2 vCPUs + GPU  |
| Insufficient RAM        | 12GB available |
| No GPU acceleration    | Tesla T4 GPU   |
| Storage constraints    | 1TB temporary  |

## Setup Instructions

### 1. Enable GPU Acceleration
```bash
Edit > Notebook Settings > Hardware accelerator > GPU
```
### 2. Install Required Packages
```bash
!sudo add-apt-repository ppa:gladky-anton/lammps
!sudo add-apt-repository ppa:openkim/latest
!sudo apt update
!sudo apt-get install lammps-stable lammps-stable-doc lammps-stable-data openkim-models
```
### 3. Verify Installation
```bash 
!nvidia-smi
!lscpu
```
## Running Simulations
**Example Tensile Test**
```bash
!mpirun --allow-run-as-root -n 1 lmp_stable -sf gpu -pk gpu 1 neigh no newton off -in Al10Cu_Tensile.lmp
```
## Performance Notes
- Achieves ~1,500 timesteps/second on 4,000 atoms
- GPU utilization shown through runtime diagnostics
- Mixed precision mode for optimal performance

## Troubleshooting
**Common Issues**
1. **GPU not detected:**
   - Reset runtime (Runtime > Factory reset runtime)
   - Verify GPU is enabled in notebook settings
2. **Memory errors:**
   - Reduce system size in input script
   - Use -pk gpu 1 to limit GPU memory usage
3. **Package installation failures:**
   - Restart runtime and try again
   -  Use !apt --fix-broken install

## Performance Comparison

| Metric           | Local System (4-core) | Colab (T4 GPU) |
|------------------|----------------------|----------------|
| Timesteps/sec    | ~200                 | ~1,500         |
| Energy calc time | 15ms/step            | 4ms/step       |
| Memory available | Typically <8GB       | 12GB           |

## References
- LAMMPS Documentation: https://docs.lammps.org/
- NIST Interatomic Potentials: https://www.ctcms.nist.gov/potentials/
- Google Colab GPU specs: https://research.google.com/colaboratory/faq.html
