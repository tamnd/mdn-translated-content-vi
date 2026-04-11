---
title: "SecurityPolicyViolationEvent: statusCode property"
short-title: statusCode
slug: Web/API/SecurityPolicyViolationEvent/statusCode
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.statusCode
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`statusCode`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một số biểu diễn mã trạng thái HTTP của cửa sổ hoặc worker mà tại đó vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) xảy ra.

## Giá trị

Một số biểu diễn mã trạng thái của cửa sổ hoặc worker mà tại đó vi phạm xảy ra.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.statusCode);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.statusCode")}}
