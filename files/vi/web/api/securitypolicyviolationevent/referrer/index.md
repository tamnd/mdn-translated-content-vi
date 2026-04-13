---
title: "SecurityPolicyViolationEvent: referrer property"
short-title: referrer
slug: Web/API/SecurityPolicyViolationEvent/referrer
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.referrer
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`referrer`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn referrer của các tài nguyên có [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) bị vi phạm.
Đây sẽ là một URL hoặc `null`.

## Giá trị

Một chuỗi biểu diễn URL của referrer của các tài nguyên có chính sách bị vi phạm, hoặc `null`.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.referrer);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.referrer")}}
