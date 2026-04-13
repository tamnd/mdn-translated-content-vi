---
title: "FontData: family property"
short-title: family
slug: Web/API/FontData/family
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.FontData.family
---

{{APIRef("Local Font Access API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`family`** của giao diện {{domxref("FontData")}} trả về họ của mặt phông chữ.

Đây là tên được sử dụng khi tham chiếu đến họ phông chữ từ code, ví dụ, trong thuộc tính {{cssxref("font-family")}} hoặc trong các vị trí trong quy tắc at {{cssxref("@font-face")}} như hàm `local()`.

Ví dụ bao gồm:

- Apple SD Gothic Neo
- Arial Black
- Avenir Next
- Katari
- YuMincho +36p Kana

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
