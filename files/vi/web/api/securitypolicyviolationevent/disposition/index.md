---
title: "SecurityPolicyViolationEvent: disposition property"
short-title: disposition
slug: Web/API/SecurityPolicyViolationEvent/disposition
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.disposition
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`disposition`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} cho biết cách [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) bị vi phạm được cấu hình để xử lý bởi tác nhân người dùng.

## Giá trị

Các giá trị có thể là:

- `"enforce"`
  - : Chính sách được thực thi và yêu cầu tài nguyên bị chặn.
- `"report"`
  - : Vi phạm được báo cáo nhưng yêu cầu tài nguyên không bị chặn.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.disposition);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.disposition")}}
