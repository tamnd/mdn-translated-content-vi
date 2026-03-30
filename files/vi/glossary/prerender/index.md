---
title: Prerender
slug: Glossary/Prerender
page-type: glossary-definition
sidebar: glossarysidebar
---

Prerender (kết xuất trước) đề cập đến việc {{Glossary("prefetch", "tải trước")}} và _kết xuất_ các trang một cách suy đoán mà người dùng có khả năng điều hướng tới trong tương lai gần (trình duyệt kết xuất trang trong nền trong một tab vô hình riêng biệt). Prerender bao gồm việc tải xuống các tài nguyên con của tài liệu và thực thi JavaScript liên quan.

Nếu người dùng sau đó chọn điều hướng tới trang, nội dung của nó có thể được hiển thị gần như tức thì.

Prerender có thể được dùng, ví dụ, để tải trước các tài nguyên trang được liên kết bởi nút "Tiếp theo", một liên kết popup mà người dùng di chuột qua, hoặc đích trang có thể của URL đang được nhập vào thanh địa chỉ. Các [quy tắc suy đoán](/en-US/docs/Web/API/Speculation_Rules_API) sau có thể được đưa vào phần head của tài liệu để gợi ý cho trình duyệt rằng nó nên prerender `next.html` và `next2.html`, vì một trong hai có thể là đích điều hướng tiếp theo:

```html
<script type="speculationrules">
  {
    "prerender": [
      {
        "source": "list",
        "urls": ["next.html", "next2.html"]
      }
    ]
  }
</script>
```

Prerender dẫn đến thời gian hiển thị nhanh hơn so với prefetch và do đó mang lại trải nghiệm người dùng tốt hơn, với chi phí là tiêu tốn nhiều tài nguyên hơn.

## Xem thêm

- [Speculative loading](/en-US/docs/Web/Performance/Guides/Speculative_loading)
- Các thuật ngữ liên quan:
  - {{Glossary("Prefetch")}}
- [Prerender pages in Chrome for instant page navigations](https://developer.chrome.com/docs/web-platform/prerender-pages#prerendering-from-the-address-bar) trên developer.chrome.com
- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
