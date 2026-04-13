---
title: "XPathResult: iterateNext() method"
short-title: iterateNext()
slug: Web/API/XPathResult/iterateNext
page-type: web-api-instance-method
browser-compat: api.XPathResult.iterateNext
---

{{APIRef("DOM")}}

Phương thức **`iterateNext()`** của giao diện
{{domxref("XPathResult")}} lặp qua kết quả tập hợp nút và trả về
nút tiếp theo từ nó hoặc `null` nếu không còn nút nào.

## Cú pháp

```js-nolint
iterateNext()
```

### Tham số

Không có.

### Giá trị trả về

{{domxref("Node")}} tiếp theo trong tập hợp nút của `XPathResult`.

### Ngoại lệ

#### TYPE_ERR

Trong trường hợp {{domxref("XPathResult.resultType")}} không phải là
`UNORDERED_NODE_ITERATOR_TYPE` hoặc `ORDERED_NODE_ITERATOR_TYPE`, một
{{domxref("DOMException")}} kiểu `TYPE_ERR` sẽ được ném ra.

#### INVALID_STATE_ERR

Nếu tài liệu bị thay đổi kể từ khi kết quả được trả về, một
{{domxref("DOMException")}} kiểu `INVALID_STATE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng phương thức `iterateNext()`.

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
  XPathResult.ANY_TYPE,
  null,
);
let node = null;
const tagNames = [];
while ((node = result.iterateNext())) {
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
