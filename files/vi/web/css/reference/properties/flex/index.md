---
title: flex
slug: Web/CSS/Reference/Properties/flex
page-type: css-shorthand-property
browser-compat: css.properties.flex
sidebar: cssref
---

Thuộc tính **`flex`** trong [CSS](/vi/docs/Web/CSS) là [thuộc tính viết tắt](/vi/docs/Web/CSS/Guides/Cascade/Shorthand_properties) xác định cách một {{glossary("flex item")}} sẽ co giãn để vừa với không gian có sẵn trong flex container của nó.

{{InteractiveExample("CSS Demo: flex")}}

```css interactive-example-choice
flex: 1;
```

```css interactive-example-choice
flex: 2;
```

```css interactive-example-choice
flex: 1 30px;
```

```css interactive-example-choice
flex: 1 1 100px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">Change me</div>
  <div>flex: 1</div>
  <div>flex: 1</div>
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
  flex-basis: 0;
}

#example-element {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("flex-grow")}}
- {{cssxref("flex-shrink")}}
- {{cssxref("flex-basis")}}

## Cú pháp

```css
/* Giá trị từ khóa */
flex: none; /* 0 0 auto */

/* Một giá trị, số không đơn vị: flex-grow
flex-basis khi đó bằng 0%. */
flex: 2; /* 2 1 0% */

/* Một giá trị, chiều rộng/chiều cao: flex-basis */
flex: auto; /* 1 1 auto */
flex: 10em; /* 1 1 10em */
flex: 30%;
flex: min-content;

/* Hai giá trị: flex-grow | flex-basis */
flex: 1 30px; /* 1 1 30px */

/* Hai giá trị: flex-grow | flex-shrink */
flex: 2 2; /* 2 2 0% */

/* Ba giá trị: flex-grow | flex-shrink | flex-basis */
flex: 2 2 10%;

