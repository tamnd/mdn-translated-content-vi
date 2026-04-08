---
title: CSS scroll anchoring
short-title: Scroll anchoring
slug: Web/CSS/Guides/Scroll_anchoring
page-type: css-module
spec-urls: https://drafts.csswg.org/css-scroll-anchoring/
sidebar: cssref
---

Module **CSS scroll anchoring** định nghĩa một cơ chế để ngăn trang bị dịch chuyển do các thay đổi DOM phía trên vùng hiển thị của một scroll container khi người dùng đang xem nội dung.

Scroll anchoring cố gắng giữ cho góc nhìn của người dùng vào tài liệu ổn định khi layout thay đổi. Nó hoạt động bằng cách chọn một DOM node (anchor node) mà chuyển động của nó được dùng để xác định điều chỉnh vị trí cuộn. Anchor node luôn là phần tử con của scroll container.

Đối với các scroll container đã [snap](/en-US/docs/Glossary/Scroll_snap) vào một phần tử, scroll anchoring chỉ cho phép những điều chỉnh mà việc re-snapping cho phép.

## Tham chiếu

### Thuộc tính

- {{cssxref("overflow-anchor")}}

## Thuật ngữ

- {{glossary("Scroll container")}}
- {{glossary("Scroll snap")}}

## Hướng dẫn

- [Tổng quan về scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring/Overview)
  - : Scroll anchoring là gì, các suppression trigger, và khi nào cũng như cách bật và tắt tính năng trình duyệt này.

## Khái niệm liên quan

- {{CSSxRef("overscroll-behavior")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- Module [CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior)
