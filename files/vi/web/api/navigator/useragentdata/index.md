---
title: "Navigator: thuộc tính userAgentData"
short-title: userAgentData
slug: Web/API/Navigator/userAgentData
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.userAgentData
---

{{securecontext_header}}{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`userAgentData`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("NavigatorUAData")}}
có thể được sử dụng để truy cập {{domxref("User-Agent Client Hints API", "", "", "nocode")}}.

## Giá trị

Đối tượng {{domxref("NavigatorUAData")}}.

## Ví dụ

Ví dụ sau in giá trị {{domxref("NavigatorUAData.brands")}} ra bàn điều khiển.

```js
console.log(navigator.userAgentData.brands);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [HTTP Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints)
