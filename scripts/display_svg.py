import os
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import tkinter as tk
from tkinter import filedialog
import cairosvg

# Constants
NUM_COLS = 10  # Number of columns in the grid

def list_svg_files(folder_path):
    """List all SVG files in the given folder."""
    svg_files = [file for file in os.listdir(folder_path) if file.endswith('.svg')]
    return svg_files

def convert_svg_to_png(svg_path, png_path):
    """Convert SVG file to PNG format."""
    cairosvg.svg2png(url=svg_path, write_to=png_path)

def display_svg_grid(folder_path, num_cols):
    """Display SVG files in a grid."""
    svg_files = list_svg_files(folder_path)
    num_files = len(svg_files)

    if num_files == 0:
        print("No SVG files found in the folder.")
        return

    num_rows = (num_files + num_cols - 1) // num_cols

    fig, axs = plt.subplots(num_rows, num_cols, figsize=(10, 10))

    for i, file_name in enumerate(svg_files):
        row = i // num_cols
        col = i % num_cols
        if num_rows > 1:
            ax = axs[row, col]
        else:
            ax = axs[col]  # Handle single row case

        svg_path = os.path.join(folder_path, file_name)
        png_path = f"temp_{i}.png"

        convert_svg_to_png(svg_path, png_path)

        image = mpimg.imread(png_path)
        ax.imshow(image)
        ax.axis('off')
        ax.set_title(os.path.basename(file_name))

        # Remove temporary PNG file
        os.remove(png_path)

    # Hide empty subplots
    for i in range(num_files, num_rows * num_cols):
        if num_rows > 1:
            row = i // num_cols
            col = i % num_cols
            axs[row, col].axis('off')
        else:
            axs[i].axis('off')

    plt.tight_layout()
    plt.show()

def select_folder():
    """Open a file dialog to select a folder."""
    root = tk.Tk()
    root.withdraw()  # Hide the main window
    folder_path = filedialog.askdirectory(title="Select Folder")
    return folder_path

def select_new_folder():
    """Callback function to select a new folder."""
    new_folder_path = select_folder()
    if new_folder_path:
        plt.close()  # Close the previous figure
        display_svg_grid(new_folder_path, NUM_COLS)

# Create the GUI
root = tk.Tk()
root.title("SVG Viewer")

# Display SVG files at startup
initial_folder = select_folder()
if initial_folder:
    display_svg_grid(initial_folder, NUM_COLS)

# Button to select a new folder
select_new_folder_button = tk.Button(root, text="Select New Folder", command=select_new_folder)
select_new_folder_button.pack(pady=10)

root.mainloop()
