---
title: CSS view transitions
short-title: View transitions
slug: Web/CSS/Guides/View_transitions
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-view-transitions-1/
  - https://drafts.csswg.org/css-view-transitions-2/
sidebar: cssref
---

Module **CSS view transitions** định nghĩa hành vi của [View Transition API](/en-US/docs/Web/API/View_Transition_API), cho phép các nhà phát triển tạo ra các hiệu ứng chuyển tiếp có animation giữa các trạng thái khác nhau trong một tài liệu và giữa các tài liệu. Module này cũng định nghĩa các thuộc tính CSS và pseudo-element để tạo kiểu cho các hiệu ứng chuyển tiếp này.

## Tham chiếu

### Thuộc tính

- {{cssxref("view-transition-class")}}
- {{cssxref("view-transition-name")}}

### At-rule và descriptor

- {{cssxref("@view-transition")}}
  - Descriptor [`navigation`](/en-US/docs/Web/CSS/Reference/At-rules/@view-transition#navigation)

### Selector và pseudo-element

- {{cssxref(":active-view-transition")}}
- {{cssxref(":active-view-transition-type()")}}
- {{cssxref("::view-transition")}}
- {{cssxref("::view-transition-image-pair()")}}
- {{cssxref("::view-transition-group()")}}
- {{cssxref("::view-transition-new()")}}
- {{cssxref("::view-transition-old()")}}

### Interface

- {{domxref("CSSViewTransitionRule")}}
- {{domxref("ViewTransition")}}
  - Phương thức {{domxref("ViewTransition.skipTransition()")}}
  - {{domxref("ViewTransition.updateCallbackDone")}}
  - {{domxref("ViewTransition.ready")}}
  - {{domxref("ViewTransition.finished")}}
- Phương thức {{domxref("Document.startViewTransition()")}}

## Hướng dẫn

- [Sử dụng View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
  - : Giải thích cách tạo view transition và tùy chỉnh animation chuyển tiếp, bao gồm việc thao túng các view transition đang hoạt động.

## Các khái niệm liên quan

- Sự kiện {{domxref("PageRevealEvent", "pagereveal")}}
- Sự kiện {{domxref("PageSwapEvent", "pageswap")}}
- {{domxref("Document.visibilityState")}}

- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
  - {{cssxref("animation")}}
  - {{cssxref("@keyframes")}}
  - {{domxref("CSSKeyframesRule")}}
  - {{domxref("CSSStyleRule")}}
  - [Web animations API](/en-US/docs/Web/API/Web_Animations_API)

- Module [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms)
  - {{cssxref("transform")}}
  - {{cssxref("transform-function")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
- [Functional pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#functional_pseudo-classes)
- [Học: Pseudo-class và pseudo-element](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
