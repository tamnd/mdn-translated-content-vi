---
title: ::highlight()
slug: Web/CSS/Reference/Selectors/::highlight
page-type: css-pseudo-element
browser-compat: css.selectors.highlight
sidebar: cssref
---

Phần tử giả **`::highlight()`** trong [CSS](/en-US/docs/Web/CSS) áp dụng các kiểu cho một highlight tùy chỉnh.

Một highlight tùy chỉnh là tập hợp các đối tượng {{domxref("Range")}} và được đăng ký trên một trang web bằng cách sử dụng {{domxref("HighlightRegistry")}}.

Phần tử giả `::highlight()` tuân theo mô hình kế thừa đặc biệt chung cho tất cả các phần tử giả highlight. Để biết thêm chi tiết về cách kế thừa này hoạt động, xem phần [Kế thừa của các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements_inheritance).

## Các thuộc tính được phép sử dụng

Chỉ một số thuộc tính CSS nhất định có thể được dùng với `::highlight()`:

- {{CSSxRef("color")}}
- {{CSSxRef("background-color")}}
- {{CSSxRef("text-decoration")}} và các thuộc tính liên quan
- {{CSSxRef("text-shadow")}}
- {{CSSxRef("-webkit-text-stroke-color")}}, {{CSSxRef("-webkit-text-fill-color")}} và {{CSSxRef("-webkit-text-stroke-width")}}

Đặc biệt, {{CSSxRef("background-image")}} bị bỏ qua.

## Cú pháp

```css-nolint
::highlight(custom-highlight-name)
```

## Ví dụ

### Làm nổi bật các ký tự

#### HTML

```html
<p id="rainbow-text">CSS Custom Highlight API rainbow</p>
```

#### CSS

```css
#rainbow-text {
  font-family: monospace;
  font-size: 1.5rem;
}

::highlight(rainbow-color-1) {
  color: violet;
  text-decoration: underline;
}
::highlight(rainbow-color-2) {
  color: purple;
  text-decoration: underline;
}
::highlight(rainbow-color-3) {
  color: blue;
  text-decoration: underline;
}
::highlight(rainbow-color-4) {
  color: green;
  text-decoration: underline;
}
::highlight(rainbow-color-5) {
  color: yellow;
  text-decoration: underline;
}
::highlight(rainbow-color-6) {
  color: orange;
  text-decoration: underline;
}
::highlight(rainbow-color-7) {
  color: red;
  text-decoration: underline;
}
```

#### JavaScript

```js
const textNode = document.getElementById("rainbow-text").firstChild;

if (!CSS.highlights) {
  textNode.textContent =
    "The CSS Custom Highlight API is not supported in this browser!";
}

// Create and register highlights for each color in the rainbow.
const highlights = [];
for (let i = 0; i < 7; i++) {
  // Create a new highlight for this color.
  const colorHighlight = new Highlight();
  highlights.push(colorHighlight);

  // Register this highlight under a custom name.
  CSS.highlights.set(`rainbow-color-${i + 1}`, colorHighlight);
}

// Iterate over the text, character by character.
for (let i = 0; i < textNode.textContent.length; i++) {
  // Create a new range just for this character.
  const range = new Range();
  range.setStart(textNode, i);
  range.setEnd(textNode, i + 1);

  // Add the range to the next available highlight,
  // looping back to the first one once we've reached the 7th.
  highlights[i % 7].add(range);
}
```

#### Kết quả

{{ EmbedLiveSample("Highlighting characters") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API)
- API [CSS custom highlight](/en-US/docs/Web/API/CSS_Custom_Highlight_API)
- Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
