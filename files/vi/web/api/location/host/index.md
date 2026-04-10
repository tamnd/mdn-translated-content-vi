---
title: "Location: thuộc tính host"
short-title: host
slug: Web/API/Location/host
page-type: web-api-instance-property
browser-compat: api.Location.host
---

{{ApiRef("Location")}}

Thuộc tính **`host`** của giao diện {{domxref("Location")}} là một chuỗi chứa host, tức là {{domxref("Location.hostname", "hostname")}}, và sau đó, nếu {{glossary("port")}} của URL không rỗng, là một dấu `":"` theo sau bởi {{domxref("Location.port", "port")}} của URL. Nếu URL không có `hostname`, thuộc tính này chứa chuỗi rỗng `""`.

Xem {{domxref("URL.host")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const anchor = document.createElement("a");

anchor.href = "https://developer.mozilla.org/en-US/Location.host";
console.log(anchor.host === "developer.mozilla.org");

anchor.href = "https://developer.mozilla.org:443/en-US/Location.host";
console.log(anchor.host === "developer.mozilla.org");
// Số cổng không được bao gồm vì 443 là cổng mặc định của scheme

anchor.href = "https://developer.mozilla.org:4097/en-US/Location.host";
console.log(anchor.host === "developer.mozilla.org:4097");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
