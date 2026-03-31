---
title: "Permissions-Policy: chỉ thị cross-origin-isolated"
short-title: cross-origin-isolated
slug: Web/HTTP/Reference/Headers/Permissions-Policy/cross-origin-isolated
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.cross-origin-isolated
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `cross-origin-isolated` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng các API yêu cầu {{domxref("Window.crossOriginIsolated", "cách ly cross-origin", "", "nocode")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các thuộc tính {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}} sẽ luôn trả về `false`, và tài liệu sẽ không được hưởng lợi từ các hạn chế được giảm bớt khi sử dụng một số API chỉ được cấp cho các tài liệu cross-origin isolated.
Điều này đúng bất kể các header {{HTTPHeader("Cross-Origin-Embedder-Policy")}} và {{HTTPHeader("Cross-Origin-Opener-Policy")}}, và liệu tài liệu có bị cách ly cross-origin hay không nếu quyền được cấp.

Các API yêu cầu quyền này bao gồm việc sử dụng các đối tượng {{jsxref("SharedArrayBuffer")}} và {{domxref("Performance.now()")}} với các bộ đếm thời gian không bị điều tiết — xem {{domxref("Window.crossOriginIsolated")}} để biết thông tin về các API bị hạn chế khác.

Quyền có thể được sử dụng để duy trì các hạn chế truy cập vào các API nhạy cảm trừ khi chúng thực sự cần thiết bởi một tài liệu cross-origin isolated.
Lưu ý rằng nếu tính năng không được cho phép, nhưng ngược lại tài liệu sẽ bị cách ly cross-origin, thì trong tất cả các khía cạnh khác nó vẫn bị cách ly cross-origin.
Ví dụ, nó sẽ chỉ chia sẻ một {{glossary("Browsing context", "nhóm ngữ cảnh duyệt web")}} với các tài liệu cùng nguồn gốc.

## Cú pháp

```http
Permissions-Policy: cross-origin-isolated=<allowlist>;
```

- `<allowlist>`
  - : Danh sách một hoặc nhiều nguồn gốc được cấp quyền sử dụng tính năng.
    Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `cross-origin-isolated` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
