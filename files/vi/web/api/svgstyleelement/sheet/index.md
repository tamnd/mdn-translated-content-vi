---
title: "SVGStyleElement: thuộc tính sheet"
short-title: sheet
slug: Web/API/SVGStyleElement/sheet
page-type: web-api-instance-property
browser-compat: api.SVGStyleElement.sheet
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`SVGStyleElement.sheet`** trả về {{domxref("CSSStyleSheet")}} tương ứng với phần tử SVG style đã cho, hoặc `null` nếu không có.

## Giá trị

Một {{domxref("CSSStyleSheet")}}, hoặc `null` nếu phần tử không có stylesheet liên kết.

## Ví dụ

Ví dụ này minh họa cách lấy CSS sheet liên kết với một phần tử.

### HTML

HTML chứa một định nghĩa SVG cho một [`<circle>`](/en-US/docs/Web/SVG/Reference/Element/circle).

```html
<textarea id="log" rows="3" cols="50"></textarea>
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <circle cx="50" cy="50" r="25" />
</svg>
```

### JavaScript

Đoạn mã bên dưới tạo một phần tử `style` (một `SVGStyleElement`) và thêm nó vào SVG.

```js
const svg = document.querySelector("svg");
// Tạo phần tử `style` trong không gian tên SVG
const style = document.createElementNS("http://www.w3.org/2000/svg", "style");
const node = document.createTextNode("circle { fill: red; }");
svg.appendChild(style);
style.appendChild(node);
```

Đoạn mã bên dưới sau đó ghi lại sheet và quy tắc CSS liên kết với phần tử mới này, sử dụng `style.sheet`.

```js
// Ghi lại sheet liên kết với phần tử mới này.
const log = document.getElementById("log");
log.value = `${style.sheet} with rules[0].cssText:\n ${style.sheet.rules[0].cssText}`;
```

### Kết quả

Kết quả được hiển thị bên dưới.
Khi thành công, nhật ký hiển thị đối tượng `CSSStyleSheet` được áp dụng cho hình tròn SVG.

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLStyleElement.sheet")}}
