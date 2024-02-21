from osgeo import gdal
from osgeo import gdalconst


def resample_tif(input_path, output_path, scale_factor):
    """
    Resample a GeoTIFF file to higher resolution using bilinear resampling.

    Parameters:
    - input_path: Path to the input GeoTIFF file.
    - output_path: Path to the output GeoTIFF file after resampling.
    - scale_factor: Scaling factor for the resolution. E.g., 2 means doubling the resolution.

    Returns:
    - None
    """

    # Open the input dataset
    input_ds = gdal.Open(input_path, gdalconst.GA_ReadOnly)

    if input_ds is None:
        raise Exception(f"Failed to open input file: {input_path}")

    # Get the input geotransform and dimensions
    geotransform = input_ds.GetGeoTransform()
    x_size, y_size = input_ds.RasterXSize, input_ds.RasterYSize

    # Calculate the new dimensions after resampling
    new_x_size = int(x_size * scale_factor)
    new_y_size = int(y_size * scale_factor)

    # Create the output dataset
    output_ds = gdal.GetDriverByName('GTiff').Create(output_path, new_x_size, new_y_size, input_ds.RasterCount)

    if output_ds is None:
        raise Exception(f"Failed to create output file: {output_path}")

    # Set the geotransform and projection
    output_ds.SetGeoTransform((geotransform[0], geotransform[1] / scale_factor, geotransform[2], geotransform[3],
                               geotransform[4], geotransform[5] / scale_factor))
    output_ds.SetProjection(input_ds.GetProjection())

    # Perform resampling using bilinear interpolation
    gdal.ReprojectImage(input_ds, output_ds, None, None, gdalconst.GRA_Bilinear)

    # Close the datasets
    input_ds = None
    output_ds = None


if __name__ == "__main__":
    input_tif = "precip.tif"
    output_tif = "precip2.tif"
    scale_factor = 2  # Adjust this based on your desired resolution

    resample_tif(input_tif, output_tif, scale_factor)
