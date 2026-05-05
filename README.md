# Sentinel-1-Ground-Truth-Dataset-for-Coastline-Extraction

## 📌 Overview
This repository provides a multi-stage processing pipeline for Sentinel-1 SAR data, integrating ESA SNAP preprocessing, co-registration with external datasets using the ORFEO toolbox, and final data preparation in MATLAB.
The pipeline generates co-registered SAR imagery paired with corresponding binary masks, exported in `.mat` format for downstream analysis following the methodology proposed in  [IEEE GRSL paper](https://ieeexplore.ieee.org/document/11366898).
The dataset used in the paper is free-available and shared in [release section](https://github.com/impress-parthenope/Sentinel-1-Ground-Truth-Dataset-for-Coastline-Extraction/releases/tag/dataset).

if you find it useful and use it for you research, please cite as the following
```
@ARTICLE{11366898,
  author={Passarello, Gianpaolo and Vitale, Sergio and Ferraioli, Giampaolo and Pascazio, Vito},
  journal={IEEE Geoscience and Remote Sensing Letters}, 
  title={Sentinel-1 Ground Truth Dataset for Coastline Extraction}, 
  year={2026},
  volume={23},
  number={},
  pages={1-5},
  keywords={Coastlines;Sea measurements;Synthetic aperture radar;Image edge detection;Training;Europe;Deep learning;Sentinel-1;Pixel;Land surface;Coast detection;dataset;deep learning (DL);synthetic aperture radar (SAR)},
  doi={10.1109/LGRS.2026.3659009}}
```


## 🎯 Objectives

* Convert raw Sentinel-1 SAR data into analysis-ready products
* Perform accurate co-registration between SAR imagery and external datasets
* Generate aligned image–mask pairs for MATLAB-based processing

## 🛰️ Input Data

* Sentinel-1 SAR data (SLC format)
* External dataset for co-registration

## 📤 Outputs

* Co-registered SAR images
* Corresponding binary masks
* Final outputs stored in MATLAB `.mat` format

## ⚙️ Processing Workflow
<img width="500" alt="image" src="https://github.com/user-attachments/assets/edeac383-32db-41fb-8b69-98602c7ee630" />

### 1. SAR Preprocessing (SNAP)

Processing is performed using ESA SNAP:

* Deburst
* Terrain correction
* Export to GeoTIFF format

### 2. Co-Registration (ORFEO Toolbox)

* Import SAR GeoTIFF outputs
* Co-register SAR images with external dataset ([EEA](https://www.eea.europa.eu/en/datahub/datahubitem-view/af40333f-9e94-4926-a4f0-0a787f1d2b8f) and [EuHydro](https://land.copernicus.eu/en/products/eu-hydro) databases)
* Generate paired image–mask datasets

### 3. Final Processing (MATLAB)

* Load co-registered datasets
* Coastline edge detection and Refinement
* Optional image cropping
* Save data into `.mat` format
* Prepare outputs for analysis or model training


## 📦 Requirements

Ensure the following software is installed and configured:

* SNAP (with Sentinel-1 toolbox)
* MATLAB
* ORFEO Toolbox 8.1.1 Win64

## ▶️ Usage

### Step 1 – SNAP Processing

Process Sentinel-1 data and export GeoTIFF files.

### Step 2 – Co-Registration

Run ORFEO toolbox scripts to align the GeoTIFF files of SAR images extracted by SNAP with the external dataset.

### Step 3 – MATLAB Processing

```matlab
run('main_processing.m')
```

## 📁 Project Structure

```
project-root/
│
├── data/                # Input SAR and external datasets
├── snap_graphs/         # SNAP processing graphs (XML)
├── coregistration/      # ORFEO toolbox workflows
├── matlab/              # MATLAB scripts (.m)
├── outputs/             # Final .mat datasets
└── docs/                # Documentation
```

## ⚠️ Assumptions & Limitations

* Input SAR data must be Sentinel-1 SLC products
* Co-registration accuracy depends on external dataset quality
* Processing steps are not fully automated (manual SNAP stage required)

## 🔍 Notes

This pipeline is intended for generating aligned SAR–mask datasets, potentially suitable for machine learning applications such as classification or segmentation.

## 🤝 Contributing

1. Fork the repository
2. Create a new branch
3. Commit your changes
4. Open a pull request

## 📄 License

Specify license (e.g., MIT, GPL)

## 📧 Contact

Add your contact details or GitHub profile

An example of the reference generation is shown in the following:



<img width="800" height="300" alt="image" src="https://github.com/user-attachments/assets/1f9a9015-6510-4f07-a4f5-b36068f357e5" />


