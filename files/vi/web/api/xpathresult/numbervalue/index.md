---
title: "XPathResult: numberValue property"
short-title: numberValue
slug: Web/API/XPathResult/numberValue
page-type: web-api-instance-property
browser-compat: api.XPathResult.numberValue
---

{{APIRef("DOM")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`numberValue`** của giao diện
{{domxref("XPathResult")}} trả về giá trị số của kết quả khi
{{domxref("XPathResult.resultType")}} là `NUMBER_TYPE`.

## Giá trị

Giá trị trả về là giá trị số của `XPathResult` được trả về bởi
{{domxref("Document.evaluate()")}}.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là `NUMBER_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `numberValue`.

### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt;s: <output></output></div>
```

### JavaScript

```js
const xpath = "count(//div)";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.NUMBER_TYPE,
  null,
);
document.querySelector("output").textContent = result.numberValue;
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
