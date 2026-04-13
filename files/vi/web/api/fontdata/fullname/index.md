---
title: "FontData: fullName property"
short-title: fullName
slug: Web/API/FontData/fullName
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.FontData.fullName
---

{{APIRef("Local Font Access API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`fullName`** của giao diện {{domxref("FontData")}} trả về tên đầy đủ của mặt phông chữ. Đây thường là tên có thể đọc được bởi con người để xác định phông chữ, ví dụ: "Optima Bold".

Ví dụ bao gồm:

- Apple SD Gothic Neo UltraLight
- Arial Black
- Avenir Next Heavy
- Katari Medium Italic
- YuMincho +36p Kana Extrabold

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
