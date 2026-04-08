---
title: reading-order
slug: Web/CSS/Reference/Properties/reading-order
page-type: css-property
status:
  - experimental
browser-compat: css.properties.reading-order
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`reading-order`** của [CSS](/vi/docs/Web/CSS) cho phép thay đổi thứ tự đọc của một phần tử con thuộc [reading flow container](/en-US/docs/Glossary/Reading_order#reading_flow_container) so với các phần tử anh em của nó.

## Cú pháp

```css
/* Giá trị <integer> */
reading-order: 1;
reading-order: -1;

/* Giá trị toàn cục */
reading-order: inherit;
reading-order: initial;
reading-order: revert;
reading-order: revert-layer;
reading-order: unset;
```

### Giá trị

- {{cssxref("&lt;integer&gt;")}}
  - : Đại diện cho nhóm thứ tự (ordinal group) mà phần tử thuộc về.

## Mô tả

Khi phần tử cha dạng [block](/en-US/docs/Glossary/Block/CSS), [flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), hoặc [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) có thuộc tính {{cssxref("reading-flow")}} được đặt thành giá trị khác `normal`, thuộc tính `reading-order` có thể được dùng để thiết lập vị trí [reading flow](/en-US/docs/Glossary/Reading_order#reading_flow) của phần tử so với các phần tử anh em.

Để đọc và điều hướng, các phần tử bên trong container block, flex hoặc grid được sắp xếp theo thứ tự tăng dần của giá trị `reading-order`. Nếu nhiều phần tử anh em có cùng giá trị `reading-order`, các phần tử đó được sắp xếp theo `reading-flow` của container. Các phần tử anh em không được đặt giá trị `reading-order` tường minh sẽ nhận giá trị mặc định là `0`, nghĩa là tất cả các con của reading flow container đều thuộc cùng một nhóm thứ tự theo mặc định.

Các phần tử anh em được sắp xếp từ nhóm có số thứ tự thấp nhất đến cao nhất. Do đó, để một phần tử được đọc sau các phần tử anh em, bạn có thể đặt giá trị `reading-order` là `1` hoặc lớn hơn. Để một phần tử được đọc trước, bạn có thể đặt giá trị `reading-order` là `-1` hoặc nhỏ hơn.

`reading-order` xác định thứ tự đọc và tabbing, nhưng không ảnh hưởng đến thứ tự hiển thị.

### Tương tác với `tabindex`

Nếu một tập hợp các phần tử con của reading flow container thường không nhận focus nhưng được làm cho có thể nhận focus bằng thuộc tính [`tabindex="0"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex), thứ tự đọc của chúng sẽ được điều chỉnh theo `reading-flow` và `reading-order` giống như các phần tử tương tác như {{htmlelement("a")}} hoặc {{htmlelement("button")}}.

Tuy nhiên, mọi cố gắng thay đổi thứ tự tabbing của nội dung trong reading flow container bằng giá trị `tabindex` dương sẽ bị bỏ qua — bị ghi đè bởi `reading-flow` và `reading-order`. Nói chung bạn không nên dùng `tabindex` dương; xem [Don't Use Tabindex Greater than 0](https://adrianroselli.com/2014/11/dont-use-tabindex-greater-than-0.html). Thuộc tính `reading-flow` và `reading-order` cung cấp cách tốt hơn nhiều để thay đổi thứ tự tabbing khi cần thiết.

## Định nghĩa hình thức

{{cssinfo}}

## Ví dụ

### Thứ tự hàng trong grid

Ví dụ này minh họa cách dùng `reading-order` để kiểm soát vị trí của từng mục lưới trong thứ tự đọc của grid container. Một mục lưới có giá trị `reading-order` thấp hơn mặc định `0`, do đó sẽ được đọc trước các phần tử anh em. Một mục khác có giá trị `reading-order` cao hơn, nên sẽ được đọc sau tất cả các mục còn lại bất kể thứ tự nguồn hay thứ tự hiển thị.

#### HTML

Trong markup, chúng ta có sáu phần tử {{htmlelement("a")}} được bọc bên trong một {{htmlelement("div")}} wrapper.

```html
<div class="wrapper">
  <a href="#">Item 1</a>
  <a class="bottom" href="#">Item 2</a>
  <a href="#">Item 3</a>
  <a class="top" href="#">Item 4</a>
  <a href="#">Item 5</a>
  <a href="#">Item 6</a>
</div>
```

#### CSS

Trên `<div>`, chúng ta đặt thuộc tính [grid-auto-flow](/en-US/docs/Web/CSS/Reference/Properties/grid-auto-flow) thành `dense`, do đó các mục có thể hiển thị không theo thứ tự nguồn. Thuộc tính `reading-order` trên phần tử `<a>` với class `top` được đặt thành `-1`, do đó "Item 4" sẽ là mục đầu tiên trong reading flow. Thuộc tính `reading-order` trên phần tử `<a>` với class `bottom` được đặt thành `21`, do đó "Item 2" sẽ là mục cuối cùng trong thứ tự đọc. Các mục còn lại sẽ được duyệt theo thứ tự hàng trong grid, vì thuộc tính {{cssxref("reading-flow")}} của `<div>` được đặt thành [grid-rows](/en-US/docs/Web/CSS/Reference/Properties/grid-row).

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 150px);
  grid-auto-flow: dense;
  reading-flow: grid-rows;
}

.top {
  reading-order: -1;
}

.bottom {
  reading-order: 21;
}
```

#### Kết quả

Bản demo trên hiển thị như sau:

{{EmbedLiveSample('Grid row order', '100%', '100px')}}

Thử nhấn Tab qua các liên kết. Lưu ý cách "Item 4" được Tab tới đầu tiên và "Item 2" được Tab tới cuối cùng nhờ giá trị `reading-order` đã được thay đổi. Ở giữa, các mục được Tab theo thứ tự hàng trong grid.

### Ghi đè thứ tự nguồn

Trong ví dụ này, các mục có số thứ tự lẻ có giá trị `reading-order` thấp hơn, nên sẽ được đọc trước các mục khác trong một nhóm, bất kể thứ tự nguồn hay thứ tự hiển thị.

#### HTML

Trong markup, chúng ta có năm phần tử `<a>` được bọc bên trong một {{htmlelement("div")}} wrapper.

```html
<div class="wrapper">
  <a href="#">Item 1</a>
  <a href="#">Item 2</a>
  <a href="#">Item 3</a>
  <a href="#">Item 4</a>
  <a href="#">Item 5</a>
</div>
```

#### CSS

Thuộc tính `reading-flow` của `<div>` được đặt thành `source-order`, cho phép `reading-order` ghi đè thứ tự đọc nguồn mặc định. Các phần tử `<a>` có số lẻ có giá trị `reading-order` là `-1`, nên chúng được đọc trước các mục số chẵn.

```css
.wrapper {
  reading-flow: source-order;
}

.wrapper > a {
  display: block;
}

.wrapper a:nth-child(odd) {
  reading-order: -1;
}
```

#### Kết quả

Bản demo trên hiển thị như sau:

{{EmbedLiveSample('Source order override', '100%', '100px')}}

Thử nhấn Tab qua các liên kết, và lưu ý cách "Item 1", "Item 3", và "Item 5" được Tab tới đầu tiên nhờ giá trị `reading-order` đã thay đổi. Sau đó, các mục được Tab theo thứ tự nguồn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("reading-flow")}}
- [CSS `reading-flow` examples](https://chrome.dev/reading-flow-examples/) via chrome.dev
