---
title: "Location: thuộc tính origin"
short-title: origin
slug: Web/API/Location/origin
page-type: web-api-instance-property
browser-compat: api.Location.origin
---

{{APIRef("Location")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`origin`** của giao diện {{domxref("Location")}} trả về một chuỗi chứa biểu diễn Unicode của origin của URL của location.

Cấu trúc chính xác thay đổi tùy theo loại URL:

- Với các URL dùng scheme `ftp:`, `http:`, `https:`, `ws:`, và `wss:`, đó là {{domxref("Location.protocol", "protocol")}} theo sau bởi `//`, rồi đến {{domxref("Location.host", "host")}}. Tương tự như `host`, {{domxref("Location.port", "port")}} chỉ được bao gồm nếu nó không phải là cổng mặc định của protocol.
- Với URL dùng scheme `file:`, giá trị phụ thuộc vào trình duyệt.
- Với URL dùng scheme `blob:`, origin của URL theo sau `blob:`, nhưng chỉ khi URL đó dùng scheme `http:`, `https:`, hoặc `file:`. Ví dụ, `blob:https://mozilla.org` sẽ có `https://mozilla.org`.

Trong mọi trường hợp khác, chuỗi `"null"` sẽ được trả về.

Xem {{domxref("URL.origin")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
console.log(window.location.origin); // Trên trang này trả về 'https://developer.mozilla.org'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Window.origin`](/en-US/docs/Web/API/Window/origin)
- Thuật ngữ {{Glossary("origin")}}
