---
title: "Node: phương thức lookupPrefix()"
short-title: lookupPrefix()
slug: Web/API/Node/lookupPrefix
page-type: web-api-instance-method
browser-compat: api.Node.lookupPrefix
---

{{APIRef("DOM")}}

Phương thức **`lookupPrefix()`** của giao diện {{domxref("Node")}} trả về một chuỗi chứa tiền tố của một URI namespace đã cho, nếu có, và `null` nếu không. Khi có nhiều tiền tố khả dĩ, kết quả phụ thuộc vào cách triển khai.

## Cú pháp

```js-nolint
lookupPrefix(namespaceURI)
```

### Tham số

- `namespaceURI`
  - : URI namespace cần tra cứu.

### Giá trị trả về

Tiền tố tương ứng hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
