import sys
filename = str(sys.argv[-1])
from haishoku.haishoku import Haishoku
dominant = Haishoku.getDominant(filename)
Haishoku.showPalette(filename)
print(dominant)
