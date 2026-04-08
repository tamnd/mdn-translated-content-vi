---
title: align-items
slug: Web/CSS/Reference/Properties/align-items
page-type: css-property
browser-compat: css.properties.align-items
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`align-items`** đặt giá trị {{cssxref("align-self")}} cho tất cả các con trực tiếp như một nhóm. Trong flexbox, nó kiểm soát việc căn chỉnh các mục trên {{glossary("cross axis", "trục chéo")}}. Trong bố cục grid, nó kiểm soát việc căn chỉnh các mục trên trục khối trong {{glossary("grid areas", "vùng grid")}} của chúng.

Ví dụ tương tác bên dưới sử dụng bố cục grid để minh họa một số giá trị của thuộc tính này.

{{InteractiveExample("CSS Demo: align-items")}}

```css interactive-example-choice
align-items: stretch;
```

```css interactive-example-choice
align-items: center;
```

```css interactive-example-choice
align-items: start;
```

```css interactive-example-choice
align-items: end;
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
  width: 200px;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 80px;
  grid-gap: 10px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Từ khóa cơ bản */
align-items: normal;
align-items: stretch;

/* Căn chỉnh theo vị trí */
/* align-items không nhận giá trị left và right */
align-items: center;
align-items: start;
align-items: end;
align-items: flex-start;
align-items: flex-end;
align-items: self-start;
align-items: self-end;
align-items: anchor-center;

/* Căn chỉnh theo đường cơ sở */
align-items: baseline;
align-items: first baseline;
align-items: last baseline;

/* Căn chỉnh tràn (chỉ dành cho căn chỉnh theo vị trí) */
align-items: safe center;
align-items: unsafe center;

/* Giá trị toàn cục */
align-items: inherit;
align-items: initial;
align-items: revert;
align-items: revert-layer;
align-items: unset;
```

### Giá trị

- `normal`
  - : Hiệu ứng của từ khóa này phụ thuộc vào chế độ bố cục đang sử dụng:
    - Trong bố cục định vị tuyệt đối, từ khóa hoạt động như `start` trên các hộp định vị tuyệt đối _được thay thế_, và như `stretch` trên _tất cả các_ hộp định vị tuyệt đối còn lại.
    - Trong vị trí tĩnh của bố cục định vị tuyệt đối, từ khóa hoạt động như `stretch`.
    - Đối với các mục flex, từ khóa hoạt động như `stretch`.
    - Đối với các mục grid, từ khóa này dẫn đến hành vi tương tự như `stretch`, ngoại trừ các hộp có {{glossary("aspect ratio", "tỷ lệ khung hình")}} hoặc kích thước nội tại, nơi nó hoạt động như `start`.
    - Thuộc tính không áp dụng cho các hộp cấp khối và ô bảng.

- `center`
  - : Các hộp lề của flex item được căn giữa trong dòng trên trục chéo. Nếu kích thước chéo của một mục lớn hơn flex container, mục đó sẽ tràn đều theo cả hai hướng.

- `start`
  - : Các mục được xếp sát nhau về phía cạnh bắt đầu của container căn chỉnh trên trục phù hợp.

- `end`
  - : Các mục được xếp sát nhau về phía cạnh kết thúc của container căn chỉnh trên trục phù hợp.

- `self-start`
  - : Các mục được xếp sát vào cạnh phía bắt đầu của mục trong container căn chỉnh, trên trục phù hợp.

- `self-end`
  - : Các mục được xếp sát vào cạnh phía kết thúc của mục trong container căn chỉnh, trên trục phù hợp.

