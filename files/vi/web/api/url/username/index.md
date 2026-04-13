---
title: "URL: thuộc tính username"
short-title: username
slug: Web/API/URL/username
page-type: web-api-instance-property
browser-compat: api.URL.username
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`username`** của giao diện {{domxref("URL")}} là một chuỗi chứa thành phần tên người dùng của URL. Nếu URL không có tên người dùng, thuộc tính này chứa chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi tên người dùng của URL. Nếu URL không có {{domxref("URL.host", "host")}} hoặc scheme của nó là `file:`, thì việc đặt thuộc tính này không có tác dụng.

Tên người dùng được {{Glossary("Percent-encoding", "mã hóa phần trăm")}} khi đặt nhưng không được giải mã phần trăm khi đọc.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://anonymous:flabada@developer.mozilla.org/en-US/docs/Web/API/URL/username",
);
console.log(url.username); // In ra "anonymous"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
