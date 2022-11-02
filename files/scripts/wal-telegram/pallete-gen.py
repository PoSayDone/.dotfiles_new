#!/usr/bin/env python3

import sys
import os
import os.path

CONSTANTS = "colors.tpg-constants"
OUT_NAME = "colors.tdesktop-palette"
WAL_COLORS = os.path.expanduser("~/.cache/wal/colors")
OUT_DIR = os.path.expanduser("~/.cache/telegram-palette-gen")

SCALES = [
    ("20", float(1/5)),
    ("30", float(3/10)),
    ("40", float(2/5)),
    ("50", float(1/2)),
    ("60", float(3/5)),
]

ALPHAS = {
    0: [0x18, 0x3C, 0x03, 0x7F, 0xB0, 0xCC, 0x00, 0x54, 0x56, 0x74, 0x40, 0x4C, 0xB2],
    1: [0x10, 0x33],
    2: [0xC8, 0x4C, 0x7F, 0x00, 0x87],
    3: [0x64],
    7: [0x53, 0x7A, 0x1A, 0x2C, 0x7F, 0xBC, 0x4C, 0x6B, 0x14],
}


def clr2hex(c):
    return "#{:02X}{:02X}{:02X}".format(c[0], c[1], c[2])


def clr2hex_alpha(c, a):
    return "#{:02X}{:02X}{:02X}{:02X}".format(c[0], c[1], c[2], a)


def color(idx, c):
    return "color{}: {};".format(idx, clr2hex(c))


def color_light(idx, scale, c):
    return "colorLighter{}_{}: {};".format(idx, scale, clr2hex(c))


def color_dark(idx, scale, c):
    return "colorDarker{}_{}: {};".format(idx, scale, clr2hex(c))


def color_alpha(idx, alpha, c):
    return "colorAlpha{}_{:02x}: {};".format(idx, alpha, clr2hex_alpha(c, alpha))


def hex2clr(h):
    c = h[1:]
    return (
        int(c[0:2], 16),
        int(c[2:4], 16),
        int(c[4:6], 16),
    )


def clamp_byte(v, vmin, vmax):
    if v < vmin: v = vmin
    elif v > vmax: v = vmax
    return v


def scale_byte(b, s):
    f = float(b)
    v = int(f + (f*s))
    return clamp_byte(v, 0, 255)


def scale_color(c, s):
    return (
        scale_byte(c[0], s),
        scale_byte(c[1], s),
        scale_byte(c[2], s),
    )


def load_colors(colors_path, limit=9):
    with open(colors_path, mode="rt", encoding="utf-8") as fd:
        return [hex2clr(fd.readline()) for _ in range(limit)]


def load_constants(name=CONSTANTS):
    cpath = os.path.join(
        os.path.dirname(os.path.realpath(__file__)),
        name,
    )

    with open(cpath, mode="rt", encoding="utf-8") as fd:
        return fd.read()


def dump_colors(values, constants):
    if not os.path.exists(OUT_DIR):
        os.mkdir(OUT_DIR)

    opath = os.path.join(OUT_DIR, OUT_NAME)
    if os.path.exists(opath):
        os.remove(opath)

    with open(opath, mode="wt", encoding="utf-8") as fd:
        fd.write("\n".join(values))
        fd.write("\n\n" + constants)


def main(args):
    if not os.path.exists(WAL_COLORS):
        print("no wal colors cache has been found!")
        return 1

    values = []

    for i, c in enumerate(load_colors(WAL_COLORS)):
        values.append(color(i, c))

        for n, v in SCALES:
            values.append(color_light(i, n, scale_color(c, v)))
            values.append(color_dark(i, n, scale_color(c, -v)))

        if i not in ALPHAS:
            continue

        for a in ALPHAS[i]:
            values.append(color_alpha(i, a, c))

    dump_colors(values, load_constants())

    print("[+] OK")

    return 0


sys.exit(main(sys.argv))
