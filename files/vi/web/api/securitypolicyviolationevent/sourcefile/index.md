---
title: "SecurityPolicyViolationEvent: sourceFile property"
short-title: sourceFile
slug: Web/API/SecurityPolicyViolationEvent/sourceFile
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.sourceFile
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`sourceFile`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn URL của script mà tại đó vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) xảy ra.

## Giá trị

Một chuỗi biểu diễn URL của script mà tại đó vi phạm xảy ra, hoặc `null` nếu vi phạm không nằm trong một script.

Lưu ý rằng cả `columnNumber` và `lineNumber` đều phải có giá trị khác null nếu thuộc tính này không phải là `null`.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.sourceFile);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.sourceFile")}}
