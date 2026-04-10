---
title: "Location: thuộc tính hostname"
short-title: hostname
slug: Web/API/Location/hostname
page-type: web-api-instance-property
browser-compat: api.Location.hostname
---

{{ApiRef("URL API")}}

Thuộc tính **`hostname`** của giao diện {{domxref("Location")}} là một chuỗi chứa {{glossary("domain name")}} hoặc {{glossary("IP address")}} của URL vị trí. Nếu URL không có hostname, thuộc tính này chứa chuỗi rỗng `""`. Địa chỉ IPv4 và IPv6 được chuẩn hóa, chẳng hạn như loại bỏ số 0 ở đầu, và tên miền được chuyển thành [IDN](https://en.wikipedia.org/wiki/Internationalized_domain_name).

Xem {{domxref("URL.hostname")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
console.log(window.location.hostname);
// developer.mozilla.org

const anchor = document.createElement("a");
anchor.href = "https://developer.mozilla.org:4097/";
console.log(anchor.hostname === "developer.mozilla.org");
// Số cổng không được bao gồm trong hostname
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
