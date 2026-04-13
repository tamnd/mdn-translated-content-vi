---
title: "HTMLOListElement: type property"
short-title: type
slug: Web/API/HTMLOListElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLOListElement.type
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLOListElement")}} cho biết loại dấu hiệu được sử dụng để hiển thị danh sách có thứ tự.

Nó phản ánh thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/ol#type) của phần tử {{HTMLElement("ol")}}.

> [!NOTE]
> `type` có thể được xác định trong CSS bằng thuộc tính {{CSSxRef("list-style-type")}}. Thuộc tính `list-style-type` cung cấp nhiều giá trị hơn.

## Giá trị

Một chuỗi đại diện cho kiểu.

Các giá trị có thể được liệt kê trong phần [loại dấu hiệu](/en-US/docs/Web/HTML/Reference/Elements/ol#type) của thuộc tính.

## Ví dụ

### HTML

```html
<ol id="order-list">
  <li>Fee</li>
  <li>Fi</li>
  <li>Fo</li>
  <li>Fum</li>
</ol>
```

### JavaScript

```js
const olElement = document.querySelector("#order-list");
// if type is not specified then return empty string
console.log(olElement.type); // Output: ""
olElement.type = "i"; // Using roman numeral type
console.log(olElement.type); // Output: "i"
```

### Kết quả

{{EmbedLiveSample("Examples", 400, 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
