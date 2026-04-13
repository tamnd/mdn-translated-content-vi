---
title: "SecurityPolicyViolationEvent: sample property"
short-title: sample
slug: Web/API/SecurityPolicyViolationEvent/sample
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.sample
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`sample`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là một chuỗi biểu diễn mẫu của tài nguyên gây ra vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

Điều này chỉ áp dụng cho vi phạm [`script-src*`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) và [`style-src*`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/style-src), khi chỉ thị `Content-Security-Policy` tương ứng chứa từ khóa [`'report-sample'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#report-sample).
Ngoài ra, thuộc tính này chỉ được điền nếu tài nguyên là một inline script, trình xử lý sự kiện, hoặc style - các tài nguyên bên ngoài gây ra vi phạm sẽ không tạo ra mẫu.

> [!NOTE]
> Các báo cáo vi phạm nên được coi là dữ liệu do kẻ tấn công kiểm soát.
> Nội dung của trường này cần được làm sạch trước khi lưu trữ hoặc hiển thị.

## Giá trị

Một chuỗi chứa mẫu của tài nguyên gây ra vi phạm, thường là 40 ký tự đầu tiên, hoặc chuỗi rỗng.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.sample);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.sample")}}
