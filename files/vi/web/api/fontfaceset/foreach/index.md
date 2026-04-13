---
title: "FontFaceSet: phương thức forEach()"
short-title: forEach()
slug: Web/API/FontFaceSet/forEach
page-type: web-api-instance-method
browser-compat: api.FontFaceSet.forEach
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Phương thức **`forEach()`** của giao diện {{domxref("FontFaceSet")}} thực thi hàm được cung cấp cho mỗi giá trị trong đối tượng `FontFaceSet`.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử, nhận ba tham số:
    - `value`, `key`
      - : Phần tử hiện tại đang được xử lý trong `FontFaceSet`. Vì `FontFaceSet` không có key, giá trị được truyền cho cả hai tham số.
    - `set`
      - : `FontFaceSet` mà `forEach()` được gọi trên đó.
- `thisArg`
  - : Giá trị dùng làm [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) khi thực thi `callbackFn`.

### Giá trị trả về

Undefined.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
