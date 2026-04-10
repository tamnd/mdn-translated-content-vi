---
title: "URLSearchParams: phương thức forEach()"
short-title: forEach()
slug: Web/API/URLSearchParams/forEach
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.forEach
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`forEach()`** của giao diện {{domxref("URLSearchParams")}} cho phép lặp qua tất cả các giá trị có trong đối tượng này thông qua một hàm callback.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm được gọi cho mỗi cặp khóa/giá trị.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
params.forEach((value, key) => {
  console.log(key, value);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
