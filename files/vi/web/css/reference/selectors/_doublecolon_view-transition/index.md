---
title: ::view-transition
slug: Web/CSS/Reference/Selectors/::view-transition
page-type: css-pseudo-element
browser-compat: css.selectors.view-transition
sidebar: cssref
---

Phần tử giả **`::view-transition`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho gốc của lớp phủ [view transitions](/en-US/docs/Web/API/View_Transition_API), chứa tất cả các nhóm snapshot chuyển đổi view và nằm trên cùng của tất cả nội dung trang khác.

Trong quá trình chuyển đổi view, `::view-transition` được bao gồm trong cây phần tử giả liên quan như được giải thích trong [Cây phần tử giả chuyển đổi view](/en-US/docs/Web/API/View_Transition_API/Using#the_view_transition_pseudo-element_tree). Đây là node cấp cao nhất của cây này và có một hoặc nhiều {{cssxref("::view-transition-group()")}} làm con.

`::view-transition` được cấp kiểu mặc định sau trong stylesheet UA:

```css
:root::view-transition {
  position: fixed;
  inset: 0;
}
```

Tất cả các phần tử giả {{cssxref("::view-transition-group()")}} được định vị tương đối với gốc chuyển đổi view.

## Cú pháp

```css
::view-transition {
  /* ... */
}
```

## Ví dụ

```css
::view-transition {
  background-color: rgb(0 0 0 / 25%);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Chuyển đổi mượt mà với View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
