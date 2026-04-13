---
title: "SecurityPolicyViolationEvent: lineNumber property"
short-title: lineNumber
slug: Web/API/SecurityPolicyViolationEvent/lineNumber
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.lineNumber
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lineNumber`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là số dòng trong tài liệu hoặc script worker mà tại đó vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) xảy ra.

## Giá trị

Một số biểu diễn số dòng nơi vi phạm xảy ra.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.lineNumber);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.lineNumber")}}
