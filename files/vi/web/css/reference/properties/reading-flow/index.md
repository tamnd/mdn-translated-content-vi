---
title: reading-flow
slug: Web/CSS/Reference/Properties/reading-flow
page-type: css-property
status:
  - experimental
browser-compat: css.properties.reading-flow
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`reading-flow`** của [CSS](/vi/docs/Web/CSS) cho phép sửa đổi {{glossary("reading order", "thứ tự đọc")}} của các phần tử con trong bố cục [block](/vi/docs/Glossary/Block/CSS), [flex](/vi/docs/Web/CSS/Guides/Flexible_box_layout) hoặc [grid](/vi/docs/Web/CSS/Guides/Grid_layout). Điều này ảnh hưởng đến thứ tự chúng được đọc ra bằng giọng nói và được điều hướng đến khi sử dụng điều hướng tuần tự như nhấn Tab đến các liên kết hoặc nút.

## Cú pháp

```css
/* Giá trị từ khóa */
reading-flow: normal;
reading-flow: flex-visual;
reading-flow: flex-flow;
reading-flow: grid-columns;
reading-flow: grid-rows;
reading-flow: grid-order;
reading-flow: source-order;

/* Giá trị toàn cục */
reading-flow: inherit;
reading-flow: initial;
reading-flow: revert;
reading-flow: revert-layer;
reading-flow: unset;
```

### Giá trị

Thuộc tính `reading-flow` nhận một trong các từ khóa sau làm giá trị:

- `normal`
  - : Giá trị mặc định. Thứ tự đọc theo thứ tự của các phần tử trong DOM.

- `flex-visual`
  - : Chỉ ảnh hưởng đến {{glossary("Flex Container", "flex container")}}. Thứ tự đọc theo thứ tự hiển thị của các flex item, có tính đến {{cssxref("writing-mode")}}. Do đó, một tài liệu tiếng Anh với `flex-direction: row-reverse` và `reading-flow: flex-visual` được đặt sẽ có thứ tự đọc từ trái sang phải.

- `flex-flow`
  - : Chỉ ảnh hưởng đến flex container. Thứ tự đọc theo hướng {{cssxref("flex-flow")}}.

- `grid-columns`
  - : Chỉ ảnh hưởng đến {{glossary("Grid Container", "grid container")}}. Thứ tự đọc theo thứ tự hiển thị của các grid item, theo từng cột, có tính đến writing mode.

- `grid-rows`
  - : Chỉ ảnh hưởng đến grid container. Thứ tự đọc theo thứ tự hiển thị của các grid item, theo từng hàng, có tính đến writing mode.

- `grid-order`
  - : Chỉ ảnh hưởng đến grid container. Nếu thuộc tính {{cssxref("order")}} được áp dụng cho bất kỳ phần tử con nào của container, thứ tự đọc theo thứ tự item đã được sửa đổi. Nếu thuộc tính `order` không được áp dụng cho các grid item, `grid-order` hoạt động như `normal`.

- `source-order`
  - : Ảnh hưởng đến grid, flex và block container. Không có hiệu ứng riêng — thứ tự đọc của container tiếp tục theo thứ tự các phần tử trong DOM — nhưng cho phép thứ tự đọc được sửa đổi bằng cách đặt thuộc tính {{cssxref("reading-order")}} trên các phần tử con của container.

## Mô tả

