---
title: Prefetch
slug: Glossary/Prefetch
page-type: glossary-definition
sidebar: glossarysidebar
---

Prefetch (tải trước) đề cập đến việc tải trước các tài liệu hoặc tài nguyên con trong nền một cách suy đoán cho các trang mà người dùng _có khả năng_ điều hướng tới trong tương lai gần. Điều này có thể giảm đáng kể thời gian tải cho trang đã được prefetch nếu người dùng thực sự chọn điều hướng tới đó. Prefetch có thể được dùng, ví dụ, để tải trước trang được liên kết bởi nút "Tiếp theo" hoặc các tài nguyên con của nó, hoặc một liên kết popup mà người dùng di chuột qua, hoặc kết quả tìm kiếm.

## Tải trước tài nguyên

Các tài nguyên nên được prefetch dựa trên khả năng chúng sẽ cần thiết trong điều hướng tương lai. Trình duyệt có thể tự động suy ra điều này cho một số tài nguyên, chẳng hạn như URL hiện tại trong thanh địa chỉ.

Điều này có thể được thực hiện bằng [`<link rel="prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch) (API [Speculation Rules](/en-US/docs/Web/API/Speculation_Rules_API) chỉ xử lý prefetch tài liệu cho điều hướng):

```html
<link rel="prefetch" href="next.html" />
```

## Tải trước tài liệu

Các nhà phát triển có thể cung cấp gợi ý cho trình duyệt về các điều hướng cần được prefetch theo một vài cách khác nhau:

[`<link rel="prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch):

```html
<link rel="prefetch" href="next.html" />
```

Prefetch [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API):

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "source": "list",
        "urls": ["next.html"]
      }
    ]
  }
</script>
```

Speculation Rules API xử lý prefetch tài liệu cho điều hướng tốt hơn nhiều so với `<link rel="prefetch">`; cái trước được thiết kế đặc biệt cho mục đích đó trong khi cái sau có một số hạn chế; xem [`<link rel="prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch) để biết chi tiết.

## Tải trước DNS

[Tải trước DNS](/en-US/docs/Web/HTML/Reference/Attributes/rel/dns-prefetch) giải quyết tên miền trước, tăng tốc tải bằng cách giảm thời gian tra cứu tên miền tại thời điểm yêu cầu.

```html
<link rel="dns-prefetch" href="https://example.com/" />
```

## Xem thêm

- [Speculative loading](/en-US/docs/Web/Performance/Guides/Speculative_loading)
- Các thuật ngữ liên quan:
  - {{Glossary("Prerender")}}
- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
