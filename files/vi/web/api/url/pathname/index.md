---
title: "URL: thuộc tính pathname"
short-title: pathname
slug: Web/API/URL/pathname
page-type: web-api-instance-property
browser-compat: api.URL.pathname
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`pathname`** của giao diện {{domxref("URL")}} là một chuỗi chứa phần đường dẫn của URL, bắt đầu bằng `"/"`, không bao gồm query string hoặc fragment.

Thuộc tính này có thể được đặt để thay đổi đường dẫn của URL.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/pathname",
);
console.log(url.pathname); // "/en-US/docs/Web/API/URL/pathname"

url.pathname = "/fr/docs/Web/API/URL/pathname";
console.log(url.pathname); // "/fr/docs/Web/API/URL/pathname"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
