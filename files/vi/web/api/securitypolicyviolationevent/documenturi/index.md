---
title: "SecurityPolicyViolationEvent: documentURI property"
short-title: documentURI
slug: Web/API/SecurityPolicyViolationEvent/documentURI
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.documentURI
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`documentURI`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn URI của tài liệu hoặc worker mà tại đó vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) xảy ra.

## Giá trị

Một chuỗi biểu diễn URI của tài liệu hoặc worker mà tại đó vi phạm xảy ra.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.documentURI);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.documentURL")}}
