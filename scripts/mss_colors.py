import re
import colour
import webcolors


class ColorExtractor:
    def __init__(self):
        self.color_dict = {}

    def extract_colors(self, lines):
        for idx, line in enumerate(lines):
            name, color = self.extract_color(line)
            if color:
                self.color_dict[name] = color
        return self.color_dict

    def extract_color(self, line):
        # Match an "@" color definition in MSS with CCS hex or color name plus lighten/darken
        pattern = r"\s*@([\w-]+):\s*(?:(lighten|darken)\(([#@\w-]+),\s*([\d]+)%*\)|(@?#?[\w\d-]+));"
        match = re.match(pattern, line)
        if not match:
            return "", None

        name, adj_mode, adj_color, adj_percent, color = match.groups()

        if adj_mode:
            base_color = self.get_hex_color(adj_color)
            return name, self.adjust_luminance(base_color, int(adj_percent), adj_mode)
        else:
            return name, self.get_hex_color(color)

    def get_hex_color(self, color_name):
        if color_name.startswith('@'):
            return self.color_dict.get(color_name[1:])

        try:
            if color_name.startswith('#'):
                return webcolors.normalize_hex(color_name)
            else:
                return webcolors.name_to_hex(color_name)
        except ValueError:
            return None

    @staticmethod
    def adjust_luminance(base_color, percent, mode):
        color_obj = colour.Color(base_color)
        sign = 1 if mode == 'lighten' else -1
        color_obj.luminance = max(0, min(1, color_obj.luminance + sign * percent / 100))
        return color_obj.hex
