---
title: FontData
slug: Web/API/FontData
page-type: web-api-interface
status:
  - experimental
browser-compat: api.FontData
---

{{APIRef("Local Font Access API")}}{{SeeCompatTable}}

Giao diện **`FontData`** của {{domxref("Local Font Access API", "Local Font Access API", "", "nocode")}} đại diện cho một mặt phông chữ cục bộ duy nhất.

## Thuộc tính phiên bản

- {{domxref('FontData.family')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về họ của mặt phông chữ.
- {{domxref('FontData.fullName')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tên đầy đủ của mặt phông chữ.
- {{domxref('FontData.postscriptName')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tên PostScript của mặt phông chữ.
- {{domxref('FontData.style')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về kiểu dáng của mặt phông chữ.

## Phương thức phiên bản

- {{domxref('FontData.blob()')}} {{Experimental_Inline}}
  - : Trả về {{jsxref("Promise")}} được thực hiện với {{domxref("Blob")}} chứa các byte thô của tệp phông chữ cơ bản.

## Ví dụ

Để xem ví dụ trực tiếp, hãy xem [demo Local Font Access API](https://mdn.github.io/dom-examples/local-font-access/).

### Liệt kê phông chữ

Đoạn code sau sẽ truy vấn tất cả các phông chữ có sẵn và ghi siêu dữ liệu. Điều này có thể được sử dụng, ví dụ, để điền vào điều khiển chọn phông chữ.

```js
async function logFontData() {
  try {
    const availableFonts = await window.queryLocalFonts();
    for (const fontData of availableFonts) {
      console.log(fontData.postscriptName);
      console.log(fontData.fullName);
      console.log(fontData.family);
      console.log(fontData.style);
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

### Truy cập dữ liệu cấp thấp

Phương thức {{domxref("FontData.blob", "blob()")}} cung cấp quyền truy cập vào dữ liệu [SFNT](https://en.wikipedia.org/wiki/SFNT) cấp thấp, đây là định dạng tệp phông chữ có thể chứa các định dạng phông chữ khác như PostScript, TrueType, OpenType hoặc Web Open Font Format (WOFF).

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
