---
title: box-decoration-break
slug: Web/CSS/Reference/Properties/box-decoration-break
page-type: css-property
browser-compat: css.properties.box-decoration-break
sidebar: cssref
---

Thuộc tính **`box-decoration-break`** [CSS](/en-US/docs/Web/CSS) chỉ định cách các [đoạn](/en-US/docs/Web/CSS/Guides/Fragmentation) của một phần tử được hiển thị khi bị ngắt qua nhiều dòng, cột hoặc trang.

{{InteractiveExample("CSS Demo: box-decoration-break")}}

```css interactive-example-choice
-webkit-box-decoration-break: slice;
box-decoration-break: slice;
```

```css interactive-example-choice
-webkit-box-decoration-break: clone;
box-decoration-break: clone;
```

```html interactive-example
<section id="default-example">
  <div id="example-container">
    <span id="example-element">This text breaks across multiple lines.</span>
  </div>
</section>
```

```css interactive-example
#example-container {
  width: 14rem;
}

#example-element {
  background: linear-gradient(to bottom right, #6f6f6f, black);
  color: white;
  box-shadow:
    8px 8px 10px 0 #ff1492,
    -5px -5px 5px 0 blue,
    5px 5px 15px 0 yellow;
  padding: 0 1em;
  border-radius: 16px;
  border-style: solid;
  margin-left: 10px;
  font: 24px sans-serif;
  line-height: 2;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
box-decoration-break: slice;
box-decoration-break: clone;

/* Giá trị toàn cục */
box-decoration-break: inherit;
box-decoration-break: initial;
box-decoration-break: revert;
box-decoration-break: revert-layer;
box-decoration-break: unset;
```

Thuộc tính `box-decoration-break` được chỉ định bằng một trong các giá trị từ khóa liệt kê dưới đây.

### Giá trị

- `slice`
  - : Phần tử ban đầu được hiển thị như thể hộp của nó không bị phân mảnh, sau đó phần hiển thị của hộp giả thuyết này bị cắt thành các mảnh cho mỗi dòng/cột/trang. Lưu ý rằng hộp giả thuyết có thể khác nhau cho mỗi đoạn vì nó sử dụng chiều cao riêng nếu ngắt xảy ra theo hướng nội tuyến, và chiều rộng riêng nếu ngắt xảy ra theo hướng khối. Xem thông số kỹ thuật CSS để biết chi tiết.
- `clone`
  - : Mỗi đoạn hộp được hiển thị độc lập với đường viền, padding và margin được chỉ định bao quanh mỗi đoạn. {{ Cssxref("border-radius") }}, {{ Cssxref("border-image") }}, và {{ Cssxref("box-shadow") }} được áp dụng cho từng đoạn một cách độc lập. Nền cũng được vẽ độc lập cho mỗi đoạn, nghĩa là hình nền với {{ Cssxref("background-repeat", "background-repeat: no-repeat") }} vẫn có thể lặp lại nhiều lần.

## Mô tả

Giá trị được chỉ định sẽ ảnh hưởng đến giao diện của các thuộc tính sau:

- {{Cssxref("background")}}
- {{Cssxref("border")}}
- {{Cssxref("border-image")}}
- {{Cssxref("box-shadow")}}
- {{Cssxref("clip-path")}}
- {{Cssxref("margin")}}
- {{Cssxref("padding")}}

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đoạn hộp nội tuyến

Một phần tử nội tuyến có trang trí hộp có thể có giao diện không mong muốn khi chứa ngắt dòng do giá trị `slice` mặc định.
Ví dụ sau đây cho thấy hiệu ứng của việc thêm `box-decoration-break: clone` vào một {{htmlelement("span")}} chứa các thẻ {{htmlelement("br")}}:

```css hidden
body {
  display: flex;
  background-color: grey;
  justify-content: space-around;
}

span {
  padding: 0em 1em;
  border-radius: 1rem;
  border-style: solid;
  margin: 1rem;
  font: 22px sans-serif;
  line-height: 2;
}
```

```css
span {
  background: linear-gradient(to bottom right, yellow, green);
  box-shadow:
    8px 8px 10px 0px deeppink,
    -5px -5px 5px 0px blue,
    5px 5px 15px 0px yellow;
}

#clone {
  -webkit-box-decoration-break: clone;
  box-decoration-break: clone;
}
```

```html
<p>
  <span>The<br />quick<br />orange fox</span>
</p>
<p>
  <span id="clone">The<br />quick<br />orange fox</span>
</p>
```

{{embedlivesample("inline_box_fragments", "100%", "210")}}

### Đoạn hộp khối

Ví dụ sau đây cho thấy cách các phần tử khối có trang trí hộp trông như thế nào khi chứa ngắt dòng trong [bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout).
Lưu ý rằng kết quả của `box-decoration-break: slice` sẽ tương đương với {{htmlelement("div")}} đầu tiên nếu xếp chồng theo chiều dọc.

```css hidden
body {
  background-color: grey;
}
span {
  padding: 0em 2em;
  border-radius: 250px;
  border-style: solid;
  margin-left: 1em;
  font: 20px sans-serif;
  line-height: 1.5;
}
```

```css
span {
  display: block;
  background: linear-gradient(to bottom right, yellow, green);
  box-shadow:
    inset 8px 8px 10px 0px deeppink,
    inset -5px -5px 5px 0px blue,
    inset 5px 5px 15px 0px yellow;
}
#base {
  width: 33%;
}
.columns {
  columns: 3;
}

.clone {
  -webkit-box-decoration-break: clone;
  box-decoration-break: clone;
}
```

```html
<div id="base">
  <span>The<br />quick<br />orange fox</span>
</div>
<br />

<h2>'box-decoration-break: slice'</h2>
<div class="columns">
  <span>The<br />quick<br />orange fox</span>
</div>

<h2>'box-decoration-break: clone'</h2>
<div class="columns">
  <span class="clone">The<br />quick<br />orange fox</span>
</div>
```

{{embedlivesample("block_box_fragments", "", "340")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("break-after")}}, {{cssxref("break-before")}}, {{cssxref("break-inside")}}
