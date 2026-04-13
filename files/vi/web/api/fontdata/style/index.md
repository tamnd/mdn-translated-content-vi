---
title: "FontData: style property"
short-title: style
slug: Web/API/FontData/style
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.FontData.style
---

{{APIRef("Local Font Access API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("FontData")}} trả về kiểu dáng của mặt phông chữ.

Đây là giá trị được sử dụng để chọn kiểu dáng của phông chữ bạn muốn sử dụng, ví dụ trong thuộc tính {{cssxref("font-style")}}.

Ví dụ bao gồm:

- UltraLight
- Regular
- Heavy
- Medium Italic
- Extrabold

## Giá trị

Một chuỗi.

## Ví dụ

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Use advanced typography with local fonts](https://developer.chrome.com/docs/capabilities/web-apis/local-fonts)
- {{cssxref("@font-face")}}
