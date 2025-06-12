# Copper (Cu) Structure Generation and Casting Simulation

This project includes:
1. A batch script to generate perfect FCC copper crystal structures (`Cu(1).bat`)
2. A LAMMPS script for simulating copper casting (`cucast(1).lammps`)

## Part 1: Structure Generation (`Cu (1).bat`)
This batch script uses Atomsk to create a perfect single-crystal copper (Cu) structure in LAMMPS data format for molecular dynamics simulations.

## Description
The script performs the following operations:
1. Creates an FCC copper lattice with:
   - Lattice parameter: 3.61 Å (experimental value for Cu)
   - Crystallographic orientation: [100], [010], [001]
2. Duplicates the unit cell to create a 10×10×10 supercell
3. Outputs the structure in LAMMPS data format (renamed from .lmp to .lmpdat)

### Usage
1. Run `Cu (1).bat` (requires [Atomsk](https://atomsk.univ-lille.fr/))
2. Output: `purecu.lmpdat` (LAMMPS data file)

## Suggested Applications

This pristine copper structure is ideal for:
- Basic MD simulations of pure metals
- Elastic property calculations
- Thermal conductivity studies
- Dislocation nucleation research
- Reference structure for defect generation
- Educational purposes in materials science

## Visualization Tips

To view the generated structure:
1. Use OVITO (https://www.ovito.org/)
2. Load the .lmpdat file
3. Enable "Coordination analysis" to verify FCC structure
4. Use "Polyhedral template matching" to confirm crystal orientation

## Part 2: Casting Simulation (`cucast(1).lammps`)

### Simulation Stages
1. **Initialization**
   - Loads `purecu.lmpdat`
   - Uses EAM potential (`Cu_mishin1.eam.alloy`)
   - Energy minimization

2. **Melting Phase**
   - Heats from 273K → 1600K (NPT ensemble)
   - Runs for 400,000 steps (400 ps)

3. **Equilibration**
   - Holds at 1600K (NVT ensemble)
   - Runs for 300,000 steps (300 ps)

4. **Cooling Phase**
   - Cools from 1600K → 273K at ~4K/ps (NPT)
   - Pressure control: 0.004 bar (simulating casting pressure)
   - Runs for 300,000 steps (300 ps)

5. **Final Solidification**
   - Equilibrates at 273K (NPT)
   - Runs for 300,000 steps (300 ps)

### Output Files
- `dump.cast3.*`: Trajectory files (every 500 steps)
- `tmp1.rdf`: Radial distribution function data
- `cu.lmpdat`: Final structure
- `cu.rest`: Restart file

## Requirements
- [Atomsk](https://atomsk.univ-lille.fr/) (for structure generation)
- [LAMMPS](https://www.lammps.org/) (for MD simulation)
- EAM potential file: `Cu_mishin1.eam.alloy`

## Execution Workflow
1. Generate structure:
   ```bash
   Cu(1).bat
2. Run simulation:
   ```bash
   lmp_mpi -in casting.in


## Customization
**Structure Generation**
  - Modify lattice constant/size in Cu(1).bat
  - Change orientation by editing [100] [010] [001]

**Simulation**
  - Change cooling rate in fix 4 (currently ~4K/ps)
  - Modify output frequency in dump and thermo commands

## Visualization
**Recommended tools:**
  - OVITO (for trajectory analysis)
  - VMD (for RDF visualization)

## Troubleshooting

1. **Atomsk not found:**
   - Ensure Atomsk is in system PATH
   - Or use full path to atomsk executable

2. **Missing potential file:**
   - Download Cu_mishin1.eam.alloy from NIST Interatomic Potentials Repository

1. **LAMMPS errors:**
   - Check log.lammps for detailed error messages
   - Verify unit consistency (metal units used)

## References
- Mishin EAM potential for Cu [DOI: 10.1103/PhysRevB.63.224106](https://doi.org/10.1103/PhysRevB.63.224106)
- LAMMPS documentation: https://docs.lammps.org/
