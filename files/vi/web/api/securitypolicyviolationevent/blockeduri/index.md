---
title: "SecurityPolicyViolationEvent: blockedURI property"
short-title: blockedURI
slug: Web/API/SecurityPolicyViolationEvent/blockedURI
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.blockedURI
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`blockedURI`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn URI của tài nguyên bị chặn vì nó vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

## Giá trị

Một chuỗi biểu diễn URI của tài nguyên bị chặn.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.blockedURI);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.blockedURL")}}
