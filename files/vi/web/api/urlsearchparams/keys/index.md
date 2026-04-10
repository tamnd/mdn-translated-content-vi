---
title: "URLSearchParams: phương thức keys()"
short-title: keys()
slug: Web/API/URLSearchParams/keys
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.keys
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`keys()`** của giao diện {{domxref("URLSearchParams")}} trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép lặp qua tất cả các khóa của các cặp khóa/giá trị có trong đối tượng này.

## Cú pháp

```js-nolint
keys()
```

### Giá trị trả về

Một {{jsxref("Iteration_protocols", "iterator")}}.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
for (const key of params.keys()) {
  console.log(key);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
