---
title: xywh()
slug: Web/CSS/Reference/Values/basic-shape/xywh
page-type: css-function
browser-compat: css.types.basic-shape.xywh
sidebar: cssref
---

Hàm **`xywh()`** trong [CSS](/vi/docs/Web/CSS) tạo một hình chữ nhật bằng cách sử dụng các khoảng cách được chỉ định từ cạnh trái (`x`) và cạnh trên (`y`) của khối chứa, cùng chiều rộng (`w`) và chiều cao (`h`) được chỉ định của hình chữ nhật. Đây là hàm hình dạng cơ bản thuộc kiểu dữ liệu {{cssxref("basic-shape")}} [data type](/vi/docs/Web/CSS/Reference/Values/Data_types). Bạn có thể dùng hàm `xywh()` trong các thuộc tính CSS như {{cssxref("offset-path")}} để tạo đường dẫn hình chữ nhật cho phần tử di chuyển theo, và trong {{cssxref("clip-path")}} để định nghĩa hình dạng của vùng cắt.

## Cú pháp

```css
offset-path: xywh(0 1% 2px 3% round 0 1px 2% 3px);
clip-path: xywh(1px 2% 3px 4em round 0 1% 2px 3em);
```

### Giá trị

- `<length-percentage>`
  - : Chỉ định giá trị {{cssxref("&lt;length-percentage&gt;")}} cho tọa độ `x` và `y` của hình chữ nhật.
- `<length-percentage [0,∞]>`
  - : Chỉ định giá trị {{cssxref("&lt;length-percentage&gt;")}} không âm cho chiều rộng và chiều cao của hình chữ nhật. Giá trị tối thiểu có thể là không, và giá trị tối đa không có giới hạn.
- `round <'border-radius'>`
  - : Chỉ định bán kính góc bo tròn của hình chữ nhật sử dụng cú pháp tương tự như thuộc tính rút gọn CSS {{cssxref("border-radius")}}. Tham số này là tùy chọn.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Tạo offset-path bằng xywh()

Trong ví dụ bên dưới, thuộc tính {{cssxref("offset-path")}} sử dụng hàm `xywh()` để định nghĩa hình dạng của đường dẫn mà phần tử (ở đây là một hộp màu đỏ tươi) di chuyển theo. Hai tình huống khác nhau được hiển thị, mỗi tình huống có các giá trị khác nhau cho hàm `xywh()`. Mũi tên bên trong các hộp chỉ về cạnh phải của hộp.

```html
<div class="container">
  Rectangular path 1
  <div class="path xywh-path-1">→</div>
</div>
<div class="container">
  Rectangular path 2
  <div class="path xywh-path-2">→</div>
</div>
```

```css
.container {
  position: relative;
  display: inline-block;
  width: 200px;
  height: 200px;
  border: 1px solid black;
  margin: 30px;
  text-align: center;
}

.path {
  width: 50px;
  height: 50px;
  position: absolute;
  background-color: magenta;
  animation: move 10s linear infinite;
}

.xywh-path-1 {
  offset-path: xywh(20px 20px 100% 100% round 10%);
}

.xywh-path-2 {
  offset-path: xywh(20px 30% 150% 200%);
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

{{EmbedLiveSample("Creating offset-path using xywh", "100%", 600)}}

- Hình chữ nhật đường dẫn 1 được dịch chuyển `20px` từ cạnh trái và cạnh trên của khối chứa. Hình chữ nhật đường dẫn này có cùng kích thước với khối chứa, tức là chiều rộng là `100%` chiều rộng của khối chứa, và chiều cao là `100%` chiều cao của khối chứa. Chú ý cách mũi tên bên trong hộp đi theo đường cong `10%` (được xác định bởi `round 10%`) tại các góc đường dẫn hình chữ nhật.
- Do giới hạn trên của cả chiều rộng và chiều cao trong `xywh()` là vô cực, việc đặt chiều cao thành `200%` trong hình chữ nhật đường dẫn 2 làm cho hình chữ nhật được tạo ra cao gấp đôi khối chứa. Chú ý cách mũi tên bên trong hộp hoạt động tại các góc khi không có `round <'border-radius'>` được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm {{cssxref("basic-shape/inset","inset()")}}
- Hàm {{cssxref("basic-shape/rect","rect()")}}
- Thuộc tính {{cssxref("clip-path")}}
- Thuộc tính {{cssxref("offset-path")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- Module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- [Hướng dẫn về basic shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
