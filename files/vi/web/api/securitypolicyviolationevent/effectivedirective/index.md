---
title: "SecurityPolicyViolationEvent: effectiveDirective property"
short-title: effectiveDirective
slug: Web/API/SecurityPolicyViolationEvent/effectiveDirective
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.effectiveDirective
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`effectiveDirective`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn chỉ thị [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) bị vi phạm.

Thuộc tính này thay thế {{domxref("SecurityPolicyViolationEvent.violatedDirective")}}, bí danh lịch sử của nó.

## Giá trị

Một chuỗi biểu diễn [chỉ thị `Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#directives) cụ thể bị vi phạm.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.effectiveDirective);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.effectiveDirective")}}
