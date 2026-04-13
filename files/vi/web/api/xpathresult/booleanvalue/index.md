---
title: "XPathResult: booleanValue property"
short-title: booleanValue
slug: Web/API/XPathResult/booleanValue
page-type: web-api-instance-property
browser-compat: api.XPathResult.booleanValue
---

{{APIRef("DOM")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`booleanValue`** của giao diện
{{domxref("XPathResult")}} trả về giá trị boolean của kết quả khi
{{domxref("XPathResult.resultType")}} là `BOOLEAN_TYPE`.

## Giá trị

Giá trị trả về là giá trị boolean của `XPathResult` được trả về bởi
{{domxref("Document.evaluate()")}}.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là `BOOLEAN_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `booleanValue`.

### HTML

```html
<div>XPath example</div>
<p>Text is 'XPath example': <output></output></p>
```

### JavaScript

```js
const xpath = "//div/text() = 'XPath example'";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.BOOLEAN_TYPE,
  null,
);
document.querySelector("output").textContent = result.booleanValue;
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
