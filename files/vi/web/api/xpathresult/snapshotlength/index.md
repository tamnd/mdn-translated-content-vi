---
title: "XPathResult: snapshotLength property"
short-title: snapshotLength
slug: Web/API/XPathResult/snapshotLength
page-type: web-api-instance-property
browser-compat: api.XPathResult.snapshotLength
---

{{APIRef("DOM")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`snapshotLength`** của giao diện
{{domxref("XPathResult")}} đại diện cho số lượng nút trong ảnh chụp kết quả.

## Giá trị

Một giá trị số nguyên đại diện cho số lượng nút trong ảnh chụp kết quả.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là
`UNORDERED_NODE_SNAPSHOT_TYPE` hoặc `ORDERED_NODE_SNAPSHOT_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `snapshotLength`.

### HTML

```html
<div>XPath example</div>
<div>Number of matched nodes: <output></output></div>
```

### JavaScript

```js
const xpath = "//div";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
  null,
);
document.querySelector("output").textContent = result.snapshotLength;
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
