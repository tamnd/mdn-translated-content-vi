---
title: justify-content
slug: Web/CSS/Reference/Properties/justify-content
page-type: css-property
browser-compat: css.properties.justify-content
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`justify-content`** xác định cách trình duyệt phân phối khoảng cách giữa và xung quanh các mục nội dung dọc theo {{Glossary("main axis")}} của flex container và [trục inline](/en-US/docs/Glossary/Logical_properties#inline_direction) của grid và multicol container.

Ví dụ tương tác bên dưới minh họa một số giá trị `justify-content` sử dụng grid layout.

{{InteractiveExample("CSS Demo: justify-content")}}

```css interactive-example-choice
justify-content: start;
```

```css interactive-example-choice
justify-content: center;
```

```css interactive-example-choice
justify-content: space-between;
```

```css interactive-example-choice
justify-content: space-around;
```

```css interactive-example-choice
justify-content: space-evenly;
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
  width: 220px;
  display: grid;
  grid-template-columns: 60px 60px;
  grid-auto-rows: 40px;
  row-gap: 10px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Căn chỉnh theo vị trí */
justify-content: center;
justify-content: start;
justify-content: end;
justify-content: flex-start;
justify-content: flex-end;
justify-content: left;
justify-content: right;

/* Căn chỉnh bình thường */
justify-content: normal;

/* Căn chỉnh phân tán */
justify-content: space-between;
justify-content: space-around;
justify-content: space-evenly;
justify-content: stretch;

/* Căn chỉnh tràn (chỉ dành cho căn chỉnh theo vị trí) */
justify-content: safe center;
justify-content: unsafe center;

/* Giá trị toàn cục */
justify-content: inherit;
justify-content: initial;
justify-content: revert;
justify-content: revert-layer;
justify-content: unset;
```

### Giá trị

- `start`
  - : Các mục được đặt sát nhau về phía cạnh bắt đầu của alignment container trên trục chính.

- `end`
  - : Các mục được đặt sát nhau về phía cạnh kết thúc của alignment container trên trục chính.

- `flex-start`
  - : Các mục được đặt sát nhau về phía cạnh bắt đầu của alignment container trên phía main-start của flex container.
    Điều này chỉ áp dụng cho các mục flex layout. Đối với các mục không phải con của flex container, giá trị này được xử lý như `start`.

- `flex-end`
  - : Các mục được đặt sát nhau về phía cạnh kết thúc của alignment container trên phía main-end của flex container.
    Điều này chỉ áp dụng cho các mục flex layout. Đối với các mục không phải con của flex container, giá trị này được xử lý như `end`.

- `center`
  - : Các mục được đặt sát nhau về phía trung tâm của alignment container dọc theo trục chính.

- `left`
  - : Các mục được đặt sát nhau về phía cạnh trái của alignment container. Khi trục ngang của thuộc tính không song song với trục inline, chẳng hạn khi [`flex-direction: column;`](/en-US/docs/Web/CSS/Reference/Properties/flex-direction) được đặt, giá trị này hoạt động như `start`.

- `right`
  - : Các mục được đặt sát nhau về phía cạnh phải của alignment container trên trục thích hợp. Nếu trục của thuộc tính không song song với trục inline (trong grid container) hoặc trục chính (trong flexbox container), giá trị này hoạt động như `start`.

- `normal`
  - : Hoạt động như `stretch`, ngoại trừ trường hợp multi-column container có {{cssxref("column-width")}} khác `auto`, trong đó các cột lấy `column-width` đã chỉ định thay vì co giãn để lấp đầy container. Vì `stretch` hoạt động như `start` trong flex container, `normal` cũng hoạt động như `start`.

- `space-between`
  - : Các mục được phân phối đều trong alignment container dọc theo trục chính. Khoảng cách giữa mỗi cặp mục liền kề là như nhau. Mục đầu tiên nằm sát cạnh main-start, và mục cuối cùng nằm sát cạnh main-end.

- `space-around`
  - : Các mục được phân phối đều trong alignment container dọc theo trục chính. Khoảng cách giữa mỗi cặp mục liền kề là như nhau. Khoảng trống trước mục đầu tiên và sau mục cuối cùng bằng một nửa khoảng cách giữa mỗi cặp mục liền kề. Nếu chỉ có một mục, nó sẽ được căn giữa.

- `space-evenly`
  - : Các mục được phân phối đều trong alignment container dọc theo trục chính. Khoảng cách giữa mỗi cặp mục liền kề, cạnh main-start và mục đầu tiên, và cạnh main-end và mục cuối cùng đều hoàn toàn giống nhau.

- `stretch`
  - : Nếu kích thước kết hợp của các mục dọc theo trục chính nhỏ hơn kích thước của alignment container, bất kỳ mục kích thước `auto` nào cũng có kích thước được tăng lên đều nhau (không theo tỷ lệ), trong khi vẫn tôn trọng các ràng buộc do {{cssxref("max-height")}}/{{cssxref("max-width")}} (hoặc chức năng tương đương) áp đặt, sao cho kích thước kết hợp lấp đầy chính xác alignment container dọc theo trục chính.

    > [!NOTE]
    > Đối với [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts), giá trị `stretch` hoạt động như `flex-start` hoặc `start`. Điều này là vì trong flexbox, việc co giãn được kiểm soát bằng thuộc tính {{CSSXref("flex-grow")}}.

- `safe`
  - : Nếu mục tràn alignment container, thì mục được căn chỉnh như thể chế độ căn chỉnh là `start`. Căn chỉnh mong muốn sẽ không được thực hiện.

- `unsafe`
  - : Ngay cả khi mục tràn alignment container, căn chỉnh mong muốn vẫn được thực hiện. Khác với `safe`, vốn bỏ qua căn chỉnh mong muốn để tránh tràn.

## Mô tả

Được định nghĩa trong module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment), `justify-content` áp dụng cho multicol container, flex container và grid container. Thuộc tính không áp dụng và không có hiệu lực trên block container.

