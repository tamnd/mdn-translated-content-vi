---
title: align-content
slug: Web/CSS/Reference/Properties/align-content
page-type: css-property
browser-compat: css.properties.align-content
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`align-content`** đặt cách phân bổ khoảng cách giữa và xung quanh các mục nội dung dọc theo [trục chéo](/en-US/docs/Glossary/Cross_Axis) của [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), hoặc dọc theo trục khối của phần tử [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) hay phần tử [cấp khối](/en-US/docs/Glossary/Block-level_content).

Thuộc tính này không có hiệu lực trên các flex container một dòng (tức là những container có `flex-wrap: nowrap`).

Ví dụ tương tác bên dưới sử dụng bố cục grid để minh họa một số giá trị của thuộc tính này.

{{InteractiveExample("CSS Demo: align-content")}}

```css interactive-example-choice
align-content: start;
```

```css interactive-example-choice
align-content: center;
```

```css interactive-example-choice
align-content: space-between;
```

```css interactive-example-choice
align-content: space-around;
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
  column-gap: 10px;
  height: 180px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Căn chỉnh thông thường */
align-content: normal;

/* Căn chỉnh theo vị trí cơ bản */
/* align-content không nhận giá trị left và right */
align-content: start;
align-content: center;
align-content: end;
align-content: flex-start;
align-content: flex-end;

/* Căn chỉnh theo đường cơ sở */
align-content: baseline;
align-content: first baseline;
align-content: last baseline;

/* Căn chỉnh phân tán */
align-content: space-between;
align-content: space-around;
align-content: space-evenly;
align-content: stretch;

/* Căn chỉnh tràn */
align-content: safe center;
align-content: unsafe center;

/* Giá trị toàn cục */
align-content: inherit;
align-content: initial;
align-content: revert;
align-content: revert-layer;
align-content: unset;
```

### Giá trị

- `normal`
  - : Các mục được đặt ở vị trí mặc định của chúng như thể không có giá trị `align-content` nào được đặt.
- `start`
  - : Các mục được xếp sát nhau về phía cạnh bắt đầu của container căn chỉnh trên trục chéo.
- `center`
  - : Các mục được xếp sát nhau ở giữa container căn chỉnh dọc theo trục chéo.
- `end`
  - : Các mục được xếp sát nhau về phía cạnh kết thúc của container căn chỉnh trên trục chéo.
- `flex-start`
  - : Các mục được xếp sát nhau về phía cạnh của container căn chỉnh tùy thuộc vào phía cross-start của flex container.
    Điều này chỉ áp dụng cho các mục bố cục flex. Đối với các mục không phải là con của flex container, giá trị này được xử lý như `start`.
- `flex-end`
  - : Các mục được xếp sát nhau về phía cạnh của container căn chỉnh tùy thuộc vào phía cross-end của flex container.
    Điều này chỉ áp dụng cho các mục bố cục flex. Đối với các mục không phải là con của flex container, giá trị này được xử lý như `end`.
- `baseline`, `first baseline`, `last baseline`
  - : Xác định sự tham gia vào căn chỉnh đường cơ sở đầu tiên hoặc cuối cùng: căn chỉnh đường cơ sở căn chỉnh của tập đường cơ sở đầu tiên hoặc cuối cùng của hộp với đường cơ sở tương ứng trong tập đường cơ sở đầu tiên hoặc cuối cùng được chia sẻ của tất cả các hộp trong nhóm chia sẻ đường cơ sở của nó.

    ![đường cơ sở là đường mà trên đó hầu hết các chữ cái "ngồi" và bên dưới các nét xuống kéo dài.](410px-typography_line_terms.svg.png)

    Căn chỉnh dự phòng cho `first baseline` là `start`, cho `last baseline` là `end`.

- `space-between`
  - : Các mục được phân bổ đều trong container căn chỉnh dọc theo trục chéo. Khoảng cách giữa mỗi cặp mục liền kề là như nhau. Mục đầu tiên nằm sát cạnh bắt đầu của container căn chỉnh trên trục chéo, và mục cuối cùng nằm sát cạnh kết thúc của container căn chỉnh trên trục chéo.
- `space-around`
  - : Các mục được phân bổ đều trong container căn chỉnh dọc theo trục chéo. Khoảng cách giữa mỗi cặp mục liền kề là như nhau. Khoảng trắng trước mục đầu tiên và sau mục cuối cùng bằng một nửa khoảng cách giữa mỗi cặp mục liền kề.
- `space-evenly`
  - : Các mục được phân bổ đều trong container căn chỉnh dọc theo trục chéo. Khoảng cách giữa mỗi cặp mục liền kề, giữa cạnh bắt đầu và mục đầu tiên, và giữa cạnh kết thúc và mục cuối cùng, đều hoàn toàn như nhau.
