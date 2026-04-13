---
title: "CustomStateSet: forEach() method"
short-title: forEach()
slug: Web/API/CustomStateSet/forEach
page-type: web-api-instance-method
browser-compat: api.CustomStateSet.forEach
---

{{APIRef("Web Components")}}

Phương thức **`forEach()`** của giao diện {{domxref("CustomStateSet")}} thực thi hàm được cung cấp cho mỗi giá trị trong đối tượng `CustomStateSet`.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử, nhận ba đối số:
    - `value`, `key`
      - : Phần tử hiện tại đang được xử lý trong `CustomStateSet`. Vì không có key trong `CustomStateSet`, giá trị được truyền cho cả hai đối số.
    - `set`
      - : `CustomStateSet` mà `forEach()` được gọi trên đó.
- `thisArg`
  - : Giá trị để sử dụng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Undefined.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
