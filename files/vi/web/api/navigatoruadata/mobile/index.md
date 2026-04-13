---
title: "NavigatorUAData: thuộc tính mobile"
short-title: mobile
slug: Web/API/NavigatorUAData/mobile
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NavigatorUAData.mobile
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`mobile`** của giao diện {{domxref("NavigatorUAData")}} trả về giá trị cho biết thiết bị có phải là thiết bị di động hay không.

## Giá trị

Một {{jsxref("Boolean")}}, `true` nếu đây là thiết bị di động.

## Ví dụ

Ví dụ dưới đây in giá trị của `mobile` ra console.

```js
console.log(navigator.userAgentData.mobile);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Sec-CH-UA-Mobile")}} (một [low-entropy client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints)) chứa thông tin tương tự.
