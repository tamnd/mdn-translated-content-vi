---
title: Speculation Rules API
slug: Web/API/Speculation_Rules_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - html.elements.script.type.speculationrules
  - http.headers.Speculation-Rules
spec-urls:
  - https://html.spec.whatwg.org/multipage/speculative-loading.html#speculative-loading
  - https://wicg.github.io/nav-speculation/prerendering.html
---

{{SeeCompatTable}}{{DefaultAPISidebar("Speculation Rules API")}}

**Speculation Rules API** được thiết kế để cải thiện hiệu suất cho các điều hướng trong tương lai. API này nhắm vào URL tài liệu thay vì các tệp tài nguyên cụ thể, do đó phù hợp với ứng dụng nhiều trang (MPA) hơn là ứng dụng một trang (SPA).

Speculation Rules API cung cấp một giải pháp thay thế cho tính năng [`<link rel="prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch) được hỗ trợ rộng rãi và được thiết kế để thay thế tính năng [`<link rel="prerender">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prerender) chỉ dành cho Chrome đã lỗi thời. Nó cung cấp nhiều cải tiến so với các công nghệ này, cùng với cú pháp biểu đạt và có thể cấu hình hơn để chỉ định tài liệu nào nên được prefetch hoặc prerender.

> [!NOTE]
> Speculation Rules API không xử lý prefetch tài nguyên con; bạn cần dùng `<link rel="prefetch">` cho điều đó.

## Khái niệm và cách sử dụng

Quy tắc đầu cơ (speculation rules) có thể được chỉ định bên trong các phần tử [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules) nội tuyến và các tệp văn bản bên ngoài được tham chiếu bởi header phản hồi {{httpheader("Speculation-Rules")}}. Các quy tắc được chỉ định dưới dạng cấu trúc JSON.

Ví dụ về script:

```html
<script type="speculationrules">
  {
    "prerender": [
      {
        "where": {
          "and": [
            { "href_matches": "/*" },
            { "not": { "href_matches": "/logout" } },
            { "not": { "href_matches": "/*\\?*(^|&)add-to-cart=*" } },
            { "not": { "selector_matches": ".no-prerender" } },
            { "not": { "selector_matches": "[rel~=nofollow]" } }
          ]
        }
      }
    ],
    "prefetch": [
      {
        "urls": ["next.html", "next2.html"],
        "requires": ["anonymous-client-ip-when-cross-origin"],
        "referrer_policy": "no-referrer"
      }
    ]
  }
</script>
```

Các quy tắc đầu cơ sử dụng phần tử `<script>` cần được cho phép rõ ràng trong chỉ thị {{httpheader("Content-Security-Policy")}} [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) nếu trang bao gồm nó. Điều này được thực hiện bằng cách thêm một trong các nguồn `'inline-speculation-rules'`, hash-source, hoặc nonce-source.

Ví dụ HTTP header:

```http
Speculation-Rules: "/rules/prefetch.json"
```

Tài nguyên văn bản chứa JSON quy tắc đầu cơ có thể có bất kỳ tên và phần mở rộng hợp lệ nào, nhưng phải được phục vụ với kiểu MIME `application/speculationrules+json`.

## Giao diện

Speculation Rules API không định nghĩa bất kỳ giao diện nào của riêng nó.

### Mở rộng cho các giao diện khác

- {{domxref("Document.prerendering")}} {{experimental_inline}}
  - : Thuộc tính boolean trả về `true` nếu tài liệu đang trong quá trình prerendering.
- {{domxref("Document.prerenderingchange_event", "prerenderingchange")}} event {{experimental_inline}}
  - : Được kích hoạt trên tài liệu prerendered khi nó được kích hoạt (tức là người dùng xem trang).
- {{domxref("PerformanceNavigationTiming.activationStart")}} {{experimental_inline}}
  - : Một số đại diện thời gian giữa khi tài liệu bắt đầu prerendering và khi nó được kích hoạt.
- {{domxref("PerformanceResourceTiming.deliveryType")}} giá trị `"navigational-prefetch"` {{experimental_inline}}
  - : Báo hiệu rằng loại mục performance là một prefetch.

## HTTP headers

- {{httpheader("Content-Security-Policy")}} giá trị `'inline-speculation-rules'` {{experimental_inline}}
  - : Được dùng để cho phép sử dụng `<script type="speculationrules">` để định nghĩa quy tắc đầu cơ trên tài liệu được fetch.
- {{httpheader("Clear-Site-Data")}} các giá trị `'prefetchCache'` và `'prerenderCache'` {{experimental_inline}}
  - : Dùng để xóa các đầu cơ. Ví dụ, khi trạng thái thay đổi làm cho đầu cơ cũ.
- {{httpheader("Speculation-Rules")}} {{experimental_inline}}
  - : Cung cấp danh sách URL trỏ đến tài nguyên văn bản chứa định nghĩa JSON quy tắc đầu cơ.
- {{httpheader("Supports-Loading-Mode")}} {{experimental_inline}}
  - : Được đặt bởi mục tiêu điều hướng để chọn sử dụng các chế độ tải rủi ro cao hơn.

## HTML features

- [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules) {{experimental_inline}}
  - : Dùng để định nghĩa một tập hợp quy tắc đầu cơ prefetch và/hoặc prerender bên trong tài liệu hiện tại.

## Ví dụ

Xem ví dụ code tại [Prerender pages in Chrome for instant page navigations](https://developer.chrome.com/docs/web-platform/prerender-pages) trên developer.chrome.com (2025)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Speculative loading](/en-US/docs/Web/Performance/Guides/Speculative_loading) để so sánh quy tắc đầu cơ và các tính năng cải thiện hiệu suất tương tự khác.
