---
title: Composite operation
slug: Glossary/Composite_operation
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, giá trị của một thuộc tính trong quy tắc CSS là _giá trị nền_ (underlying value) của thuộc tính đó, và giá trị của cùng thuộc tính đó trong một [keyframe](/en-US/docs/Web/CSS/Reference/At-rules/@keyframes) là _giá trị hiệu ứng_ (effect value) của nó.

**Phép tổng hợp** (composite operation) là phép toán cụ thể được sử dụng để kết hợp giá trị hiệu ứng với giá trị nền để tạo ra giá trị hiệu ứng keyframe cuối cùng. Có ba loại phép tổng hợp:

- **replace** (thay thế): Giá trị hiệu ứng thay thế giá trị nền. Giá trị hiệu ứng cuối cùng trong trường hợp này chính là giá trị hiệu ứng gốc.
- **add** (cộng): Giá trị hiệu ứng được cộng vào giá trị nền.
- **accumulate** (tích lũy): Giá trị hiệu ứng được kết hợp với giá trị nền.

> [!NOTE]
> Phép tổng hợp trong CSS chỉ áp dụng cho hoạt ảnh (animation).

## Xem thêm

- {{cssxref("animation-composition")}}
- [`KeyframeEffect.composite`](/en-US/docs/Web/API/KeyframeEffect/composite)
