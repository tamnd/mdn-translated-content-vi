---
title: "FontData: blob() method"
short-title: blob()
slug: Web/API/FontData/blob
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FontData.blob
---

{{APIRef("Local Font Access API")}}{{SeeCompatTable}}

Phương thức **`blob()`** của giao diện {{domxref("FontData")}} trả về {{jsxref("Promise")}} được thực hiện với {{domxref("Blob")}} chứa các byte thô của tệp phông chữ cơ bản.

## Cú pháp

```js-nolint
blob()
```

### Tham số

Không có.

### Giá trị trả về

{{jsxref("Promise")}} được thực hiện với {{domxref("Blob")}} chứa các byte thô của tệp phông chữ cơ bản.

## Ví dụ

Phương thức `blob()` cung cấp quyền truy cập vào dữ liệu [SFNT](https://en.wikipedia.org/wiki/SFNT) cấp thấp, đây là định dạng tệp phông chữ có thể chứa các định dạng phông chữ khác như PostScript, TrueType, OpenType hoặc Web Open Font Format (WOFF).

```js
async function computeOutlineFormat() {
  try {
    const availableFonts = await window.queryLocalFonts({
      postscriptNames: ["ComicSansMS"],
    });
    for (const fontData of availableFonts) {
      // `blob()` returns a Blob containing valid and complete
      // SFNT-wrapped font data.
      const sfnt = await fontData.blob();
      // Slice out only the bytes we need: the first 4 bytes are the SFNT
      // version info.
      // Spec: https://learn.microsoft.com/en-us/typography/opentype/spec/otff#organization-of-an-opentype-font
      const sfntVersion = await sfnt.slice(0, 4).text();

      let outlineFormat = "UNKNOWN";
      switch (sfntVersion) {
        case "\x00\x01\x00\x00":
        case "true":
        case "typ1":
          outlineFormat = "truetype";
          break;
        case "OTTO":
          outlineFormat = "cff";
          break;
      }
      console.log("Outline format:", outlineFormat);
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Use advanced typography with local fonts](https://developer.chrome.com/docs/capabilities/web-apis/local-fonts)
- {{cssxref("@font-face")}}
