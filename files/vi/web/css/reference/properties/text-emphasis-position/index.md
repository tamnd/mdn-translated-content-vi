---
title: text-emphasis-position
slug: Web/CSS/Reference/Properties/text-emphasis-position
page-type: css-property
browser-compat: css.properties.text-emphasis-position
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-emphasis-position`** xác định vị trí vẽ các dấu nhấn mạnh. Tương tự như văn bản được hiển thị bởi phần tử HTML [`<ruby>`](/en-US/docs/Web/HTML/Reference/Elements/ruby), nếu không có đủ chỗ cho các dấu nhấn mạnh, chiều cao dòng sẽ được tăng lên.

{{InteractiveExample("CSS Demo: text-emphasis-position")}}

```css interactive-example-choice
text-emphasis-position: auto;
```

```css interactive-example-choice
text-emphasis-position: over right;
```

```css interactive-example-choice
text-emphasis-position: under right;
```

```css interactive-example-choice
text-emphasis-position: auto;
writing-mode: vertical-rl;
```

```css interactive-example-choice
text-emphasis-position: over left;
writing-mode: vertical-rl;
```

```css interactive-example-choice
text-emphasis-position: over right;
writing-mode: vertical-rl;
```

```html interactive-example
<section id="default-example">
  <p>
    I'd far rather be
    <span class="transition-all" id="example-element">happy than right</span>
    any day.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}

#example-element {
  text-emphasis: filled double-circle #ffb703;
}
```

## Cú pháp

```css
/* Giá trị ban đầu */
text-emphasis-position: auto;

/* Giá trị từ khóa */
text-emphasis-position: over;
text-emphasis-position: under;

text-emphasis-position: over right;
text-emphasis-position: over left;
text-emphasis-position: under right;
text-emphasis-position: under left;

text-emphasis-position: left over;
text-emphasis-position: right over;
text-emphasis-position: right under;
text-emphasis-position: left under;

/* Giá trị toàn cục */
text-emphasis-position: inherit;
text-emphasis-position: initial;
text-emphasis-position: revert;
text-emphasis-position: revert-layer;
text-emphasis-position: unset;
```

### Giá trị

Thuộc tính nhận một hoặc hai giá trị:

- Nếu chỉ có một giá trị được cung cấp, giá trị đó có thể là `auto`, `over` hay `under`. Khi chỉ dùng `over` hay `under`, `right` được giả định là vị trí mặc định.
- Nếu có hai giá trị được cung cấp, chúng phải bao gồm một trong `over` hay `under` và một trong `right` hay `left`. Thứ tự của chúng không quan trọng.

Các giá trị bao gồm:

- `auto`
  - : Vẽ dấu nhấn mạnh bên trên văn bản trong chế độ viết ngang và bên phải văn bản trong chế độ viết dọc.
- `over`
  - : Vẽ dấu nhấn mạnh bên trên văn bản trong chế độ viết ngang.
- `under`
  - : Vẽ dấu nhấn mạnh bên dưới văn bản trong chế độ viết ngang.
- `right`
  - : Vẽ dấu nhấn mạnh bên phải văn bản trong chế độ viết dọc.
- `left`
  - : Vẽ dấu nhấn mạnh bên trái văn bản trong chế độ viết dọc.

## Mô tả

Vị trí ưa thích của các dấu nhấn mạnh phụ thuộc vào ngôn ngữ. Ví dụ, trong tiếng Nhật, vị trí ưa thích là `over right`. Trong tiếng Trung, vị trí ưa thích là `under right`. Bảng thông tin dưới đây tóm tắt các vị trí dấu nhấn mạnh ưa thích cho tiếng Trung, tiếng Mông Cổ và tiếng Nhật:

<table>
  <caption>
    Vị trí dấu nhấn mạnh và ruby ưa thích
  </caption>
  <thead>
    <tr>
      <th rowspan="2" scope="col">Ngôn ngữ</th>
      <th colspan="2" scope="col">Vị trí ưa thích</th>
      <th colspan="2" rowspan="2" scope="col">Minh họa</th>
    </tr>
    <tr>
      <th>Ngang</th>
      <th>Dọc</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Nhật Bản</td>
      <td rowspan="3">over</td>
      <td rowspan="3">right</td>
      <td rowspan="3">
        <img
          alt="Emphasis marks appear over each emphasized character in horizontal Japanese text."
          src="text-emphasis-ja.png"
          title="Emphasis (shown in blue for clarity) applied above a fragment of Japanese text"
        />
      </td>
      <td rowspan="4">
        <img
          alt="Emphasis marks appear on the right of each emphasized character in vertical Japanese text."
          src="text-emphasis-v.gif"
          title="Emphasis applied on the right of a fragment of Japanese text"
        />
      </td>
    </tr>
    <tr>
      <td>Hàn Quốc</td>
    </tr>
    <tr>
      <td>Mông Cổ</td>
    </tr>
    <tr>
      <td>Trung Quốc</td>
      <td>under</td>
      <td>right</td>
      <td>
        <img
          alt="Emphasis marks appear below each emphasized character in horizontal Simplified Chinese text."
          src="text-emphasis-zh.gif"
          title="Emphasis (shown in blue for clarity) applied below a fragment of Chinese text"
        />
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Thuộc tính `text-emphasis-position` không thể được đặt, và do đó cũng không thể được đặt lại, bằng thuộc tính viết tắt {{cssxref("text-emphasis")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thêm vị trí dấu nhấn mạnh

Sử dụng menu thả xuống để thay đổi vị trí của các dấu nhấn mạnh. Điều này sẽ thay đổi class trên phần tử `<section>`, từ đó cập nhật vị trí của các dấu nhấn mạnh trên văn bản.

#### HTML

```html hidden
<p class="unsupported">
  The <code>auto</code> value is not supported in your browser.
