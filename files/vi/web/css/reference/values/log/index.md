---
title: log()
slug: Web/CSS/Reference/Values/log
page-type: css-function
browser-compat: css.types.log
sidebar: cssref
---

Hàm **`log()`** trong [CSS](/vi/docs/Web/CSS) là một hàm mũ trả về logarithm của một số.

[Logarithm](https://en.wikipedia.org/wiki/Logarithm) là nghịch đảo của lũy thừa. Đó là số mà một cơ số cố định phải được nâng lên để thu được số được truyền vào tham số đầu tiên.

Trong CSS, khi chỉ một tham số được truyền vào, logarithm tự nhiên `e`, hay xấp xỉ `2.7182818`, được sử dụng, mặc dù cơ số có thể được đặt thành bất kỳ giá trị nào với một tham số thứ hai tùy chọn.

## Cú pháp

```css
/* A <number> value */
width: calc(100px * log(7.389)); /* 200px */
width: calc(100px * log(8, 2)); /* 300px */
width: calc(100px * log(625, 5)); /* 400px */
```

### Tham số

Hàm `log(value [, base]?)` nhận hai giá trị phân cách bằng dấu phẩy làm tham số.

- `value`
  - : Một phép tính giải thành {{cssxref("&lt;number&gt;")}} lớn hơn hoặc bằng 0. Biểu diễn giá trị cần lấy logarithm.

- `base`
  - : Tùy chọn. Một phép tính giải thành {{cssxref("&lt;number&gt;")}} lớn hơn hoặc bằng 0. Biểu diễn cơ số của logarithm. Nếu không được định nghĩa, cơ số logarithm mặc định `e` được sử dụng.

### Giá trị trả về

Logarithm của `value`, khi `base` được định nghĩa.

Logarithm tự nhiên (cơ số `e`) của `value`, khi `base` không được định nghĩa.

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng hàm `log()` trên thang logarithm

Ví dụ này minh họa cách hàm `log()` có thể được dùng để trực quan hóa các giá trị dữ liệu bằng cách sử dụng [thang logarithm](https://en.wikipedia.org/wiki/Logarithmic_scale). Chiều rộng của mỗi thanh trong ví dụ này tương đối với giá trị dữ liệu của nó trên thang logarithm cơ số 10. Trên mỗi phần tử, giá trị của nó được gán cho một [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) có tên `--value`, sau đó được dùng bởi lớp `.bar` để tính toán chiều rộng của nó.

#### HTML

```html
<div class="bar" style="--value: 50">50</div>
<div class="bar" style="--value: 100">100</div>
<div class="bar" style="--value: 500">500</div>
<div class="bar" style="--value: 10000">10,000</div>
<div class="bar" style="--value: 2000000">2,000,000</div>
```

#### CSS

```css
.bar {
  width: calc(log(var(--value), 10) * 2em);
}
```

```css hidden
.bar {
  height: 2em;
  background-color: tomato;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0.25em 0;
}
```

#### Kết quả

{{EmbedLiveSample('Using the log() function on a logarithmic scale', '100%', '200px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("pow")}}
- {{CSSxRef("sqrt")}}
- {{CSSxRef("hypot")}}
- {{CSSxRef("exp")}}
