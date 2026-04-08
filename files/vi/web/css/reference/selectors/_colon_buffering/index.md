---
title: :buffering
slug: Web/CSS/Reference/Selectors/:buffering
page-type: css-pseudo-class
browser-compat: css.selectors.buffering
sidebar: cssref
---

Bộ chọn **`:buffering`** [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) đại diện cho một phần tử có thể phát, chẳng hạn như {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, khi phần tử có thể phát đang lưu vùng đệm tài nguyên media.

Một phần tử được coi là đang lưu vùng đệm khi phần tử đó không thể tiếp tục phát vì đang cố tải dữ liệu media nhưng chưa có đủ dữ liệu để bắt đầu hoặc tiếp tục phát.
Để biết thêm thông tin, xem hướng dẫn [Media buffering, seeking, and time ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges#seekable).

> [!NOTE]
> Một phần tử vẫn được coi là {{cssxref(":playing")}} khi nó đang "lưu vùng đệm".
> Nếu `:buffering` khớp với một phần tử, `:playing` cũng sẽ khớp với phần tử đó.

## Cú pháp

```css
:buffering {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:buffering {
  outline: 5px solid red;
}

video:buffering {
  outline: 5px solid blue;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":muted")}}
- {{cssxref(":paused")}}
- {{cssxref(":playing")}}
- {{cssxref(":seeking")}}
- {{cssxref(":stalled")}}
- {{cssxref(":volume-locked")}}
- [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