- `stretch`
  - : Nếu kích thước kết hợp của các mục dọc theo trục chéo nhỏ hơn kích thước của container căn chỉnh, bất kỳ mục nào có kích thước `auto` sẽ được tăng kích thước đều nhau (không theo tỷ lệ), trong khi vẫn tuân theo các ràng buộc đặt ra bởi {{cssxref("max-height")}}/{{cssxref("max-width")}} (hoặc chức năng tương đương), sao cho kích thước kết hợp lấp đầy chính xác container căn chỉnh dọc theo trục chéo.
- `safe`
  - : Được sử dụng kèm với từ khóa căn chỉnh. Nếu từ khóa được chọn có nghĩa là mục tràn ra ngoài container căn chỉnh gây mất dữ liệu, mục đó thay vào đó sẽ được căn chỉnh như thể chế độ căn chỉnh là `start`.
- `unsafe`
  - : Được sử dụng kèm với từ khóa căn chỉnh. Bất kể kích thước tương đối của mục và container căn chỉnh và liệu tràn có thể gây mất dữ liệu hay không, giá trị căn chỉnh đã cho vẫn được tuân theo.

> [!NOTE]
> Các giá trị `<content-distribution>` (`space-between`, `space-around`, `space-evenly`, và `stretch`) không có hiệu lực trong [bố cục khối](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables#align-content_and_justify-content) vì toàn bộ nội dung trong khối đó được xử lý như một [đối tượng căn chỉnh](/en-US/docs/Glossary/Alignment_Subject) duy nhất.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Hiệu ứng của các giá trị align-content khác nhau

Trong ví dụ này, bạn có thể chuyển đổi giữa ba giá trị thuộc tính {{cssxref("display")}} khác nhau, bao gồm `flex`, `grid`, và `block`. Bạn cũng có thể chuyển đổi giữa các giá trị khác nhau cho `align-content`.

#### HTML

```html
<section>
  <div class="olive">Olive</div>
  <div class="coral">Coral</div>
  <div class="deepskyblue">Deep<br />sky<br />blue</div>
  <div class="orchid">Orchid</div>
  <div class="slateblue">Slateblue</div>
  <div class="maroon">Maroon</div>
</section>
```

```html hidden
<fieldset class="controls">
  <legend>Controls</legend>
  <div class="row">
    <label for="display">display: </label>
    <select id="display">
      <option value="block" selected>block</option>
      <option value="flex">flex</option>
      <option value="grid">grid</option>
    </select>
  </div>
  <div class="row">
    <label for="alignContent">align-content: </label>
    <select id="alignContent">
      <option value="normal" selected>normal</option>
      <option value="start">start</option>
      <option value="center">center</option>
      <option value="end">end</option>
      <option value="flex-start">flex-start</option>
      <option value="flex-end">flex-end</option>
      <option value="space-between">space-between</option>
      <option value="space-around">space-around</option>
      <option value="space-evenly">space-evenly</option>
    </select>
  </div>
  <p>CSS applied</p>
  <pre>
section {
  display: <span id="displayStyle">block</span>;
  align-content: <span id="align">normal</span>
}
  </pre>
</fieldset>
```

#### CSS

```css hidden
body {
  font-size: 1.25rem;
  display: flex;
  gap: 1rem;
}
section div {
  font-family: monospace;
  padding: 3px;
}
```

```css
section {
  border: solid 1.5px tomato;
  height: 300px;
  width: 300px;
  flex-wrap: wrap; /* used by flex only */
  gap: 0.2rem; /* not used by block */
}
.olive {
  background-color: olive;
}
.coral {
  background-color: coral;
}
.deepskyblue {
  background-color: deepskyblue;
}
.orchid {
  background-color: orchid;
}
.slateblue {
  background-color: slateblue;
  color: white;
}
.maroon {
  background-color: maroon;
  color: white;
}
```

```js hidden
const alignContent = document.querySelector("#alignContent");
const display = document.querySelector("#display");
const container = document.querySelector("section");
const displayStyle = document.querySelector("#displayStyle");
const alignStyle = document.querySelector("#align");

alignContent.addEventListener("change", () => {
  updatePage();
});
display.addEventListener("change", () => {
  updatePage();
});
function updatePage() {
  const alVal = alignContent.value;
  const dVal = display.value;
  container.style.alignContent = alVal;
  container.style.display = dVal;
  alignStyle.innerText = alVal;
  displayStyle.innerText = dVal;
}
updatePage();
```

#### Kết quả

Hãy thử thay đổi giá trị `display` và giá trị `align-content`.

{{EmbedLiveSample("Examples", 260, 310)}}

Trong [bố cục khối](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables#align-content_and_justify-content), các phần tử con được xử lý như một phần tử duy nhất, có nghĩa là `space-between`, `space-around`, và `space-evenly` hoạt động khác đi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Căn chỉnh hộp trong bố cục grid](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
- [Bố cục khối và nội tuyến trong luồng thông thường](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout)
- [Nội dung cấp khối](/en-US/docs/Glossary/Block-level_content)
- {{CSSXRef("display")}}
