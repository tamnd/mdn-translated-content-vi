---
title: "NavigatorUAData: thuộc tính brands"
short-title: brands
slug: Web/API/NavigatorUAData/brands
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NavigatorUAData.brands
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`brands`** của giao diện {{domxref("NavigatorUAData")}} trả về một mảng thông tin thương hiệu.

## Giá trị

Một mảng chứa thông tin sau cho mỗi thương hiệu:

- `brand`
  - : Một chuỗi chứa tên thương hiệu. Ví dụ, `"Google Chrome"`.
- `version`
  - : Một chuỗi chứa phiên bản. Ví dụ, `"91"`.

## Ví dụ

Ví dụ dưới đây in giá trị của `brands` ra console.

```js
console.log(navigator.userAgentData.brands);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-CH-UA")}} (một [low-entropy client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints)) chứa thông tin tương tự.
