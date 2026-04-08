---
title: ::cue
slug: Web/CSS/Reference/Selectors/::cue
page-type: css-pseudo-element
browser-compat: css.selectors.cue
sidebar: cssref
---

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::cue`** khớp với các cue [WebVTT](/en-US/docs/Web/API/WebVTT_API) bên trong một phần tử được chọn.
Điều này có thể được dùng để [tạo kiểu cho phụ đề và các cue khác](/en-US/docs/Web/API/WebVTT_API#styling_webvtt_in_html_or_a_stylesheet) trong media có VTT tracks.

{{InteractiveExample("CSS Demo: ::cue", "tabbed-shorter")}}

```css interactive-example
video {
  width: 100%;
}

video::cue {
  font-size: 1rem;
  color: yellow;
}

::cue(u) {
  color: red;
}
```

```html interactive-example
<video controls src="/shared-assets/videos/friday.mp4">
  <track
    default
    kind="captions"
    srclang="en"
    src="/shared-assets/misc/friday.vtt" />
  Sorry, your browser doesn't support embedded videos.
</video>
```

Các thuộc tính được áp dụng cho toàn bộ tập hợp cue như thể chúng là một đơn vị duy nhất. Ngoại lệ duy nhất là `background` và các thuộc tính viết dài của nó áp dụng cho từng cue riêng lẻ, để tránh tạo ra các hộp và che khuất các khu vực lớn bất ngờ của media.

Trong ví dụ trên, bộ chọn `::cue(u)` chọn tất cả các phần tử [`<u>`](/en-US/docs/Web/HTML/Reference/Elements/u) bên trong [văn bản cue](https://github.com/mdn/shared-assets/blob/main/misc/friday.vtt).

## Cú pháp

```css-nolint
::cue | ::cue(<selector>) {
  /* ... */
}
```

## Các thuộc tính được phép

Các quy tắc có bộ chọn bao gồm phần tử này chỉ có thể sử dụng các thuộc tính CSS sau:

- {{cssxref("background")}}
- {{cssxref("background-attachment")}}
- {{cssxref("background-clip")}}
- {{cssxref("background-color")}}
- {{cssxref("background-image")}}
- {{cssxref("background-origin")}}
- {{cssxref("background-position")}}
- {{cssxref("background-repeat")}}
- {{cssxref("background-size")}}
- {{cssxref("color")}}
- {{cssxref("font")}}
- {{cssxref("font-family")}}
- {{cssxref("font-size")}}
- {{cssxref("font-stretch")}}
- {{cssxref("font-style")}}
- {{cssxref("font-variant")}}
- {{cssxref("font-weight")}}
- {{cssxref("line-height")}}
- {{cssxref("opacity")}}
- {{cssxref("outline")}}
- {{cssxref("outline-color")}}
- {{cssxref("outline-style")}}
- {{cssxref("outline-width")}}
- {{cssxref("ruby-position")}}
- {{cssxref("text-combine-upright")}}
- {{cssxref("text-decoration")}}
- {{cssxref("text-decoration-color")}}
- {{cssxref("text-decoration-line")}}
- {{cssxref("text-decoration-style")}}
- {{cssxref("text-decoration-thickness")}}
- {{cssxref("text-shadow")}}
- {{cssxref("visibility")}}
- {{cssxref("white-space")}}

## Ví dụ

### Tạo kiểu cue WebVTT dạng chữ trắng trên nền đen

CSS sau đây đặt kiểu cue sao cho văn bản là màu trắng và nền là hộp đen trong suốt.

```css
::cue {
  color: white;
  background-color: rgb(0 0 0 / 60%);
}
```

### Tạo kiểu các đối tượng node nội bộ WebVTT

Văn bản cue có thể bao gồm _các đối tượng node nội bộ_ dưới dạng các thẻ (tương tự các phần tử HTML) `<c>`, `<i>`, `<b>`, `<u>`, `<ruby>`, `<rt>`, `<v>`, và `<lang>`.
Bộ chọn `::cue()` có thể được dùng để áp dụng các kiểu cho nội dung bên trong các thẻ này để tùy chỉnh cách hiển thị WebVTT track.
Hãy xem xét văn bản cue sau đây sử dụng thẻ `<u>` để gạch chân một số văn bản:

```plain
00:00:01.500 --> 00:00:02.999 line:80%
Tell me, is the <u>lord of the universe</u> in?
```

CSS sau đây tùy chỉnh văn bản bên trong thẻ `<u>` với màu sắc và [trang trí văn bản](/en-US/docs/Web/CSS/Reference/Properties/text-decoration):

```css
::cue(u) {
  color: red;
  text-decoration: wavy overline lime;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Định dạng theo dõi video web (WebVTT)](/en-US/docs/Web/API/WebVTT_API)
- {{HTMLElement("track")}}, {{HTMLElement("video")}}
