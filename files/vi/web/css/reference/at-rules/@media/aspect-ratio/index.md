---
title: aspect-ratio
slug: Web/CSS/Reference/At-rules/@media/aspect-ratio
page-type: css-media-feature
browser-compat: css.at-rules.media.aspect-ratio
sidebar: cssref
---

Tính năng media [CSS](/en-US/docs/Web/CSS) **`aspect-ratio`** có thể được dùng để kiểm tra {{glossary("aspect ratio")}} (tỉ lệ khung hình) của {{glossary("viewport")}} (vùng hiển thị).

## Cú pháp

Tính năng `aspect-ratio` được chỉ định dưới dạng giá trị {{cssxref("&lt;ratio&gt;")}} đại diện cho tỉ lệ chiều rộng trên chiều cao của viewport. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể sử dụng các biến thể có tiền tố **`min-aspect-ratio`** và **`max-aspect-ratio`** để truy vấn các giá trị tối thiểu và tối đa tương ứng.

## Ví dụ

Trong ví dụ dưới đây, một phần tử {{HTMLElement("div")}} được chứa trong một {{HTMLElement("iframe")}}. iframe tạo ra viewport riêng của nó. Hãy thay đổi kích thước `<iframe>` để xem `aspect-ratio` hoạt động.

Lưu ý rằng khi không có điều kiện truy vấn media nào là đúng, nền sẽ chuyển sang màu trắng vì không có quy tắc nào dưới đây sẽ được áp dụng cho `<div>` bên trong `<iframe>`. Hãy xem bạn có thể tìm ra giá trị chiều rộng và chiều cao nào kích hoạt điều này!

### HTML

```html
<iframe
  id="outer"
  srcdoc="<div id='inner'>Hãy quan sát phần tử này khi bạn thay đổi kích thước chiều rộng và chiều cao của viewport iframe.</div>">
</iframe>
```

### CSS

```css
/* Tỉ lệ khung hình tối thiểu được phép */
/* Chọn tỉ lệ khung hình 8/5 = 1.6 trở lên */
@media (min-aspect-ratio: 8/5) {
  div {
    background: #9999ff; /* xanh lam */
  }
}

/* Tỉ lệ khung hình tối đa được phép */
/* Chọn tỉ lệ khung hình 3/2 = 1.5 trở xuống */
@media (max-aspect-ratio: 3/2) {
  div {
    background: #99ff99; /* xanh lá */
  }
}

/* Tỉ lệ khung hình chính xác, đặt ở cuối để tránh bị ghi đè */
@media (aspect-ratio: 1/1) {
  div {
    background: #ff9999; /* đỏ */
  }
}
```

### Kết quả

```html hidden
<label id="wf" for="w">width:165</label>
<input id="w" name="w" type="range" min="100" max="250" step="5" value="165" />
<label id="hf" for="w">height:165</label>
<input id="h" name="h" type="range" min="100" max="250" step="5" value="165" />
<label id="ratio">aspect-ratio: 165/165 = 1</label>

<iframe
  id="outer"
  srcdoc="<style> @media (min-aspect-ratio: 8/5) { div { background: #9999ff; } } @media (max-aspect-ratio: 3/2) { div { background: #99ff99; } } @media (aspect-ratio: 1/1) { div { background: #ff9999; } }</style><div id='inner'> Watch this element as you resize iframe viewport's width and height.</div>">
</iframe>
```

```css hidden
iframe {
  display: block;
  border: 1px dashed black;
}
```

```js hidden
outer.style.width = outer.style.height = "165px";

const updateRatio = () => {
  ratio.textContent = `aspect-ratio: ${w.value}/${h.value} = ${(w.value / h.value).toFixed(2)}`;
};

w.onchange = w.oninput = () => {
  outer.style.width = `${w.value}px`;
  wf.textContent = `width: ${w.value}`;
  updateRatio();
};

h.onchange = h.oninput = () => {
  outer.style.height = `${h.value}px`;
  hf.textContent = `height: ${h.value}`;
  updateRatio();
};
```

{{ EmbedLiveSample('Result', '300px', '350px') }}

Lưu ý rằng `min-aspect-ratio: 8/5` đặt _cận dưới_ là 1.6, vì vậy truy vấn media này chọn các phần tử có tỉ lệ khung hình từ 1.6 trở lên. `max-aspect-ratio: 3/2` đặt _cận trên_, vì vậy truy vấn media này chọn các phần tử có tỉ lệ khung hình từ 1.5 trở xuống. `aspect-ratio: 1/1` ghi đè quy tắc tỉ lệ khung hình tối đa vì nó được khai báo sau và chọn các phần tử có tỉ lệ khung hình chính xác là `1`.

Từ trạng thái ban đầu, khi bạn giảm chiều cao, tỉ lệ khung hình bắt đầu tăng từ một. Vì vậy màu nền của div thay đổi từ đỏ(1) < xanh lá(1.5) < trắng < xanh lam(1.6).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hiểu về `aspect-ratio`](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
