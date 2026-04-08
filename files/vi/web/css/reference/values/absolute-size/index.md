---
title: <absolute-size>
slug: Web/CSS/Reference/Values/absolute-size
page-type: css-type
spec-urls: https://drafts.csswg.org/css-fonts/#typedef-absolute-size
sidebar: cssref
---

Kiểu dữ liệu **`<absolute-size>`** trong [CSS](/vi/docs/Web/CSS) mô tả các từ khóa kích thước tuyệt đối. Kiểu dữ liệu này được sử dụng trong thuộc tính tốc ký {{cssxref("font")}} và thuộc tính {{cssxref("font-size")}}.

Các từ khóa kích thước phông chữ được ánh xạ tới thuộc tính `size` HTML không dùng nữa. Xem phần [Thuộc tính size HTML](#html_size_attribute) bên dưới.

## Cú pháp

```plain
<absolute-size> = xx-small | x-small | small | medium | large | x-large | xx-large | xxx-large
```

### Giá trị

Kiểu dữ liệu `<absolute-size>` được định nghĩa bằng giá trị từ khóa được chọn từ danh sách bên dưới.

- `xx-small`
  - : Kích thước tuyệt đối bằng 60% kích thước của `medium`. Được ánh xạ tới `size="1"` không dùng nữa.

- `x-small`
  - : Kích thước tuyệt đối bằng 75% kích thước của `medium`.

- `small`
  - : Kích thước tuyệt đối bằng 89% kích thước của `medium`. Được ánh xạ tới `size="2"` không dùng nữa.

- `medium`
  - : Kích thước phông chữ ưa thích của người dùng. Giá trị này được sử dụng làm giá trị trung gian tham chiếu. Được ánh xạ tới `size="3"`.

- `large`
  - : Kích thước tuyệt đối lớn hơn `medium` 20%. Được ánh xạ tới `size="4"` không dùng nữa.

- `x-large`
  - : Kích thước tuyệt đối lớn hơn `medium` 50%. Được ánh xạ tới `size="5"` không dùng nữa.

- `xx-large`
  - : Kích thước tuyệt đối gấp đôi kích thước của `medium`. Được ánh xạ tới `size="6"` không dùng nữa.

- `xxx-large`
  - : Kích thước tuyệt đối gấp ba kích thước của `medium`. Được ánh xạ tới `size="7"` không dùng nữa.

## Mô tả

Mỗi giá trị từ khóa `<absolute-size>` được điều chỉnh kích thước tương đối so với kích thước `medium` và các đặc tính của từng thiết bị, chẳng hạn như độ phân giải thiết bị. Các tác nhân người dùng duy trì bảng kích thước phông chữ cho mỗi phông chữ, với các từ khóa `<absolute-size>` làm chỉ mục.

Trong CSS1 (1996), hệ số tỷ lệ giữa các chỉ mục giá trị từ khóa liền kề là 1.5, điều này quá lớn. Trong CSS2 (1998), hệ số tỷ lệ giữa các chỉ mục giá trị từ khóa liền kề là 1.2, điều này gây ra vấn đề cho các giá trị nhỏ. Vì một tỷ lệ cố định đơn giữa các từ khóa kích thước tuyệt đối liền kề được phát hiện là có vấn đề, không còn khuyến nghị tỷ lệ cố định nữa. Khuyến nghị duy nhất để bảo toàn khả năng đọc là kích thước phông chữ nhỏ nhất không nên nhỏ hơn `9px`.

Đối với mỗi giá trị từ khóa `<absolute-size>`, bảng sau liệt kê hệ số tỷ lệ, ánh xạ tới các tiêu đề [`<h1>` đến `<h6>`](/vi/docs/Web/HTML/Reference/Elements/Heading_Elements) và ánh xạ tới [thuộc tính `size` HTML](#html_size_attribute) không dùng nữa.

| `<absolute-size>`     | xx-small | x-small | small | medium | large | x-large | xx-large | xxx-large |
| --------------------- | -------- | ------- | ----- | ------ | ----- | ------- | -------- | --------- |
| scaling factor        | 3/5      | 3/4     | 8/9   | 1      | 6/5   | 3/2     | 2/1      | 3/1       |
| HTML headings         | h6       |         | h5    | h4     | h3    | h2      | h1       |           |
| HTML `size` attribute | 1        |         | 2     | 3      | 4     | 5       | 6        | 7         |

### Thuộc tính size HTML

Thuộc tính `size` để đặt kích thước phông chữ trong HTML hiện không còn được dùng nữa. Giá trị thuộc tính là một số nguyên từ `1` đến `7` hoặc một giá trị tương đối. Các giá trị tương đối là một số nguyên được đặt trước dấu `+` hoặc `-` để tăng hoặc giảm kích thước phông chữ, tương ứng. Giá trị `+1` có nghĩa là tăng `size` lên một và `-2` có nghĩa là giảm kích thước xuống hai, với giá trị tính toán bị kẹp ở mức tối thiểu là `1` và giá trị tính toán tối đa là `7`.

## Ví dụ

### So sánh các giá trị từ khóa

```html
<ul>
  <li class="xx-small">font-size: xx-small;</li>
  <li class="x-small">font-size: x-small;</li>
  <li class="small">font-size: small;</li>
  <li class="medium">font-size: medium;</li>
  <li class="large">font-size: large;</li>
  <li class="x-large">font-size: x-large;</li>
  <li class="xx-large">font-size: xx-large;</li>
  <li class="xxx-large">font-size: xxx-large;</li>
</ul>
```

```css
li {
  margin-bottom: 0.3em;
}
.xx-small {
  font-size: xx-small;
}
.x-small {
  font-size: x-small;
}
.small {
  font-size: small;
}
.medium {
  font-size: medium;
}
.large {
  font-size: large;
}
.x-large {
  font-size: x-large;
}
.xx-large {
  font-size: xx-large;
}
.xxx-large {
  font-size: xxx-large;
}
```

#### Kết quả

{{EmbedLiveSample('Comparing the keyword values', '100%', 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Kiểu dữ liệu CSS {{cssxref("relative-size")}}
- Các thuộc tính CSS {{cssxref("font")}} và {{cssxref("font-size")}}
- Mô-đun [phông chữ CSS](/vi/docs/Web/CSS/Guides/Fonts)
