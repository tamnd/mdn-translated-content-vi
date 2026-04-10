---
title: "HTMLAnchorElement: thuộc tính host"
short-title: host
slug: Web/API/HTMLAnchorElement/host
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.host
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`host`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa tên máy chủ, tức là {{domxref("HTMLAnchorElement.hostname", "tên máy chủ")}}, và sau đó, nếu {{glossary("port", "cổng")}} của URL không rỗng, một `":"` theo sau là {{domxref("HTMLAnchorElement.port", "cổng")}} của URL. Nếu URL không có tên máy chủ, thuộc tính này chứa một chuỗi rỗng, `""`.

Xem {{domxref("URL.host")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const anchor = document.createElement("a");

anchor.href = "https://developer.mozilla.org/en-US/HTMLAnchorElement";
anchor.host === "developer.mozilla.org";

anchor.href = "https://developer.mozilla.org:443/en-US/HTMLAnchorElement";
anchor.host === "developer.mozilla.org";
// Số cổng không được bao gồm vì 443 là cổng mặc định của giao thức

anchor.href = "https://developer.mozilla.org:4097/en-US/HTMLAnchorElement";
anchor.host === "developer.mozilla.org:4097";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
