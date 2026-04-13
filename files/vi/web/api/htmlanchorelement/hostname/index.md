---
title: "HTMLAnchorElement: thuộc tính hostname"
short-title: hostname
slug: Web/API/HTMLAnchorElement/hostname
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.hostname
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`hostname`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa {{glossary("domain name", "tên miền")} hoặc {{glossary("IP address", "địa chỉ IP")}} của `href` thuộc phần tử `<a>`. Nếu URL không có tên máy chủ, thuộc tính này chứa một chuỗi rỗng, `""`. Các địa chỉ IPv4 và IPv6 được chuẩn hóa, chẳng hạn như loại bỏ các số 0 ở đầu, và các tên miền được chuyển đổi sang [IDN](https://en.wikipedia.org/wiki/Internationalized_domain_name).

Xem {{domxref("URL.hostname")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Một phần tử <a id="myAnchor" href="/en-US/docs/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementById("myAnchor");
anchor.hostname; // trả về 'developer.mozilla.org'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
