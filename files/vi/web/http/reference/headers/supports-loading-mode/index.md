---
title: Supports-Loading-Mode header
short-title: Supports-Loading-Mode
slug: Web/HTTP/Reference/Headers/Supports-Loading-Mode
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Supports-Loading-Mode
sidebar: http
---

{{securecontext_header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Supports-Loading-Mode`** {{Glossary("response header")}} cho phép phản hồi đăng ký tải trong ngữ cảnh mới lạ, rủi ro cao hơn mà nếu không thì nó sẽ không thể tải được.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Supports-Loading-Mode: <client-hint-headers>
```

## Chỉ thị

Giá trị tiêu đề `Supports-Loading-Mode` là danh sách một hoặc nhiều token, có thể bao gồm các giá trị sau:

- `credentialed-prerender` {{experimental_inline}}
  - : Cho biết rằng một nguồn gốc đích đăng ký tải tài liệu qua [prerendering](/en-US/docs/Web/API/Speculation_Rules_API#using_prerendering) cross-origin, same-site.
- `fenced-frame` {{experimental_inline}}
  - : Phản hồi có thể được tải bên trong [fenced frame](/en-US/docs/Web/API/Fenced_frame_API). Nếu không có sự đăng ký rõ ràng này, tất cả điều hướng bên trong fenced frame sẽ thất bại.

## Ví dụ

```http
Supports-Loading-Mode: fenced-frame
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced Frame API](/en-US/docs/Web/API/Fenced_frame_API)
- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
- [Speculative loading](/en-US/docs/Web/Performance/Guides/Speculative_loading)
- [Prerender pages in Chrome for instant page navigations](https://developer.chrome.com/docs/web-platform/prerender-pages) trên developer.chrome.com
