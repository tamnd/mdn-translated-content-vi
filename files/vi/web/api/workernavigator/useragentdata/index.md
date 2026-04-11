---
title: "WorkerNavigator: thuộc tính userAgentData"
short-title: userAgentData
slug: Web/API/WorkerNavigator/userAgentData
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WorkerNavigator.userAgentData
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{securecontext_header}}{{AvailableInWorkers("worker")}}

Thuộc tính chỉ đọc **`userAgentData`** của giao diện {{domxref("WorkerNavigator")}} trả về một đối tượng {{domxref("NavigatorUAData")}} có thể dùng để truy cập [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API).

## Giá trị

Một đối tượng {{domxref("NavigatorUAData")}}.

## Ví dụ

Ví dụ sau in giá trị của {{domxref("NavigatorUAData.brands")}} ra console.

```js
console.log(navigator.userAgentData.brands);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cải thiện quyền riêng tư của người dùng và trải nghiệm lập trình với User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints)
