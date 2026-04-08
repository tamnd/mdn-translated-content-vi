---
title: :current
slug: Web/CSS/Reference/Selectors/:current
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.current
sidebar: cssref
---

{{SeeCompatTable}}

Bộ chọn **`:current`** [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) đại diện cho một phần tử hoặc phần tử tổ tiên của một phần tử đang được hiển thị hoặc làm nổi bật.

## Cú pháp

```css-nolint
:current {
  /* ... */
}

:current(<compound-selector-list>) {
  /* ... */
}
```

## Mô tả

Lớp giả `:current` được sử dụng để đại diện cho phần tử "đang được hiển thị" trong một chuỗi các phần tử.

Điều này có thể có nghĩa là "hiện tại" theo nghĩa thời gian: `:current` có thể được sử dụng để nhắm mục tiêu vào phụ đề hoặc chú thích đang được hiển thị (được biểu diễn bằng [WebVTT](/en-US/docs/Web/API/WebVTT_API)) liên kết với video đang phát.

Nó cũng có thể đề cập đến phần tử đang được làm nổi bật trong một chuỗi. Ví dụ, `:current` có thể được kết hợp với [phần tử giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements) `::search-text` để cung cấp các kiểu cụ thể cho kết quả tìm kiếm đang được đặt tiêu điểm từ tính năng tìm kiếm văn bản "Find in page" của trình duyệt.

Ví dụ:

```css
p::search-text {
  color: white;
  background-color: purple;
}

p::search-text:current {
  background-color: crimson;
}
```

## Ví dụ

### Kiểu tùy chỉnh cho kết quả tìm kiếm văn bản

Ví dụ này cho thấy cách sử dụng `::search-text` và `:current` để tạo kiểu tùy chỉnh cho kết quả tìm kiếm "Find in page" của trình duyệt.

#### HTML

HTML bao gồm một đoạn văn bản cơ bản. Chúng ta sẽ không hiển thị mã nguồn HTML, vừa để ngắn gọn, vừa để dễ điều hướng qua các kết quả tìm kiếm trong ví dụ được hiển thị.

```html hidden live-sample___custom-search-results
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus est
  eget eros congue pellentesque. Etiam a augue accumsan, scelerisque nisl sit
  amet, lobortis nulla. Aliquam condimentum eu orci eu elementum. Donec
  porttitor quam et posuere commodo. Mauris rhoncus diam a scelerisque molestie.
  Integer sollicitudin risus dui, ut sagittis lorem laoreet eget. Duis eget
  pretium enim. Morbi tristique, diam sit amet gravida finibus, metus ex
  tincidunt nibh, ac volutpat urna purus et arcu. Donec risus risus, semper vel
  purus sit amet, gravida vestibulum est. Sed et tristique urna. Nam vel mi eget
  nisi consectetur elementum. Aenean faucibus aliquam cursus. Morbi posuere
  tincidunt velit, et sagittis quam sagittis in. Nam eget ante ultrices, auctor
  dui vel, euismod lacus. Vivamus tincidunt, sem ac sodales aliquet, tortor
  tortor consequat diam, nec tempor mi dui vel eros. Aliquam ac erat et metus
  egestas scelerisque.
</p>
```

#### CSS

Trong CSS, chúng ta bắt đầu bằng cách tạo kiểu cho phần tử giả `::search-text`. Chúng ta đặt cho nó các kiểu {{cssxref("background-color")}}, {{cssxref("color")}}, và {{cssxref("text-shadow")}} tùy chỉnh.

```css hidden live-sample___custom-search-results
html {
  font-family: "Helvetica", "Arial";
}

p {
  font-size: 1.5rem;
  line-height: 1.5;
  width: 90%;
  margin: 0 auto;
}

@layer no-support {
  body::before {
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1em 0;
  }
  @supports not selector(::search-text) {
    body::before {
      content: "Your browser doesn't support the ::search-text pseudo-element.";
    }
  }
  @supports not selector(:current) {
    body::before {
      content: "Your browser doesn't support the :current pseudo-class.";
    }
  }
}
```

```css live-sample___custom-search-results
::search-text {
  background-color: purple;
  color: white;
  text-shadow: 1px 1px 1px black;
}
```

Cuối cùng, chúng ta tạo kiểu cho kết quả tìm kiếm đang được đặt tiêu điểm thông qua `::search-text:current`, đặt cho nó `background-color` khác và một số kiểu {{cssxref("text-decoration")}} để phân biệt với phần còn lại của kết quả.

```css live-sample___custom-search-results
::search-text:current {
  background-color: crimson;
  text-decoration-line: underline;
  text-decoration-color: yellow;
  text-decoration-thickness: 3px;
}
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{EmbedLiveSample("live-sample___custom-search-results", "100%", 300)}}

Hãy thử sử dụng giao diện find in page của trình duyệt để tìm một từ xuất hiện nhiều lần trong văn bản ví dụ, chẳng hạn như "aliquam", "amet", hoặc "tortor". Di chuyển giữa kết quả trước và tiếp theo để kiểm tra kiểu `:current`.

### Tạo kiểu cho phụ đề WebVTT đang được hiển thị

#### CSS

```css
:current(p, span) {
  background-color: yellow;
}
```

#### HTML

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

#### WebVTT

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
- {{cssxref(":past")}}
- {{cssxref(":future")}}
- Module [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
