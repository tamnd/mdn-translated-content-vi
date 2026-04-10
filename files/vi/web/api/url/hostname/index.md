---
title: "URL: thuộc tính hostname"
short-title: hostname
slug: Web/API/URL/hostname
page-type: web-api-instance-property
browser-compat: api.URL.hostname
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`hostname`** của giao diện {{domxref("URL")}} là một chuỗi chứa {{glossary("domain name", "tên miền")}} hoặc {{glossary("IP address", "địa chỉ IP")}} của URL. Nếu URL không có hostname, thuộc tính này chứa chuỗi rỗng, `""`. Địa chỉ IPv4 và IPv6 được chuẩn hóa, chẳng hạn như loại bỏ các số 0 ở đầu, và tên miền được chuyển sang [IDN](https://en.wikipedia.org/wiki/Internationalized_domain_name).

Thuộc tính này có thể được đặt để thay đổi hostname của URL. Nếu scheme của URL không phải là [phân cấp](https://www.rfc-editor.org/rfc/rfc3986#section-1.2.3) (mà tiêu chuẩn URL gọi là "[special schemes](https://url.spec.whatwg.org/#special-scheme)"), thì nó không có khái niệm host và việc đặt thuộc tính này không có tác dụng.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/hostname",
);
console.log(url.hostname); // Logs: 'developer.mozilla.org'

url.hostname = "你好.com";
console.log(url.hostname); // Logs: 'xn--6qq79v.com'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
