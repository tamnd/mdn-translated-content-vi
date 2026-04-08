---
title: :paused
slug: Web/CSS/Reference/Selectors/:paused
page-type: css-pseudo-class
browser-compat: css.selectors.paused
sidebar: cssref
---

**`:paused`** là bộ chọn [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho một phần tử có thể phát, chẳng hạn như {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, khi phần tử đó đang ở trạng thái "tạm dừng" (tức là không "đang phát").

Tài nguyên ở trạng thái tạm dừng nếu người dùng tạm dừng nó một cách rõ ràng, hoặc nếu nó đang ở trạng thái chưa kích hoạt hay không phát khác, như "đã tải, chưa được kích hoạt".
Điều này khác với `:buffering` hoặc `:stalled`, là các trạng thái xảy ra trong khi tài nguyên được coi là "đang phát".

## Cú pháp

```css
:paused {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:paused {
  border: 5px solid orange;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":buffering")}}
- {{cssxref(":muted")}}
- {{cssxref(":playing")}}
- {{cssxref(":seeking")}}
- {{cssxref(":stalled")}}
- {{cssxref(":volume-locked")}}
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
