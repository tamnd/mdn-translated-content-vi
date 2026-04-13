---
title: "SVGTextContentElement: getRotationOfChar() method"
short-title: getRotationOfChar()
slug: Web/API/SVGTextContentElement/getRotationOfChar
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getRotationOfChar
---

{{APIRef("SVG")}}

Phương thức `getRotationOfChar()` của giao diện {{domxref("SVGTextContentElement")}} đại diện cho góc xoay của một ký tự đánh máy.

## Cú pháp

```js-nolint
getRotationOfChar(index)
```

### Tham số

- `index`
  - : Một `integer`; chỉ số của ký tự.

### Giá trị trả về

Một số thực; góc xoay của ký tự tính bằng độ.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu không tìm thấy ký tự nào tại `index`.

## Ví dụ

### Lấy góc xoay của một ký tự

```html
<svg width="200" height="100">
  <text id="exampleText" x="10" y="40" writing-mode="vertical-rl">
    Hello, SVG
  </text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the rotation of the first character "H"
const rotation = textElement.getRotationOfChar(0);

console.log(extent); // Output: 90
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("writing-mode")}}
