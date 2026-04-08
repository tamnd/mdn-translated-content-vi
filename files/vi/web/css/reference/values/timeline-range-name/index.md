---
title: <timeline-range-name>
slug: Web/CSS/Reference/Values/timeline-range-name
page-type: css-type
browser-compat: css.types.timeline-range-name
spec-urls: https://drafts.csswg.org/scroll-animations/#typedef-timeline-range-name
sidebar: cssref
---

Kiểu dữ liệu {{glossary("enumerated")}} **`<timeline-range-name>`** là một định danh CSS biểu diễn một trong các phạm vi timeline được đặt tên trước trong [view progress timeline](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines).

Các giá trị từ khóa `<timeline-range-name>` được dùng trong [bộ chọn keyframe](/vi/docs/Web/CSS/Reference/Selectors/Keyframe_selectors) và các thuộc tính viết tắt và đầy đủ sau:

- {{cssxref("animation-range-end")}}
- {{cssxref("animation-range-start")}}
- {{cssxref("animation-range")}} shorthand

## Cú pháp

Các giá trị `<timeline-range-name>` hợp lệ:

- `cover`
  - : Biểu diễn toàn bộ phạm vi của view progress timeline, từ điểm mà cạnh đầu của phần tử chủ thể lần đầu đi vào vùng hiển thị view progress của scrollport (tiến độ `0%`) đến điểm mà cạnh cuối đã hoàn toàn rời khỏi nó (tiến độ `100%`).

- `contain`
  - : Biểu diễn phạm vi của view progress timeline trong đó phần tử chủ thể được chứa hoàn toàn bởi, hoặc chứa hoàn toàn, vùng hiển thị view progress trong [scrollport](/vi/docs/Glossary/Scroll_container#scrollport)
    - Nếu phần tử chủ thể nhỏ hơn scrollport, phạm vi từ điểm phần tử chủ thể lần đầu được scrollport chứa hoàn toàn (tiến độ `0%`), đến điểm nó không còn được scrollport chứa hoàn toàn (tiến độ `100%`).
    - Nếu phần tử chủ thể lớn hơn scrollport, phạm vi từ điểm phần tử chủ thể lần đầu bao phủ hoàn toàn scrollport (tiến độ `0%`), đến điểm nó không còn bao phủ hoàn toàn scrollport (tiến độ `100%`).

- `entry`
  - : Biểu diễn phạm vi của view progress timeline từ điểm phần tử chủ thể bắt đầu đi vào scroll port, đến điểm nó đã đi vào hoàn toàn scrollport. `0%` tương đương với `0%` của phạm vi `cover`. `100%` tương đương với `0%` của phạm vi `contain`.

- `exit`
  - : Biểu diễn phạm vi của view progress timeline từ điểm phần tử chủ thể bắt đầu thoát khỏi scroll port, đến điểm nó đã thoát hoàn toàn khỏi scrollport. `0%` tương đương với `100%` của phạm vi `contain`. `100%` tương đương với `100%` của phạm vi `cover`.

- `entry-crossing`
  - : Biểu diễn phạm vi trong đó hộp chính đi qua cạnh biên cuối. Điểm bắt đầu (tiến độ 0%) của phạm vi xảy ra khi cạnh biên đầu của hộp chính của phần tử trùng với cạnh cuối của vùng hiển thị view progress. Điểm kết thúc (100%) của phạm vi là điểm mà cạnh biên cuối của hộp chính của phần tử trùng với cạnh cuối của vùng hiển thị view progress. Kích thước của phạm vi bằng kích thước hộp chính của phần tử theo hướng cuộn.

- `exit-crossing`
  - : Biểu diễn phạm vi trong đó hộp chính đi qua cạnh biên đầu. Điểm bắt đầu phạm vi (tiến độ 0%) xảy ra khi cạnh biên đầu của hộp chính của phần tử trùng với cạnh đầu của vùng hiển thị view progress. Điểm kết thúc phạm vi (tiến độ 100%) là điểm mà cạnh biên cuối của hộp chính của phần tử trùng với cạnh đầu của vùng hiển thị view progress. Kích thước của phạm vi bằng kích thước hộp chính của phần tử theo hướng cuộn.

## Cú pháp chính thức

{{CSSSyntaxRaw(`<timeline-range-name> = cover | contain | entry | exit | entry-crossing | exit-crossing`)}}

## Ví dụ

Xem [View timeline range visualizer](https://scroll-driven-animations.style/tools/view-timeline/ranges/).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-range-start")}}, {{cssxref("animation-range-end")}}, {{cssxref("animation-range")}}
- {{cssxref("animation-timeline")}}
- {{cssxref("scroll-timeline")}}
- {{cssxref("view-timeline-inset")}}
- [Understanding timeline range names](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- [Scroll-driven animation timelines](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- [CSS scroll-driven animations](/vi/docs/Web/CSS/Guides/Scroll-driven_animations) module
- [View timeline range visualizer](https://scroll-driven-animations.style/tools/view-timeline/ranges/)