Thuộc tính này chia sẻ nhiều giá trị từ khóa với thuộc tính {{cssxref("align-content")}}, nhưng không phải tất cả. `justify-content` không liên quan đến căn chỉnh baseline, và do đó không nhận các giá trị baseline.

Trong [flex layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), thuộc tính xác định cách phân phối không gian tự do dương giữa hoặc xung quanh các flex item dọc theo trục chính. Thuộc tính này ảnh hưởng đến khoảng cách giữa các phần tử trong một dòng, không phải khoảng cách giữa các dòng. Căn chỉnh được thực hiện sau khi áp dụng độ dài và auto margins, có nghĩa là khi một hoặc nhiều flex item trong một dòng có hệ số {{cssxref("flex-grow")}} lớn hơn `0`, thuộc tính không có hiệu lực vì không có khoảng cách nào để phân phối trên dòng đó. Ngoài ra, vì co giãn dọc theo trục chính được kiểm soát bởi {{cssxref("flex")}}, giá trị `stretch` hoạt động như `flex-start`.

Với [grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout), thuộc tính này phân phối không gian khả dụng giữa hoặc xung quanh các cột grid, không phải các mục grid. Nếu grid container lớn hơn grid, thuộc tính `justify-content` có thể được dùng để căn chỉnh grid theo trục inline, căn chỉnh các cột grid.

Kích thước track `auto` của grid (và chỉ kích thước track `auto`) có thể được co giãn bởi các thuộc tính `align-content` và `justify-content`. Do đó, mặc định, track có kích thước `auto` sẽ chiếm bất kỳ không gian còn lại nào trong grid container. Vì kích thước inline của grid phải nhỏ hơn kích thước inline của grid container để có không gian phân phối, thuộc tính không có hiệu lực trong trường hợp này.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ grid cơ bản

Trong ví dụ này, chúng ta có một grid hẹp hơn grid container, và chúng ta dùng `justify-content` để phân phối không gian khả dụng đều nhau xung quanh và giữa các cột grid.

#### HTML

Container {{htmlelement("section")}}, grid container của chúng ta, có 16 phần tử {{htmlelement("div")}} lồng nhau sẽ trở thành grid item.

```html
<section class="container">
  <div>A</div>
  <div>B</div>
  <div>C</div>
  <div>D</div>
  <div>E</div>
  <div>F</div>
  <div>G</div>
  <div>H</div>
  <div>I</div>
  <div>J</div>
  <div>K</div>
  <div>L</div>
  <div>M</div>
  <div>N</div>
  <div>O</div>
  <div>P</div>
</section>
```

#### CSS

```css hidden
.container {
  margin: 5px;
  border: 1px solid;
  box-sizing: border-box;
}

div {
  line-height: 2em;
  border: 1px solid;
  box-sizing: border-box;
  text-align: center;
}
```

Chúng ta đặt chiều rộng container là `500px` và chỉ định ba cột, mỗi cột rộng `80px`, có nghĩa là có `260px` không gian khả dụng để phân phối giữa hoặc xung quanh chúng. Sau đó chúng ta đặt `justify-content: space-evenly`, nghĩa là sẽ có `65px` không gian trước, giữa và sau mỗi cột.

Chúng ta đặt các chiều rộng khác nhau (và màu nền) để minh họa cách căn chỉnh được áp dụng cho các cột.

```css
.container {
  display: grid;
  grid: auto-flow / repeat(3, 80px);
  width: 500px;
  justify-content: space-evenly;
}

div {
  background-color: pink;
  width: 80px;
}

div:nth-of-type(n + 9) {
  width: 35px;
  background-color: lightgreen;
}

div:nth-last-of-type(3) {
  width: 250px;
  background-color: lightblue;
}
```

#### Kết quả

{{EmbedLiveSample("Basic grid example", "100%", 220)}}

Lưu ý rằng `justify-contents` căn chỉnh các cột và không có hiệu lực đối với các mục hoặc căn chỉnh trong các grid area. Các grid item, kể cả những mục tràn ra khỏi grid cell, không ảnh hưởng đến việc căn chỉnh cột.

