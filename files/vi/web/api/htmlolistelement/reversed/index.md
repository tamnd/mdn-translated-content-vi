---
title: "HTMLOListElement: reversed property"
short-title: reversed
slug: Web/API/HTMLOListElement/reversed
page-type: web-api-instance-property
browser-compat: api.HTMLOListElement.reversed
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`reversed`** của giao diện {{domxref("HTMLOListElement")}} cho biết thứ tự của danh sách.

Nó phản ánh thuộc tính [`reversed`](/en-US/docs/Web/HTML/Reference/Elements/ol#reversed) của phần tử {{HTMLElement("ol")}}.

## Giá trị

Giá trị `boolean`. Nếu `true`, nó cho biết danh sách là danh sách giảm dần (..., 3, 2, 1).

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
console.log(olElement.reversed); // Output: "false"
olElement.reversed = "true";
console.log(olElement.reversed); // Output: "true"
```

### Kết quả

{{EmbedLiveSample("Examples", 400, 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
