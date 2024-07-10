from concurrent.futures import ThreadPoolExecutor
import os
import subprocess
import sys


def extract_nodes(name, folder):
    osmosis_command = ["osmosis", "--read-pbf", os.path.join(folder, f"{name}.osm.pbf"), "--tf",
                       "accept-nodes", "place=city,suburb,island",
                       "natural=mountain_range,peak,volcano,bay,desert,valley,geyser",
                       "man_made=lighthouse", "amenity=university,marketplace",
                       "historic=castle,district", "--tf", "reject-ways", "--tf",
                       "reject-relations", "--write-xml",
                       os.path.join(directory, f"{name}.nodes.osm")]
    process = subprocess.run(osmosis_command, check=True, capture_output=True, text=True)
    print(process.stdout)


def extract_ways(name, folder):
    osmosis_command = ["osmosis", "--read-pbf", os.path.join(folder, f"{name}.osm.pbf"), "--tf",
                       "accept-ways", "natural=glacier,desert", "railway=rail,subway,light_rail",
                       "highway=motorway", "water=reservoir,river,lake", "waterway=river",
                       "landuse=retail,commercial", "boundary=national_park", "--used-node", "--tf",
                       "reject-ways", "usage=branch,science,industrial,military,test",
                       "service=siding,crossover,yard,spur", "--write-xml",
                       os.path.join(directory, f"{name}.ways.osm")]
    process = subprocess.run(osmosis_command, check=True, capture_output=True, text=True)
    print(process.stdout)


def run_osmosis_parallel(folder, filenames):
    with ThreadPoolExecutor() as executor:
        futures = []
        for name in filenames:
            futures.append(executor.submit(extract_nodes, name, folder))
            futures.append(executor.submit(extract_ways, name, folder))
        for future in futures:
            future.result()


if __name__ == "__main__":
    directory = sys.argv[1]
    file_list = sys.argv[2]
    print (f"Dir={directory} File list={file_list}")
    with open(os.path.join(directory, file_list)) as f:
        files = f.read().splitlines()
    print(files)
    run_osmosis_parallel(directory, files)