- `baseline`, `first baseline`, `last baseline`
  - : Tất cả các flex item được căn chỉnh sao cho [các đường cơ sở của flex container](https://drafts.csswg.org/css-flexbox-1/#flex-baselines) thẳng hàng với nhau. Mục có khoảng cách lớn nhất giữa cạnh lề cross-start và đường cơ sở của nó sẽ được đặt sát cạnh cross-start của dòng.

- `stretch`
  - : Nếu kích thước chéo của mục là `auto`, kích thước sử dụng được đặt thành chiều dài cần thiết để gần lấp đầy container nhất có thể, tuân theo giới hạn chiều rộng và chiều cao của mục. Nếu mục không có kích thước tự động, giá trị này dự phòng về `flex-start`, và về `self-start` hoặc `self-end` nếu {{cssxref("align-content")}} của container là `first baseline` (hoặc `baseline`) hoặc `last baseline`.

- `anchor-center`
  - : Trong trường hợp các phần tử [được định vị neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning), căn chỉnh các mục vào trung tâm của phần tử neo liên kết theo hướng khối. Xem [Căn giữa trên neo sử dụng `anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center).

- `safe`
  - : Được sử dụng kèm với từ khóa căn chỉnh. Nếu từ khóa được chọn có nghĩa là mục tràn ra ngoài container căn chỉnh gây mất dữ liệu, mục đó thay vào đó sẽ được căn chỉnh như thể chế độ căn chỉnh là `start`.

- `unsafe`
  - : Được sử dụng kèm với từ khóa căn chỉnh. Bất kể kích thước tương đối của mục và container căn chỉnh và liệu tràn có thể gây mất dữ liệu hay không, giá trị căn chỉnh đã cho vẫn được tuân theo.

Ngoài ra còn có hai giá trị được định nghĩa cho flexbox, dựa trên các khái niệm [trục mô hình flex](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox#the_flex_model), cũng hoạt động trong bố cục grid:

- `flex-start`
  - : Chỉ được dùng trong bố cục flex, căn chỉnh các flex item sát về phía main-start hoặc cross-start của flex container. Khi được sử dụng ngoài ngữ cảnh định dạng flex, giá trị này hoạt động như `start`.

- `flex-end`
  - : Chỉ được dùng trong bố cục flex, căn chỉnh các flex item sát về phía main-end hoặc cross-end của flex container. Khi được sử dụng ngoài ngữ cảnh định dạng flex, giá trị này hoạt động như `end`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Trong ví dụ này, chúng ta có một container với sáu phần tử con. Một menu thả xuống {{htmlelement("select")}} cho phép chuyển đổi {{cssxref("display")}} của container giữa `grid` và `flex`. Menu thứ hai cho phép thay đổi giá trị thuộc tính `align-items` của container.

### CSS

Chúng ta tạo kiểu cho container và các mục theo cách đảm bảo có hai dòng hoặc hàng mục. Chúng ta định nghĩa các lớp `.flex` và `.grid`, sẽ được áp dụng cho container bằng JavaScript. Chúng đặt giá trị {{cssxref("display")}} của container và thay đổi màu nền và đường viền của nó như một chỉ báo bổ sung rằng bố cục đã thay đổi. Sáu flex item mỗi cái có màu nền khác nhau, với mục thứ 4 có hai dòng và mục thứ 6 có font phóng to.

```css
.flex,
.grid {
  height: 200px;
  width: 500px;
  align-items: initial; /* Change the value in the live sample */
  border: solid 5px transparent;
  gap: 3px;
}

.flex {
  display: flex;
  flex-wrap: wrap;
  background-color: #8c8c9f;
  border-color: magenta;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, 100px);
  background-color: #9f8c8c;
  border-color: slateblue;
}

#item1 {
  background-color: #8cffa0;
  min-height: 30px;
}

#item2 {
  background-color: #a0c8ff;
  min-height: 50px;
}

#item3 {
  background-color: #ffa08c;
  min-height: 40px;
}

#item4 {
  background-color: #ffff8c;
  min-height: 60px;
}

#item5 {
  background-color: #ff8cff;
  min-height: 70px;
}

#item6 {
  background-color: #8cffff;
  min-height: 50px;
  font-size: 30px;
}
```

```css hidden
select {
  font-size: 16px;
}

.row {
  margin-top: 10px;
}

div > div {
  box-sizing: border-box;
  border: 2px solid white;
  width: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

### HTML

Chúng ta có một container {{htmlelement("div")}} với sáu `<div>` con lồng nhau. HTML cho form và JavaScript thay đổi lớp của container đã được ẩn để ngắn gọn.

```html
<div id="container" class="flex">
  <div id="item1">1</div>
  <div id="item2">2</div>
  <div id="item3">3</div>
  <div id="item4">4<br />line 2</div>
  <div id="item5">5</div>
  <div id="item6">6</div>
</div>
```

```html hidden
<div class="row">
  <label for="display">display: </label>
  <select id="display">
    <option value="flex">flex</option>
    <option value="grid">grid</option>
  </select>
</div>

<div class="row">
  <label for="values">align-items: </label>
  <select id="values">
    <option value="normal">normal</option>
    <option value="flex-start">flex-start</option>
    <option value="flex-end">flex-end</option>
    <option value="center" selected>center</option>
    <option value="baseline">baseline</option>
    <option value="stretch">stretch</option>

    <option value="start">start</option>
    <option value="end">end</option>
    <option value="self-start">self-start</option>
    <option value="self-end">self-end</option>

    <option value="first baseline">first baseline</option>
    <option value="last baseline">last baseline</option>

    <option value="safe center">safe center</option>
    <option value="unsafe center">unsafe center</option>
    <option value="safe right">safe right</option>
    <option value="unsafe right">unsafe right</option>
    <option value="safe end">safe end</option>
    <option value="unsafe end">unsafe end</option>
    <option value="safe self-end">safe self-end</option>
    <option value="unsafe self-end">unsafe self-end</option>
    <option value="safe flex-end">safe flex-end</option>
    <option value="unsafe flex-end">unsafe flex-end</option>
  </select>
</div>
```

```js hidden
const values = document.getElementById("values");
const display = document.getElementById("display");
const container = document.getElementById("container");

values.addEventListener("change", (evt) => {
  container.style.alignItems = evt.target.value;
});

display.addEventListener("change", (evt) => {
  container.className = evt.target.value;
});
```

### Kết quả

{{EmbedLiveSample("Examples", "260", "290")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("align-self")}}
- {{cssxref("align-content")}}
- {{cssxref("justify-items")}}
- Viết tắt {{cssxref("place-items")}}
- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Căn chỉnh hộp trong bố cục grid](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- Module [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
- Module [Bố cục hộp linh hoạt CSS](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [Bố cục grid CSS](/en-US/docs/Web/CSS/Guides/Grid_layout)
