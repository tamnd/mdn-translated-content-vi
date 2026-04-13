---
title: "URL: thuộc tính origin"
short-title: origin
slug: Web/API/URL/origin
page-type: web-api-instance-property
browser-compat: api.URL.origin
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`origin`** của giao diện {{domxref("URL")}} trả về một chuỗi chứa biểu diễn Unicode của origin của URL được đại diện.

Cấu trúc chính xác thay đổi tùy theo kiểu URL:

- Với các URL dùng các scheme `ftp:`, `http:`, `https:`, `ws:` và `wss:`, giá trị là {{domxref("URL.protocol", "protocol")}} theo sau bởi `//`, rồi theo sau bởi {{domxref("URL.host", "host")}}. Tương tự như `host`, {{domxref("URL.port", "port")}} chỉ được bao gồm nếu nó không phải là giá trị mặc định của protocol.
- Với URL dùng scheme `file:`, giá trị phụ thuộc vào trình duyệt.
- Với URL dùng scheme `blob:`, giá trị là origin của URL theo sau `blob:`, nhưng chỉ nếu URL đó dùng scheme `http:`, `https:` hoặc `file:`. Ví dụ, `blob:https://mozilla.org` sẽ có `https://mozilla.org`.

Trong mọi trường hợp khác, chuỗi `"null"` được trả về.

## Giá trị

Một chuỗi.

## Ví dụ

Các ví dụ sau cho thấy thuộc tính `origin` được tính như thế nào đối với URL `blob:`, một URL `http:` và một URL dùng port không mặc định:

```js
const url = new URL("blob:https://mozilla.org:443/");
console.log(url.origin); // 'https://mozilla.org'
```

```js
const url = new URL("http://localhost:80/");
console.log(url.origin); // 'http://localhost'
```

```js
const url = new URL("https://mozilla.org:8080/");
console.log(url.origin); // 'https://mozilla.org:8080'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}}
- Thuật ngữ {{Glossary("origin")}}
