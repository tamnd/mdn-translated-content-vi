---
title: text-overflow
slug: Web/CSS/Reference/Properties/text-overflow
page-type: css-property
browser-compat: css.properties.text-overflow
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`text-overflow`** xác định cách nội dung bị ẩn do tràn ra ngoài được thông báo cho người dùng. Nó có thể bị cắt, hiển thị dấu ba chấm (`…`), hoặc hiển thị một chuỗi tùy chỉnh.

{{InteractiveExample("CSS Demo: text-overflow")}}

```css interactive-example-choice
text-overflow: clip;
```

```css interactive-example-choice
text-overflow: ellipsis;
```

```css interactive-example-choice
text-overflow: "-";
```

```css interactive-example-choice
text-overflow: "";
```

```html interactive-example
<section id="default-example">
  <div id="example-element-container">
    <p id="example-element">"Is there any tea on this spaceship?" he asked.</p>
  </div>
</section>
```

```css interactive-example
#example-element-container {
  width: 100%;
  max-width: 18em;
}

#example-element {
  line-height: 50px;
  border: 1px solid #c5c5c5;
  overflow: hidden;
  white-space: nowrap;
  font-family: sans-serif;
  padding: 0 0.5em;
  text-align: left;
}
```

Thuộc tính `text-overflow` không buộc việc tràn ra ngoài phải xảy ra. Để làm văn bản tràn ra ngoài container, bạn phải đặt các thuộc tính CSS khác: {{cssxref("overflow")}} và {{cssxref("white-space")}}. Ví dụ:

```css
overflow: hidden;
white-space: nowrap;
```

Thuộc tính `text-overflow` chỉ ảnh hưởng đến nội dung tràn ra ngoài phần tử container khối theo hướng tiến _nội tuyến_ (không phải văn bản tràn ra ở phía dưới hộp, chẳng hạn).

## Cú pháp

```css
text-overflow: clip;
text-overflow: ellipsis ellipsis;
text-overflow: ellipsis " [..]";

/* Giá trị toàn cục */
text-overflow: inherit;
text-overflow: initial;
text-overflow: revert;
text-overflow: revert-layer;
text-overflow: unset;
```

Thuộc tính `text-overflow` có thể được chỉ định bằng một hoặc hai giá trị. Nếu một giá trị được đưa ra, nó chỉ định hành vi tràn cho cuối dòng (cuối bên phải đối với văn bản từ trái sang phải, cuối bên trái đối với văn bản từ phải sang trái). Nếu hai giá trị được đưa ra, giá trị đầu tiên chỉ định hành vi tràn cho cuối bên trái của dòng, và giá trị thứ hai chỉ định nó cho cuối bên phải. Thuộc tính chấp nhận giá trị từ khóa (`clip` hoặc `ellipsis`) hoặc giá trị `<string>`.

### Giá trị

- `clip`
  - : Mặc định cho thuộc tính này. Giá trị từ khóa này sẽ cắt văn bản tại giới hạn của [vùng nội dung](/vi/docs/Web/CSS/Guides/Box_model/Introduction), do đó việc cắt có thể xảy ra ở giữa một ký tự. Để cắt tại chỗ chuyển tiếp giữa các ký tự, bạn có thể chỉ định `text-overflow` là một chuỗi rỗng, nếu điều đó được hỗ trợ trong các trình duyệt mục tiêu của bạn: `text-overflow: '';`.
- `ellipsis`
  - : Giá trị từ khóa này sẽ hiển thị dấu ba chấm (`'…'`, `U+2026 HORIZONTAL ELLIPSIS`) để đại diện cho văn bản bị cắt. Dấu ba chấm được hiển thị bên trong [vùng nội dung](/vi/docs/Web/CSS/Guides/Box_model/Introduction), giảm lượng văn bản được hiển thị. Nếu không có đủ không gian để hiển thị dấu ba chấm, nó sẽ bị cắt.
- `<string>`
  - : {{cssxref("&lt;string&gt;")}} được sử dụng để đại diện cho văn bản bị cắt. Chuỗi được hiển thị bên trong [vùng nội dung](/vi/docs/Web/CSS/Guides/Box_model/Introduction), thu nhỏ kích thước văn bản được hiển thị. Nếu không có đủ không gian để hiển thị bản thân chuỗi đó, nó sẽ bị cắt.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Cú pháp một giá trị

Ví dụ này hiển thị các giá trị khác nhau cho `text-overflow` được áp dụng cho một đoạn văn, đối với văn bản từ trái sang phải và từ phải sang trái.

#### HTML

```html
<div class="ltr">
  <h2>Left to right text</h2>
  <pre>clip</pre>
  <p class="overflow-clip">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  </p>
  <pre>ellipsis</pre>
  <p class="overflow-ellipsis">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  </p>
  <pre>" [..]"</pre>
  <p class="overflow-string">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  </p>
</div>

<div class="rtl">
  <h2>Right to left text</h2>
  <pre>clip</pre>
  <p class="overflow-clip">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  </p>
  <pre>ellipsis</pre>
  <p class="overflow-ellipsis">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  </p>
  <pre>" [..]"</pre>
  <p class="overflow-string">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  </p>
</div>
```

#### CSS

```css
p {
  width: 200px;
  border: 1px solid;
  padding: 2px 5px;

  /* Both of the following are required for text-overflow */
  white-space: nowrap;
  overflow: hidden;
}

.overflow-clip {
  text-overflow: clip;
}

.overflow-ellipsis {
  text-overflow: ellipsis;
}

.overflow-string {
  text-overflow: " [..]";
}

body {
  display: flex;
  justify-content: space-around;
}

.ltr > p {
  direction: ltr;
}

.rtl > p {
  direction: rtl;
}
```

#### Kết quả

{{EmbedLiveSample('One-value_syntax', 600, 320)}}

### Cú pháp hai giá trị

Ví dụ này hiển thị cú pháp hai giá trị cho `text-overflow`, nơi bạn có thể xác định hành vi tràn khác nhau cho điểm bắt đầu và kết thúc của văn bản. Để hiển thị hiệu ứng, chúng ta phải cuộn dòng để điểm bắt đầu của dòng cũng bị ẩn.

#### HTML

```html
<pre>clip clip</pre>
<p class="overflow-clip-clip">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
</p>
<pre>clip ellipsis</pre>
<p class="overflow-clip-ellipsis">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
</p>
<pre>ellipsis ellipsis</pre>
<p class="overflow-ellipsis-ellipsis">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
</p>
<pre>ellipsis " [..]"</pre>
<p class="overflow-ellipsis-string">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
</p>
```

#### CSS

```css
p {
  width: 200px;
  border: 1px solid;
  padding: 2px 5px;

  /* Both of the following are required for text-overflow */
  white-space: nowrap;
  overflow: scroll;
}

.overflow-clip-clip {
  text-overflow: clip clip;
}

.overflow-clip-ellipsis {
  text-overflow: clip ellipsis;
}

.overflow-ellipsis-ellipsis {
  text-overflow: ellipsis ellipsis;
}

.overflow-ellipsis-string {
  text-overflow: ellipsis " [..]";
}
```

#### JavaScript

```js
// Scroll each paragraph so the start is also hidden
const paras = document.querySelectorAll("p");

for (const para of paras) {
  para.scroll(100, 0);
}
```

#### Kết quả

{{EmbedLiveSample('Two-value_syntax', 600, 360)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan: {{cssxref("overflow")}}, {{cssxref("white-space")}}
- Các thuộc tính CSS kiểm soát ngắt dòng trong từ: {{cssxref("overflow-wrap")}}, {{cssxref("word-break")}}
