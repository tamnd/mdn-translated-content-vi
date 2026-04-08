---
title: :playing
slug: Web/CSS/Reference/Selectors/:playing
page-type: css-pseudo-class
browser-compat: css.selectors.playing
sidebar: cssref
---

Bộ chọn lớp giả **`:playing`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)) đại diện cho trạng thái phát của một phần tử có khả năng phát, chẳng hạn như {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, khi phần tử đó đang "phát". Một phần tử được coi là đang phát nếu nó đang phát tài nguyên phương tiện, hoặc nếu nó đã tạm dừng vì lý do ngoài ý muốn của người dùng (chẳng hạn như {{cssxref(":buffering")}} hoặc {{cssxref(":stalled")}}).

## Cú pháp

```css
:playing {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:playing {
  border: 5px solid green;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":buffering")}}
- {{cssxref(":muted")}}
- {{cssxref(":paused")}}
- {{cssxref(":seeking")}}
- {{cssxref(":stalled")}}
- {{cssxref(":volume-locked")}}
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
