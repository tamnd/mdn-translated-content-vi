---
title: Interpolation
slug: Glossary/Interpolation
page-type: glossary-definition
sidebar: glossarysidebar
---

Nội suy (Interpolation) là một phương pháp ước tính các điểm dữ liệu mới dựa trên một tập hợp các điểm dữ liệu đã biết.

Nội suy tính toán các giá trị trung gian trong các hoạt ảnh thay đổi các thuộc tính HTML như chiều cao, chiều rộng, v.v.
Nội suy màu sắc xác định các giá trị trung gian của màu trong việc pha trộn màu, gradient, compositing, bộ lọc, chuyển tiếp, hoạt ảnh và các hàm màu.

Các phép nội suy không nhất thiết phải tuyến tính. Hầu hết các giá trị nội suy là số thực dấu phẩy động; tuy nhiên, khi không có điểm giữa giữa hai giá trị, chẳng hạn với các giá trị chỉ chấp nhận số nguyên, [nội suy được thực hiện rời rạc](/en-US/docs/Web/CSS/Reference/Values/integer#interpolation). Tiến trình nội suy còn phụ thuộc vào [hàm easing](/en-US/docs/Web/CSS/Reference/Values/easing-function) trong hoạt ảnh và color stops, cũng như phương thức nội suy {{CSSXref("color-interpolation-method", "màu sắc")}} và {{CSSXref("hue-interpolation-method", "hue")}} trong gradient.

Trong JavaScript, thuật ngữ "[nội suy](/en-US/docs/Web/JavaScript/Reference/Template_literals#string_interpolation)" được dùng để mô tả việc thay thế chuỗi trong template literal.

## Xem thêm

- Thuộc tính SVG {{SVGAttr("color-interpolation")}}
- Thuộc tính CSS {{CSSXref("color-interpolation")}}
- Kiểu dữ liệu CSS {{CSSXref("color-interpolation-method")}}
- Kiểu dữ liệu CSS {{CSSXref("hue-interpolation-method")}}
- Hàm CSS {{CSSXref("color_value/color-mix", "color-mix()")}}
- [Nội suy màu trong CSS](/en-US/docs/Web/CSS/Reference/Values/color_value#interpolation)
- [Interpolation](https://en.wikipedia.org/wiki/Interpolation) trên Wikipedia
- [String interpolation](https://en.wikipedia.org/wiki/String_interpolation) trên Wikipedia
