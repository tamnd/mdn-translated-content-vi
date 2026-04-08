---
title: :seeking
slug: Web/CSS/Reference/Selectors/:seeking
page-type: css-pseudo-class
browser-compat: css.selectors.seeking
sidebar: cssref
---

Bộ chọn **`:seeking`** [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho một phần tử có thể phát, chẳng hạn như {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, khi phần tử có thể phát đang tìm kiếm vị trí phát lại trong tài nguyên media.
Một tài nguyên được coi là đang tìm kiếm nếu người dùng đã yêu cầu phát lại tại một vị trí cụ thể trong tài nguyên media, nhưng phần tử media chưa đến được vị trí đó.

Tìm kiếm khác với {{cssxref(":buffering")}} ở chỗ phần tử media hiện không tải dữ liệu mà thay vào đó đang nhảy đến một vị trí mới trong tài nguyên media.
Để biết thêm thông tin, xem hướng dẫn [Media buffering, seeking, and time ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges#seekable).

## Cú pháp

```css
:seeking {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:seeking {
  outline: 5px solid red;
}

video:seeking {
  outline: 5px solid blue;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":buffering")}}
- {{cssxref(":muted")}}
- {{cssxref(":paused")}}
- {{cssxref(":playing")}}
- {{cssxref(":stalled")}}
- {{cssxref(":volume-locked")}}
- [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
