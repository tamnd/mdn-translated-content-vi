---
title: <axis>
slug: Web/CSS/Reference/Values/axis
page-type: css-type
browser-compat: css.types.axis
spec-urls: https://drafts.csswg.org/scroll-animations/#typedef-axis
sidebar: cssref
---

Kiểu dữ liệu {{glossary("enumerated")}} **`<axis>`** xác định hướng cuộn của {{glossary("scroll container", "scroll container")}} điều khiển [scroll timeline](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines).

Các giá trị từ khóa `<axis>` được dùng trong các [hàm CSS](/vi/docs/Web/CSS/Reference/Values/Functions) và thuộc tính sau:

- {{cssxref("scroll-timeline-axis")}}
- Viết tắt {{cssxref("scroll-timeline")}}
- {{cssxref("animation-timeline/scroll", "scroll()")}}
- {{cssxref("view-timeline-axis")}}
- Viết tắt {{cssxref("view-timeline")}}
- {{cssxref("animation-timeline/view", "view()")}}

## Cú pháp

Các giá trị `<axis>` hợp lệ:

- `block`
  - : Trục block của phần tử cuộn, là trục theo hướng vuông góc với luồng văn bản trong một dòng. Đối với chế độ viết ngang, như tiếng Anh chuẩn, đây giống `y`, còn đối với chế độ viết dọc, đây giống `x`.
- `inline`
  - : Trục inline của phần tử cuộn, là trục theo hướng song song với luồng văn bản trong một dòng. Đối với chế độ viết ngang, đây giống `x`, còn đối với chế độ viết dọc, đây giống `y`.
- `x`
  - : Trục ngang của phần tử cuộn.
- `y`
  - : Trục dọc của phần tử cuộn.

## Cú pháp chính thức

{{CSSSyntaxRaw(`<axis> = block | inline | x | y`)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- Hướng dẫn [Scroll-driven animation timelines](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- Mô-đun [CSS scroll-driven animations](/vi/docs/Web/CSS/Guides/Scroll-driven_animations)