Thuộc tính `reading-flow` sửa đổi {{glossary("reading order", "thứ tự đọc")}} của các phần tử trong container [block](/vi/docs/Glossary/Block/CSS), [flex](/vi/docs/Web/CSS/Guides/Flexible_box_layout) hoặc [grid](/vi/docs/Web/CSS/Guides/Grid_layout) khi được đặt thành giá trị khác `normal`. Container như vậy được gọi là [reading flow container](/en-US/docs/Glossary/Reading_order#reading_flow_container).

Theo mặc định, nội dung web được đọc theo thứ tự nguồn DOM. Nói chung, thứ tự nguồn nên thể hiện thứ tự đọc hợp lý cho nội dung, và điều này cũng nên được phản ánh trong thứ tự hiển thị trong bố cục nội dung. Tuy nhiên, đôi khi thứ tự hiển thị hoặc thứ tự Tab khác với thứ tự nguồn. Ví dụ, khi áp dụng nhiều bố cục flexbox hoặc grid cho tài liệu thông qua [media queries](/vi/docs/Web/CSS/Guides/Media_queries/Using) để phù hợp với các yêu cầu thiết bị hoặc người dùng khác nhau, thứ tự nội dung có thể khác nhau dựa trên chiều rộng viewport. Trong trường hợp như vậy, `reading-flow` có thể được dùng để đảm bảo thứ tự đọc và Tab phản ánh thứ tự hiển thị.

Trong một số trường hợp, bạn có thể muốn tinh chỉnh thêm thứ tự đọc trong reading flow container. Bạn có thể sử dụng các giá trị thuộc tính {{cssxref("reading-order")}} trên các phần tử con của container, đặt chúng vào các nhóm thứ tự sẽ được đọc theo thứ tự số.

### Tương tác với `tabindex`

Nếu một tập hợp các phần tử con của reading flow container mà thông thường không thể focus được làm có thể focus bằng thuộc tính [`tabindex="0"`](/vi/docs/Web/HTML/Reference/Global_attributes/tabindex), thứ tự đọc của chúng sẽ được sửa đổi như mong đợi bởi các thuộc tính `reading-flow` và `reading-order`, giống như các phần tử tương tác như {{htmlelement("a")}} hoặc {{htmlelement("button")}}.

Tuy nhiên, bất kỳ nỗ lực nào để sửa đổi thứ tự Tab của nội dung reading flow container bằng giá trị `tabindex` dương sẽ bị bỏ qua — bị ghi đè bởi các hiệu ứng của `reading-flow` và `reading-order`. Nói chung, bạn không nên sử dụng những thứ này; xem [Don't Use Tabindex Greater than 0](https://adrianroselli.com/2014/11/dont-use-tabindex-greater-than-0.html). Các thuộc tính `reading-flow` và `reading-order` cung cấp cách tốt hơn nhiều để sửa đổi thứ tự Tab nếu cần.

## Định nghĩa hình thức

{{cssinfo}}

## Ví dụ

### So sánh giá trị flex

Trong ví dụ này, chúng ta minh họa các hiệu ứng của các giá trị `reading-flow` khác nhau trên flex container với các flex item bị đảo ngược.

#### HTML

Phần đánh dấu bao gồm phần tử {{htmlelement("select")}} để chọn các giá trị `reading-flow` khác nhau, và {{htmlelement("div")}} bọc chứa ba phần tử {{htmlelement("a")}}.

```html
<form>
  <label for="reading-flow">Choose reading flow:</label>
  <select id="reading-flow">
    <option>normal</option>
    <option>flex-visual</option>
    <option>flex-flow</option>
  </select>
</form>
<div class="wrapper">
  <a href="#">Item 1</a>
  <a href="#">Item 2</a>
  <a href="#">Item 3</a>
</div>
```

#### CSS

Chúng ta sử dụng giá trị {{cssxref("display")}} là `flex` để biến `<div>` thành flex container, và hiển thị các flex item trong một hàng theo thứ tự DOM ngược với {{cssxref("flex-direction")}} là `row-reverse`. Ban đầu, chúng ta đặt `reading-flow` là `normal` để các item được đọc hoặc Tab theo thứ tự nguồn DOM.

Chúng ta cũng đặt giá trị {{cssxref("order")}} là `1` trên phần tử `<a>` đầu tiên để khiến nó hiển thị sau item thứ hai và thứ ba trong flex flow. Thứ tự hiển thị kết quả của các flex item từ trái sang phải là "Item 1", "Item 3", rồi "Item 2", nhưng thứ tự DOM vẫn không thay đổi.

```css
.wrapper {
  display: flex;
  flex-direction: row-reverse;
  reading-flow: normal;
  gap: 1em;
}

a:first-child {
  order: 1;
}
```

#### JavaScript

Trong script, chúng ta lấy tham chiếu đến phần tử `<select>` và `<div>` bọc, sau đó thêm trình lắng nghe sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) vào phần tử `<select>`. Khi một giá trị mới được chọn, nó được đặt làm giá trị thuộc tính `reading-flow` trên wrapper.

```js
const selectElem = document.getElementById("reading-flow");
const wrapperElem = document.querySelector(".wrapper");

selectElem.addEventListener("change", () => {
  wrapperElem.style.readingFlow = selectElem.value;
});
```

#### Kết quả

Bản demo kết xuất như sau:

{{EmbedLiveSample('Flex value comparison', '', '100px')}}

Đầu tiên, thử Tab qua các liên kết với `reading-flow: normal` được đặt. Thứ tự Tab là "Item 1", "Item 2", rồi "Item 3", vì đó là thứ tự của các phần tử trong DOM.

Bây giờ thử thay đổi giá trị `reading-flow` và Tab qua các liên kết lại:

- Giá trị `flex-visual` khiến các item được Tab theo thứ tự "Item 1", "Item 3", rồi "Item 2", đây là thứ tự hiển thị trực quan kết quả từ các thuộc tính flexbox được áp dụng.
- Giá trị `flex-flow` khiến các item được Tab theo thứ tự "Item 2", "Item 3", rồi "Item 1", khớp với hướng của `flex-flow` — trong trường hợp này là `row-reverse`. Ở đây, thứ tự Tab là ngược lại của thứ tự hiển thị.

### So sánh giá trị grid

Trong ví dụ này, chúng ta minh họa các hiệu ứng của các giá trị `reading-flow` khác nhau trên grid container.

#### HTML

Phần đánh dấu bao gồm phần tử {{htmlelement("select")}} để chọn các giá trị `reading-flow` khác nhau, và `<div>` bọc chứa bốn phần tử {{htmlelement("a")}}.

```html
<form>
  <label for="reading-flow">Choose reading flow:</label>
  <select id="reading-flow">
    <option>normal</option>
    <option>grid-rows</option>
    <option>grid-columns</option>
    <option>grid-order</option>
  </select>
</form>
<div class="wrapper">
  <a class="a" href="#">Item A</a>
  <a class="b" href="#">Item B</a>
  <a class="c" href="#">Item C</a>
  <a class="d" href="#">Item D</a>
</div>
```

#### CSS

Chúng ta sử dụng giá trị {{cssxref("display")}} là `grid` để biến `<div>` thành grid container, và hiển thị các grid item trong ba cột bằng {{cssxref("grid-template-columns")}}. Chúng ta cũng đặt {{cssxref("grid-template-areas")}} để mô tả các vùng đặt khác nhau trong các cột đó, và đặt các phần tử `<a>` vào các vùng đó bằng {{cssxref("grid-area")}}. Ban đầu, chúng ta đặt `reading-flow` là `normal` để các item được đọc hoặc Tab theo thứ tự nguồn DOM mặc định.

Cuối cùng, chúng ta đặt giá trị {{cssxref("order")}} là `1` trên phần tử `<a>` đầu tiên; điều này không ảnh hưởng đến bố cục vì nó không ghi đè vị trí vùng grid, nhưng nó có hiệu ứng khi một giá trị `reading-flow` nhất định được đặt, như bạn sẽ thấy sau.

Đọc từ trái sang phải, thứ tự hiển thị kết quả của các grid item là "Item D", "Item B", "Item C", rồi "Item A".

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 150px);
  grid-template-areas:
    "d b b"
    "c c a";
  reading-flow: normal;
}

