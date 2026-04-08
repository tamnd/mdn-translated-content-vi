---
title: :future
slug: Web/CSS/Reference/Selectors/:future
page-type: css-pseudo-class
browser-compat: css.selectors.future
sidebar: cssref
---

Bộ chọn **`:future`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) theo chiều thời gian, khớp với bất kỳ phần tử nào xuất hiện hoàn toàn sau một phần tử khớp với {{cssxref(":current")}}. Ví dụ, trong một video có phụ đề đang được hiển thị qua [WebVTT](/en-US/docs/Web/API/WebVTT_API).

```css
:future(p, span) {
  display: none;
}
```

## Cú pháp

```css
:future {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:future(p, span) {
  display: none;
}
```

### HTML

```html
<video controls preload="metadata">
  <source src="video.mp4" type="video/mp4" />
  <source src="video.webm" type="video/webm" />
  <track
    label="English"
    kind="subtitles"
    srclang="en"
    src="subtitles.vtt"
    default />
</video>
```

### WebVTT

```plain
WEBVTT FILE

1
00:00:03.500 --> 00:00:05.000
This is the first caption

2
00:00:06.000 --> 00:00:09.000
This is the second caption

3
00:00:11.000 --> 00:00:19.000
This is the third caption
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Video Text Tracks Format (WebVTT)](/en-US/docs/Web/API/WebVTT_API)
- {{cssxref(":current")}}
- {{cssxref(":past")}}
