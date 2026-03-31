---
title: "Permissions-Policy: chỉ thị summarizer"
short-title: summarizer
slug: Web/HTTP/Reference/Headers/Permissions-Policy/summarizer
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.summarizer
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `summarizer` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát quyền truy cập vào [Summarizer API](/en-US/docs/Web/API/Summarizer_API).

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng Summarizer API, mọi nỗ lực gọi các phương thức của API sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: summarizer=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `summarizer` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
