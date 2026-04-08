---
title: :muted
slug: Web/CSS/Reference/Selectors/:muted
page-type: css-pseudo-class
browser-compat: css.selectors.muted
sidebar: cssref
---

Bộ chọn lớp giả **`:muted`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) đại diện cho một phần tử có khả năng phát âm thanh, chẳng hạn như {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, nhưng đang ở trạng thái tắt tiếng (buộc im lặng).

Tắt tiếng khác với {{cssxref(":volume-locked")}} ở chỗ tác giả trang có quyền kiểm soát việc một phần tử phương tiện có thể được tắt tiếng hay bật tiếng hay không. Tác nhân người dùng có thể đặt giá trị `muted` của phương tiện theo tùy chọn người dùng (ví dụ: ghi nhớ giá trị được đặt lần cuối giữa các phiên, theo từng trang web, hoặc theo cách khác). Một phần tử ở trạng thái `:volume-locked` không thể được tắt tiếng, bật tiếng, hoặc thay đổi âm lượng qua JavaScript vì tùy chọn hệ điều hành hoặc tác nhân người dùng.

## Cú pháp

```css
:muted {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:muted {
  outline: 5px solid red;
}

video:muted {
  outline: 5px solid blue;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":buffering")}}
- {{cssxref(":paused")}}
- {{cssxref(":playing")}}
- {{cssxref(":seeking")}}
- {{cssxref(":stalled")}}
- {{cssxref(":volume-locked")}}
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
- Thuộc tính [`muted`](/en-US/docs/Web/API/HTMLMediaElement/muted) của các đối tượng {{domxref("HTMLMediaElement")}}
