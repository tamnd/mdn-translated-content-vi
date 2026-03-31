---
title: "Permissions-Policy: chỉ thị translator"
short-title: translator
slug: Web/HTTP/Reference/Headers/Permissions-Policy/translator
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.translator
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `translator` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát quyền truy cập vào chức năng dịch thuật của [Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs).

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng, mọi nỗ lực gọi các phương thức dịch thuật của API sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: translator=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `translator` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
