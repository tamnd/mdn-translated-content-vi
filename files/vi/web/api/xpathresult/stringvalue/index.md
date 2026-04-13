---
title: "XPathResult: stringValue property"
short-title: stringValue
slug: Web/API/XPathResult/stringValue
page-type: web-api-instance-property
browser-compat: api.XPathResult.stringValue
---

{{APIRef("DOM")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`stringValue`** của giao diện
{{domxref("XPathResult")}} trả về giá trị chuỗi của kết quả khi
{{domxref("XPathResult.resultType")}} là `STRING_TYPE`.

## Giá trị

Giá trị trả về là giá trị chuỗi của `XPathResult` được trả về bởi
{{domxref("Document.evaluate()")}}.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là `STRING_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `stringValue`.

### HTML

```html
<div>XPath example</div>
<div>Text content of the &lt;div&gt; above: <output></output></div>
```

### JavaScript

```js
const xpath = "//div/text()";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.STRING_TYPE,
  null,
);
document.querySelector("output").textContent = result.stringValue;
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
