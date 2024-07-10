import os
import re
from tkinter import Canvas, Frame, Scrollbar
import tkinter as tk

import colour
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer

from mss_colors import ColorExtractor

carto_mss_style_files = [
    ]


def get_mss_filenames():
    project = read_lines("project.mml")  # Return all the lines in the file
    # We are interested in lines like '  - style/water-features.mss' and need to strip the leading dash
    if project is None:
        return []  # Return an empty list if the file is not found

    filtered_list = [re.match(r'\s*-\s*(.*)', s).group(1) for s in project if ".mss" in s]
    print(filtered_list)
    return filtered_list


def display_colors_from_files(canv, vscroll):
    color_dictionaries = []
    for file in carto_mss_style_files:
        lines = read_lines(file)  # Return all the lines in the file
        if lines is None:
            print("No .mss files found")
            return
        extractor = ColorExtractor()
        color_dict = extractor.extract_colors(lines)  # Extract the color definitions from the lines
        color_dictionaries.append((file, color_dict))  # Add the dictionary to list

    display_colors(color_dictionaries, canv, vscroll)  # Display all the colors found


WIDTH = 1300
HEIGHT = 400
COLUMNS = 10
ROW_SIZE = 40


def display_colors(color_dictionaries, canv, vscroll):
    # Display all the colors in the dictionary
    if not color_dictionaries:  # Check if color_dictionaries is empty
        # Display "No files found" text on the canvas
        canv.create_text(WIDTH / 2, HEIGHT / 2, text="No files found", font=('Arial', 16, 'bold'), fill="red")
        return

    row_idx = 0
    col_size = WIDTH // COLUMNS

    for file, color_dict in color_dictionaries:
        # display filename
        canv.create_text(WIDTH / 2, row_idx * ROW_SIZE + (ROW_SIZE // 2), text=file, font=('Arial', 12, 'bold'), width=WIDTH)
        row_idx += 1

        for idx, (name, color) in enumerate(sorted(color_dict.items(), key=lambda x: x[0])):
            col = idx % COLUMNS
            row = row_idx + idx // COLUMNS
            x1, y1 = col * col_size, row * ROW_SIZE
            x2, y2 = x1 + col_size, y1 + ROW_SIZE
            canv.create_rectangle(x1, y1, x2, y2, fill=color, outline="black")
            text_color = "black" if colour.Color(color).luminance > 0.5 else "white"
            canv.create_text((x1 + x2) / 2, (y1 + y2) / 2, text=name, fill=text_color, font=('Arial', 12), width=col_size)

        row_idx += (len(color_dict) // COLUMNS + 1)

    canv.config(yscrollcommand=vscroll.set, scrollregion=canv.bbox("all"))


def setup_display(width, height):
    # Setup the display
    rt = tk.Tk()
    rt.title("Color Display")
    rt.geometry(f"{width}x{height}")

    frame = Frame(rt)
    frame.pack(fill=tk.BOTH, expand=1)

    vscroll = Scrollbar(frame, orient=tk.VERTICAL)
    vscroll.pack(side="right", fill="y")

    canv = Canvas(frame, yscrollcommand=vscroll.set)
    canv.pack(fill=tk.BOTH, expand=1, side="left")
    vscroll.config(command=canv.yview)

    # Handle the touchpad two-finger scroll for Mac
    def on_touchpad_scroll(event):
        # Adjust the following scaling factor as needed
        scaling_factor = 1
        canv.yview_scroll(-1 * (event.delta * scaling_factor), "units")

    canv.bind("<MouseWheel>", on_touchpad_scroll)  # Bind the event
    return rt, canv, vscroll


def wrap_text(text, max_width):
    """
    Wrap text to fit within specified width.
    """
    lines = []
    for i in range(0, len(text), max_width):
        lines.append(text[i:i + max_width])
    return '\n'.join(lines)


def read_lines(file_path):
    # Read all the lines in the file
    try:
        with open(file_path) as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Warning: File '{file_path}' not found!")
        print(f"Current directory: {os.getcwd()}")
        print("Directory should be: openstreetmap-carto")
        return None
    return lines


def on_close():
    observer.stop()
    observer.join()
    root.destroy()


class FileChangeHandler(FileSystemEventHandler):
    def __init__(self, callback, *args, **kwargs):
        super().__init__()
        self.callback = callback
        self.args = args
        self.kwargs = kwargs

    def on_modified(self, event):
        # File Modified
        if event.is_directory:
            return
        self.callback(*self.args, **self.kwargs)


if __name__ == "__main__":
    print(f"Directory: {os.getcwd()}")
    carto_mss_style_files = get_mss_filenames()  # Get names of MSS files from project.mml

    root, canvas, vscrollbar = setup_display(WIDTH + 20, ROW_SIZE * 20)
    # Initial display of the colors
    display_colors_from_files(canvas, vscrollbar)

    # Monitor for file changes and redisplay
    event_handler = FileChangeHandler(display_colors_from_files, canvas, vscrollbar)
    observer = Observer()
    observer.schedule(event_handler, path=os.getcwd(), recursive=True)
    observer.start()
    # Ensure that observer is properly stopped when root window is closed
    root.protocol("WM_DELETE_WINDOW", on_close)

    try:
        root.mainloop()
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