/* Giá trị toàn cục */
flex: inherit;
flex: initial; /* 0 1 auto */
flex: revert;
flex: revert-layer;
flex: unset;
```

Thuộc tính `flex` có thể được chỉ định bằng một, hai hoặc ba giá trị.

- **Cú pháp một giá trị:** giá trị phải là một trong:
  - giá trị hợp lệ cho {{cssxref("&lt;flex-grow&gt;")}}: khi đó, trong tất cả các trình duyệt, viết tắt mở rộng thành `flex: <flex-grow> 1 0%`. Tuy nhiên thông số kỹ thuật nói nó nên mở rộng thành `flex: <flex-grow> 1 0`.
  - giá trị hợp lệ cho {{cssxref("&lt;flex-basis&gt;")}}: khi đó viết tắt mở rộng thành `flex: 1 1 <flex-basis>`.
  - từ khóa `none` hoặc một trong các từ khóa toàn cục.

- **Cú pháp hai giá trị:**
  - Giá trị đầu tiên phải là giá trị hợp lệ cho {{cssxref("flex-grow")}}.

  - Giá trị thứ hai phải là một trong:
    - giá trị hợp lệ cho {{cssxref("flex-shrink")}}: khi đó, trong tất cả các trình duyệt, viết tắt mở rộng thành `flex: <flex-grow> <flex-shrink> 0%`.
    - giá trị hợp lệ cho {{cssxref("flex-basis")}}: khi đó viết tắt mở rộng thành `flex: <flex-grow> 1 <flex-basis>`.

- **Cú pháp ba giá trị:** các giá trị phải theo thứ tự sau:
  1. giá trị hợp lệ cho {{cssxref("flex-grow")}}.
  2. giá trị hợp lệ cho {{cssxref("flex-shrink")}}.
  3. giá trị hợp lệ cho {{cssxref("flex-basis")}}.

### Giá trị

- `<'flex-grow'>`
  - : Xác định {{cssxref("flex-grow")}} của flex item. Các giá trị âm được coi là không hợp lệ. Mặc định là `1` khi bị bỏ qua. (giá trị ban đầu là `0`)
- `<'flex-shrink'>`
  - : Xác định {{cssxref("flex-shrink")}} của flex item. Các giá trị âm được coi là không hợp lệ. Mặc định là `1` khi bị bỏ qua. (giá trị ban đầu là `1`)
- `<'flex-basis'>`
  - : Xác định {{cssxref("flex-basis")}} của flex item. Mặc định là `0%` khi bị bỏ qua. Giá trị ban đầu là `auto`.
- `none`
  - : Phần tử được định kích thước theo các thuộc tính `width` và `height` của nó. Nó hoàn toàn không co giãn: nó không thu hẹp hay mở rộng so với flex container. Điều này tương đương với việc đặt `flex: 0 0 auto`.

Các hiệu ứng flexbox mong muốn thường có thể đạt được bằng cách sử dụng các giá trị `flex` sau:

- `initial`: Flex item không mở rộng nhưng có thể thu hẹp. Giá trị mặc định này mở rộng thành `flex: 0 1 auto`. Phần tử được định kích thước theo các thuộc tính `width` hoặc `height` của nó, tùy thuộc vào `flex-direction`. Nếu có không gian âm có sẵn, phần tử sẽ thu hẹp xuống kích thước tối thiểu để vừa với container nhưng sẽ không mở rộng để hấp thụ bất kỳ không gian dương nào có sẵn trong flex container.
- `auto`: Flex item có thể mở rộng và thu hẹp. Giá trị này mở rộng thành `flex: 1 1 auto`. Phần tử được định kích thước theo các thuộc tính `width` hoặc `height` của nó, tùy thuộc vào `flex-direction`, nhưng mở rộng để hấp thụ không gian dương có sẵn trong flex container hoặc thu hẹp xuống kích thước tối thiểu để vừa với container trong trường hợp không gian âm. Flex item hoàn toàn co giãn.
- `none`: Flex item không mở rộng cũng không thu hẹp. Giá trị này mở rộng thành `flex: 0 0 auto`. Phần tử được định kích thước theo các thuộc tính `width` hoặc `height` của nó, tùy thuộc vào hướng của flex container. Flex item hoàn toàn không co giãn.
- `flex: <number [1,∞]>`: Kích thước chính của flex item sẽ tỷ lệ với số được đặt. Giá trị này mở rộng thành `flex: <number> 1 0`. Điều này đặt `flex-basis` về không và làm cho flex item co giãn. Phần tử sẽ ít nhất rộng hoặc cao bằng kích thước tối thiểu của nó, với không gian dương có sẵn của container được phân phối theo tỷ lệ dựa trên các hệ số tăng trưởng của phần tử này và các flex item anh em của nó. Nếu tất cả các flex item sử dụng mẫu này, tất cả sẽ được định kích thước theo tỷ lệ với các giá trị số của chúng.

  > [!WARNING]
  > Các trình duyệt sử dụng giá trị `flex-basis` là `0%` khi `flex-basis` không được chỉ định trong giá trị `flex`. Điều này không giống với giá trị `flex-basis` là `0` như thông số kỹ thuật nêu. Điều này có thể ảnh hưởng đến bố cục flex trong một số trường hợp. Xem hiệu ứng này được minh họa trong ví dụ [Flex-basis `0` so với `0%`](/vi/docs/Web/CSS/Reference/Properties/flex-basis#flex_basis_0_vs_0).

## Mô tả

Đối với hầu hết các mục đích, tác giả nên đặt `flex` thành một trong các giá trị sau: `auto`, `initial`, `none`, hoặc một số dương không có đơn vị. Để xem hiệu ứng của các giá trị này, hãy thử thay đổi kích thước các flex container bên dưới:

```html hidden
<div class="flex-container">
  <div class="item auto">auto</div>
  <div class="item auto">auto</div>
  <div class="item auto">auto</div>
