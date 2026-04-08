---
title: Styling replaced elements
slug: Web/CSS/Guides/Images/Replaced_element_properties
page-type: guide
sidebar: cssref
---

Một số thuộc tính [CSS](/en-US/docs/Web/CSS) áp dụng cho tất cả các phần tử, một số chỉ áp dụng cho grid và flex container, một số khác chỉ áp dụng cho các phần tử có thể biến đổi (transformable elements). Hướng dẫn này giới thiệu các thuộc tính chỉ áp dụng cho _replaced elements_.

**{{glossary("replaced elements", "Replaced element")}}** là phần tử có biểu diễn nằm ngoài phạm vi của CSS; chúng là các đối tượng bên ngoài có biểu diễn độc lập với mô hình định dạng CSS. Một số replaced elements, chẳng hạn như phần tử {{HTMLElement("iframe")}}, có thể có stylesheet riêng, nhưng chúng không kế thừa style của tài liệu cha.

## Sử dụng CSS với replaced elements

CSS xử lý replaced elements theo cách đặc biệt trong một số trường hợp, chẳng hạn khi tính toán margin và một số giá trị `auto`. Chỉ các replaced elements mới có thể có {{glossary("intrinsic size", "intrinsic dimensions")}}. Một số replaced elements, nhưng không phải tất cả, có intrinsic dimensions hoặc một baseline xác định, được một số thuộc tính CSS sử dụng, chẳng hạn như {{cssxref("vertical-align")}}.

Trong khi style của tài liệu có thể thiết lập kích thước và vị trí của replaced elements, style của tài liệu không ảnh hưởng đến nội dung của replaced elements, với một số ngoại lệ: [Module CSS images](/en-US/docs/Web/CSS/Guides/Images) bao gồm các thuộc tính hỗ trợ kiểm soát vị trí của nội dung phần tử trong hộp của nó.

## Kiểm soát vị trí đối tượng trong content box

Module CSS images định nghĩa hai thuộc tính có thể được dùng để chỉ định cách đối tượng bên trong replaced element được định vị trong vùng hộp của phần tử. Thuộc tính `object-fit` được dùng để điều chỉnh kích thước đối tượng, trong khi thuộc tính `object-position` dùng để định vị chúng.

### Thuộc tính `object-fit`

Thuộc tính `object-fit` xác định cách đối tượng nội dung của replaced element phải vừa khít với hộp của phần tử chứa. Thuộc tính này xác định cách hình ảnh, video và các định dạng media có thể nhúng khác phản hồi với chiều cao và chiều rộng của content box của replaced element. Nếu chiều cao, chiều rộng hoặc tỉ lệ khung hình của một phần tử khác với tài nguyên sẽ chiếm không gian được dành cho phần tử đó, các giá trị `fill`, `contain`, `cover`, `scale-down` và `none` xác định xem trình duyệt có nên điều chỉnh kích thước tài nguyên, che phủ không gian được phân bổ, chứa nội dung trong không gian, hay cho phép tài nguyên bị biến dạng hay không.

Khi được chứa hoặc thu nhỏ, bất kỳ vùng nào của hộp không được replaced element che phủ sẽ hiển thị background của phần tử.

Thuộc tính `object-fit` không có hiệu lực với các phần tử {{HTMLElement("iframe")}}, {{HTMLElement("embed")}}, và {{HTMLElement("fencedframe")}}.

![Ảnh vuông của lá cờ pride treo gần ống khói.](https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg)

Nếu chúng ta đặt hình ảnh, một hình vuông có tỉ lệ khung hình 1:1, vào một hộp 100px x 300px (tỉ lệ khung hình 1:3), theo mặc định hình ảnh sẽ lấp đầy hộp, làm biến dạng chính nó. Chúng ta có thể dùng thuộc tính `object-fit` để xác định cách hình ảnh nên được hiển thị khi bị ép vào một hộp có kích thước và tỉ lệ khung hình khác nhau:

```html hidden live-sample___example1 live-sample___example2
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<p>
  <label><input type="checkbox" /> Change dimensions</label>
</p>
```

```css hidden live-sample___example1 live-sample___example2
body {
  display: flex;
  gap: 20px;
  flex-flow: row wrap;
  grid-auto-flow: column;
  max-width: 98%;
  margin: 10px auto 0;
}
img {
  width: 100px;
  height: 300px;
  outline: 2px solid purple;
}
body:has(:checked) img {
  width: 300px;
  height: 100px;
}
```

```css live-sample___example1 live-sample___example2
img:nth-of-type(1) {
  object-fit: fill;
}
img:nth-of-type(2) {
  object-fit: cover;
}
img:nth-of-type(3) {
  object-fit: contain;
}
img:nth-of-type(4) {
  object-fit: scale-down;
}
img:nth-of-type(5) {
  object-fit: none;
}
img:nth-of-type(6) {
  /* no object-fit property */
  outline: 2px dashed red;
}
```

{{EmbedLiveSample('example1','100%','650')}}

Tích vào hộp kiểm để thiết lập giá trị chiều cao và chiều rộng. Lưu ý rằng chỉ có giá trị `fill` (mặc định) mới làm méo hình ảnh gốc. Với tất cả các giá trị khác, tỉ lệ khung hình intrinsic của hình ảnh được duy trì.

### Thuộc tính `object-position`

Thuộc tính `object-position` xác định căn chỉnh của đối tượng nội dung của replaced element bên trong hộp của phần tử.

Thường được dùng kết hợp với thuộc tính {{cssxref("object-fit")}}, nó nhận giá trị là một giá trị {{cssxref("position_value", "&lt;position&gt;")}}, cùng kiểu giá trị được dùng cho {{cssxref("background-position")}}.

```css live-sample___example2
img {
  object-position: bottom right;
}
```

{{EmbedLiveSample('example2','100%','650')}}

```html hidden live-sample___example3
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

Nó có thể được dùng mà không cần `object-fit`. Trong trường hợp này, hình ảnh được hiển thị ở kích thước intrinsic của nó (218px x 218px), với vị trí của nội dung hình ảnh được thiết lập bởi giá trị `object-position`.

```css hidden live-sample___example3
img {
  margin: 10px 0 0 10px;
}
```

```css live-sample___example3
img {
  outline: 2px solid;
  object-position: 114px 72px;
}
```

{{EmbedLiveSample('example3','100%','250')}}

Thuộc tính `object-position` hoạt động tốt với các phần tử `<iframe>`, `<video>` và `<embed>` như với `<img>`.

## Xem thêm

- [Understanding aspect ratios](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- [CSS images](/en-US/docs/Web/CSS/Guides/Images) module
- [CSS display](/en-US/docs/Web/CSS/Guides/Display) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
