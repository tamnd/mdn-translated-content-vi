---
title: "Permissions-Policy: chỉ thị attribution-reporting"
short-title: attribution-reporting
slug: Web/HTTP/Reference/Headers/Permissions-Policy/attribution-reporting
page-type: http-permissions-policy-directive
status:
  - deprecated
browser-compat: http.headers.Permissions-Policy.attribution-reporting
sidebar: http
---

{{deprecated_header}}

Chỉ thị `attribution-reporting` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này:

- Các yêu cầu `attributionsrc` nền sẽ không được thực hiện.
- Phương thức {{domxref("XMLHttpRequest.setAttributionReporting()")}} sẽ ném một ngoại lệ khi được gọi.
- Tùy chọn [`attributionReporting`](/en-US/docs/Web/API/RequestInit#attributionreporting), khi được đưa vào một lần gọi {{domxref("Window/fetch", "fetch()")}}, sẽ khiến nó ném một ngoại lệ.
- Các header đăng ký ({{httpheader("Attribution-Reporting-Register-Source")}} và {{httpheader("Attribution-Reporting-Register-Trigger")}}) trong phản hồi HTTP trên các tài liệu liên quan sẽ bị bỏ qua.

## Cú pháp

```http
Permissions-Policy: attribution-reporting=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `attribution-reporting` là `*`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API)
