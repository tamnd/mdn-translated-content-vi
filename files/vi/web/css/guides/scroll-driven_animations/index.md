---
title: CSS scroll-driven animations
short-title: Scroll-driven animations
slug: Web/CSS/Guides/Scroll-driven_animations
page-type: css-module
spec-urls: https://drafts.csswg.org/scroll-animations-1/
sidebar: cssref
---

Module **CSS scroll-driven animations** cung cấp chức năng xây dựng trên [module CSS animations](/en-US/docs/Web/CSS/Guides/Animations) và [Web Animations API](/en-US/docs/Web/API/Web_Animations_API). Nó cho phép bạn animate các giá trị thuộc tính theo timeline dựa trên cuộn thay vì timeline tài liệu dựa trên thời gian mặc định. Điều này có nghĩa là bạn có thể animate một phần tử bằng cách cuộn phần tử đó, scroll container của nó, hoặc phần tử gốc của nó, thay vì chỉ bằng sự trôi qua của thời gian.

## Scroll-driven animations hoạt động

Bạn có thể xác định scroller kiểm soát animation bằng cách đặt tên animation hoặc dùng hàm {{cssxref("animation-timeline/scroll", "scroll()")}}.

```html hidden live-sample___scroll_animation
<main>
  <div></div>
</main>
```

```css live-sample___scroll_animation
main {
  scroll-timeline: --main-timeline;
}

div {
  animation: background-animation linear;
  animation-timeline: scroll(nearest inline);
}

div::after {
  animation: shape-animation linear;
  animation-timeline: --main-timeline;
}
```

```css hidden live-sample___scroll_animation
@layer animations {
  @keyframes background-animation {
    0% {
      background-color: palegoldenrod;
    }
    100% {
      background-color: magenta;
    }
  }
  @keyframes shape-animation {
    0% {
      left: 0;
      top: 0;
      background-color: black;
    }
    50% {
      top: calc(100% - var(--elSize));
      left: calc(50% - var(--elSize));
      background-color: red;
    }
    100% {
      left: calc(100vw - var(--elSize));
      top: 0;
      rotate: 1800deg;
      background-color: white;
    }
  }
}

@layer page-setup {
  :root {
    --elSize: 50px;
  }
  main {
    height: 90vh;
    overflow: scroll;
    border: 1px solid;
    margin: 5vh auto;
  }
  div {
    height: 400vh;
    width: 400vw;
  }
  div::after {
    content: "";
    border: 1px solid red;
    height: var(--elSize);
    width: var(--elSize);
    position: absolute;
    border-radius: 20px;
    corner-shape: superellipse(-4);
  }
}

@layer no-support {
  @supports not (scroll-timeline: --main-timeline) {
    body::before {
      content: "Your browser doesn't support scroll-driven animations.";
      background-color: wheat;
      display: block;
      text-align: center;
    }
  }
}
```

{{EmbedLiveSample("scroll_animation", "", "400px")}}

Cuộn phần tử theo chiều inline để xem màu nền thay đổi. Cuộn dọc để xem nội dung được tạo ra di chuyển, xoay và thay đổi màu sắc.

## Tham chiếu

### Thuộc tính

- Shorthand {{cssxref("animation-range")}}
  - {{cssxref("animation-range-end")}}
  - {{cssxref("animation-range-start")}}
- Shorthand {{cssxref("scroll-timeline")}}
  - {{cssxref("scroll-timeline-axis")}}
  - {{cssxref("scroll-timeline-name")}}
- {{cssxref("timeline-scope")}}
- Shorthand {{cssxref("view-timeline")}}
  - {{cssxref("view-timeline-axis")}}
  - {{cssxref("view-timeline-inset")}}
  - {{cssxref("view-timeline-name")}}

### Kiểu dữ liệu và giá trị

- {{cssxref("axis")}}
- {{cssxref("timeline-range-name")}}

### Hàm

- {{cssxref("animation-timeline/scroll", "scroll()")}}
- {{cssxref("animation-timeline/view", "view()")}}

### Interface

- {{domxref("ScrollTimeline")}}
- {{domxref("ViewTimeline")}}

## Hướng dẫn

- [Scroll-driven animation timelines](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
  - : Scroll-driven animation timeline và cách tạo scroll-driven animation.
- [Timeline range names](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
  - : Kiểu dữ liệu {{cssxref("timeline-range-name")}}: Hiểu các tên timeline range khác nhau.

## Khái niệm liên quan

- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
  - {{cssxref("animation-timeline")}}
  - At-rule {{cssxref("@keyframes")}}
  - [`<keyframe-selector>`](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
  - {{glossary("Scroll container")}}
  - [Scrollport](/en-US/docs/Glossary/Scroll_container#scrollport)
- API [Web Animations](/en-US/docs/Web/API/Web_Animations_API)
  - {{domxref("Element.animate()")}}
  - {{domxref("Animation")}}
  - {{domxref("AnimationTimeline")}}
  - {{domxref("DocumentTimeline")}}
  - {{domxref("KeyframeEffect")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Animate elements on scroll with scroll-driven animations](https://developer.chrome.com/docs/css-ui/scroll-driven-animations) via developer.chrome.com (2023)
