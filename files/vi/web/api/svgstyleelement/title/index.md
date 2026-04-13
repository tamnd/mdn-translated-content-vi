---
title: "SVGStyleElement: thuộc tính title"
short-title: title
slug: Web/API/SVGStyleElement/title
page-type: web-api-instance-property
browser-compat: api.SVGStyleElement.title
---

{{APIRef("SVG")}}

Thuộc tính **`SVGStyleElement.title`** là một chuỗi tương ứng với thuộc tính [`title`](/en-US/docs/Web/SVG/Reference/Element/style#title) của phần tử SVG style đã cho.
Nó có thể được sử dụng để chọn giữa các [stylesheet thay thế](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet).

## Giá trị

Một chuỗi với bất kỳ giá trị nào.

Giá trị được khởi tạo với chuỗi được chỉ định trong thuộc tính [`title`](/en-US/docs/Web/SVG/Reference/Element/style#title) của style tương ứng.

## Ví dụ

Ví dụ này minh họa việc lấy và đặt thuộc tính `title` theo chương trình trên một style được định nghĩa trong định nghĩa SVG.

### HTML

HTML chứa một định nghĩa SVG cho một [`<circle>`](/en-US/docs/Web/SVG/Reference/Element/circle) với một phần tử [`<style>`](/en-US/docs/Web/SVG/Reference/Element/style) có một `title`.
Chúng ta cũng định nghĩa một vùng văn bản để ghi lại tiêu đề hiện tại.

```html
<textarea id="log" rows="3" cols="50"></textarea>
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <style title="gold fill style">
    circle {
      fill: gold;
    }
  </style>
  <circle cx="50" cy="40" r="25" />
</svg>
```

### JavaScript

Đoạn mã bên dưới lấy phần tử `style` (một `SVGStyleElement`) bằng tên thẻ của nó, ghi lại tiêu đề, sau đó thay đổi và ghi lại tiêu đề lần nữa.

```js
const log = document.getElementById("log");

const svg = document.querySelector("svg");
const style = svg.querySelector("style");
log.value = `Initial title: ${style.title}\n`;
style.title = "Altered Title";
log.value += `New title: ${style.title}`;
```

### Kết quả

Văn bản trong nhật ký bên dưới cho thấy tiêu đề ban đầu phản ánh thuộc tính khớp trên phần tử `<style>`, nhưng sau đó có thể được thay đổi thành giá trị khác.

{{EmbedLiveSample("Examples")}}

Lưu ý rằng các style thay thế không được áp dụng theo mặc định; chúng phải được người dùng chọn làm stylesheet ưu tiên.
Để áp dụng các stylesheet thay thế trên Firefox:

1. Mở Menu Bar (Nhấn `F10` hoặc nhấn phím `Alt`)
2. Mở submenu **View > Page Style**
3. Chọn các stylesheet dựa trên tên của chúng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
