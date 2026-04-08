---
title: ::view-transition-old()
slug: Web/CSS/Reference/Selectors/::view-transition-old
page-type: css-pseudo-element
browser-compat: css.selectors.view-transition-old
sidebar: cssref
---

**`::view-transition-old()`** là một [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) đại diện cho trạng thái khung nhìn "cũ" của quá trình chuyển tiếp khung nhìn — một ảnh chụp tĩnh của khung nhìn cũ, trước khi chuyển tiếp.

Trong quá trình chuyển tiếp khung nhìn, `::view-transition-old()` được đưa vào cây phần tử giả liên kết như mô tả trong [Cây phần tử giả chuyển tiếp khung nhìn](/en-US/docs/Web/API/View_Transition_API/Using#the_view_transition_pseudo-element_tree), với điều kiện có trạng thái "cũ" để đại diện. Nó luôn là phần tử con của {{cssxref("::view-transition-image-pair()")}}, và không bao giờ có phần tử con.

Đây là một phần tử được thay thế và do đó có thể được thao tác với các thuộc tính như {{cssxref("object-fit")}} và {{cssxref("object-position")}}. Nó có kích thước tự nhiên bằng với kích thước nội dung.

Các kiểu mặc định sau đây được đưa vào bảng kiểu của tác nhân người dùng (UA stylesheet):

```css
:root::view-transition-old(*),
:root::view-transition-new(*) {
  position: absolute;
  inset-block-start: 0;
  inline-size: 100%;
  block-size: auto;

  animation-duration: inherit;
  animation-fill-mode: inherit;
  animation-delay: inherit;
}

/* Keyframes for blending when there are 2 images */
@keyframes -ua-mix-blend-mode-plus-lighter {
  from {
    mix-blend-mode: plus-lighter;
  }
  to {
    mix-blend-mode: plus-lighter;
  }
}

@keyframes -ua-view-transition-fade-out {
  to {
    opacity: 0;
  }
}
```

> [!NOTE]
> Các kiểu chuyển tiếp khung nhìn bổ sung cũng được thiết lập để tạo hoạt ảnh `::view-transition-old()`. Chúng được tạo động trong quá trình chuyển tiếp; xem phần [setup transition pseudo-elements](https://drafts.csswg.org/css-view-transitions-1/#setup-transition-pseudo-elements) và [update pseudo-element styles](https://drafts.csswg.org/css-view-transitions-1/#update-pseudo-element-styles) trong đặc tả để biết thêm chi tiết.

## Cú pháp

```css-nolint
::view-transition-old([ <pt-name-selector> <pt-class-selector>? ] | <pt-class-selector>) {
  /* ... */
}
```

### Tham số

- `*`
  - : Bộ chọn toàn thể (`*`) chọn tất cả các nhóm chuyển tiếp khung nhìn trên trang.
- `root`
  - : Khiến phần tử giả khớp với nhóm ảnh chụp chuyển tiếp khung nhìn `root` mặc định được tác nhân người dùng tạo ra để chứa quá trình chuyển tiếp khung nhìn cho toàn bộ trang. Nhóm này bao gồm bất kỳ phần tử nào không được gán nhóm ảnh chụp chuyển tiếp khung nhìn riêng thông qua thuộc tính {{cssxref("view-transition-name")}}.
- `<pt-name-selector>`
  - : {{cssxref("custom-ident")}} được đặt làm giá trị của thuộc tính {{cssxref("view-transition-name")}}.
- `<pt-class-selector>`
  - : {{cssxref("custom-ident")}} được đặt làm giá trị của thuộc tính {{cssxref("view-transition-class")}} đứng trước bởi một dấu chấm (`.`).

## Ví dụ

```css
figcaption {
  view-transition-name: figure-caption;
}

@keyframes grow-x {
  from {
    transform: scaleX(0);
  }
  to {
    transform: scaleX(1);
  }
}

@keyframes shrink-x {
  from {
    transform: scaleX(1);
  }
  to {
    transform: scaleX(0);
  }
}

::view-transition-old(figure-caption),
::view-transition-new(figure-caption) {
  height: auto;
  right: 0;
  left: auto;
  transform-origin: right center;
}

::view-transition-old(figure-caption) {
  animation: 0.25s linear both shrink-x;
}

::view-transition-new(figure-caption) {
  animation: 0.25s 0.25s linear both grow-x;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