</p>
<label for="position">Emphasis position:</label>
<select id="position">
  <option value="auto">auto</option>
  <option value="over-right">over right</option>
  <option value="over-left">over left</option>
  <option value="under-right">under right</option>
  <option value="under-left">under left</option>
  <option value="preferred">preferred</option>
</select>
```

```html
<section id="setting" class="auto">
  <p class="horizontal" lang="zh">你好世界</p>
  <!-- Hello World in Chinese -->
  <p class="vertical" lang="ja">世界、こんにちは。</p>
  <!-- Hello World in Japanese -->
</section>
```

#### CSS

```css hidden
.unsupported {
  color: red;
}
@supports (text-emphasis-position: auto) {
  .unsupported {
    display: none;
  }
}
.horizontal {
  writing-mode: horizontal-tb;
}
.vertical {
  writing-mode: vertical-rl;
}
section {
  display: flex;
  justify-content: space-around;
}
```

```css
section p {
  text-emphasis: filled circle tomato;
  text-emphasis-position: auto;
}
.over-right p,
.preferred p [lang="ja"] {
  text-emphasis-position: over right;
}
.over-left p {
  text-emphasis-position: over left;
}
.under-right p,
.preferred p [lang="zh"] {
  text-emphasis-position: under right;
}
.under-left p {
  text-emphasis-position: under left;
}
.preferred p [lang="ja"] {
}
```

```js hidden
const position = document.querySelector("#position");
const setting = document.querySelector("#setting");
const updateClass = () => {
  const currentClass = setting.classList;
  setting.classList.replace(currentClass, position.value);
};
position.addEventListener("change", updateClass);
```

#### Kết quả

Sử dụng menu thả xuống "Emphasis position" để chọn vị trí của các dấu nhấn mạnh. Tùy chọn `preferred` trong menu thả xuống sử dụng các vị trí ưa thích, như đã giải thích trong phần [Mô tả](#mô_tả).

{{EmbedLiveSample("Emphasis_mark_positions", 450, 250)}}

### Ưu tiên ruby hơn dấu nhấn mạnh

Một số trình soạn thảo thích ẩn dấu nhấn mạnh khi chúng xung đột với ruby. Trong HTML, điều này có thể thực hiện bằng quy tắc kiểu sau:

```css
ruby {
  text-emphasis: none;
}
```

### Ưu tiên dấu nhấn mạnh hơn ruby

Một số trình soạn thảo khác thích ẩn ruby khi chúng xung đột với dấu nhấn mạnh. Trong HTML, điều này có thể thực hiện bằng mẫu sau:

```css
em {
  text-emphasis: dot; /* Set text-emphasis for <em> elements */
}

em rt {
  display: none; /* Hide ruby inside <em> elements */
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-underline-position")}}
- {{cssxref("text-emphasis-style")}}
- {{cssxref("text-emphasis-color")}}
- Thuộc tính viết tắt {{cssxref("text-emphasis")}}
- {{cssxref("writing-mode")}}
