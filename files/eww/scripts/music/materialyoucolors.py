from material_color_utilities_python import *
import sys

img = Image.open(str(sys.argv[-1]))
basewidth = 64
wpercent = (basewidth/float(img.size[0]))
hsize = int((float(img.size[1])*float(wpercent)))
img = img.resize((basewidth,hsize),Image.Resampling.LANCZOS)

theme = themeFromImage(img)
themePalette = theme.get("palettes")
themePalettePrimary = themePalette.get("primary")
print(hexFromArgb(themePalettePrimary.tone(40)))
print(hexFromArgb(themePalettePrimary.tone(90)))
print(hexFromArgb(themePalettePrimary.tone(10)))
