---
title: place-content
slug: Web/CSS/Reference/Properties/place-content
page-type: css-shorthand-property
browser-compat: css.properties.place-content
sidebar: cssref
---

Thuộc tính viết tắt [CSS](/en-US/docs/Web/CSS) **`place-content`** cho phép bạn căn chỉnh nội dung theo cả hướng khối và hướng nội tuyến cùng lúc (tức là các thuộc tính {{CSSxRef("align-content")}} và {{CSSxRef("justify-content")}}) trong các hệ thống bố cục phù hợp như [Grid](/en-US/docs/Web/CSS/Guides/Grid_layout) hoặc [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).

{{InteractiveExample("CSS Demo: place-content")}}

```css interactive-example-choice
place-content: end space-between;
```

```css interactive-example-choice
place-content: space-around start;
```

```css interactive-example-choice
place-content: start space-evenly;
```

```css interactive-example-choice
place-content: end center;
```

```css interactive-example-choice
place-content: end;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 60px 60px;
  grid-auto-rows: 40px;
  height: 180px;
  width: 220px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("align-content")}}
- {{cssxref("justify-content")}}

## Cú pháp

```css
/* Căn chỉnh theo vị trí */
/* align-content không nhận các giá trị left và right */
place-content: center start;
place-content: start center;
place-content: end left;
place-content: flex-start center;
place-content: flex-end center;

/* Căn chỉnh theo baseline */
/* justify-content không nhận các giá trị baseline */
place-content: baseline center;
place-content: first baseline space-evenly;
place-content: last baseline right;

/* Căn chỉnh phân bổ */
place-content: space-between space-evenly;
place-content: space-around space-evenly;
place-content: space-evenly stretch;
place-content: stretch space-evenly;

/* Giá trị toàn cục */
place-content: inherit;
place-content: initial;
place-content: revert;
place-content: revert-layer;
place-content: unset;
```

Giá trị đầu tiên là giá trị của thuộc tính {{CSSxRef("align-content")}}, giá trị thứ hai là của {{CSSxRef("justify-content")}}.

> [!NOTE]
> Nếu giá trị thứ hai không có, giá trị đầu tiên sẽ được dùng cho cả hai, với điều kiện nó hợp lệ cho cả hai. Nếu nó không hợp lệ cho một trong hai, toàn bộ giá trị sẽ không hợp lệ.

### Các giá trị

- `start`
  - : Các mục được đóng gói sát nhau hướng về cạnh bắt đầu của vùng chứa căn chỉnh theo trục phù hợp.
- `end`
  - : Các mục được đóng gói sát nhau hướng về cạnh kết thúc của vùng chứa căn chỉnh theo trục phù hợp.
- `flex-start`
  - : Các mục được đóng gói sát nhau hướng về cạnh của vùng chứa căn chỉnh tùy thuộc vào phía main-start hoặc cross-start của flex container.
    Giá trị này chỉ áp dụng cho các mục flex layout. Đối với các mục không phải con của flex container, giá trị này được coi như `start`.
- `flex-end`
  - : Các mục được đóng gói sát nhau hướng về cạnh của vùng chứa căn chỉnh tùy thuộc vào phía main-end hoặc cross-end của flex container.
    Giá trị này chỉ áp dụng cho các mục flex layout. Đối với các mục không phải con của flex container, giá trị này được coi như `end`.
- `center`
  - : Các mục được đóng gói sát nhau hướng về trung tâm của vùng chứa căn chỉnh.
- `left`
  - : Các mục được đóng gói sát nhau hướng về cạnh trái của vùng chứa căn chỉnh. Nếu trục của thuộc tính không song song với trục nội tuyến, giá trị này hoạt động như `start`.
- `right`
  - : Các mục được đóng gói sát nhau hướng về cạnh phải của vùng chứa căn chỉnh theo trục phù hợp. Nếu trục của thuộc tính không song song với trục nội tuyến, giá trị này hoạt động như `start`.
- `space-between`
  - : Các mục được phân bổ đều trong vùng chứa căn chỉnh. Khoảng cách giữa mỗi cặp mục liền kề là bằng nhau. Mục đầu tiên nằm sát cạnh main-start, mục cuối cùng nằm sát cạnh main-end.
- `baseline`, `first baseline`, `last baseline`
  - : Xác định sự tham gia vào căn chỉnh baseline đầu tiên hoặc cuối cùng: căn chỉnh baseline căn chỉnh của baseline đầu tiên hoặc cuối cùng của hộp với baseline tương ứng trong tập baseline đầu tiên hoặc cuối cùng chia sẻ của tất cả các hộp trong nhóm chia sẻ baseline của nó.
    Căn chỉnh dự phòng cho `first baseline` là `start`, cho `last baseline` là `end`.
- `space-around`
  - : Các mục được phân bổ đều trong vùng chứa căn chỉnh. Khoảng cách giữa mỗi cặp mục liền kề là bằng nhau. Khoảng trống trước mục đầu tiên và sau mục cuối cùng bằng một nửa khoảng cách giữa mỗi cặp mục liền kề.
- `space-evenly`
  - : Các mục được phân bổ đều trong vùng chứa căn chỉnh. Khoảng cách giữa mỗi cặp mục liền kề, cạnh main-start và mục đầu tiên, cùng cạnh main-end và mục cuối cùng, đều hoàn toàn bằng nhau.
- `stretch`
  - : Nếu kích thước kết hợp của các mục nhỏ hơn kích thước của vùng chứa căn chỉnh, bất kỳ mục có kích thước `auto` nào đều được tăng kích thước đều nhau (không theo tỉ lệ), trong khi vẫn tôn trọng các ràng buộc áp đặt bởi {{CSSxRef("max-height")}}/{{CSSxRef("max-width")}} (hoặc chức năng tương đương), để kích thước kết hợp lấp đầy hoàn toàn vùng chứa căn chỉnh.
- `safe`
  - : Dùng cùng với từ khóa căn chỉnh. Nếu từ khóa được chọn khiến mục tràn khỏi vùng chứa căn chỉnh gây mất dữ liệu, mục sẽ được căn chỉnh như thể chế độ căn chỉnh là `start`.
- `unsafe`
  - : Dùng cùng với từ khóa căn chỉnh. Bất kể kích thước tương đối của mục và vùng chứa căn chỉnh, và bất kể có xảy ra tràn gây mất dữ liệu hay không, giá trị căn chỉnh đã cho vẫn được áp dụng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt nội dung trong flex container

#### HTML

```html
<div id="container">
  <div class="small">Lorem</div>
  <div class="small">Lorem<br />ipsum</div>
  <div class="large">Lorem</div>
  <div class="large">Lorem<br />ipsum</div>
  <div class="large"></div>
  <div class="large"></div>
