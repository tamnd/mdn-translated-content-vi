---
title: "URL: thuộc tính protocol"
short-title: protocol
slug: Web/API/URL/protocol
page-type: web-api-instance-property
browser-compat: api.URL.protocol
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`protocol`** của giao diện {{domxref("URL")}} là một chuỗi chứa protocol hoặc scheme của URL, bao gồm dấu `":"` cuối cùng.

Thuộc tính này có thể được đặt để thay đổi protocol của URL. Một `":"` sẽ được thêm vào chuỗi được cung cấp nếu chưa có sẵn. Scheme được cung cấp phải tương thích với phần còn lại của URL thì mới được xem là hợp lệ.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/protocol",
);
console.log(url.protocol); // Logs "https:"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
