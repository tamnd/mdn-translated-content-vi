---
title: ::view-transition-image-pair()
slug: Web/CSS/Reference/Selectors/::view-transition-image-pair
page-type: css-pseudo-element
browser-compat: css.selectors.view-transition-image-pair
sidebar: cssref
---

**`::view-transition-image-pair()`** là một [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) đại diện cho một vùng chứa cho các trạng thái khung nhìn "cũ" và "mới" trong [quá trình chuyển tiếp khung nhìn](/en-US/docs/Web/API/View_Transition_API) — trước và sau khi chuyển tiếp.

Trong quá trình chuyển tiếp khung nhìn, `::view-transition-image-pair()` được đưa vào cây phần tử giả liên kết như mô tả trong [Cây phần tử giả chuyển tiếp khung nhìn](/en-US/docs/Web/API/View_Transition_API/Using#the_view_transition_pseudo-element_tree). Nó luôn là phần tử con của {{cssxref("::view-transition-group()")}}. Về phần tử con, nó có thể có một {{cssxref("::view-transition-new()")}} hoặc một {{cssxref("::view-transition-old()")}}, hoặc cả hai.

`::view-transition-image-pair()` được cấp các kiểu mặc định sau trong bảng kiểu của tác nhân người dùng (UA stylesheet):

```css
:root::view-transition-image-pair(*) {
  position: absolute;
  inset: 0;

  animation-duration: inherit;
  animation-fill-mode: inherit;
  animation-delay: inherit;
}
```

Trong quá trình chuyển tiếp khung nhìn, `::view-transition-image-pair()` có {{cssxref("isolation", "isolation: isolate")}} được thiết lập trên nó trong bảng kiểu chuyển tiếp để các phần tử con của nó có thể được pha trộn với các chế độ pha trộn không phải thông thường mà không ảnh hưởng đến các đầu ra trực quan khác.

## Cú pháp

```css-nolint
::view-transition-image-pair([ <pt-name-selector> <pt-class-selector>? ] | <pt-class-selector>) {
  /* ... */
}
```

### Tham số

- `*`
  - : [Bộ chọn toàn thể (`*`)](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors); chọn tất cả các nhóm chuyển tiếp khung nhìn trên trang.
- `root`
  - : Khiến phần tử giả khớp với nhóm ảnh chụp chuyển tiếp khung nhìn `root` mặc định được tác nhân người dùng tạo ra để chứa quá trình chuyển tiếp khung nhìn cho toàn bộ trang. Nhóm này bao gồm bất kỳ phần tử nào không được gán nhóm ảnh chụp chuyển tiếp khung nhìn riêng thông qua thuộc tính {{cssxref("view-transition-name")}}.
- `<pt-name-selector>`
  - : {{cssxref("custom-ident")}} được đặt làm giá trị của thuộc tính {{cssxref("view-transition-name")}}.
- `<pt-class-selector>`
  - : {{cssxref("custom-ident")}} được đặt làm giá trị của thuộc tính {{cssxref("view-transition-class")}} đứng trước bởi một dấu chấm (`.`).

## Ví dụ

```css
::view-transition-image-pair(root) {
  isolation: auto;
}

::view-transition-image-pair(.card) {
  isolation: isolate;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
