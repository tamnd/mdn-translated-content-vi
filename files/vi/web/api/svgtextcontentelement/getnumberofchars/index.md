---
title: "SVGTextContentElement: getNumberOfChars() method"
short-title: getNumberOfChars()
slug: Web/API/SVGTextContentElement/getNumberOfChars
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getNumberOfChars
---

{{APIRef("SVG")}}

Phương thức `getNumberOfChars()` của giao diện {{domxref("SVGTextContentElement")}} đại diện cho tổng số ký tự có thể định địa chỉ có sẵn để kết xuất trong phần tử hiện tại, bất kể chúng có được kết xuất hay không.

## Cú pháp

```js-nolint
getNumberOfChars()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên dài.

## Ví dụ

### Đếm ký tự trong một phần tử văn bản

```html
<svg width="300" height="100">
  <text id="exampleText" x="10" y="50">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the number of characters in the text element
const charCount = textElement.getNumberOfChars();

console.log(charCount); // Output: 17
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
