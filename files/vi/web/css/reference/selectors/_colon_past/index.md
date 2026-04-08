---
title: :past
slug: Web/CSS/Reference/Selectors/:past
page-type: css-pseudo-class
browser-compat: css.selectors.past
sidebar: cssref
---

**`:past`** là bộ chọn [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) theo chiều thời gian, khớp với bất kỳ phần tử nào xuất hiện hoàn toàn trước một phần tử khớp với {{cssxref(":current")}}. Ví dụ như trong video có phụ đề đang được hiển thị qua [WebVTT](/en-US/docs/Web/API/WebVTT_API).

```css
:past(p, span) {
  display: none;
}
```

## Cú pháp

```css
:past {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:past(p, span) {
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

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Video Text Tracks Format (WebVTT)](/en-US/docs/Web/API/WebVTT_API)
- {{cssxref(":current")}}
- {{cssxref(":future")}}