### Từ khóa safe

Ví dụ này minh họa từ khóa `safe`. Chúng ta chỉ định bốn flex item được căn giữa không được phép wrap, và do đó tràn ra khỏi single flex-line container. Bằng cách thêm `safe` vào `center` trong thuộc tính `justify-content`, nội dung tràn hoạt động như thể chế độ căn chỉnh là `start`.

```html hidden
<p><code>justify-content: center;</code></p>
<section class="container safe">
  <div>A</div>
  <div>B</div>
  <div>C</div>
  <div>D</div>
</section>
<p><code>justify-content: safe center;</code></p>
<section class="container safe-center">
  <div>A</div>
  <div>B</div>
  <div>C</div>
  <div>D</div>
</section>
<p><code>justify-content: safe center;</code> with 3 items</p>
<section class="container safe-center">
  <div>A</div>
  <div>B</div>
  <div>C</div>
</section>
```

```css hidden
.container {
  margin: 5px auto;
  border: 1px dashed;
  box-sizing: border-box;
  background-color: lightblue;
}

div {
  line-height: 1em;
  border: 1px solid;
  box-sizing: border-box;
  text-align: center;
  background-color: pink;
}
```

Container được đặt thành `center`, với mọi container trừ container đầu tiên có thêm từ khóa `safe`:

```css
.container {
  align-items: baseline;
  display: flex;
  width: 350px;
  height: 2em;
}

.safe {
  justify-content: center;
}

.safe-center {
  justify-content: safe center;
}

div {
  flex: 0 0 100px;
}
```

#### Kết quả

{{EmbedLiveSample("the safe keyword", "100%", 260)}}

Khi một mục tràn alignment container, với `safe` được bao gồm, chế độ căn chỉnh hoạt động như `start` và căn chỉnh `center` không được thực hiện. Từ khóa `safe` không có hiệu lực nếu các mục không tràn container.

### Trực quan hóa phân phối flex item

Ví dụ này bao gồm flex layout nhiều dòng có wrap. Flex item thứ hai có hệ số flex growth dương, tiêu thụ toàn bộ không gian tự do trên dòng flex đầu tiên.

#### CSS

```css hidden
#container {
  margin: 5px auto;
  border: 1px dashed black;
  box-sizing: border-box;
}

div {
  line-height: 2em;
  border: 1px solid;
  box-sizing: border-box;
  text-align: center;
}
```

```css
#container {
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between; /* Can be changed in the live sample */
  width: 510px;
}

div {
  line-height: 2em;
  flex: 0 0 120px;
  background-color: pink;
}

div:nth-of-type(2) {
  flex-grow: 1;
  background-color: yellow;
}

div:nth-of-type(n + 9) {
  flex: 0 0 35px;
  background-color: lightgreen;
}
div:last-of-type {
  flex: 0 0 300px;
  background-color: lightblue;
}
```

```html hidden
<section id="container">
  <div>A</div>
  <div>GROW</div>
  <div>C</div>
  <div>D</div>
  <div>E</div>
  <div>F</div>
  <div>G</div>
  <div>H</div>
  <div>I</div>
  <div>J</div>
  <div>K</div>
  <div>L</div>
  <div>M</div>
  <div>N</div>
  <div>O</div>
  <div>P</div>
</section>
<select id="justifyContent">
  <option value="start">start</option>
  <option value="end">end</option>
  <option value="flex-start">flex-start</option>
  <option value="flex-end">flex-end</option>
  <option value="center">center</option>
  <option value="left">left</option>
  <option value="right">right</option>
  <option value="space-between" selected>space-between</option>
  <option value="space-around">space-around</option>
  <option value="space-evenly">space-evenly</option>
  <option value="stretch">stretch</option>
</select>
```

```js hidden
const justifyContent = document.getElementById("justifyContent");
justifyContent.addEventListener("change", (evt) => {
  document.getElementById("container").style.justifyContent = evt.target.value;
});
```

#### Kết quả

{{EmbedLiveSample("Visualizing_flex_item_distribution", "100%", 180)}}

Chọn các từ khóa khác từ menu thả xuống để trực quan hóa các giá trị từ khóa `justify-content` khác nhau. Vì một mục trên dòng đầu tiên có thể phát triển, không có không gian khả dụng trên dòng đó cho thuộc tính `justify-content` phân phối. Với giá trị `space-between`, mục đầu tiên trên mỗi dòng nằm sát cạnh main-start, và mục cuối cùng nằm sát cạnh main-end. Kết quả là, nếu một dòng chỉ có một mục, nó sẽ được căn chỉnh với cạnh main-start (như thấy trên dòng cuối cùng). Đây không phải trường hợp với các giá trị `space-*` khác, chẳng hạn `space-evenly` và `space-around`, vốn căn giữa các dòng flex có một mục.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Basic concepts of flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Aligning items in a flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) module
