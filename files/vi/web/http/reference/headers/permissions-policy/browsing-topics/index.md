---
title: "Permissions-Policy: chỉ thị browsing-topics"
short-title: browsing-topics
slug: Web/HTTP/Reference/Headers/Permissions-Policy/browsing-topics
page-type: http-permissions-policy-directive
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Permissions-Policy.browsing-topics
sidebar: http
---

{{non-standard_header}}{{deprecated_header}}

Chỉ thị `browsing-topics` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát quyền truy cập vào [Topics API](/en-US/docs/Web/API/Topics_API).

Khi một chính sách cụ thể không cho phép sử dụng Topics API, mọi nỗ lực gọi phương thức {{domxref("Document.browsingTopics()")}} hoặc gửi yêu cầu với header {{httpheader("Sec-Browsing-Topics")}} sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: browsing-topics=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `browsing-topics` là `*`.

## Thông số kỹ thuật

Tính năng này không phải là một phần của tiêu chuẩn chính thức, mặc dù nó được chỉ định trong [Topics API Unofficial Proposal Draft](https://patcg-individual-drafts.github.io/topics/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Topics API](/en-US/docs/Web/API/Topics_API)
- {{domxref("Document.browsingTopics()")}}
