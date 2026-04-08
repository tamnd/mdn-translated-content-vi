---
title: paint()
slug: Web/CSS/Reference/Values/image/paint
page-type: css-function
browser-compat: css.types.image.paint
sidebar: cssref
---

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) **`paint()`** trong [CSS](/vi/docs/Web/CSS) định nghĩa một giá trị {{cssxref("image")}} được tạo ra bởi một PaintWorklet.

## Cú pháp

```css
paint(workletName, ...parameters)
```

trong đó:

- _workletName_
  - : Tên của worklet đã được đăng ký.
- _parameters_ {{optional_inline}}
  - : Các tham số bổ sung tùy chọn để truyền cho paintWorklet

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng CSS paint() cơ bản

Cho HTML sau:

```html live-sample___example-boxbg
<ul>
  <li>item 1</li>
  <li>item 2</li>
  <li>item 3</li>
  <li>item 4</li>
  <li>item 5</li>
  <li>item 6</li>
  <li>item 7</li>
  <li>item 8</li>
  <li>item 9</li>
  <li>item 10</li>
  <li>item N</li>
</ul>
```

Trong JavaScript, chúng ta đăng ký [paint worklet](/vi/docs/Web/API/PaintWorkletGlobalScope):

```js live-sample___example-boxbg
CSS.paintWorklet.addModule(
  "https://mdn.github.io/houdini-examples/cssPaint/intro/worklets/boxbg.js",
);
```

Trong CSS, chúng ta định nghĩa `background-image` là kiểu `paint()` với tên worklet là `boxbg`, cùng với các biến (ví dụ `--box-color` và `--width-subtractor`) mà worklet sẽ sử dụng:

```css live-sample___example-boxbg
body {
  font: 1.2em / 1.2 sans-serif;
}
li {
  background-image: paint(boxbg);
  --box-color: hsl(55 90% 60%);
}

li:nth-of-type(3n) {
  --box-color: hsl(155 90% 60%);
  --width-subtractor: 20;
}

li:nth-of-type(3n + 1) {
  --box-color: hsl(255 90% 60%);
  --width-subtractor: 40;
}
```

{{EmbedLiveSample("example-boxbg", "", "300px")}}

### CSS paint() với tham số

Bạn có thể truyền các đối số tùy chọn trong hàm CSS `paint()`. Trong ví dụ này, chúng ta đã truyền hai đối số để kiểm soát xem `background-image` trên một nhóm các mục danh sách là `filled` (đổ đầy) hay có đường viền `stroke`, và `width` (độ rộng) của đường viền đó:

```html hidden live-sample___example-highlight
<ul>
  <li>item 1</li>
  <li>item 2</li>
  <li>item 3</li>
  <li>item 4</li>
  <li>item 5</li>
  <li>item 6</li>
  <li>item 7</li>
  <li>item 8</li>
  <li>item 9</li>
  <li>item 10</li>
  <li>item N</li>
</ul>
```

```js hidden live-sample___example-highlight
CSS.paintWorklet.addModule(
  "https://mdn.github.io/houdini-examples/cssPaint/intro/worklets/hilite.js",
);
```

```css live-sample___example-highlight
body {
  font: 1.2em / 1.2 sans-serif;
}

li {
  --box-color: hsl(55 90% 60% / 100%);
  background-image: paint(hollow-highlights, stroke, 2px);
}

li:nth-of-type(3n) {
  --box-color: hsl(155 90% 60% / 100%);
  background-image: paint(hollow-highlights, filled, 3px);
}

li:nth-of-type(3n + 1) {
  --box-color: hsl(255 90% 60% / 100%);
  background-image: paint(hollow-highlights, stroke, 1px);
}
```

Chúng ta đã bao gồm một thuộc tính tùy chỉnh trong khối bộ chọn để định nghĩa màu hộp. Các thuộc tính tùy chỉnh có thể truy cập được từ PaintWorklet.

{{EmbedLiveSample("example-highlight", "", "300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('PaintWorkletGlobalScope')}}
- [CSS Painting API](/vi/docs/Web/API/CSS_Painting_API)
- [Using the CSS Painting API](/vi/docs/Web/API/CSS_Painting_API/Guide)
- {{cssxref("image")}}
- [Canvas API](/vi/docs/Web/API/Canvas_API)
