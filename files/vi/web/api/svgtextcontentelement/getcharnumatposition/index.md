---
title: "SVGTextContentElement: getCharNumAtPosition() method"
short-title: getCharNumAtPosition()
slug: Web/API/SVGTextContentElement/getCharNumAtPosition
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getCharNumAtPosition
---

{{APIRef("SVG")}}

Phương thức `getCharNumAtPosition()` của giao diện {{domxref("SVGTextContentElement")}} đại diện cho ký tự đã gây ra một nét chữ văn bản được kết xuất tại một vị trí nhất định trong hệ tọa độ. Vì mối quan hệ giữa các ký tự và nét chữ không phải là một-một, chỉ ký tự đầu tiên của ký tự đánh máy liên quan được trả về.

Nếu không tìm thấy ký tự nào tại vị trí được chỉ định, `-1` được trả về.

## Cú pháp

```js-nolint
getCharNumAtPosition(point)
```

### Tham số

- `point`
  - : Một đối tượng {{domxref("DOMPoint")}}; tọa độ (x, y) nơi vị trí của ký tự cần được kiểm tra trong không gian tọa độ người dùng.

### Giá trị trả về

Một số nguyên dài; chỉ số của ký tự tương ứng với vị trí.

## Ví dụ

### Tìm ký tự tại một vị trí cụ thể

```html
<svg width="200" height="100">
  <text id="exampleText" x="10" y="40" font-size="16">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Create a DOMPoint for the position (30, 40)
const point = new DOMPoint(30, 40);

// Get the character at the specified position
const charIndex = textElement.getCharNumAtPosition(point);

console.log(charIndex); // Output: 2 (for character "l")

// Check with a point where no character is present
const offPoint = new DOMPoint(300, 40);
const offCharIndex = textElement.getCharNumAtPosition(offPoint);

console.log(offCharIndex); // Output: -1 (no character found)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
