---
title: "SVGTextContentElement: getSubStringLength() method"
short-title: getSubStringLength()
slug: Web/API/SVGTextContentElement/getSubStringLength
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getSubStringLength
---

{{APIRef("SVG")}}

Phương thức `getSubStringLength()` của giao diện {{domxref("SVGTextContentElement")}} đại diện cho độ dài được tính toán của khoảng cách tiến văn bản định dạng cho một chuỗi con văn bản trong phần tử.

Lưu ý rằng phương thức này chỉ tính đến chiều rộng của các nét chữ trong chuỗi con và khoảng cách thêm được chèn bởi các thuộc tính CSS {{cssxref("letter-spacing")}} và {{cssxref("word-spacing")}}. Các điều chỉnh khoảng cách trực quan do thuộc tính {{cssxref("x")}} thực hiện bị bỏ qua.

## Cú pháp

```js-nolint
getSubStringLength(index, length)
```

### Tham số

- `index`
  - : Một `integer`; chỉ số bắt đầu của chuỗi con.
- `length`
  - : Một `integer`; số ký tự cần đưa vào chuỗi con.

### Giá trị trả về

Một số thực.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu `index` lớn hơn chỉ số cao nhất hoặc `length` âm.

## Ví dụ

### Lấy độ dài của một chuỗi con

```html
<svg width="300" height="100">
  <text id="exampleText" x="10" y="50" font-size="16">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the length of a substring starting at character 0 with 5 characters
const substringLength = textElement.getSubStringLength(0, 5);

console.log(substringLength); // Output: 35.55
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
