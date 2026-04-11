---
title: "FontFaceSet: phương thức load()"
short-title: load()
slug: Web/API/FontFaceSet/load
page-type: web-api-instance-method
browser-compat: api.FontFaceSet.load
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Phương thức `load()` của {{domxref("FontFaceSet")}} buộc tất cả font được chỉ định trong tham số phải tải.

## Cú pháp

```js-nolint
load(font)
load(font, text)
```

### Tham số

- `font`
  - : Đặc tả font theo cú pháp giá trị CSS, ví dụ "italic bold 16px Roboto"
- `text`
  - : Giới hạn font face với những font có phạm vi Unicode chứa ít nhất một ký tự trong text. Điều này [không kiểm tra độ phủ glyph từng ký tự](https://lists.w3.org/Archives/Public/www-style/2015Aug/0330.html).

### Giá trị trả về

{{jsxref("Promise")}} resolve với {{jsxref("Array")}} các đối tượng {{domxref("FontFace")}} đã tải. Promise resolve khi tất cả font đã tải; reject nếu một trong các font tải thất bại.

## Ví dụ

Ví dụ sau trả về promise sẽ resolve hoặc reject tùy kết quả tải "MyFont". Code trong `then()` có thể giả định font đó đã sẵn sàng.

```js
document.fonts.load("12px MyFont", "ß").then(/* ... */);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
