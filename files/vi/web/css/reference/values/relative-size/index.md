---
title: <relative-size>
slug: Web/CSS/Reference/Values/relative-size
page-type: css-type
spec-urls: https://drafts.csswg.org/css-fonts/#valdef-font-size-relative-size
sidebar: cssref
---

Kiểu dữ liệu **`<relative-size>`** [CSS](/vi/docs/Web/CSS) [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) mô tả các từ khóa kích thước tương đối. Các từ khóa `<relative-size>` xác định kích thước tương đối so với kích thước được tính toán của phần tử cha. Kiểu dữ liệu này được sử dụng trong thuộc tính rút gọn {{cssxref("font")}} và {{cssxref("font-size")}}.

## Cú pháp

```plain
<relative-size> = smaller | larger
```

### Giá trị

Kiểu dữ liệu `<relative-size>` được xác định bằng một giá trị từ khóa được chọn từ danh sách bên dưới.

- `smaller`
  - : Kích thước tương đối nhỏ hơn một bậc so với kích thước được kế thừa.

- `larger`
  - : Kích thước tương đối lớn hơn một bậc so với kích thước được kế thừa.

## Mô tả

Các từ khóa `<relative-size>` là tương đối so với kích thước hiện tại của phần tử. Nếu kích thước được kế thừa được xác định bằng từ khóa {{cssxref("absolute-size")}}, giá trị `<relative-size>` tương đương với kích thước liền kề trong [bảng `<absolute-size>`](/vi/docs/Web/CSS/Reference/Values/absolute-size#mô_tả). Nếu không, mức tăng hoặc giảm kích thước tương đối nằm trong khoảng từ 120% đến 150%.

## Ví dụ

### So sánh các giá trị từ khóa

```html
<ul>
  <li class="smaller">font-size: smaller;</li>
  <li>font-size không được chỉ định</li>
  <li class="larger">font-size: larger;</li>
</ul>
```

```css
li {
  margin-bottom: 0.3em;
}
.smaller {
  font-size: smaller;
}
.larger {
  font-size: larger;
}
```

#### Kết quả

{{EmbedLiveSample('Comparing the keyword values', '100%', 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Kiểu dữ liệu CSS {{cssxref("absolute-size")}}
- Thuộc tính CSS {{cssxref("font")}} và {{cssxref("font-size")}}
- Module [CSS fonts](/vi/docs/Web/CSS/Guides/Fonts)
