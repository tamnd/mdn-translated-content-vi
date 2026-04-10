---
title: "URLSearchParams: phương thức values()"
short-title: values()
slug: Web/API/URLSearchParams/values
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.values
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`values()`** của giao diện {{domxref("URLSearchParams")}} trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép lặp qua tất cả các giá trị của các cặp khóa/giá trị có trong đối tượng này.

## Cú pháp

```js-nolint
values()
```

### Giá trị trả về

Một {{jsxref("Iteration_protocols", "iterator")}}.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
for (const value of params.values()) {
  console.log(value);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
