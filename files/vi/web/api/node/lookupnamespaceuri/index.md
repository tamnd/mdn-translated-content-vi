---
title: "Node: phương thức lookupNamespaceURI()"
short-title: lookupNamespaceURI()
slug: Web/API/Node/lookupNamespaceURI
page-type: web-api-instance-method
browser-compat: api.Node.lookupNamespaceURI
---

{{APIRef("DOM")}}

Phương thức **`lookupNamespaceURI()`** của giao diện {{domxref("Node")}} nhận một tiền tố và trả về URI namespace liên kết với tiền tố đó trên nút đã cho nếu tìm thấy, và `null` nếu không. Nếu truyền `null` làm tiền tố, phương thức sẽ trả về namespace mặc định.

## Cú pháp

```js-nolint
lookupNamespaceURI(prefix)
```

### Tham số

- `prefix`
  - : Tiền tố cần tra cứu.

### Giá trị trả về

URI namespace tương ứng, hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
