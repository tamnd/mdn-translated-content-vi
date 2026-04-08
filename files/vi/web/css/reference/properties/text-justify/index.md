---
title: text-justify
slug: Web/CSS/Reference/Properties/text-justify
page-type: css-property
browser-compat: css.properties.text-justify
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`text-justify`** xác định loại căn chỉnh nào nên được áp dụng cho văn bản khi {{cssxref("text-align", "text-align: justify;")}} được đặt trên một phần tử.

## Cú pháp

```css
text-justify: none;
text-justify: auto;
text-justify: inter-word;
text-justify: inter-character;
text-justify: distribute; /* Giá trị không dùng nữa */

/* Giá trị toàn cục */
text-justify: inherit;
text-justify: initial;
text-justify: revert;
text-justify: revert-layer;
text-justify: unset;
```

### Giá trị

- `none`
  - : Tắt căn chỉnh văn bản. Điều này có tác dụng tương tự như không đặt {{cssxref("text-align")}} gì cả, mặc dù hữu ích nếu bạn cần bật/tắt căn chỉnh vì một lý do nào đó.
- `auto`
  - : Trình duyệt chọn loại căn chỉnh tốt nhất cho tình huống hiện tại dựa trên sự cân bằng giữa hiệu suất và chất lượng, và cũng dựa trên điều phù hợp nhất với ngôn ngữ của văn bản (ví dụ: tiếng Anh, ngôn ngữ CJK, v.v.). Đây là căn chỉnh mặc định được sử dụng nếu `text-justify` không được đặt.
- `inter-word`
  - : Văn bản được căn chỉnh bằng cách thêm khoảng cách giữa các từ (thực tế là thay đổi {{cssxref("word-spacing")}}), phù hợp nhất với các ngôn ngữ phân tách từ bằng dấu cách, như tiếng Anh hoặc tiếng Hàn.
- `inter-character`
  - : Văn bản được căn chỉnh bằng cách thêm khoảng cách giữa các ký tự (thực tế là thay đổi {{cssxref("letter-spacing")}}), phù hợp nhất với các ngôn ngữ như tiếng Nhật.
- `distribute`
  - : Hiển thị hành vi giống như `inter-character`; giá trị này được giữ lại để tương thích ngược.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Minh họa các giá trị khác nhau của text-justify

```html hidden
<p class="none">
  <code>text-justify: none</code> —<br />Lorem ipsum dolor sit amet, consectetur
  adipiscing elit. Nunc ornare maximus vehicula. Duis nisi velit, dictum id
  mauris vitae, lobortis pretium quam. Quisque sed nisi pulvinar, consequat
  justo id, feugiat leo. Cras eu elementum dui.
</p>
<p class="auto">
  <code>text-justify: auto</code> —<br />Lorem ipsum dolor sit amet, consectetur
  adipiscing elit. Nunc ornare maximus vehicula. Duis nisi velit, dictum id
  mauris vitae, lobortis pretium quam. Quisque sed nisi pulvinar, consequat
  justo id, feugiat leo. Cras eu elementum dui.
</p>
<p class="dist">
  <code>text-justify: distribute</code> —<br />Lorem ipsum dolor sit amet,
  consectetur adipiscing elit. Nunc ornare maximus vehicula. Duis nisi velit,
  dictum id mauris vitae, lobortis pretium quam. Quisque sed nisi pulvinar,
  consequat justo id, feugiat leo. Cras eu elementum dui.
</p>
<p class="word">
  <code>text-justify: inter-word</code> —<br />Lorem ipsum dolor sit amet,
  consectetur adipiscing elit. Nunc ornare maximus vehicula. Duis nisi velit,
  dictum id mauris vitae, lobortis pretium quam. Quisque sed nisi pulvinar,
  consequat justo id, feugiat leo. Cras eu elementum dui.
</p>
<p class="char">
  <code>text-justify: inter-character</code> —<br />Lorem ipsum dolor sit amet,
  consectetur adipiscing elit. Nunc ornare maximus vehicula. Duis nisi velit,
  dictum id mauris vitae, lobortis pretium quam. Quisque sed nisi pulvinar,
  consequat justo id, feugiat leo. Cras eu elementum dui.
</p>
```

```css
p {
  font-size: 1.5em;
  border: 1px solid black;
  padding: 10px;
  width: 95%;
  margin: 10px auto;
  text-align: justify;
}

.none {
  text-justify: none;
}

.auto {
  text-justify: auto;
}

.dist {
  text-justify: distribute;
}

.word {
  text-justify: inter-word;
}

.char {
  text-justify: inter-character;
}
```

{{EmbedLiveSample("Examples","100%",400)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
