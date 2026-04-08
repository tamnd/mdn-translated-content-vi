---
title: CSS transitions
short-title: Transitions
slug: Web/CSS/Guides/Transitions
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-transitions-1/
  - https://drafts.csswg.org/css-transitions-2/
sidebar: cssref
---

Module **CSS transitions** quy định chức năng tạo ra các transition (chuyển tiếp) dần dần giữa các giá trị thuộc tính CSS khác nhau. Hành vi của các transition này có thể được kiểm soát bằng cách chỉ định hàm easing, thời gian và các giá trị khác.

Thông thường, khi giá trị của một thuộc tính CSS thay đổi, kết quả của sự thay đổi từ giá trị cũ sang giá trị mới là tức thì. Module CSS transitions cho phép kiểm soát quá trình chuyển đổi từ trạng thái thuộc tính cũ sang trạng thái mới trong một khoảng thời gian được chỉ định. Nó cũng cung cấp các event handler để cho phép mã được chạy để phản hồi với các giai đoạn khác nhau của quá trình transition.

Trong một số trường hợp nhất định, không có giá trị "từ" (from) ban đầu cho một transition. Ví dụ, nếu một phần tử được thêm vào DOM, các kiểu được định nghĩa là cho trạng thái "đến" (to). Module này cung cấp at-rule {{cssxref("@starting-style")}}, cho phép định nghĩa các kiểu bắt đầu cho những trường hợp như vậy. Module này cũng định nghĩa cách các giá trị thuộc tính rời rạc (discrete) nên được chuyển tiếp, chẳng hạn như chuyển tiếp thuộc tính {{cssxref("display")}} được animate rời rạc từ giá trị `none` sang giá trị hiển thị.

## Tham khảo

### Thuộc tính

- {{cssxref("transition")}}
- {{cssxref("transition-behavior")}}
- {{cssxref("transition-delay")}}
- {{cssxref("transition-duration")}}
- {{cssxref("transition-property")}}
- {{cssxref("transition-timing-function")}}

### At-rule

- {{cssxref("@starting-style")}}

### Giao diện

- {{domxref("CSSStartingStyleRule")}}
- {{domxref("CSSTransition")}}
  - Thuộc tính {{domxref("CSSTransition.transitionProperty", "transitionProperty")}}
- {{domxref("TransitionEvent")}}
  - Constructor {{domxref("TransitionEvent.TransitionEvent", "TransitionEvent()")}}
  - Thuộc tính {{domxref("TransitionEvent.propertyName")}}
  - Thuộc tính {{domxref("TransitionEvent.elapsedTime")}}
  - Thuộc tính {{domxref("TransitionEvent.pseudoElement")}}
  - Sự kiện {{domxref("Element/transitioncancel_event", "transitioncancel")}}
  - Sự kiện {{domxref("Element/transitionend_event", "transitionend")}}
  - Sự kiện {{domxref("Element/transitionrun_event", "transitionrun")}}
  - Sự kiện {{domxref("Element/transitionstart_event", "transitionstart")}}

## Hướng dẫn

- [Sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
  - : Hướng dẫn từng bước giải thích cách tạo transitions bằng CSS. Bài viết này mô tả từng thuộc tính CSS liên quan và giải thích cách chúng tương tác với nhau.
- [Animate `display`](/en-US/docs/Web/CSS/Reference/Properties/display#animating_display)
  - : Chuyển tiếp đến và từ giá trị `none` của thuộc tính {{cssxref("display")}} được animate rời rạc.
- [Chuyển tiếp một popover](/en-US/docs/Web/CSS/Reference/Properties/overlay#transitioning_a_popover) và [chuyển tiếp một `<dialog>`](/en-US/docs/Web/HTML/Reference/Elements/dialog#transitioning_dialog_elements)
  - : Ví dụ về chuyển tiếp từ {{cssxref("@starting-style")}} đến các kiểu pseudo-class {{cssxref(":popover-open")}} và {{cssxref(":open")}} cuối cùng.

## Khái niệm liên quan

- Thuộc tính {{cssxref("interpolate-size")}}
- Hàm {{cssxref("calc-size()")}}
- Thuật ngữ bảng chú giải {{Glossary("Intrinsic size")}}

- Module [CSS easing functions](/en-US/docs/Web/CSS/Guides/Easing_functions):
  - Kiểu dữ liệu {{cssxref("easing-function")}}

- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations):
  - Shorthand {{cssxref("animation")}}
  - {{cssxref("animation-delay")}}
  - {{cssxref("animation-direction")}}
  - {{cssxref("animation-duration")}}
  - {{cssxref("animation-fill-mode")}}
  - {{cssxref("animation-iteration-count")}}
  - {{cssxref("animation-name")}}
  - {{cssxref("animation-play-state")}}
  - {{cssxref("animation-timing-function")}}

- Module [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms):
  - {{cssxref("transform")}}
  - {{cssxref("transform-box")}}
  - {{cssxref("transform-origin")}}
  - {{cssxref("transform-style")}}

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap):
  - {{cssxref("scroll-snap-type")}}
  - {{cssxref("scroll-padding")}}
  - {{cssxref("scroll-snap-align")}}
  - {{cssxref("scroll-margin")}}
  - {{cssxref("scroll-snap-stop")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- {{cssxref("opacity")}}
- {{cssxref("visibility")}}
- Giao diện {{domxref("ViewTransition")}}
- Giao diện {{domxref("PageTransitionEvent")}}
