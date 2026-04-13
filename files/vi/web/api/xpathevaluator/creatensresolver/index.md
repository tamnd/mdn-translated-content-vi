---
title: "XPathEvaluator: createNSResolver() method"
short-title: createNSResolver()
slug: Web/API/XPathEvaluator/createNSResolver
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.XPathEvaluator.createNSResolver
---

{{APIRef("DOM")}}{{deprecated_header}}

Phương thức **`createNSResolver()`** của giao diện {{domxref("XPathEvaluator")}} trước đây được dùng để tạo một đối tượng `XPathNSResolver` tùy chỉnh. Hiện tại nó trả về đầu vào như nguyên vẹn và chỉ được giữ lại vì lý do tương thích.

## Cú pháp

```js-nolint
createNSResolver(nodeResolver)
```

### Tham số

- `nodeResolver`
  - : Một {{domxref("Node")}}.

### Giá trị trả về

Chính `nodeResolver`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Document.createNSResolver()")}}
- {{DOMxRef("XPathExpression")}}
