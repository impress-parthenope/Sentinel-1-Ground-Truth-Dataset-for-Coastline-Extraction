@echo off 

<OTB_PATH>\OTB-8.1.1-Win64\bin\\otbcli_Rasterization.bat -in <EEA_PATH>\EEA_Coastline_Polyline_Shape\Europe_coastline_raw_rev2017.shp -out <Out_PATH>\Masks\<filename>_mask2.tif -mode.binary.foreground 1.0 -im <SAR_TIFF_PATH>\<filename>.tif
