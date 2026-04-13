---
title: "SVGTextContentElement: getExtentOfChar() method"
short-title: getExtentOfChar()
slug: Web/API/SVGTextContentElement/getExtentOfChar
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getExtentOfChar
---

{{APIRef("SVG")}}

Phương thức `getExtentOfChar()` của giao diện {{domxref("SVGTextContentElement")}} đại diện cho hộp giới hạn chặt chẽ được tính toán của ô nét chữ tương ứng với một ký tự đánh máy đã cho.

## Cú pháp

```js-nolint
getExtentOfChar(index)
```

### Tham số

- `index`
  - : Một `integer`; chỉ số của ký tự.

### Giá trị trả về

Một đối tượng {{domxref("DOMRect")}}; hộp giới hạn chặt chẽ của ký tự được chỉ định.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu không tìm thấy ký tự nào tại `index`.

## Ví dụ

### Lấy phạm vi của một ký tự

```html
<svg width="300" height="100">
  <text id="exampleText" x="10" y="50" font-size="16">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the extent (bounding box) of the character at index 0 (the first character)
const extent = textElement.getExtentOfChar(0);

// The bounding box of the first character
console.dir(extent); // Output: DOMRect { x: 10, y: 38, width: 11.55, height: 16 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMRect")}}
