---
title: "XPathResult: singleNodeValue property"
short-title: singleNodeValue
slug: Web/API/XPathResult/singleNodeValue
page-type: web-api-instance-property
browser-compat: api.XPathResult.singleNodeValue
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`singleNodeValue`** của giao diện
{{domxref("XPathResult")}} trả về một giá trị {{domxref("Node")}} hoặc
`null` trong trường hợp không có nút nào khớp với kết quả có
{{domxref("XPathResult.resultType")}} là `ANY_UNORDERED_NODE_TYPE` hoặc
`FIRST_ORDERED_NODE_TYPE`.

## Giá trị

Giá trị trả về là giá trị {{domxref("Node")}} của `XPathResult`
được trả về bởi {{domxref("Document.evaluate()")}}.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là
`ANY_UNORDERED_NODE_TYPE` hoặc `FIRST_ORDERED_NODE_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `singleNodeValue`.

### HTML

```html
<div>XPath example</div>
<div>
  Tag name of the element having the text content 'XPath example':
  <output></output>
</div>
```

### JavaScript

```js
const xpath = "//*[text()='XPath example']";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.FIRST_ORDERED_NODE_TYPE,
  null,
);
document.querySelector("output").textContent = result.singleNodeValue.localName;
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
