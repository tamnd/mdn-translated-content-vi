---
title: position
slug: Web/CSS/Reference/Properties/position
page-type: css-property
browser-compat: css.properties.position
sidebar: cssref
---

Thuộc tính **`position`** [CSS](/en-US/docs/Web/CSS) xác định cách một phần tử được định vị trong tài liệu. Các thuộc tính vật lý {{Cssxref("top")}}, {{Cssxref("right")}}, {{Cssxref("bottom")}}, và {{Cssxref("left")}} cùng với các thuộc tính logic tương đối theo luồng {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}}, và {{cssxref("inset-inline-end")}} có thể được sử dụng để xác định vị trí cuối cùng của các phần tử được định vị.

{{InteractiveExample("CSS Demo: position")}}

```css interactive-example-choice
position: static;
```

```css interactive-example-choice
position: relative;
top: 40px;
left: 40px;
```

```css interactive-example-choice
position: absolute;
inset-inline-start: 40px;
inset-block-start: 40px;
```

```css interactive-example-choice
position: sticky;
top: 20px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element-container">
    <p>
      In this demo you can control the <code>position</code> property for the
      yellow box.
    </p>
    <div class="box"></div>
    <div class="box" id="example-element"></div>
    <div class="box"></div>
    <p class="clear">
      To see the effect of <code>sticky</code> positioning, select the
      <code>position: sticky</code> option and scroll this container.
    </p>
    <p>
      The element will scroll along with its container, until it is at the top
      of the container (or reaches the offset specified in <code>top</code>),
      and will then stop scrolling, so it stays visible.
    </p>
    <p>
      The rest of this text is only supplied to make sure the container
      overflows, so as to enable you to scroll it and see the effect.
    </p>
    <hr />
    <p>
      Far out in the uncharted backwaters of the unfashionable end of the
      western spiral arm of the Galaxy lies a small unregarded yellow sun.
      Orbiting this at a distance of roughly ninety-two million miles is an
      utterly insignificant little blue green planet whose ape-descended life
      forms are so amazingly primitive that they still think digital watches are
      a pretty neat idea.
    </p>
  </div>
</section>
```

```css interactive-example
section {
  align-items: flex-start;
  overflow: auto;
}

.box {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  float: left;
  width: 65px;
  height: 65px;
}

.box + .box {
  margin-left: 10px;
}

.clear {
  clear: both;
  padding-top: 1em;
}

#example-element-container {
  position: relative;
  text-align: left;
}

#example-element {
  background-color: yellow;
  border: 3px solid red;
  z-index: 1;
}
```

## Cú pháp

```css
position: static;
position: relative;
position: absolute;
position: fixed;
position: sticky;

/* Giá trị toàn cục */
position: inherit;
position: initial;
position: revert;
position: revert-layer;
position: unset;
```

### Giá trị