.a {
  grid-area: a;
}
.b {
  grid-area: b;
}
.c {
  grid-area: c;
}
.d {
  grid-area: d;
}

a:first-child {
  order: 1;
}
```

#### JavaScript

Trong script, chúng ta lấy tham chiếu đến phần tử `<select>` và `<div>` bọc, sau đó thêm trình lắng nghe sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) vào phần tử `<select>`. Khi một giá trị mới được chọn, nó được đặt làm giá trị thuộc tính `reading-flow` trên wrapper.

```js
const selectElem = document.getElementById("reading-flow");
const wrapperElem = document.querySelector(".wrapper");

selectElem.addEventListener("change", () => {
  wrapperElem.style.readingFlow = selectElem.value;
});
```

#### Kết quả

Bản demo kết xuất như sau:

{{EmbedLiveSample('Grid value comparison', '', '100px')}}

Đầu tiên, thử Tab qua các liên kết với `reading-flow: normal` được đặt. Thứ tự Tab là "Item A", "Item B", "Item C" và "Item D", vì đó là thứ tự của các phần tử trong DOM.

Bây giờ thay đổi giá trị `reading-flow` và thử Tab qua các liên kết lại:

- Giá trị `grid-rows` khiến các item được Tab theo thứ tự hiển thị theo hàng. Đây là "Item D", "Item B", "Item C", rồi "Item A".
- Giá trị `grid-columns` khiến các item được Tab theo thứ tự hiển thị theo cột. Đây là "Item D", "Item C", "Item B", rồi "Item A".
- Giá trị `grid-order` khiến các item được Tab theo thứ tự DOM, nhưng có tính đến bất kỳ thay đổi giá trị `order` nào. Vì chúng ta có `order: 1;` đặt trên phần tử `<a>` đầu tiên, thứ tự Tab là "Item B", "Item C", "Item D", rồi "Item A".

### Điều chỉnh thứ tự đọc trên block container

Trong ví dụ này, chúng ta minh họa các hiệu ứng của giá trị `reading-flow: source-order` trên block container.

#### HTML

Phần đánh dấu bao gồm `<div>` bọc chứa bốn phần tử {{htmlelement("a")}}.

```html
<div class="wrapper">
  <a class="a" href="#">Item A</a>
  <a class="b" href="#">Item B</a>
  <a class="c" href="#">Item C</a>
  <a class="d" href="#">Item D</a>
</div>
```

#### CSS

Chúng ta đặt `reading-flow` là `source-order` để các item được đọc hoặc Tab theo thứ tự nguồn DOM, nhưng cho phép sửa đổi thứ tự đọc thông qua {{cssxref("reading-order")}}. Chúng ta đặt giá trị `reading-order` là `1` trên phần tử `<a>` đầu tiên.

```css
.wrapper {
  reading-flow: source-order;
}

a:first-child {
  reading-order: 1;
}
```

#### Kết quả

Bản demo kết xuất như sau:

{{EmbedLiveSample('Reading flow adjustment on block containers', '', '100px')}}

Thử Tab qua các liên kết: thứ tự Tab là "Item B", "Item C", "Item D", rồi "Item A" — thứ tự của các phần tử trong DOM được tuân theo, nhưng Item A đã được đặt vào nhóm thứ tự đọc cao hơn (giá trị `reading-order` mặc định là `0`), do đó nó được Tab đến sau cùng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("reading-order")}}
- [CSS `reading-flow` examples](https://chrome.dev/reading-flow-examples/) qua chrome.dev
