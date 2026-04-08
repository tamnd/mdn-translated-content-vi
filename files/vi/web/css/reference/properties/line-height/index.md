---
title: line-height
slug: Web/CSS/Reference/Properties/line-height
page-type: css-property
browser-compat: css.properties.line-height
sidebar: cssref
---

Thuộc tính **`line-height`** trong [CSS](/vi/docs/Web/CSS) thiết lập chiều cao của hộp dòng trong các [chế độ viết](/vi/docs/Web/CSS/Reference/Properties/writing-mode#vertical-rl) ngang. Trong chế độ viết dọc, nó thiết lập chiều rộng của hộp dòng. Nó thường được dùng để đặt khoảng cách giữa các dòng văn bản. Trên các phần tử cấp khối trong chế độ viết ngang, nó xác định chiều cao ưa thích của các hộp dòng trong phần tử, và trên các phần tử nội tuyến không [thay thế](/vi/docs/Glossary/Replaced_elements), nó xác định chiều cao dùng để tính toán chiều cao hộp dòng.

{{InteractiveExample("CSS Demo: line-height")}}

```css interactive-example-choice
line-height: normal;
```

```css interactive-example-choice
line-height: 2.5;
```

```css interactive-example-choice
line-height: 3em;
```

```css interactive-example-choice
line-height: 150%;
```

```css interactive-example-choice
line-height: 32px;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    Far out in the uncharted backwaters of the unfashionable end of the western
    spiral arm of the Galaxy lies a small unregarded yellow sun.
  </div>
</section>
```

```css interactive-example
#example-element {
  font-family: "Georgia", serif;
  max-width: 200px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
line-height: normal;

/* Giá trị không đơn vị: dùng số này nhân với
cỡ chữ của phần tử */
line-height: 3.5;

/* Giá trị <length> */
line-height: 3em;

/* Giá trị <percentage> */
line-height: 34%;

/* Giá trị toàn cục */
line-height: inherit;
line-height: initial;
line-height: revert;
line-height: revert-layer;
line-height: unset;
```

Thuộc tính `line-height` được chỉ định là một trong những giá trị sau:

- một `<number>`
- một `<length>`
- một `<percentage>`
- từ khóa `normal`.

### Giá trị

- `normal`
  - : Phụ thuộc vào tác nhân người dùng. Trình duyệt máy tính để bàn (bao gồm Firefox) sử dụng giá trị mặc định khoảng **`1.2`**, tùy thuộc vào `font-family` của phần tử.
- `<number>` (không đơn vị)
  - : Giá trị sử dụng là {{cssxref("&lt;number&gt;")}} không đơn vị này nhân với cỡ chữ của chính phần tử. Giá trị được tính toán giống như giá trị `<number>` được chỉ định. Trong hầu hết các trường hợp, **đây là cách ưa thích** để đặt `line-height` và tránh các kết quả bất ngờ do kế thừa.
- `<length>`
  - : {{cssxref("&lt;length&gt;")}} được chỉ định được dùng trong tính toán chiều cao hộp dòng. Các giá trị được cho bằng đơn vị **em** có thể tạo ra các kết quả bất ngờ (xem ví dụ bên dưới).
- `<percentage>`
  - : Tương đối so với cỡ chữ của chính phần tử. Giá trị được tính toán là {{cssxref("&lt;percentage&gt;")}} này nhân với cỡ chữ được tính toán của phần tử. Các giá trị **phần trăm** có thể tạo ra các kết quả bất ngờ (xem ví dụ thứ hai bên dưới).

## Khả năng tiếp cận

Sử dụng giá trị tối thiểu là `1.5` cho `line-height` cho nội dung đoạn văn chính. Điều này sẽ giúp những người gặp phải các tình trạng thị lực kém, cũng như những người có vấn đề nhận thức như Dyslexia. Nếu trang được phóng to để tăng kích thước văn bản, việc sử dụng giá trị không đơn vị đảm bảo rằng chiều cao dòng sẽ co giãn tỷ lệ thuận.

[W3C Understanding WCAG 2.2](https://w3c.github.io/wcag/guidelines/22/#visual-presentation)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

```css
/* Tất cả các quy tắc bên dưới đều có cùng chiều cao dòng kết quả */

/* number/unitless */
div {
  line-height: 1.2;
  font-size: 10pt;
}

/* length */
div {
  line-height: 1.2em;
  font-size: 10pt;
}

/* percentage */
div {
  line-height: 120%;
  font-size: 10pt;
}

/* font shorthand */
div {
  font:
    10pt/1.2 "Bitstream Charter",
    "Georgia",
    serif;
}
```

Thường tiện lợi hơn khi đặt `line-height` bằng cách sử dụng viết tắt {{cssxref("font")}} như trên, nhưng điều này yêu cầu thuộc tính `font-family` cũng phải được chỉ định.

### Ưu tiên số không đơn vị cho các giá trị line-height

Ví dụ này cho thấy lý do tại sao nên sử dụng các giá trị {{cssxref("&lt;number&gt;")}} thay vì các giá trị {{cssxref("&lt;length&gt;")}}. Chúng ta sẽ sử dụng hai phần tử {{HTMLElement("div")}}. Div đầu tiên với viền màu xanh lá, sử dụng giá trị `line-height` không đơn vị. Div thứ hai với viền đỏ sử dụng giá trị `line-height` được định nghĩa bằng `em`.

#### HTML

```html
<div class="box green">
  <h1>Avoid unexpected results by using unitless line-height.</h1>
  Length and percentage line-heights have poor inheritance behavior.
</div>

<div class="box red">
  <h1>Avoid unexpected results by using unitless line-height.</h1>
  Length and percentage line-heights have poor inheritance behavior
</div>

<!-- The first <h1> line-height is calculated from its own font-size   (30px × 1.1) = 33px -->
<!-- The second <h1> line-height results from the red div's font-size  (15px × 1.1) = 16.5px, probably not what you want -->
```

#### CSS

```css
.green {
  line-height: 1.1;
  border: solid limegreen;
}

.red {
  line-height: 1.1em;
  border: solid red;
}

h1 {
  font-size: 30px;
}

.box {
  width: 18em;
  display: inline-block;
  vertical-align: top;
  font-size: 15px;
}
```

#### Kết quả

{{EmbedLiveSample('Prefer_unitless_numbers_for_line-height_values', 600, 200)}}

### Khoảng cách giữa các dòng trong chế độ viết dọc

Thuộc tính `line-height` có thể dùng để điều chỉnh khoảng cách giữa các dòng dọc trong chế độ viết dọc.

```html hidden
<div class="haiku">
  古池や蛙飛び込む水の音<br />
  ふるいけやかわずとびこむみずのおと<br />
  富士の風や扇にのせて江戸土産<br />
  ふじのかぜやおうぎにのせてえどみやげ<br />
</div>

<div class="haiku wide">
  古池や蛙飛び込む水の音<br />
  ふるいけやかわずとびこむみずのおと<br />
  富士の風や扇にのせて江戸土産<br />
  ふじのかぜやおうぎにのせてえどみやげ<br />
</div>
```

```css
.haiku {
  border: 1px solid;
  margin-bottom: 1rem;
  padding: 0.5rem;
  background-color: wheat;

  writing-mode: vertical-rl;
}

.wide {
  line-height: 2;
}
```

#### Kết quả

{{EmbedLiveSample('Space between lines in vertical writing modes', '100%', 650)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("font")}}, {{Cssxref("font-size")}}
- {{glossary("Leading")}}
