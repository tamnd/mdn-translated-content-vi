---
title: ::before
slug: Web/CSS/Reference/Selectors/::before
page-type: css-pseudo-element
browser-compat: css.selectors.before
sidebar: cssref
---

Trong CSS, **`::before`** tạo ra một [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) là con đầu tiên của phần tử được chọn. Nó thường được dùng để thêm nội dung trang trí vào một phần tử thông qua thuộc tính {{cssxref("content")}}. Mặc định nó là inline.

{{InteractiveExample("CSS Demo: ::before", "tabbed-standard")}}

```css interactive-example
a {
  color: blue;
  text-decoration: none;
}

a::before {
  content: "🔗";
}

.local-link::before {
  content: url("/shared-assets/images/examples/firefox-logo.svg");
  display: inline-block;
  width: 15px;
  height: 15px;
  margin-right: 5px;
}
```

```html interactive-example
<p>
  Learning resources for web developers can be found all over the internet. Try
  out
  <a href="https://web.dev/">web.dev</a>,
  <a href="https://www.w3schools.com/">w3schools.com</a> or our
  <a href="https://developer.mozilla.org/" class="local-link">MDN web docs</a>.
</p>
```

## Cú pháp

```css-nolint
::before {
  content: /* value */;
  /* properties */
}
```

## Mô tả

Phần tử giả `::before` là một hộp inline được tạo ra như một con trực tiếp của phần tử mà nó liên kết, hay còn gọi là "phần tử gốc". Nó thường được dùng để thêm nội dung trang trí vào một phần tử thông qua thuộc tính {{CSSxRef("content")}}, chẳng hạn như biểu tượng, dấu ngoặc trích dẫn, hoặc các trang trí khác.

Phần tử giả `::before` không thể áp dụng lên _{{ glossary("replaced elements")}}_ như {{htmlelement("img")}}, vì nội dung của chúng được xác định bởi tài nguyên bên ngoài và không bị ảnh hưởng bởi các kiểu dáng của tài liệu hiện tại.

Một phần tử giả `::before` với giá trị {{cssxref("display")}} là `list-item` sẽ hoạt động như một mục danh sách, và do đó có thể tạo ra một phần tử giả {{cssxref("::marker")}} giống như phần tử {{htmlelement("li")}}.

Nếu thuộc tính {{cssxref("content")}} không được chỉ định, có giá trị không hợp lệ, hoặc có giá trị `normal` hoặc `none`, thì phần tử giả `::before` sẽ không được hiển thị. Nó hoạt động như thể đã đặt `display: none`.