- `static`
  - : Phần tử được định vị theo [Luồng bình thường](/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction#normal_layout_flow) của tài liệu. Các thuộc tính {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, {{cssxref("left")}}, và {{cssxref("z-index")}} _không có hiệu lực_. Đây là giá trị mặc định.
- `relative`
  - : Phần tử được định vị theo luồng bình thường của tài liệu, sau đó bị dịch chuyển _so với chính nó_ dựa trên các giá trị của `top`, `right`, `bottom`, và `left`. Phần dịch chuyển không ảnh hưởng đến vị trí của bất kỳ phần tử nào khác; do đó, không gian dành cho phần tử trong bố cục trang vẫn giống như khi `position` là `static`.

    Giá trị này tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới khi giá trị của `z-index` không phải là `auto`. Hiệu lực của nó trên các phần tử `table-*-group`, `table-row`, `table-column`, `table-cell`, và `table-caption` là không xác định.

- `absolute`
  - : Phần tử được xóa khỏi luồng tài liệu bình thường và không có không gian nào được tạo cho phần tử trong bố cục trang. Phần tử được định vị tương đối so với tổ tiên được định vị gần nhất (nếu có) hoặc so với [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block) ban đầu. Vị trí cuối cùng của nó được xác định bởi các giá trị của `top`, `right`, `bottom`, và `left`.

    Giá trị này tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới khi giá trị của `z-index` không phải là `auto`. Các margin của các hộp được định vị tuyệt đối không [thu gọn](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing) với các margin khác.

- `fixed`
  - : Phần tử được xóa khỏi luồng tài liệu bình thường và không có không gian nào được tạo cho phần tử trong bố cục trang. Phần tử được định vị tương đối so với [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block) ban đầu, là viewport trong trường hợp phương tiện trực quan. Vị trí cuối cùng của nó được xác định bởi các giá trị của `top`, `right`, `bottom`, và `left`.

    Giá trị này luôn tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới. Trong các tài liệu in, phần tử được đặt ở cùng một vị trí trên _mỗi trang_.

- `sticky`
  - : Phần tử được định vị theo luồng bình thường của tài liệu, sau đó bị dịch chuyển so với _tổ tiên cuộn gần nhất_ và [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) (tổ tiên cấp khối gần nhất), bao gồm cả các phần tử liên quan đến bảng, dựa trên các giá trị của `top`, `right`, `bottom`, và `left`. Phần dịch chuyển không ảnh hưởng đến vị trí của bất kỳ phần tử nào khác.

    Giá trị này luôn tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới. Lưu ý rằng một phần tử sticky "dính" vào tổ tiên gần nhất có "cơ chế cuộn" (được tạo khi `overflow` là `hidden`, `scroll`, `auto`, hoặc `overlay`), ngay cả khi tổ tiên đó không phải là tổ tiên thực sự đang cuộn gần nhất.

    > [!NOTE]
    > Ít nhất một thuộc tính [inset](/en-US/docs/Web/CSS/Reference/Properties/inset) ({{cssxref("top")}}, {{cssxref("inset-block-start")}}, {{cssxref("right")}}, {{cssxref("inset-inline-end")}}, v.v.) cần được đặt thành giá trị khác `auto` cho trục mà phần tử cần được làm sticky. Nếu cả hai thuộc tính `inset` của một trục đều được đặt thành `auto`, trên trục đó giá trị `sticky` sẽ hoạt động như `relative`.

## Mô tả

### Các loại định vị

- **Phần tử được định vị** là phần tử có giá trị `position` [đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) là `relative`, `absolute`, `fixed`, hoặc `sticky`. (Nói cách khác, là bất kỳ giá trị nào ngoài `static`.)
- **Phần tử được định vị tương đối** là phần tử có giá trị `position` [đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) là `relative`. Các thuộc tính {{Cssxref("top")}} và {{Cssxref("bottom")}} xác định độ dịch chuyển theo chiều dọc so với vị trí bình thường của nó; các thuộc tính {{Cssxref("left")}} và {{Cssxref("right")}} xác định độ dịch chuyển theo chiều ngang.
- **Phần tử được định vị tuyệt đối** là phần tử có giá trị `position` [đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) là `absolute` hoặc `fixed`. Các thuộc tính {{Cssxref("top")}}, {{Cssxref("right")}}, {{Cssxref("bottom")}}, và {{Cssxref("left")}} xác định các độ dịch chuyển từ các cạnh của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của phần tử. (Khối chứa là tổ tiên mà phần tử được định vị tương đối.) Nếu phần tử có margin, chúng được thêm vào độ dịch chuyển. Phần tử thiết lập một [ngữ cảnh định dạng khối](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) (BFC) mới cho nội dung của nó.
- **Phần tử được định vị sticky** là phần tử có giá trị `position` [đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) là `sticky`. Nó được xử lý như được định vị tương đối cho đến khi [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của nó vượt qua một ngưỡng nhất định (chẳng hạn như đặt {{Cssxref("top")}} thành giá trị khác auto) trong gốc luồng của nó (hoặc container mà nó cuộn bên trong), lúc đó nó được xử lý như "đã dính" cho đến khi chạm đến cạnh đối diện của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).

Trong hầu hết các trường hợp, các phần tử được định vị tuyệt đối có {{Cssxref("height")}} và {{Cssxref("width")}} được đặt thành `auto` sẽ được điều chỉnh kích thước để vừa với nội dung của chúng. Tuy nhiên, các phần tử được định vị tuyệt đối không phải là [replaced](/en-US/docs/Glossary/Replaced_elements) có thể được làm cho lấp đầy không gian dọc có sẵn bằng cách chỉ định cả {{Cssxref("top")}} và {{Cssxref("bottom")}} và để {{Cssxref("height")}} không được chỉ định (tức là `auto`). Tương tự, chúng có thể được làm cho lấp đầy không gian ngang có sẵn bằng cách chỉ định cả {{Cssxref("left")}} và {{Cssxref("right")}} và để {{Cssxref("width")}} là `auto`.

Ngoại trừ trường hợp vừa mô tả (các phần tử được định vị tuyệt đối lấp đầy không gian có sẵn):

- Nếu cả `top` và `bottom` đều được chỉ định (về mặt kỹ thuật, không phải `auto`), `top` sẽ được ưu tiên.
- Nếu cả `left` và `right` đều được chỉ định, `left` sẽ được ưu tiên khi {{Cssxref("direction")}} là `ltr` (tiếng Anh, tiếng Nhật ngang, v.v.) và `right` sẽ được ưu tiên khi {{Cssxref("direction")}} là `rtl` (tiếng Ba Tư, tiếng Ả Rập, tiếng Do Thái, v.v.).

## Khả năng tiếp cận

Đảm bảo rằng các phần tử được định vị với giá trị `absolute` hoặc `fixed` không che khuất nội dung khác khi trang được phóng to để tăng kích thước văn bản.

- [Hướng dẫn MDN Understanding WCAG, Guideline 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Visual Presentation: Understanding SC 1.4.8 | Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

### Hiệu suất & Khả năng tiếp cận

Việc cuộn các phần tử chứa nội dung `fixed` hoặc `sticky` có thể gây ra các vấn đề về hiệu suất và khả năng tiếp cận. Khi người dùng cuộn, trình duyệt phải vẽ lại nội dung sticky hoặc fixed ở vị trí mới. Tùy thuộc vào nội dung cần vẽ lại, hiệu suất của trình duyệt, và tốc độ xử lý của thiết bị, trình duyệt có thể không thể quản lý việc vẽ lại ở 60 fps. Tình huống như vậy có thể dẫn đến [jank](/en-US/docs/Glossary/Jank) và quan trọng hơn, là các mối lo ngại về khả năng tiếp cận đối với những người nhạy cảm. Một giải pháp là thêm {{cssxref("will-change", "will-change: transform")}} vào các phần tử được định vị để render phần tử trong lớp riêng của nó, cải thiện tốc độ vẽ lại và do đó cải thiện hiệu suất và khả năng tiếp cận.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định vị tương đối

Các phần tử được định vị tương đối bị dịch chuyển một lượng nhất định so với vị trí bình thường của chúng trong tài liệu, nhưng phần dịch chuyển không ảnh hưởng đến các phần tử khác. Trong ví dụ bên dưới, hãy chú ý cách các phần tử khác được đặt như thể "Two" đang chiếm không gian của vị trí bình thường của nó.

#### HTML

```html
<div class="box" id="one">One</div>
<div class="box" id="two">Two</div>
<div class="box" id="three">Three</div>
<div class="box" id="four">Four</div>
```

#### CSS

```css
* {
  box-sizing: border-box;
}

.box {
  display: inline-block;
  width: 100px;
  height: 100px;
  background: red;
  color: white;
}

#two {
  position: relative;
  top: 20px;
  left: 20px;
  background: blue;
}
```

{{EmbedLiveSample('Relative_positioning', '', '200px')}}

### Định vị tuyệt đối

Các phần tử được định vị tương đối vẫn nằm trong luồng bình thường của tài liệu. Ngược lại, một phần tử được định vị tuyệt đối bị lấy ra khỏi luồng; do đó, các phần tử khác được định vị như thể nó không tồn tại. Phần tử được định vị tuyệt đối được định vị tương đối so với _tổ tiên được định vị gần nhất_ (tức là tổ tiên gần nhất không phải là `static`). Nếu không có tổ tiên được định vị, nó được định vị tương đối so với ICB ([khối chứa ban đầu](https://drafts.csswg.org/css-display/#initial-containing-block)), là khối chứa của phần tử gốc của tài liệu.

#### HTML

```html
<h1>Absolute positioning</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p class="positioned">
  By default we span 100% of the width of our parent element, and we are as tall
  as our child content. Our total width and height is our content + padding +
  border width/height.
</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the width of one of our margins, not both.
</p>

<p>
  inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line as one another, and adjacent text nodes, if there is space on
  the same line. Overflowing inline elements
  <span>wrap onto a new line if possible — like this one containing text</span>,
  or just go on to a new line if not, much like this image will do:
  <img src="https://mdn.github.io/shared-assets/images/examples/long.jpg" />
</p>
```

#### CSS

```css
* {
  box-sizing: border-box;
}

body {
  width: 500px;
  margin: 0 auto;
}

p {
  background: aqua;
  border: 3px solid blue;
  padding: 10px;
  margin: 10px;
}

span {
  background: red;
  border: 1px solid black;
}

.positioned {
  position: absolute;
  background: yellow;
  inset-block-start: 30px;
  inset-inline-start: 30px;
}
```

#### Kết quả

{{EmbedLiveSample('Absolute_positioning', '', '420px')}}

### Định vị cố định

Định vị cố định tương tự như định vị tuyệt đối, ngoại trừ [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của phần tử là khối chứa ban đầu được thiết lập bởi _viewport_, trừ khi bất kỳ tổ tiên nào có thuộc tính `transform`, `perspective`, hoặc `filter` được đặt thành giá trị khác `none` (xem [fixed positioning containing block](https://drafts.csswg.org/css-position/#fixed-positioning-containing-block)), lúc đó tổ tiên đó sẽ thay thế vị trí của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của phần tử. Điều này có thể được sử dụng để tạo một phần tử "nổi" luôn ở cùng một vị trí bất kể việc cuộn. Trong ví dụ bên dưới, hộp "One" được cố định ở 80 pixel từ đầu trang và 10 pixel từ bên trái. Ngay cả sau khi cuộn, nó vẫn ở cùng một vị trí so với viewport. Ngoài ra, khi thuộc tính {{cssxref("will-change")}} được đặt thành `transform`, một khối chứa mới sẽ được thiết lập.

#### HTML

```html
<div class="outer">
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam congue tortor
    eget pulvinar lobortis. Vestibulum ante ipsum primis in faucibus orci luctus
    et ultrices posuere cubilia Curae; Nam ac dolor augue. Pellentesque mi mi,
    laoreet et dolor sit amet, ultrices varius risus. Nam vitae iaculis elit.
    Aliquam mollis interdum libero. Sed sodales placerat egestas. Vestibulum ut
    arcu aliquam purus viverra dictum vel sit amet mi. Duis nisl mauris, aliquam
    sit amet luctus eget, dapibus in enim. Sed velit augue, pretium a sem
    aliquam, congue porttitor tortor. Sed tempor nisl a lorem consequat, id
    maximus erat aliquet. Sed sagittis porta libero sed condimentum. Aliquam
    finibus lectus nec ante congue rutrum. Curabitur quam quam, accumsan id
    ultrices ultrices, tempor et tellus.
  </p>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam congue tortor
    eget pulvinar lobortis. Vestibulum ante ipsum primis in faucibus orci luctus
    et ultrices posuere cubilia Curae; Nam ac dolor augue. Pellentesque mi mi,
    laoreet et dolor sit amet, ultrices varius risus. Nam vitae iaculis elit.
    Aliquam mollis interdum libero. Sed sodales placerat egestas. Vestibulum ut
    arcu aliquam purus viverra dictum vel sit amet mi. Duis nisl mauris, aliquam
    sit amet luctus eget, dapibus in enim. Sed velit augue, pretium a sem
    aliquam, congue porttitor tortor. Sed tempor nisl a lorem consequat, id
    maximus erat aliquet. Sed sagittis porta libero sed condimentum. Aliquam
    finibus lectus nec ante congue rutrum. Curabitur quam quam, accumsan id
    ultrices ultrices, tempor et tellus.
  </p>
  <div class="box" id="one">One</div>
</div>
```

#### CSS

```css
* {
  box-sizing: border-box;
}

.box {
  width: 100px;
  height: 100px;
  background: red;
  color: white;
}

#one {
  position: fixed;
  top: 80px;
  left: 10px;
  background: blue;
}

.outer {
  width: 500px;
  height: 300px;
  overflow: scroll;
  padding-left: 150px;
}
```

#### Kết quả

{{EmbedLiveSample('Fixed_positioning', '', '300px')}}

### Định vị sticky

Quy tắc CSS sau định vị phần tử có id `one` một cách tương đối cho đến khi viewport được cuộn sao cho phần tử cách đầu 10 pixel. Vượt qua ngưỡng đó, phần tử được cố định ở 10 pixel từ đầu.

```css
#one {
  position: sticky;
  top: 10px;
}
```

#### Danh sách với tiêu đề sticky

Một cách sử dụng phổ biến của định vị sticky là cho các tiêu đề trong danh sách theo bảng chữ cái. Tiêu đề "B" sẽ xuất hiện ngay bên dưới các mục bắt đầu bằng "A" cho đến khi chúng bị cuộn ra ngoài màn hình. Thay vì trượt ra ngoài màn hình cùng với phần còn lại của nội dung, tiêu đề "B" sau đó sẽ được cố định ở đầu viewport cho đến khi tất cả các mục "B" đã bị cuộn ra ngoài màn hình, lúc đó nó sẽ bị che bởi tiêu đề "C", và cứ tiếp tục như vậy.

Bạn phải chỉ định một ngưỡng với ít nhất một trong `top`, `right`, `bottom`, hoặc `left` để định vị sticky hoạt động như mong đợi. Nếu không, nó sẽ không thể phân biệt được với định vị tương đối.

##### HTML

```html
<dl>
  <div>
    <dt>A</dt>
    <dd>Andrew W.K.</dd>
    <dd>Apparat</dd>
    <dd>Arcade Fire</dd>
    <dd>At The Drive-In</dd>
    <dd>Aziz Ansari</dd>
  </div>
  <div>
    <dt>C</dt>
    <dd>Chromeo</dd>
    <dd>Common</dd>
    <dd>Converge</dd>
    <dd>Crystal Castles</dd>
    <dd>Cursive</dd>
  </div>
  <div>
    <dt>E</dt>
    <dd>Explosions In The Sky</dd>
  </div>
  <div>
    <dt>T</dt>
    <dd>Ted Leo &amp; The Pharmacists</dd>
    <dd>T-Pain</dd>
    <dd>Thrice</dd>
    <dd>TV On The Radio</dd>
    <dd>Two Gallants</dd>
  </div>
</dl>
```

##### CSS

```css
* {
  box-sizing: border-box;
}

dl > div {
  background: white;
  padding-top: 24px;
}

dt {
  background: #b8c1c8;
  border-bottom: 1px solid #989ea4;
  border-top: 1px solid #717d85;
  color: white;
  font:
    bold 18px/21px "Helvetica",
    "Arial",
    sans-serif;
  margin: 0;
  padding: 2px 0 0 12px;
  position: -webkit-sticky;
  position: sticky;
  top: -1px;
}

dd {
  font:
    bold 20px/45px "Helvetica",
    "Arial",
    sans-serif;
  margin: 0;
  padding-left: 12px;
  white-space: nowrap;
}

dd + dd {
  border-top: 1px solid #cccccc;
}
```

##### Kết quả

{{EmbedLiveSample('List with sticky headings', '', '300px')}}

#### Định vị sticky với tất cả các ranh giới inset được đặt

Ví dụ sau minh họa hành vi của một phần tử khi tất cả các ranh giới inset được đặt. Ở đây, chúng ta có hai emoji bóng đèn trong một đoạn văn. Các bóng đèn sử dụng định vị sticky, và các ranh giới inset được chỉ định là 50px từ đầu, 100px từ phải, 50px từ dưới, và 50px từ trái. Nền màu xám trên phần tử div cha đánh dấu vùng inset.

##### HTML

```html
Use scrollbars to put the light bulbs(💡) in the right place in the following
text:
<div>
  <p>
    The representation of an idea by a light bulb(<span class="bulb">💡</span>)
    is a commonly used metaphor that symbolizes the moment of inspiration or the
    birth of a new idea. The association between a light bulb and an idea can be
    traced back to the invention of the incandescent light bulb(<span
      class="bulb"
      >💡</span
    >) by Thomas Edison in the late 19th century. The light bulb is a powerful
    symbol because it represents illumination, clarity, and the sudden
    brightening of one's thoughts or understanding. When someone has an idea, it
    is often described as a light bulb turning on in their mind, signifying a
    moment of insight or creativity. The image of a light bulb also suggests the
    idea of energy, power, and the potential for growth and development.
  </p>
</div>
```

##### CSS

```css hidden
div {
  width: 400px;
  height: 200px;
  overflow: scroll;
  scrollbar-width: thin;
  font-size: 16px;
  font-family: "Verdana";
  border: 1px solid;
}

p {
  width: 600px;
  user-select: none;
  margin: 0;
  border: 110px solid transparent;
}
```

```css
.bulb {
  position: sticky;
  inset: 50px 100px;
}

div {
  /* mark area defined by the inset boundaries using gray color */
  background: linear-gradient(#99999999, #99999999) 100px 50px / 192px 100px
    no-repeat;
}
```

##### Kết quả

{{EmbedLiveSample('Sticky position with all the inset boundaries set', '', '300px')}}

Khi bạn đặt cả hai bóng đèn vào đúng vị trí, bạn sẽ nhận thấy rằng chúng được định vị tương đối bên trong vùng inset. Khi bạn di chuyển chúng ra ngoài vùng inset, chúng được cố định (sticky) vào ranh giới inset theo hướng đó.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{glossary("Inset properties")}}
- [Học CSS: Định vị](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
- [Thuộc tính Inset cho bố cục được định vị](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Floating_and_positioning#example_inset_properties_for_positioned_layout)
- Mô-đun [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
