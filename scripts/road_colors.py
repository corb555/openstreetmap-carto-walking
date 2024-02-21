from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QLabel, QLineEdit, QPushButton, QColorDialog
from PyQt6.QtGui import QColor

class ColorDisplayApp(QWidget):
    def __init__(self, base_color, num_colors, r_delta, g_delta, b_delta):
        super().__init__()

        self.base_color = QColor(base_color)
        self.num_colors = num_colors
        self.r_delta = r_delta
        self.g_delta = g_delta
        self.b_delta = b_delta

        self.init_ui()

    def init_ui(self):
        layout = QVBoxLayout()

        # Editable row for delta values
        delta_layout = QHBoxLayout()
        delta_labels = ["R Delta:", "G Delta:", "B Delta:"]
        self.delta_inputs = [QLineEdit(str(self.r_delta)), QLineEdit(str(self.g_delta)), QLineEdit(str(self.b_delta))]
        for label, delta_input in zip(delta_labels, self.delta_inputs):
            delta_layout.addWidget(QLabel(label))
            delta_layout.addWidget(delta_input)
        update_delta_button = QPushButton("Update Deltas")
        update_delta_button.clicked.connect(self.update_deltas)
        delta_layout.addWidget(update_delta_button)
        layout.addLayout(delta_layout)

        # Display base color with editable QLineEdit
        base_color_input = QLineEdit(self.base_color.name())
        base_color_input.setMaxLength(7)
        base_color_input.setFixedWidth(100)
        base_color_label = self.create_color_label(self.base_color)
        update_button = QPushButton("Base Color")
        update_button.clicked.connect(self.update_base_color)

        base_color_layout = QHBoxLayout()

        base_color_layout.addWidget(base_color_label)
        base_color_layout.addWidget(update_button)
        base_color_layout.addWidget(base_color_input)

        layout.addLayout(base_color_layout)

        # Display subsequent colors with hex values in a column
        for i in range(1, self.num_colors + 1):
            color = self.calculate_color(i)
            color_label = self.create_color_label(color)
            hex_label = QLabel(f" {color.name()}")

            color_layout = QHBoxLayout()
            color_layout.addWidget(color_label)
            color_layout.addWidget(hex_label)

            layout.addLayout(color_layout)

        self.setLayout(layout)
        self.setWindowTitle("Color Display App")

    def calculate_color(self, step):
        return QColor(
            min(255, self.base_color.red() + step * self.r_delta),
            min(255, self.base_color.green() + step * self.g_delta),
            min(255, self.base_color.blue() + step * self.b_delta)
        )

    def create_color_label(self, color):
        color_label = QLabel()
        color_label.setFixedSize(200, 20)
        color_label.setStyleSheet(f"background-color: {color.name()};")
        return color_label

    def update_base_color(self):
        new_color = QColorDialog.getColor(self.base_color, self, "Select Color")
        if new_color.isValid():
            self.base_color = new_color
            self.update_ui()

    def update_deltas(self):
        try:
            self.r_delta = int(self.delta_inputs[0].text())
            self.g_delta = int(self.delta_inputs[1].text())
            self.b_delta = int(self.delta_inputs[2].text())
            self.update_ui()
        except ValueError:
            print("Invalid delta values. Please enter integers.")

    def update_ui(self):
        # Update subsequent color labels with new base color
        for i in range(1, self.num_colors + 1):
            color = self.calculate_color(i)
            color_label = self.layout().itemAt(i + 1).layout().itemAt(0).widget()
            hex_label = self.layout().itemAt(i + 1).layout().itemAt(1).widget()
            color_label.setStyleSheet(f"background-color: {color.name()};")
            hex_label.setText(f"Hex: {color.name()}")


if __name__ == "__main__":
    app = QApplication([])
    base_color = "#c4bf99"
    num_colors = 6
    r_delta, g_delta, b_delta = 10, 10, 16

    color_display_app = ColorDisplayApp(base_color, num_colors, r_delta, g_delta, b_delta)
    color_display_app.show()

    app.exec()
