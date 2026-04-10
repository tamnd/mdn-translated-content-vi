---
title: "URLSearchParams: phương thức entries()"
short-title: entries()
slug: Web/API/URLSearchParams/entries
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.entries
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`entries()`** của giao diện {{domxref("URLSearchParams")}} trả về một {{jsxref("Iteration_protocols","iterator")}} cho phép lặp qua tất cả các cặp khóa/giá trị có trong đối tượng này theo đúng thứ tự chúng xuất hiện trong chuỗi truy vấn.

## Cú pháp

```js-nolint
entries()
```

### Giá trị trả về

Một {{jsxref("Iteration_protocols", "iterator")}}.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
for (const pair of params.entries()) {
  console.log(pair);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
