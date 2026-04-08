---
title: initial-letter
slug: Web/CSS/Reference/Properties/initial-letter
page-type: css-property
browser-compat: css.properties.initial-letter
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`initial-letter`** đặt kích thước và độ lún cho các chữ cái đầu được thả xuống, nâng lên, và chìm xuống. Thuộc tính này áp dụng cho phần tử giả {{cssxref("::first-letter")}} và các phần tử con đầu tiên ở cấp inline của các container khối.

## Cú pháp

```css
/* Giá trị từ khóa */
initial-letter: normal;

/* Một giá trị */
initial-letter: 3; /* Cao 3 dòng, đường cơ sở ở dòng 3 */
initial-letter: 1.5; /* Cao 1.5 dòng, đường cơ sở ở dòng 2 */

/* Hai giá trị */
initial-letter: 3 2; /* Cao 3 dòng, đường cơ sở ở dòng 2 (nâng lên 1 dòng) */
initial-letter: 3 1; /* Cao 3 dòng, đường cơ sở không thay đổi (nâng lên 2 dòng) */

/* Giá trị toàn cục */
initial-letter: inherit;
initial-letter: initial;
initial-letter: revert;
initial-letter: revert-layer;
initial-letter: unset;
```

### Giá trị

Giá trị từ khóa `normal`, hoặc một `<number>` tùy chọn theo sau bởi một `<integer>`.

- `normal`
  - : Không có hiệu ứng chữ cái đầu đặc biệt. Văn bản hoạt động bình thường.
- `<number>`
  - : Xác định kích thước của chữ cái đầu, tính theo số dòng mà nó chiếm. Giá trị âm không được phép.
- `<integer>`
  - : Xác định số dòng mà chữ cái đầu cần lún xuống khi kích thước của nó được cho. Giá trị phải lớn hơn không. Nếu bỏ qua, nó sao chép giá trị kích thước, làm tròn xuống số nguyên dương gần nhất.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước chữ cái đầu

#### HTML

```html
<p class="normal">Initial letter is normal</p>
<p class="onefive">Initial letter occupies 1.5 lines</p>
<p class="three">Initial letter occupies 3 lines</p>
```

#### CSS

```css
.normal::first-letter {
  -webkit-initial-letter: normal;
  initial-letter: normal;
}

.onefive::first-letter {
  -webkit-initial-letter: 1.5;
  initial-letter: 1.5;
}

.three::first-letter {
  -webkit-initial-letter: 3;
  initial-letter: 3;
}

p {
  outline: 1px dashed red;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_initial_letter_size', 250, 180)}}

### Đặt giá trị lún

Trong ví dụ này, tất cả các chữ cái đầu có cùng kích thước, nhưng với các giá trị lún khác nhau.

#### HTML

```html
<p class="four">Initial letter: Sink value = 4</p>
<p class="same">Initial letter: Sink value not declared (same as size)</p>
<p class="two">Initial letter: Sink value = 2</p>
<p class="one">Initial letter: Sink value = 1</p>
```

#### CSS

```css
.four::first-letter {
  -webkit-initial-letter: 3 4;
  initial-letter: 3 4;
}

.same::first-letter {
  -webkit-initial-letter: 3;
  initial-letter: 3;
}

.two::first-letter {
  -webkit-initial-letter: 3 2;
  initial-letter: 3 2;
}

.one::first-letter {
  -webkit-initial-letter: 3 1;
  initial-letter: 3 1;
}

p {
  outline: 1px dashed red;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_the_sink_value', 250, 240)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::first-letter")}}
- {{cssxref(":first-child")}}
- [Drop caps in CSS](https://www.oddbird.net/2017/01/03/initial-letter/) qua Oddbird (2017)
