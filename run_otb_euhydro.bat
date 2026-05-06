@echo off 

<OTB_PATH>\OTB-8.1.1-Win64\bin\\otbcli_Rasterization.bat -in <EUHydro_PATH>\EUHYDRO_Coastline_EEA39_v012\Shapefile\EUHYDRO_Coastline_EEA39_v012.shp -out <Out_PATH>\Masks\SARVH_mask.tif -mode.binary.foreground 1.0 -im <SAR_TIFF_PATH>\SARVH.tif 