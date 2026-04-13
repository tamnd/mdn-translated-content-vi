---
title: "FontData: postscriptName property"
short-title: postscriptName
slug: Web/API/FontData/postscriptName
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.FontData.postscriptName
---

{{APIRef("Local Font Access API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`postscriptName`** của giao diện {{domxref("FontData")}} trả về tên PostScript của mặt phông chữ.

Đây là tên được sử dụng để xác định duy nhất phông chữ PostScript và thường là một chuỗi ký tự không bị ngắt quãng bao gồm tên và kiểu dáng của phông chữ.

Ví dụ bao gồm:

- AppleSDGothicNeo-UltraLight
- Arial-Black
- AvenirNext-Heavy
- Katari-MediumItalic
- YuMin_36pKn-Extrabold

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
