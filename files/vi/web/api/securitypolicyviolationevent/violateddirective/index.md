---
title: "SecurityPolicyViolationEvent: violatedDirective property"
short-title: violatedDirective
slug: Web/API/SecurityPolicyViolationEvent/violatedDirective
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.violatedDirective
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`violatedDirective`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn chỉ thị [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) bị vi phạm.

Đây là bí danh lịch sử của {{domxref("SecurityPolicyViolationEvent.effectiveDirective")}}, và có cùng giá trị.

## Giá trị

Một chuỗi biểu diễn [chỉ thị `Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#directives) bị vi phạm.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.violatedDirective);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
