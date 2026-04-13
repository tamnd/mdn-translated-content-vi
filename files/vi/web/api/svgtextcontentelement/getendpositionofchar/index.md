---
title: "SVGTextContentElement: getEndPositionOfChar() method"
short-title: getEndPositionOfChar()
slug: Web/API/SVGTextContentElement/getEndPositionOfChar
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getEndPositionOfChar
---

{{APIRef("SVG")}}

Phương thức `getEndPositionOfChar()` của giao diện {{domxref("SVGTextContentElement")}} trả về vị trí kết thúc của một ký tự đánh máy sau khi bố cục văn bản đã được thực hiện.

## Cú pháp

```js-nolint
getEndPositionOfChar(index)
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

### Lấy vị trí kết thúc của một ký tự

```html
<svg width="300" height="100">
  <text id="exampleText" x="10" y="50" font-size="16">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the end position of the character at index 0 (the first character)
const position = textElement.getEndPositionOfChar(0);

// Get the x and y coordinates of the first character
console.log(position.x, position.y); // Output: 21.5 50
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
