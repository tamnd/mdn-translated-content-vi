---
title: CSS easing functions
short-title: Easing functions
slug: Web/CSS/Guides/Easing_functions
page-type: css-module
spec-urls: https://drafts.csswg.org/css-easing-2
sidebar: cssref
---

Module **CSS easing functions** định nghĩa các easing functions, cung cấp phương tiện để kiểm soát sự biến đổi của các giá trị. Các functions được định nghĩa bao gồm linear, cubic bezier và step easing functions. Các easing functions này có thể được áp dụng cho animations và transitions.

Tăng dần tốc độ di chuyển của một phần tử có thể tạo cho phần tử cảm giác có trọng lượng khi nó dường như tích lũy đà. Easing functions cho phép bạn kiểm soát tốc độ thay đổi. Cubic bezier easing functions có thể được sử dụng để tạo ra các phần tử giao diện người dùng trực quan hoặc các đạo cụ hoạt hình hấp dẫn hoạt động giống như các đối tác vật lý của chúng.

Ngoài ra, bạn có thể muốn một animation di chuyển về phía trước theo các bước riêng biệt, để tạo ra chuyển động giống robot, hoặc hiệu ứng của một bánh xe có phân đoạn quay sao cho các phân đoạn luôn xuất hiện ở cùng một vị trí. Đối với điều này, có thể sử dụng step easing functions.

## Tham khảo

### Functions

- {{cssxref("easing-function/cubic-bezier", "cubic-bezier()")}}
- {{cssxref("easing-function/linear", "linear()")}}
- {{cssxref("easing-function/steps", "steps()")}}

### Kiểu dữ liệu

- {{cssxref("easing-function")}}
- [`<linear-easing-function>`](/en-US/docs/Web/CSS/Reference/Values/easing-function#linear-easing-function)
- [`<cubic-bezier-easing-function>`](/en-US/docs/Web/CSS/Reference/Values/easing-function#cubic-bezier-easing-function)
- [`<step-easing-function>`](/en-US/docs/Web/CSS/Reference/Values/easing-function#step-easing-function)

### Thuật ngữ và định nghĩa từ điển

- {{glossary("Bézier curve")}}
- {{glossary("Interpolation")}}

## Hướng dẫn

- [CSS value functions: easing functions](/en-US/docs/Web/CSS/Reference/Values/Functions#easing_functions)
  - : Các câu lệnh CSS gọi ra quá trình xử lý dữ liệu hoặc tính toán đặc biệt để trả về một giá trị CSS cho một thuộc tính CSS.

## Khái niệm liên quan

- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
  - {{cssxref("animation-timing-function")}}
  - Viết tắt {{cssxref("animation")}}

- Module [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions)
  - {{cssxref("transition-timing-function")}}
  - Viết tắt {{cssxref("transition")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [CSS value functions](/en-US/docs/Web/CSS/Reference/Values/Functions)
- Thuộc tính CSS {{cssxref("will-change")}}
