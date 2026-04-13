---
title: "XPathResult: snapshotItem() method"
short-title: snapshotItem()
slug: Web/API/XPathResult/snapshotItem
page-type: web-api-instance-method
browser-compat: api.XPathResult.snapshotItem
---

{{APIRef("DOM")}}

Phương thức **`snapshotItem()`** của giao diện
{{domxref("XPathResult")}} trả về một phần tử của tập hợp ảnh chụp hoặc
`null` trong trường hợp chỉ số nằm ngoài phạm vi của các nút. Không giống như
kết quả iterator, ảnh chụp không trở nên không hợp lệ, nhưng có thể không tương ứng với
tài liệu hiện tại nếu nó bị thay đổi.

## Cú pháp

```js-nolint
snapshotItem(i)
```

### Tham số

- `i`
  - : Một số, chỉ số của phần tử.

### Giá trị trả về

{{domxref("Node")}} tại chỉ số đã cho trong tập hợp nút của
`XPathResult`.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là
`UNORDERED_NODE_SNAPSHOT_TYPE` hoặc `ORDERED_NODE_SNAPSHOT_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng phương thức `snapshotItem()`.

### HTML

```html
<div>XPath example</div>
<div>Tag names of the matched nodes: <output></output></div>
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
let node = null;
const tagNames = [];
for (let i = 0; i < result.snapshotLength; i++) {
  node = result.snapshotItem(i);
  tagNames.push(node.localName);
}
document.querySelector("output").textContent = tagNames.join(", ");
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
