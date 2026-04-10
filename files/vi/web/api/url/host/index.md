---
title: "URL: thuộc tính host"
short-title: host
slug: Web/API/URL/host
page-type: web-api-instance-property
browser-compat: api.URL.host
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`host`** của giao diện {{domxref("URL")}} là một chuỗi chứa host, tức là {{domxref("URL.hostname", "hostname")}}, và sau đó, nếu {{glossary("port")}} của URL không rỗng, một `":"`, theo sau là {{domxref("URL.port", "port")}} của URL. Nếu URL không có `hostname`, thuộc tính này chứa chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi cả hostname và port của URL. Nếu scheme của URL không phải là [phân cấp](https://www.rfc-editor.org/rfc/rfc3986#section-1.2.3) (mà tiêu chuẩn URL gọi là "[special schemes](https://url.spec.whatwg.org/#special-scheme)"), thì nó không có khái niệm host và việc đặt thuộc tính này không có tác dụng.

> [!NOTE]
> Nếu giá trị được cung cấp cho setter `host` không có `port`, `port` của URL sẽ không thay đổi. Điều này có thể bất ngờ vì getter `host` có trả về một chuỗi URL-port, nên người ta có thể nghĩ setter sẽ luôn "đặt lại" cả hai.

## Giá trị

Một chuỗi.

## Ví dụ

```js
let url = new URL("https://developer.mozilla.org/en-US/docs/Web/API/URL/host");
console.log(url.host); // "developer.mozilla.org"

url = new URL("https://developer.mozilla.org:443/en-US/docs/Web/API/URL/host");
console.log(url.host); // "developer.mozilla.org"
// Số port không được bao gồm vì 443 là port mặc định của scheme

url = new URL("https://developer.mozilla.org:4097/en-US/docs/Web/API/URL/host");
console.log(url.host); // "developer.mozilla.org:4097"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
