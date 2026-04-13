---
title: "XPathResult: invalidIteratorState property"
short-title: invalidIteratorState
slug: Web/API/XPathResult/invalidIteratorState
page-type: web-api-instance-property
browser-compat: api.XPathResult.invalidIteratorState
---

{{APIRef("DOM")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`invalidIteratorState`** của giao diện
{{domxref("XPathResult")}} cho biết iterator đã trở nên không hợp lệ. Là
`true` nếu {{domxref("XPathResult.resultType")}} là
`UNORDERED_NODE_ITERATOR_TYPE` hoặc `ORDERED_NODE_ITERATOR_TYPE` và
tài liệu đã bị sửa đổi kể từ khi kết quả này được trả về.

## Giá trị

Một giá trị boolean cho biết iterator có trở nên không hợp lệ hay không.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `invalidIteratorState`.

### HTML

```html
<div>XPath example</div>
<p>Iterator state: <output></output></p>
```

### JavaScript

```js
const xpath = "//div";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.ANY_TYPE,
  null,
);
// Invalidates the iterator state
document.querySelector("div").remove();
document.querySelector("output").textContent = result.invalidIteratorState
  ? "invalid"
  : "valid";
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
