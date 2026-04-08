---
title: rect()
slug: Web/CSS/Reference/Values/basic-shape/rect
page-type: css-function
browser-compat: css.types.basic-shape.rect
sidebar: cssref
---

Hàm **`rect()`** trong [CSS](/vi/docs/Web/CSS) tạo một hình chữ nhật ở khoảng cách được chỉ định từ cạnh trên và cạnh trái của khối chứa. Đây là hàm hình dạng cơ bản thuộc kiểu dữ liệu {{cssxref("basic-shape")}} [data type](/vi/docs/Web/CSS/Reference/Values/Data_types). Bạn có thể dùng hàm `rect()` trong các thuộc tính CSS như {{cssxref("offset-path")}} để tạo đường dẫn hình chữ nhật cho phần tử di chuyển theo, và trong {{cssxref("clip-path")}} để định nghĩa hình dạng của vùng cắt.

## Cú pháp

```css
offset-path: rect(0 1% auto 3% round 0 1px);
clip-path: rect(50px 70px 80% 20%);
```

### Giá trị

Hình chữ nhật lùi vào được xác định bằng cách chỉ định bốn giá trị độ lệch, bắt đầu từ cạnh trên và đi theo chiều kim đồng hồ, cùng với từ khóa `round` tùy chọn với tham số `border-radius` để thêm các góc bo tròn vào hình chữ nhật. Mỗi giá trị độ lệch có thể là `<length>`, `<percentage>`, hoặc từ khóa `auto`.

- `<length-percentage>`
  - : Chỉ định giá trị {{cssxref("&lt;length-percentage&gt;")}} cho khoảng cách của cạnh trên, phải, dưới, hoặc trái của hình chữ nhật từ cạnh trên hoặc cạnh trái của khối chứa. Giá trị đầu tiên (trên) và thứ ba (dưới) là khoảng cách từ cạnh trên của khối chứa, và giá trị thứ hai (phải) và thứ tư (trái) là khoảng cách từ cạnh trái của khối chứa. Giá trị thứ hai (phải) và thứ ba (dưới) bị giới hạn bởi giá trị thứ tư (trái) và thứ nhất (trên) tương ứng, để ngăn cạnh dưới vượt qua cạnh trên và cạnh phải vượt qua cạnh trái. Ví dụ, `rect(10px 0 0 20px)` bị giới hạn thành `rect(10px 20px 10px 20px)`.

- `auto`
  - : Làm cho cạnh mà giá trị này được dùng trùng với cạnh tương ứng của khối chứa. Nếu `auto` được dùng cho giá trị đầu tiên (trên) hoặc thứ tư (trái), giá trị của `auto` là `0`, và nếu dùng cho giá trị thứ hai (phải) hoặc thứ ba (dưới), giá trị của `auto` là `100%`.

- `round <'border-radius'>`
  - : Chỉ định bán kính góc bo tròn của hình chữ nhật sử dụng cú pháp tương tự như thuộc tính rút gọn CSS {{cssxref("border-radius")}}. Tham số này là tùy chọn.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Tạo offset-path bằng rect()

Trong ví dụ này, thuộc tính {{cssxref("offset-path")}} sử dụng hàm `rect()` để định nghĩa hình dạng của đường dẫn mà phần tử (ở đây là một hộp đỏ) di chuyển theo. Ba tình huống khác nhau được hiển thị, mỗi tình huống sử dụng các giá trị khác nhau cho hàm `rect()`. Mũi tên bên trong các hộp chỉ về cạnh phải của hộp.

```html
<div class="container">
  Rectangular path 1
  <div class="path rect-path-1">→</div>
</div>
<div class="container">
  Rectangular path 2
  <div class="path rect-path-2">→</div>
</div>
<div class="container">
  Rectangular path 3
  <div class="path rect-path-3">→</div>
</div>
```

```css
.container {
  position: relative;
  display: inline-block;
  width: 200px;
  height: 200px;
  border: 1px solid black;
  margin: 15px;
  text-align: center;
}

.path {
  width: 40px;
  height: 40px;
  background-color: red;
  position: absolute;
  animation: move 10s linear infinite;
}

.rect-path-1 {
  offset-path: rect(50px 150px 200px 50px round 20%);
}

.rect-path-2 {
  offset-path: rect(50px auto 200px 50px round 20%);
}

.rect-path-3 {
  offset-path: rect(50px auto 200px auto);
}

@keyframes move {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Creating an offset-path using rect", "100%", 400)}}

- Hình chữ nhật đường dẫn 1 chỉ định khoảng cách của bốn cạnh (trên, phải, dưới, và trái) từ khối chứa. Các giá trị trên và dưới là khoảng cách từ cạnh trên của khối chứa. Các giá trị phải và trái là khoảng cách từ cạnh trái của khối chứa. Ngoài ra, góc của hình chữ nhật được bo tròn với `20%`, làm cho phần tử hộp đỏ đi theo các góc bo tròn khi di chuyển theo đường dẫn này. Chú ý cách mũi tên bên trong hộp bám theo đường cong tại các góc đường dẫn hình chữ nhật.
- Hình chữ nhật đường dẫn 2 tương tự hình chữ nhật đường dẫn 1, ngoại trừ giá trị phải là `auto`, tương đương giá trị `100%`. Điều này làm cạnh phải của hình chữ nhật khớp với cạnh phải của khối chứa, tạo ra hình chữ nhật rộng hơn đường dẫn 1.
- Hình chữ nhật đường dẫn 3 chỉ định cả tham số cạnh trái và phải là `auto` và bỏ qua tham số `round <'border-radius'>`. Điều này tạo ra hình chữ nhật có chiều rộng bằng khối chứa với các góc vuông thay vì góc bo tròn như trong đường dẫn 1 và 2. Chú ý chuyển động của mũi tên bên trong hộp này tại các góc.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm {{cssxref("basic-shape/inset","inset()")}}
- Hàm {{cssxref("basic-shape/xywh","xywh()")}}
- Thuộc tính {{cssxref("clip-path")}}
- Thuộc tính {{cssxref("offset-path")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- Module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- [Hướng dẫn về basic shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
