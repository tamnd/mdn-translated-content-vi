---
title: box-flex
slug: Web/CSS/Reference/Properties/box-flex
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-flex
sidebar: cssref
---

{{Non-standard_Header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính dùng để kiểm soát các phần của mô hình hộp XUL. Nó không khớp với các bản thảo Module CSS bố cục hộp linh hoạt cũ dành cho `box-flex` (vốn dựa trên thuộc tính này) hay hành vi của `-webkit-box-flex` (vốn dựa trên những bản thảo đó). Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện tại.

Các thuộc tính **`-moz-box-flex`** và **`-webkit-box-flex`** [CSS](/en-US/docs/Web/CSS) chỉ định cách một `-moz-box` hoặc `-webkit-box` phát triển để lấp đầy hộp chứa nó, theo hướng bố cục của hộp chứa.

## Cú pháp

```css
/* Giá trị <number> */
-moz-box-flex: 0;
-moz-box-flex: 2;
-moz-box-flex: 3.5;
-webkit-box-flex: 0;
-webkit-box-flex: 2;
-webkit-box-flex: 3.5;

/* Giá trị toàn cục */
-moz-box-flex: inherit;
-moz-box-flex: initial;
-moz-box-flex: revert;
-moz-box-flex: revert-layer;
-moz-box-flex: unset;
-webkit-box-flex: inherit;
-webkit-box-flex: initial;
-webkit-box-flex: revert;
-webkit-box-flex: revert-layer;
-webkit-box-flex: unset;
```

Thuộc tính `box-flex` được chỉ định bằng giá trị {{CSSxRef("&lt;number&gt;")}}. Nếu giá trị là 0, hộp không phát triển. Nếu lớn hơn 0, hộp phát triển để lấp đầy một tỷ lệ không gian có sẵn.

## Ghi chú

Hộp chứa phân bổ không gian thừa có sẵn theo tỷ lệ giá trị flex của mỗi phần tử nội dung.

Các phần tử nội dung có flex bằng không sẽ không phát triển.

Nếu chỉ có một phần tử nội dung có flex khác không, nó sẽ phát triển để lấp đầy không gian có sẵn.

Các phần tử nội dung có cùng giá trị flex sẽ phát triển theo cùng một lượng tuyệt đối.

Nếu giá trị flex được đặt bằng thuộc tính `flex` của phần tử, thì style sẽ bị bỏ qua.

Để làm cho các phần tử XUL trong hộp chứa có cùng kích thước, hãy đặt thuộc tính `equalsize` của hộp chứa thành giá trị `always`. Thuộc tính này không có thuộc tính CSS tương ứng.

Một mẹo để làm cho tất cả các phần tử nội dung trong hộp chứa có cùng kích thước là đặt cho chúng kích thước cố định (ví dụ: `height: 0`), và cùng giá trị `box-flex` lớn hơn không (ví dụ: `-moz-box-flex: 1`).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-flex = <number>`)}}

## Ví dụ

### Đặt box-flex

```html
<div class="example">
  <p>I will expand to fill extra space</p>
  <p>I will not expand</p>
</div>
```

```css
div.example {
  display: -moz-box;
  display: -webkit-box;
  border: 1px solid black;
  width: 100%;
}
div.example > p:nth-child(1) {
  -moz-box-flex: 1; /* Mozilla */
  -webkit-box-flex: 1; /* WebKit */
  border: 1px solid black;
}
div.example > p:nth-child(2) {
  -moz-box-flex: 0; /* Mozilla */
  -webkit-box-flex: 0; /* WebKit */
  border: 1px solid black;
}
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("box-orient")}}
- {{CSSxRef("box-pack")}}
- {{CSSxRef("box-direction")}}
- {{CSSxRef("flex")}}
