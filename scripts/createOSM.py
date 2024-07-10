import csv
import os
import unicodedata
import sys

def is_latin_character(char):
    """
    Check if a character belongs to the Latin script.

    Args:
    char (str): The character to check.

    Returns:
    bool: True if the character is in the Latin script, False otherwise.
    """
    return unicodedata.category(char)[0] == 'L' and unicodedata.name(char).startswith('LATIN')

def choose_name(local_name, english_name):
    """
    Choose local name if all characters are Latin script otherwise use English name.

    Args:
    local_name (str): The local name.
    english_name (str): The English name.

    Returns:
    str: The chosen name.
    """
    if any(not is_latin_character(char) for char in local_name):
        return english_name
    return local_name


def read_csv_file(filename):
    """
    Read a CSV file containing columns with variable names in the first row and sort the data by ID.

    Args:
    filename (str): The name of the CSV file to read.

    Returns:
    list: A list of dictionaries containing the data from the CSV file, sorted by ID.
    """
    data = []
    with open(filename, 'r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            data.append(row)
    return sorted(data, key=lambda x: int(x['id']))


def generate_osm_xml(nodes):
    """
    Generate OpenStreetMap (OSM) XML format from a list of nodes.  For the name field, this will choose local if it
    is all LATIN characters, otherwise it will choose name_en.

    Args:
    nodes (list): A list of dictionaries representing nodes with various keys.  Must be sorted by ID.

    Returns:
    str: A string containing the OSM XML data.
    """
    xml_template = """<?xml version="1.0" encoding="UTF-8"?>
<osm version="0.6" generator="Python script">
{nodes}
</osm>"""

    node_template = """  <node id="{id}" lat="{lat}" lon="{lon}" version="1" changeset="1" timestamp="2024-05-06T00:00:00Z">
    {tags}
  </node>"""

    nodes_xml = ""
    for node in nodes:
        tags_xml = ""
        for key, value in node.items():
            if key != 'id' and key != 'lat' and key != 'lon':
                if key == 'name':
                    value = choose_name(value, node.get('name_en', ''))
                tags_xml += f'    <tag k="{key}" v="{value}"/>\n'
        nodes_xml += node_template.format(
            id=node['id'], lat=node['lat'], lon=node['lon'], tags=tags_xml
        ) + '\n'

    return xml_template.format(nodes=nodes_xml)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python program.py basename\nInput is basename.csv and output is basename.osm ")
        sys.exit(1)

    input_base = sys.argv[1]
    input_filename, output_filename = f"{input_base}.csv", f"{input_base}.osm"

    if not os.path.isfile(input_filename):
        current_dir = os.getcwd()
        print(f"Error: Input file '{input_filename}' does not exist in: {current_dir}")
        sys.exit(1)

    nodes_data = read_csv_file(input_filename)
    osm_xml = generate_osm_xml(nodes_data)

    with open(output_filename, 'w', encoding='utf-8') as outfile:
        outfile.write(osm_xml)

    print(f"OSM XML data written to {output_filename}")
