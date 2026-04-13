---
title: "Document: phương thức createNSResolver()"
short-title: createNSResolver()
slug: Web/API/Document/createNSResolver
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Document.createNSResolver
---

{{ ApiRef("DOM") }}{{deprecated_header}}

Phương thức **`createNSResolver()`** của giao diện {{domxref("Document")}} trước đây được sử dụng để tạo một đối tượng `XPathNSResolver` tùy chỉnh. Bây giờ nó trả về đầu vào nguyên vẹn và chỉ được giữ lại vì lý do tương thích.

## Cú pháp

```js-nolint
createNSResolver(nodeResolver)
```

### Tham số

- `nodeResolver`
  - : Một {{domxref("Node")}}.

### Giá trị trả về

Chính `nodeResolver`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.evaluate()")}}
- [Giới thiệu về sử dụng XPath trong JavaScript](/en-US/docs/Web/XML/XPath/Guides/Introduction_to_using_XPath_in_JavaScript)