</div>

<div class="flex-container">
  <div class="item auto">auto</div>
  <div class="item initial">initial</div>
  <div class="item initial">initial</div>
</div>

<div class="flex-container">
  <div class="item auto">auto</div>
  <div class="item auto">auto</div>
  <div class="item none">none</div>
</div>

<div class="flex-container">
  <div class="item initial">initial</div>
  <div class="item none">none</div>
  <div class="item none">none</div>
</div>

<div class="flex-container">
  <div class="item four">4</div>
  <div class="item two">2</div>
  <div class="item one">1</div>
</div>
```

```css hidden
* {
  box-sizing: border-box;
}

.flex-container {
  background-color: #f4f7f8;
  resize: horizontal;
  overflow: hidden;
  display: flex;
  margin: 1em;
}

.item {
  margin: 1em;
  padding: 0.5em;
  width: 110px;
  min-width: 0;
  background-color: #1b5385;
  color: white;
  font-family: monospace;
  font-size: 13px;
}

.initial {
  flex: initial;
}

.auto {
  flex: auto;
}

.none {
  flex: none;
}

.four {
  flex: 4;
}

.two {
  flex: 2;
}

.one {
  flex: 1;
}
```

{{EmbedLiveSample("Description", 1200, 400)}}

Theo mặc định, flex item không thu hẹp xuống dưới kích thước {{cssxref("min-content")}} của chúng. Để thay đổi điều này, hãy đặt {{cssxref("min-width")}} hoặc {{cssxref("min-height")}} của phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt flex: auto

Ví dụ này cho thấy cách một flex item với `flex: auto` mở rộng để hấp thụ bất kỳ không gian trống nào trong container.

#### HTML

```html
<div id="flex-container">
  <div id="flex-auto">
    flex: auto (click to remove/add the `flex: initial` box)
  </div>
  <div id="default">flex: initial</div>
</div>
```

#### CSS

```css hidden
body * {
  padding: 1rem;
  user-select: none;
  box-sizing: border-box;
  font-family: "Consolas", "Arial", sans-serif;
}
```

```css
#flex-container {
  border: 2px dashed gray;
  display: flex;
}

#flex-auto {
  cursor: pointer;
  background-color: wheat;

  flex: auto;
}

#default {
  background-color: lightblue;
}
```

#### JavaScript

```js
const flexAutoItem = document.getElementById("flex-auto");
const defaultItem = document.getElementById("default");
flexAutoItem.addEventListener("click", () => {
  defaultItem.style.display =
    defaultItem.style.display === "none" ? "block" : "none";
});
```

#### Kết quả

Flex container chứa hai flex item:

- Phần tử `#flex-auto` có giá trị `flex` là `auto`. Giá trị `auto` mở rộng thành `1 1 auto`, tức là phần tử được phép mở rộng.
- Phần tử `#default` không có giá trị `flex` nên mặc định là giá trị `initial`. Giá trị `initial` mở rộng thành `0 1 auto`, tức là phần tử không được phép mở rộng.

Phần tử `#default` chiếm nhiều không gian bằng chiều rộng của nó yêu cầu, nhưng không mở rộng để chiếm thêm không gian. Tất cả không gian còn lại được chiếm bởi phần tử `#flex-auto`.

Khi bạn nhấp vào phần tử `#flex-auto`, chúng ta đặt thuộc tính {{cssxref("display")}} của phần tử `#default` thành `none`, xóa nó khỏi bố cục. Phần tử `#flex-auto` sau đó mở rộng để chiếm tất cả không gian có sẵn trong container. Nhấp lại vào phần tử `#flex-auto` sẽ thêm lại phần tử `#default` vào container.

{{EmbedLiveSample('Setting_flex_auto','100%','150')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm cơ bản về flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Kiểm soát tỷ lệ của các flex item theo trục chính](/vi/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- Mô-đun [bố cục hộp linh hoạt CSS](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
