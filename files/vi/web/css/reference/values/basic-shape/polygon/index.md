---
title: polygon()
slug: Web/CSS/Reference/Values/basic-shape/polygon
page-type: css-function
browser-compat: css.types.basic-shape.polygon
sidebar: cssref
---

Hàm **`polygon()`** trong [CSS](/vi/docs/Web/CSS) là một trong các kiểu dữ liệu {{cssxref("basic-shape")}} [data types](/vi/docs/Web/CSS/Reference/Values/Data_types). Nó được dùng để vẽ một [đa giác](https://en.wikipedia.org/wiki/Polygon) bằng cách cung cấp một hoặc nhiều cặp tọa độ, mỗi cặp đại diện cho một đỉnh của hình dạng.

{{InteractiveExample("CSS Demo: polygon()")}}

```css interactive-example-choice
clip-path: polygon(
  0% 20%,
  60% 20%,
  60% 0%,
  100% 50%,
  60% 100%,
  60% 80%,
  0% 80%
);
```

```css interactive-example-choice
clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#default-example {
  background: #ffee99;
}

#example-element {
  background: linear-gradient(to bottom right, #ff5522, #0055ff);
  width: 100%;
  height: 100%;
}
```

## Cú pháp

```css-nolint
/* Chỉ định dưới dạng danh sách tọa độ */
/* polygon(<length-percentage> <length-percentage>, ... )*/
polygon(50% 2.4%, 34.5% 33.8%, 0% 38.8%, 25% 63.1%, 19.1% 97.6%)
polygon(0px 0px, 200px 100px, 0px 200px)
polygon(0% 0px, 100% 100px, 0px 100%)
polygon(0 0, 50% 1rem, 100% 2vw, calc(100% - 20px) 100%, 0 100%)

/* Chỉ định dưới dạng danh sách tọa độ và quy tắc tô màu */
/* polygon(<fill-rule> <length-percentage> <length-percentage>, ... )*/
polygon(nonzero, 0% 0%, 50% 50%, 0% 100%)
polygon(evenodd, 0% 0%, 50% 50%, 0% 100%)
```

Các tham số của `polygon()` được phân cách bằng dấu phẩy và khoảng trắng tùy chọn. Tham số đầu tiên là giá trị [`<fill-rule>`](/vi/docs/Web/SVG/Reference/Attribute/fill-rule) tùy chọn. Các tham số bổ sung là các điểm xác định đa giác. Mỗi điểm là một cặp tọa độ x/y dưới dạng giá trị {{cssxref("length-percentage")}} phân cách bằng dấu cách, ví dụ "0 0" và "100% 100%" lần lượt cho các góc trái/trên và dưới/phải.

Lưu ý: Phần tử SVG [`<polygon>`](/vi/docs/Web/SVG/Reference/Element/polygon) có các thuộc tính riêng cho [`fill-rule`](/vi/docs/Web/SVG/Reference/Attribute/fill-rule) và [`points`](/vi/docs/Web/SVG/Reference/Attribute/points), và `points` linh hoạt trong việc sử dụng dấu cách và dấu phẩy làm dấu phân cách. Quy tắc về dấu phân cách của CSS `polygon()` được áp dụng nghiêm ngặt.

### Tham số

- [`<fill-rule>`](/vi/docs/Web/SVG/Reference/Attribute/fill-rule) {{optional_inline}}
  - : Giá trị tùy chọn `nonzero` (mặc định khi bị bỏ qua) hoặc `evenodd`, chỉ định quy tắc tô màu.
- {{cssxref("length-percentage")}}
  - : Mỗi đỉnh của đa giác được biểu diễn bằng một cặp giá trị `<length-percentage>`, cung cấp tọa độ x/y của đỉnh đó tương đối với [hộp tham chiếu](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside#the_reference_box) của hình dạng.

### Giá trị trả về

Trả về một giá trị {{cssxref("basic-shape")}}.

## Mô tả

Bạn có thể tạo hầu hết mọi hình dạng bằng hàm `polygon()` bằng cách chỉ định tọa độ các điểm của nó. Thứ tự bạn định nghĩa các điểm có ảnh hưởng và có thể tạo ra các hình dạng khác nhau. Hàm `polygon()` yêu cầu ít nhất 3 điểm để tạo thành một tam giác, nhưng không có giới hạn trên.

Hàm `polygon()` nhận các tọa độ hoặc điểm phân cách bằng dấu phẩy làm giá trị. Mỗi điểm được biểu diễn bằng một cặp giá trị `x` và `y` phân cách bằng dấu cách, cho biết tọa độ của các điểm bên trong đa giác.

<code>polygon(x<sub>1</sub> y<sub>1</sub>, x<sub>2</sub> y<sub>2</sub>, x<sub>3</sub> y<sub>3</sub>, x<sub>4</sub> y<sub>4</sub>, x<sub>n</sub> y<sub>n</sub>)</code>

Với cú pháp trên, việc ánh xạ tọa độ của container có thể được hình dung như sau:

| trục | điểm 1 | điểm 2 | điểm 3 | điểm 4 | điểm n        |
| ---- | ------- | ------- | ------- | ------- | ------------- |
| x    | 0%      | 100%    | 100%    | 0%      | x<sub>n</sub> |
| y    | 0%      | 0%      | 100%    | 100%    | y<sub>n</sub> |

Áp dụng các tọa độ đó vào thuộc tính CSS {{cssxref("clip-path")}} bằng hàm `polygon()`:

```css
clip-path: polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%);
```

Điều này sẽ tạo ra hình chữ nhật có kích thước bằng nội dung cha của nó bằng cách chỉ định tọa độ bốn góc: trái-trên (`0% 0%`), phải-trên (`100% 0%`), phải-dưới (`100% 100%`), và trái-dưới (`0% 100%`).

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo hình tam giác

Trong ví dụ này, một tam giác được tạo bằng cách định nghĩa tọa độ của ba điểm của nó.

#### HTML

```html
<div class="triangle"></div>
```

#### CSS

```css
.triangle {
  width: 400px;
  height: 400px;
  background-color: magenta;
  clip-path: polygon(100% 0%, 50% 50%, 100% 100%);
}
```

#### Kết quả

{{EmbedLiveSample("Create a triangle", '100%', 400)}}

Tọa độ của tam giác là góc phải-trên (`100% 0%`), điểm trung tâm (`50% 50%`), và góc phải-dưới (`100% 100%`) của container.

### Đặt đa giác cho shape-outside

Trong ví dụ này, một hình dạng được tạo ra để văn bản bám theo bằng thuộc tính {{cssxref("shape-outside")}}.

```html
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css
.box {
  width: 250px;
}

.shape {
  float: left;
  shape-outside: polygon(
    0 5%,
    15% 12%,
    30% 15%,
    40% 26%,
    45% 35%,
    45% 45%,
    40% 55%,
    10% 90%,
    10% 98%,
    8% 100%,
    0 100%
  );
  width: 300px;
  height: 320px;
}

p {
  font-size: 0.9rem;
}
```

{{EmbedLiveSample("Setting a polygon for shape-outside", '100%', 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("clip-path")}}, {{cssxref("shape-outside")}}
- [Hướng dẫn về Basic Shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
