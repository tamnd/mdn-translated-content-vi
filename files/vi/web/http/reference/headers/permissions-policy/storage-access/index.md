---
title: "Permissions-Policy: chỉ thị storage-access"
short-title: storage-access
slug: Web/HTTP/Reference/Headers/Permissions-Policy/storage-access
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.storage-access
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `storage-access` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc một tài liệu được tải trong ngữ cảnh bên thứ ba (tức là được nhúng trong {{htmlelement("iframe")}}) có được phép sử dụng {{domxref("Storage Access API", "Storage Access API", "", "nocode")}} để yêu cầu quyền truy cập vào cookie không phân vùng hay không.

Điều này có liên quan đến các tác nhân người dùng theo mặc định chặn quyền truy cập vào cookie không phân vùng bởi các trang được tải trong ngữ cảnh bên thứ ba để cải thiện quyền riêng tư (ví dụ, để ngăn chặn việc theo dõi).

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("Document.requestStorageAccess()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `NotAllowedError`.

## Cú pháp

```http
Permissions-Policy: storage-access=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `storage-access` là `*`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Storage Access API](/en-US/docs/Web/API/Storage_Access_API)
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