> [!NOTE]
> Đặc tả [Selectors Level 3](https://drafts.csswg.org/selectors-3/#gen-content) đã giới thiệu ký hiệu dấu hai chấm đôi `::before` để phân biệt [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) với [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements). Các trình duyệt cũng chấp nhận ký hiệu dấu hai chấm đơn `:before`, được giới thiệu trong CSS2.

Mặc định, phần tử giả `::before` và `::after` chia sẻ cùng ngữ cảnh xếp chồng với phần tử cha của chúng. Nếu không có {{cssxref("z-index")}} được đặt rõ ràng, nội dung được tạo ra của phần tử giả `::after` sẽ xuất hiện phía trên nội dung của phần tử giả `::before`, vì `::after` được hiển thị sau hơn trong luồng DOM.

## Khả năng tiếp cận

Không nên sử dụng phần tử giả `::before` để thêm nội dung, vì nó không thể truy cập được một cách đáng tin cậy với trình đọc màn hình.

## Ví dụ

### Dấu trích dẫn

Một ví dụ sử dụng phần tử giả `::before` là để cung cấp dấu trích dẫn. Ở đây chúng ta sử dụng cả `::before` và {{Cssxref("::after")}} để chèn ký tự trích dẫn.

#### HTML

```html
<q>Some quotes</q>, he said, <q>are better than none.</q>
```

#### CSS

```css
q::before {
  content: "«";
  color: blue;
}

q::after {
  content: "»";
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('Adding_quotation_marks', '500', '50')}}

### Ví dụ trang trí

Chúng ta có thể tạo kiểu dáng cho văn bản hoặc hình ảnh trong thuộc tính {{cssxref("content")}} theo hầu hết mọi cách chúng ta muốn.

#### HTML

```html
<span class="ribbon">Notice where the orange box is.</span>
```

#### CSS

```css
.ribbon {
  background-color: #5bc8f7;
}

.ribbon::before {
  content: "Look at this orange box.";
  background-color: #ffba10;
  border-color: black;
  border-style: dotted;
}
```

#### Kết quả

{{EmbedLiveSample('Decorative_example', 450, 60)}}

### Danh sách việc cần làm

Trong ví dụ này, chúng ta sẽ tạo một danh sách việc cần làm bằng cách sử dụng phần tử giả. Phương pháp này thường được dùng để thêm những chi tiết nhỏ vào giao diện người dùng và cải thiện trải nghiệm người dùng.

#### HTML

```html
<ul>
  <li>Buy milk</li>
  <li>Take the dog for a walk</li>
  <li>Exercise</li>
  <li>Write code</li>
  <li>Play music</li>
  <li>Relax</li>
</ul>
```

#### CSS

```css
li {
  list-style-type: none;
  position: relative;
  margin: 2px;
  padding: 0.5em 0.5em 0.5em 2em;
  background: lightgrey;
  font-family: sans-serif;
}

li.done {
  background: #ccff99;
}

li.done::before {
  content: "";
  position: absolute;
  border-color: #009933;
  border-style: solid;
  border-width: 0 0.3em 0.25em 0;
  height: 1em;
  top: 1.3em;
  left: 0.6em;
  margin-top: -1em;
  transform: rotate(45deg);
  width: 0.5em;
}
```

#### JavaScript

```js
const list = document.querySelector("ul");
list.addEventListener("click", (ev) => {
  if (ev.target.tagName === "LI") {
    ev.target.classList.toggle("done");
  }
});
```

Đây là ví dụ mã trên đang chạy trực tiếp. Lưu ý rằng không có biểu tượng nào được sử dụng, và dấu kiểm thực ra là `::before` đã được tạo kiểu trong CSS. Hãy hoàn thành một vài việc.

#### Kết quả

{{EmbedLiveSample('To-do_list', 400, 300)}}

### Chuỗi thoát Unicode

Vì nội dung được tạo ra là CSS, không phải HTML, bạn **không thể** sử dụng các thực thể đánh dấu trong giá trị nội dung. Nếu bạn cần sử dụng một ký tự đặc biệt và không thể nhập trực tiếp vào chuỗi nội dung CSS của mình, hãy sử dụng chuỗi thoát unicode. Chuỗi này bao gồm dấu gạch chéo ngược theo sau là giá trị unicode thập lục phân của ký tự.

#### HTML

```html
<ol>
  <li>Crack Eggs into bowl</li>
  <li>Add Milk</li>
  <li>Add Flour</li>
  <li aria-current="step">Mix thoroughly into a smooth batter</li>
  <li>Pour a ladleful of batter onto a hot, greased, flat frying pan</li>
  <li>Fry until the top of the pancake loses its gloss</li>
  <li>Flip it over and fry for a couple more minutes</li>
  <li>serve with your favorite topping</li>
</ol>
```

#### CSS

```css
li {
  padding: 0.5em;
}

li[aria-current="step"] {
  font-weight: bold;
}

li[aria-current="step"]::before {
  content: "\21E8 "; /* Unicode escape sequence for "Rightwards White Arrow" */
  display: inline;
}
```

#### Kết quả

{{EmbedLiveSample('Special_characters', 400, 200)}}

### Phần tử giả lồng nhau `::before::marker`

[Phần tử giả lồng nhau](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#nesting_pseudo-elements) `::before::marker` chọn {{CSSxRef("::marker")}} danh sách của một phần tử giả `::before` mà bản thân nó là một mục danh sách, tức là có thuộc tính {{CSSxRef("display")}} được đặt thành `list-item`.

Trong demo này, chúng ta tạo thêm [các mục danh sách](/en-US/docs/Web/HTML/Reference/Elements/li) trước và sau một menu điều hướng danh sách bằng cách sử dụng `::before` và `::after` (đặt chúng thành `display: list-item` để chúng hoạt động như các mục danh sách). Sau đó chúng ta sử dụng `ul::before::marker` và `ul::after::marker` để đặt màu khác cho các dấu danh sách của chúng.

#### HTML

```html
<ul>
  <li><a href="#">Introduction</a></li>
  <li><a href="#">Getting started</a></li>
  <li><a href="#">Understanding the basics</a></li>
</ul>
```

#### CSS

```css
ul {
  font-size: 1.5rem;
  font-family: "Helvetica", "Arial", sans-serif;
}

ul::before,
ul::after {
  display: list-item;
  color: orange;
}

ul::before {
  content: "Start";
}

ul::after {
  content: "End";
}

ul::before::marker,
ul::after::marker {
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('`::before::marker` nested pseudo-elements', 450, 200)}}

Trong khi các dấu đầu dòng của ba mục điều hướng được tạo ra vì chúng là các phần tử `<li>`, "Start" và "End" đã được chèn vào thông qua các phần tử giả và `::marker` được dùng để tạo kiểu cho các dấu đầu dòng của chúng.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("::after")}}
- {{Cssxref("content")}}
