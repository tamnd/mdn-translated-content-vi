---
title: "NavigatorUAData: thuộc tính platform"
short-title: platform
slug: Web/API/NavigatorUAData/platform
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NavigatorUAData.platform
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`platform`** của giao diện {{domxref("NavigatorUAData")}} trả về thông tin thương hiệu nền tảng.

## Giá trị

Một chuỗi chứa thương hiệu nền tảng.
Ví dụ, `"Windows"`.

## Ví dụ

Ví dụ dưới đây in giá trị của `platform` ra console.

```js
console.log(navigator.userAgentData.platform);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Sec-CH-UA-Platform")}} (một [low-entropy client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints)) chứa thông tin tương tự.
