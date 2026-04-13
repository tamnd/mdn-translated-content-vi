---
title: "HTMLOListElement: start property"
short-title: start
slug: Web/API/HTMLOListElement/start
page-type: web-api-instance-property
browser-compat: api.HTMLOListElement.start
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`start`** của giao diện {{domxref("HTMLOListElement")}} cho biết giá trị bắt đầu của danh sách có thứ tự, với giá trị mặc định là 1.

Nó phản ánh thuộc tính [`start`](/en-US/docs/Web/HTML/Reference/Elements/ol#start) của phần tử {{HTMLElement("ol")}}.

> [!NOTE]
> Giá trị thuộc tính `start` độc lập với thuộc tính {{domxref("HTMLOListElement.type")}}; nó luôn là số, ngay cả khi kiểu là chữ cái hoặc chữ số La Mã.

## Giá trị

Giá trị `long`.

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
console.log(olElement.start); // Output: "1"
olElement.start = "11";
console.log(olElement.start); // Output: "11"
```

### Kết quả

{{EmbedLiveSample("Examples", 400, 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
