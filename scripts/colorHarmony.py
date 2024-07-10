import sys
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QColorDialog, QLabel
from PyQt6.QtGui import QColor

class ColorPalette(QWidget):
    def __init__(self):
        super().__init__()

        self.setWindowTitle('Color Palette')
        self.layout = QVBoxLayout(self)

        self.color_label = QLabel('Initial Color')
        self.layout.addWidget(self.color_label)

        self.pick_button = QPushButton('Pick Color')
        self.pick_button.clicked.connect(self.pick_color)
        self.layout.addWidget(self.pick_button)

        self.complementary_label = QLabel('Complementary Color:')
        self.layout.addWidget(self.complementary_label)

        self.analogous_label = QLabel('Analogous Colors:')
        self.layout.addWidget(self.analogous_label)

        self.triadic_label = QLabel('Triadic Colors:')
        self.layout.addWidget(self.triadic_label)

    def pick_color(self):
        color = QColorDialog.getColor()
        if color.isValid():
            self.color_label.setStyleSheet(f'background-color: {color.name()}')

            complementary_color = color.toHsv()
            complementary_color.setHsv(complementary_color.hue() + 180, complementary_color.saturation(), complementary_color.value())
            self.complementary_label.setStyleSheet(f'background-color: {complementary_color.name()}')

            analogous_color1 = color.toHsv()
            analogous_color1.setHsv((analogous_color1.hue() + 30) % 360, analogous_color1.saturation(), analogous_color1.value())
            analogous_color2 = color.toHsv()
            analogous_color2.setHsv((analogous_color2.hue() - 30) % 360, analogous_color2.saturation(), analogous_color2.value())
            self.analogous_label.setStyleSheet(f'background-color: {analogous_color1.name()}; color: {analogous_color2.name()}')

            triadic_color1 = color.toHsv()
            triadic_color1.setHsv((triadic_color1.hue() + 120) % 360, triadic_color1.saturation(), triadic_color1.value())
            triadic_color2 = color.toHsv()
            triadic_color2.setHsv((triadic_color2.hue() - 120) % 360, triadic_color2.saturation(), triadic_color2.value())
            self.triadic_label.setStyleSheet(f'background-color: {triadic_color1.name()}; color: {triadic_color2.name()}')

            self.complementary_label.setText(f'Complementary Color: {complementary_color.name()}')
            self.analogous_label.setText(f'Analogous Colors: {analogous_color1.name()}, {analogous_color2.name()}')
            self.triadic_label.setText(f'Triadic Colors: {triadic_color1.name()}, {triadic_color2.name()}')

if __name__ == '__main__':
    app = QApplication(sys.argv)
    palette = ColorPalette()
    palette.show()
    sys.exit(app.exec())
