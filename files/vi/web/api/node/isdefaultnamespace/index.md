---
title: "Node: phương thức isDefaultNamespace()"
short-title: isDefaultNamespace()
slug: Web/API/Node/isDefaultNamespace
page-type: web-api-instance-method
browser-compat: api.Node.isDefaultNamespace
---

{{APIRef("DOM")}}

Phương thức **`isDefaultNamespace()`** của giao diện {{domxref("Node")}} nhận một URI namespace làm đối số và trả về `true` nếu namespace đó là namespace mặc định trên nút đã cho, hoặc `false` nếu không.

## Cú pháp

```js-nolint
isDefaultNamespace(namespaceURI)
```

### Tham số

- `namespaceURI`
  - : URI namespace cần kiểm tra.

### Giá trị trả về

`true` nếu namespace là mặc định, ngược lại là `false`.

## Ví dụ

```js
console.log(document.documentElement.isDefaultNamespace("http://www.w3.org/1999/xhtml"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
