---
title: "HTMLAnchorElement: thuộc tính origin"
short-title: origin
slug: Web/API/HTMLAnchorElement/origin
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.origin
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`origin`** của giao diện {{domxref("HTMLAnchorElement")}} trả về một chuỗi chứa dạng nối tiếp Unicode của nguồn gốc `href` thuộc phần tử `<a>`.

Cấu trúc chính xác thay đổi tùy thuộc vào loại URL:

- Đối với URL sử dụng giao thức `ftp:`, `http:`, `https:`, `ws:`, và `wss:`, {{domxref("HTMLAnchorElement.protocol", "giao thức")}} theo sau là `//`, theo sau là {{domxref("HTMLAnchorElement.host", "tên máy chủ")}}. Giống như `host`, {{domxref("HTMLAnchorElement.port", "cổng")}} chỉ được bao gồm nếu nó không phải là mặc định cho giao thức.
- Đối với URL sử dụng giao thức `file:`, giá trị phụ thuộc vào trình duyệt.
- Đối với URL sử dụng giao thức `blob:`, nguồn gốc của URL theo sau `blob:`, nhưng chỉ khi URL đó sử dụng giao thức `http:`, `https:`, hoặc `file:`. Ví dụ: `blob:https://mozilla.org` sẽ có `https://mozilla.org`.

Đối với tất cả các trường hợp khác, chuỗi `"null"` được trả về.

Xem {{domxref("URL.origin")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Một phần tử <a id="myAnchor" href="https://developer.mozilla.org/en-US/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementById("myAnchor");
anchor.origin; // trả về 'https://developer.mozilla.org'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
