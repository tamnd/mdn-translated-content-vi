---
title: position-try
slug: Web/CSS/Reference/Properties/position-try
page-type: css-shorthand-property
browser-compat: css.properties.position-try
sidebar: cssref
---

Thuộc tính **`position-try`** của [CSS](/vi/docs/Web/CSS) là thuộc tính viết tắt tương ứng với các thuộc tính {{cssxref("position-try-order")}} và {{cssxref("position-try-fallbacks")}}.

## Các thuộc tính thành phần

Thuộc tính này là thuộc tính viết tắt cho các thuộc tính CSS sau:

- {{cssxref("position-try-order")}}
- {{cssxref("position-try-fallbacks")}}

## Cú pháp

```css
/* Chỉ position-try-fallbacks */
position-try: normal flip-block;
position-try: top;
position-try: --custom-try-option;
position-try: flip-block flip-inline;
position-try: top, right, bottom;
position-try: --custom-try-option1, --custom-try-option2;
position-try:
  normal flip-block,
  right,
  --custom-try-option;

/* position-try-order và position-try-fallbacks */
position-try: normal none;
position-try:
  most-width --custom-try-option1,
  --custom-try-option2;
position-try:
  most-height flip-block,
  right,
  --custom-try-option;

/* Giá trị toàn cục */
position-try: inherit;
position-try: initial;
position-try: revert;
position-try: revert-layer;
position-try: unset;
```

### Giá trị

Xem {{cssxref("position-try-order")}} và {{cssxref("position-try-fallbacks")}} để biết mô tả các giá trị.

Thuộc tính viết tắt `position-try` có thể chỉ định giá trị cho `position-try-fallbacks`, hoặc `position-try-order` và `position-try-fallbacks`, theo thứ tự đó. Nếu `position-try-order` bị bỏ qua, nó sẽ được đặt thành giá trị khởi tạo của thuộc tính, là `normal`, nghĩa là các tùy chọn dự phòng position-try được thử theo thứ tự xuất hiện trong thuộc tính.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng `position-try` cơ bản

Bản demo này minh họa hiệu ứng của `position-try`.

#### HTML

HTML bao gồm hai phần tử {{htmlelement("div")}} sẽ trở thành một neo và một phần tử được định vị theo neo.

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

#### CSS

Trong CSS, neo được đặt tên {{cssxref("anchor-name")}} và có giá trị {{cssxref("position")}} là `absolute`. Chúng ta định vị nó ở nửa trên của viewport bằng các giá trị {{cssxref("top")}} và {{cssxref("left")}}:

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 45%;
}
```

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
  text-align: center;
}

form {
  position: fixed;
  bottom: 2px;
  right: 2px;
}
```

Tiếp theo, chúng ta thêm tùy chọn vị trí tùy chỉnh `--custom-bottom` để định vị phần tử bên dưới neo và đặt lề phù hợp:

```css
@position-try --custom-bottom {
  top: anchor(bottom);
  bottom: unset;
  margin-top: 10px;
}
```

Ban đầu chúng ta định vị phần tử phía trên neo, sau đó đặt giá trị `position-try` với `position-try-order` là `most-height` và danh sách `position-try-fallbacks` chỉ bao gồm tùy chọn dự phòng tùy chỉnh của chúng ta:

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;

  bottom: anchor(top);
  margin-bottom: 10px;
  justify-self: anchor-center;

  position-try: most-height --custom-bottom;
}
```

#### Kết quả

Phần tử xuất hiện bên dưới neo dù ban đầu được định vị phía trên. Điều này xảy ra vì có nhiều không gian dọc hơn bên dưới neo. Thứ tự thử `most-height` khiến tùy chọn dự phòng `--custom-bottom` được áp dụng, đặt phần tử được định vị vào vị trí mang lại nhiều chiều cao nhất cho khối chứa của nó.

{{ EmbedLiveSample("Basic `position-try` usage", "100%", "300") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-area")}}
- {{cssxref("position-try-fallbacks")}}
- {{cssxref("position-try-order")}}
- Quy tắc at {{cssxref("@position-try")}}
- Giá trị [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value)
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
