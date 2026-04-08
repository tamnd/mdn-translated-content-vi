---
title: :volume-locked
slug: Web/CSS/Reference/Selectors/:volume-locked
page-type: css-pseudo-class
browser-compat: css.selectors.volume-locked
sidebar: cssref
---

Bộ chọn lớp giả **`:volume-locked`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho một phần tử có khả năng phát âm thanh, chẳng hạn {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, nhưng âm lượng của phần tử media hiện đang bị người dùng "khóa".

Tác nhân người dùng có thể đặt các giá trị [`muted`](/en-US/docs/Web/API/HTMLMediaElement/muted) hoặc [`volume`](/en-US/docs/Web/API/HTMLMediaElement/volume) của media theo tùy chọn người dùng (ví dụ: ghi nhớ giá trị cuối cùng được đặt giữa các phiên, theo từng trang web, hoặc cách khác).
Phần tử đang ở trạng thái `:volume-locked` không thể bị tắt tiếng, bật tiếng lại, hay thay đổi âm lượng qua JavaScript. Trạng thái khóa là tùy chọn của hệ điều hành hoặc tác nhân người dùng.

## Cú pháp

```css
:volume-locked {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:volume-locked {
  border: 5px solid green;
}

video:volume-locked {
  border: 5px solid aqua;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":buffering")}}
- {{cssxref(":muted")}}
- {{cssxref(":paused")}}
- {{cssxref(":playing")}}
- {{cssxref(":seeking")}}
- {{cssxref(":stalled")}}
- [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
- Thuộc tính [`volume`](/en-US/docs/Web/API/HTMLMediaElement/volume) của các đối tượng {{domxref("HTMLMediaElement")}}
