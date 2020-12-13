# fontpath

Outputs the path to the font-file for a given font name. Uses the macOS font library. Accepts font-family names (*Futura*) and font-style names (*Futura Medium Italic* or *Futura-MediumItalic*).

## Usage

Resolve the path of a single font using arguments:

```sh
$ fontpath Zapfino
/System/Library/Fonts/Supplemental/Zapfino.ttf
$ fontpath "Avenir Next"
/System/Library/Fonts/Avenir Next.ttc
```

Read from standard-input:

```sh
$ fontpath
Menlo
/System/Library/Fonts/Menlo.ttc
PT Serif
/System/Library/Fonts/Supplemental/PTSerif.ttc
```

Read from standard-input via pipe:

```sh
$ echo -e "Skia\nHoefler Text\nKohinoor Devanagari" | fontpath
/System/Library/Fonts/Supplemental/Skia.ttf
/System/Library/Fonts/Supplemental/Hoefler Text.ttc
/System/Library/Fonts/Kohinoor.ttc
```

In a sub-shell when working with other programs:

```sh
$ hb-view $(fontpath Damascus) "١ ٢ ٣ ٤ ٥ ٦ ٧ ٨ ٩ ٠"
```
