---
title: "URLSearchParams: phương thức sort()"
short-title: sort()
slug: Web/API/URLSearchParams/sort
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.sort
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`sort()`** của giao diện {{domxref("URLSearchParams")}} sắp xếp tất cả các cặp khóa/giá trị, nếu có, theo khóa của chúng.

## Cú pháp

```js-nolint
sort()
```

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const params = new URLSearchParams("b=2&a=1");
params.sort();
console.log(params.toString()); // "a=1&b=2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
