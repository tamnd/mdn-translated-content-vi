---
title: "SecurityPolicyViolationEvent: originalPolicy property"
short-title: originalPolicy
slug: Web/API/SecurityPolicyViolationEvent/originalPolicy
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.originalPolicy
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`originalPolicy`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi chứa [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) mà việc thực thi của nó phát hiện ra vi phạm.

## Giá trị

Một chuỗi biểu diễn chính sách mà việc thực thi của nó phát hiện ra vi phạm.

Đây là chuỗi trong tiêu đề HTTP {{HTTPHeader("Content-Security-Policy")}} chứa danh sách các [chỉ thị](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#directives) và giá trị của chúng tạo nên chính sách CSP.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.originalPolicy);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.originalPolicy")}}
