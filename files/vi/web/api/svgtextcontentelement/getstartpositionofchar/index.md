---
title: "SVGTextContentElement: getStartPositionOfChar() method"
short-title: getStartPositionOfChar()
slug: Web/API/SVGTextContentElement/getStartPositionOfChar
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getStartPositionOfChar
---

{{APIRef("SVG")}}

Phương thức `getStartPositionOfChar()` của giao diện {{domxref("SVGTextContentElement")}} trả về vị trí của một ký tự đánh máy sau khi bố cục văn bản đã được thực hiện.

## Cú pháp

```js-nolint
getStartPositionOfChar(index)
```

### Tham số

- `index`
  - : Một `integer`; chỉ số của ký tự.

### Giá trị trả về

Một đối tượng {{domxref("DOMPoint")}}; vị trí của ký tự trong tọa độ người dùng.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu không tìm thấy ký tự nào tại `index`.

## Ví dụ

### Lấy vị trí của một ký tự

```html
<svg width="300" height="100">
  <text id="exampleText" x="10" y="50" font-size="16">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the position of the character at index 0 (the first character)
const position = textElement.getStartPositionOfChar(0);

// Get the x and y coordinates of the first character
console.log(position.x, position.y); // Output: 10 50
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