</div>
```

```html hidden
<code>writing-mode:</code
><select id="writingMode">
  <option value="horizontal-tb" selected>horizontal-tb</option>
  <option value="vertical-rl">vertical-rl</option>
  <option value="vertical-lr">vertical-lr</option>
  <option value="sideways-rl">sideways-rl</option>
  <option value="sideways-lr">sideways-lr</option></select
><code>;</code><br />

<code>direction:</code
><select id="direction">
  <option value="ltr" selected>ltr</option>
  <option value="rtl">rtl</option></select
><code>;</code><br />

<code>place-content:</code
><select id="alignContentAlignment">
  <option value="normal">normal</option>
  <option value="first baseline">first baseline</option>
  <option value="last baseline">last baseline</option>
  <option value="baseline">baseline</option>
  <option value="space-between">space-between</option>
  <option value="space-around">space-around</option>
  <option value="space-evenly" selected>space-evenly</option>
  <option value="stretch">stretch</option>
  <option value="center">center</option>
  <option value="start">start</option>
  <option value="end">end</option>
  <option value="flex-start">flex-start</option>
  <option value="flex-end">flex-end</option>
  <option value="safe">safe</option>
  <option value="unsafe">unsafe</option>
</select>
<select id="justifyContentAlignment">
  <option value="normal">normal</option>
  <option value="space-between">space-between</option>
  <option value="space-around">space-around</option>
  <option value="space-evenly">space-evenly</option>
  <option value="stretch">stretch</option>
  <option value="center" selected>center</option>
  <option value="start">start</option>
  <option value="end">end</option>
  <option value="flex-start">flex-start</option>
  <option value="flex-end">flex-end</option>
  <option value="left">left</option>
  <option value="right">right</option>
  <option value="safe">safe</option>
  <option value="unsafe">unsafe</option></select
><code>;</code>
```

```js hidden
function update() {
  document.getElementById("container").style.placeContent =
    `${document.getElementById("alignContentAlignment").value} ` +
    `${document.getElementById("justifyContentAlignment").value}`;
}

const alignContentAlignment = document.getElementById("alignContentAlignment");
alignContentAlignment.addEventListener("change", update);

const justifyContentAlignment = document.getElementById(
  "justifyContentAlignment",
);
justifyContentAlignment.addEventListener("change", update);

const writingM = document.getElementById("writingMode");
writingM.addEventListener("change", (evt) => {
  document.getElementById("container").style.writingMode = evt.target.value;
});

const direction = document.getElementById("direction");
direction.addEventListener("change", (evt) => {
  document.getElementById("container").style.direction = evt.target.value;
});
```

#### CSS

```css
#container {
  display: flex;
  height: 240px;
  width: 240px;
  flex-wrap: wrap;
  background-color: #8c8c8c;
  writing-mode: horizontal-tb; /* Can be changed in the live sample */
  direction: ltr; /* Can be changed in the live sample */
  place-content: flex-end center; /* Can be changed in the live sample */
}

div > div {
  border: 2px solid #8c8c8c;
  width: 50px;
  background-color: #a0c8ff;
}

.small {
  font-size: 12px;
  height: 40px;
}

.large {
  font-size: 14px;
  height: 50px;
}
```

#### Kết quả

{{EmbedLiveSample("Placing_content_in_a_flex_container", "370", "300")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("align-content")}}
- {{cssxref("justify-content")}}
- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Căn chỉnh hộp trong bố cục grid](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- Mô-đun [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
