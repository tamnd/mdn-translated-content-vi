---
title: flex-basis
slug: Web/CSS/Reference/Properties/flex-basis
page-type: css-property
browser-compat: css.properties.flex-basis
sidebar: cssref
---

Thuộc tính **`flex-basis`** trong [CSS](/vi/docs/Web/CSS) đặt kích thước chính ban đầu của một {{glossary("flex item")}}. Nó đặt kích thước của hộp nội dung trừ khi được đặt khác với {{Cssxref("box-sizing")}}.

> [!NOTE]
> Nên sử dụng viết tắt {{cssxref("flex")}} với giá trị từ khóa như `auto` hoặc `initial` thay vì đặt `flex-basis` riêng lẻ. Các [giá trị từ khóa](/vi/docs/Web/CSS/Reference/Properties/flex#values) mở rộng thành các tổ hợp đáng tin cậy của {{cssxref("flex-grow")}}, {{cssxref("flex-shrink")}} và `flex-basis`, giúp đạt được các hành vi flex mong muốn thông thường.

{{InteractiveExample("CSS Demo: flex-basis")}}

```css interactive-example-choice
flex-basis: auto;
```

```css interactive-example-choice
flex-basis: 0;
```

```css interactive-example-choice
flex-basis: 200px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">Item One</div>
  <div>Item Two</div>
  <div>Item Three</div>
</section>
```

```css interactive-example
.default-example {
  border: 1px solid #c5c5c5;
  width: auto;
  max-height: 300px;
  display: flex;
}

.default-example > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  margin: 10px;
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: auto;
}
```

Trong ví dụ này, các thuộc tính {{cssxref("flex-grow")}} và {{cssxref("flex-shrink")}} đều được đặt thành `1` trên cả ba phần tử, cho biết rằng flex item có thể mở rộng và thu hẹp từ `flex-basis` ban đầu.

Demo thay đổi giá trị `flex-basis` được đặt trên flex item đầu tiên, làm cho nó mở rộng hoặc thu hẹp để lấp đầy không gian có sẵn. Các flex item khác cũng sẽ thay đổi kích thước; chúng sẽ ít nhất có kích thước `min-content`. Ví dụ, khi `flex-basis` của phần tử đầu tiên được đặt thành `200px`, nó sẽ bắt đầu ở `200px` nhưng sau đó thu hẹp để vừa với không gian có sẵn.

Nếu `flex-basis` được đặt thành giá trị khác `auto` và có `width` (hoặc `height` trong trường hợp `flex-direction: column`) được đặt cho cùng flex item đó, thì giá trị `flex-basis` có quyền ưu tiên.

## Cú pháp

```css
/* Chỉ định <'width'> */
flex-basis: 10em;
flex-basis: 3px;
flex-basis: 50%;
flex-basis: auto;

/* Từ khóa định kích thước nội tại */
flex-basis: max-content;
flex-basis: min-content;
flex-basis: fit-content;

/* Tự động định kích thước dựa trên nội dung của flex item */
flex-basis: content;

/* Giá trị toàn cục */
flex-basis: inherit;
flex-basis: initial;
flex-basis: revert;
flex-basis: revert-layer;
flex-basis: unset;
```

Thuộc tính `flex-basis` được chỉ định là từ khóa `content` hoặc `<'width'>`.

### Giá trị

- `content`
  - : Chỉ ra định kích thước tự động, dựa trên nội dung của flex item.

- `<'width'>`
  - : Bất kỳ đơn vị nào sau:
    - {{cssxref("&lt;length&gt;")}} đặt giá trị tuyệt đối.
    - {{cssxref("&lt;percentage&gt;")}} đặt phần trăm chiều rộng hoặc chiều cao của vùng nội dung của khối chứa. Các giá trị phần trăm của `flex-basis` được tính toán so với flex container. Nếu kích thước của flex container không xác định, giá trị được sử dụng cho `flex-basis` là `content`.
    - `auto` sử dụng giá trị {{cssxref("width")}} trong chế độ viết ngang, và giá trị {{cssxref("height")}} trong chế độ viết dọc; khi giá trị tương ứng cũng là `auto`, giá trị `content` được sử dụng thay thế.
    - {{cssxref("max-content")}} đặt chiều rộng ưu tiên nội tại.
    - {{cssxref("min-content")}} đặt chiều rộng tối thiểu nội tại.
    - {{cssxref("fit-content")}} đặt kích thước tối đa có thể của vùng nội dung của khối chứa, bị giới hạn bởi các giá trị `min-content` và `max-content`, và được tính toán dựa trên nội dung của phần tử hiện tại.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước ban đầu của flex item

#### HTML

```html
<ul class="container">
  <li class="flex flex1">1: flex-basis test</li>
  <li class="flex flex2">2: flex-basis test</li>
  <li class="flex flex3">3: flex-basis test</li>
  <li class="flex flex4">4: flex-basis test</li>
  <li class="flex flex5">5: flex-basis test</li>
</ul>

<ul class="container">
  <li class="flex flex6">6: flex-basis test</li>
</ul>
```

#### CSS

```css
.container {
  font-family: "Arial", sans-serif;
  margin: 0;
  padding: 0;
  list-style-type: none;
  display: flex;
  flex-wrap: wrap;
}

.flex {
  background: #6ab6d8;
  padding: 10px;
  margin-bottom: 50px;
  border: 3px solid #2e86bb;
  color: white;
  font-size: 14px;
  text-align: center;
  position: relative;
}

.flex::after {
  position: absolute;
  z-index: 1;
  left: 0;
  top: 100%;
  margin-top: 10px;
  width: 100%;
  color: #333333;
  font-size: 12px;
}

.flex1 {
  flex-basis: auto;
}

.flex1::after {
  content: "auto";
}

.flex2 {
  flex-basis: max-content;
}

.flex2::after {
  content: "max-content";
}

.flex3 {
  flex-basis: min-content;
}

.flex3::after {
  content: "min-content";
}

.flex4 {
  flex-basis: fit-content;
}

.flex4::after {
  content: "fit-content";
}

.flex5 {
  flex-basis: content;
}

.flex5::after {
  content: "content";
}
```

#### Kết quả

{{EmbedLiveSample('Setting_flex_item_initial_sizes', '', '360')}}

### Flex basis `0` so với `0%`

Ví dụ này minh họa sự khác biệt giữa `flex-basis` là `0` so với `flex-basis` là `0%` khi `flex-direction` được đặt thành `column` và flex container cũng như flex item không có chiều cao được đặt; trong khi `0` là độ dài tuyệt đối, các giá trị flex-basis theo phần trăm phân giải thành giá trị [`content`](#content).

#### HTML

Chúng ta bao gồm hai flex container cùng cấu trúc, sẽ được tạo kiểu tương tự ngoại trừ giá trị `flex-basis` của chúng. Mỗi container có hai phần tử con: thẻ tiêu đề `<div>` và `<section>`. Phần tử `<section>` có phần tử con `<div>` nội dung, sẽ không được đặt là flex item nhưng sẽ được cấp chiều cao.

```html
<div class="container basis-0">
  <div>heading</div>
  <section>
    <div class="content">flex-basis: 0;</div>
  </section>
</div>
<div class="container basis-0-percent">
  <div>heading</div>
  <section>
    <div class="content">flex-basis: 0%;</div>
  </section>
</div>
```

#### CSS

Chúng ta tạo kiểu cho các container là flex container nội tuyến sẽ xuất hiện cạnh nhau để dễ so sánh hơn. Chúng ta đặt `flex-direction` thành `column`. Flex item của container đầu tiên có giá trị `flex-basis` là `0`, trong khi flex item của container thứ hai có giá trị `flex-basis` là `0%`. Cả flex container lẫn flex item của chúng đều không có chiều cao được đặt rõ ràng; tuy nhiên, chiều cao của các phần tử `section` phải ít nhất là `200px`, và các phần tử con của chúng có chiều cao là `300px`.

```css
.container {
  width: 40vw;
  padding: 1rem;
  border: 1px dashed blue;

  display: inline-flex;
  flex-direction: column;
}

section {
  outline: 1px solid red;

  overflow: auto;
  min-height: 200px;
}

.content {
  background: wheat;
  height: 300px;
}

.container.basis-0 > * {
  flex-basis: 0;
}
.container.basis-0-percent > * {
  flex-basis: 0%;
}
```

#### Kết quả

{{EmbedLiveSample('flex_basis_0_vs_0', '100%', '400')}}

Trong container đầu tiên, với `flex-basis: 0`, phần tử `<section>` có kích thước chính ban đầu bằng không và mở rộng đến chiều cao tối thiểu `200px`. Trong container thứ hai, với `flex-basis: 0%`, phần tử `<section>` có kích thước chính ban đầu là `300px` vì, khi flex container không có chiều cao được đặt, các giá trị flex-basis theo phần trăm phân giải thành giá trị [`content`](#content).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Viết tắt {{cssxref("flex")}}
- {{cssxref("inline-size")}}
- [Khái niệm cơ bản về flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Kiểm soát tỷ lệ của các flex item theo trục chính](/vi/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- Mô-đun [bố cục hộp linh hoạt CSS](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
