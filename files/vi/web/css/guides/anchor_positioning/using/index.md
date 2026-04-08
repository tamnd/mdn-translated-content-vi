---
title: Using CSS anchor positioning
short-title: Using anchor positioning
slug: Web/CSS/Guides/Anchor_positioning/Using
page-type: guide
sidebar: cssref
---

Module **CSS anchor positioning** định nghĩa các tính năng cho phép bạn liên kết các phần tử với nhau. Các phần tử có thể được định nghĩa là **anchor element** và **anchor-positioned element**. Các anchor-positioned element có thể được gắn vào các anchor element. Sau đó, các anchor-positioned element có thể có kích thước và vị trí được thiết lập tương đối với kích thước và vị trí của các anchor element mà chúng được gắn vào.

CSS anchor positioning cũng cung cấp các cơ chế chỉ dùng CSS để chỉ định nhiều vị trí thay thế cho một anchor-positioned element. Ví dụ: nếu một tooltip được neo vào một trường biểu mẫu nhưng tooltip đó sẽ hiển thị ngoài màn hình ở cài đặt vị trí mặc định, trình duyệt có thể thử hiển thị nó ở một vị trí được đề xuất khác sao cho nó nằm trong màn hình, hoặc có thể ẩn nó đi hoàn toàn nếu muốn.

Bài viết này giải thích các khái niệm cơ bản về anchor positioning và cách sử dụng các tính năng liên kết, định vị và định kích thước của module ở mức cơ bản. Chúng tôi đã bao gồm các liên kết đến các trang tham chiếu với các ví dụ bổ sung và chi tiết cú pháp cho mỗi khái niệm được thảo luận bên dưới. Để biết thông tin về việc chỉ định các vị trí thay thế và ẩn các anchor-positioned element, hãy xem hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding).

## Khái niệm cơ bản

Việc muốn gắn kết hoặc liên kết một phần tử với phần tử khác là rất phổ biến. Ví dụ:

- Thông báo lỗi xuất hiện bên cạnh các điều khiển biểu mẫu.
- Tooltip hoặc infobox bật lên bên cạnh một phần tử UI để cung cấp thêm thông tin về nó.
- Hộp thoại cài đặt hoặc tùy chọn có thể được truy cập để nhanh chóng cấu hình các phần tử UI.
- Menu dropdown hoặc popover xuất hiện bên cạnh thanh điều hướng hoặc nút liên kết.

Giao diện hiện đại thường yêu cầu một số nội dung — thường có thể tái sử dụng và được tạo động — phải được đặt tương đối so với một anchor element. Việc tạo ra các trường hợp sử dụng như vậy sẽ khá đơn giản nếu phần tử cần gắn vào (hay còn gọi là **anchor element**) luôn ở cùng một vị trí trong UI và phần tử được gắn vào (hay còn gọi là **anchor-positioned element**, hoặc chỉ là **positioned element**) luôn có thể được đặt ngay trước hoặc sau nó trong thứ tự nguồn. Tuy nhiên, mọi thứ hiếm khi đơn giản như vậy.

Vị trí của các positioned element so với anchor element của chúng cần được duy trì và điều chỉnh khi anchor element di chuyển hoặc thay đổi cấu hình (ví dụ: bằng cách cuộn, thay đổi kích thước viewport, kéo và thả, v.v.). Ví dụ: nếu một phần tử như trường biểu mẫu tiến gần đến cạnh của viewport, tooltip của nó có thể hiển thị ra ngoài màn hình. Nói chung, bạn muốn gắn tooltip vào điều khiển biểu mẫu của nó và đảm bảo tooltip luôn hiển thị đầy đủ trên màn hình miễn là trường biểu mẫu còn hiển thị, tự động di chuyển tooltip nếu cần. Bạn có thể đã nhận thấy điều này là hành vi mặc định trong hệ điều hành của mình khi bạn nhấp chuột phải (<kbd>Ctrl</kbd> + nhấp) vào menu ngữ cảnh trên máy tính để bàn hoặc laptop.

Trước đây, việc liên kết một phần tử với một phần tử khác và tự động thay đổi vị trí và kích thước của positioned element dựa trên vị trí của anchor đều cần JavaScript, điều này tạo thêm sự phức tạp và các vấn đề về hiệu suất. Nó cũng không được đảm bảo hoạt động trong mọi tình huống. Các tính năng được định nghĩa trong module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) cho phép triển khai các trường hợp sử dụng như vậy một cách hiệu quả và khai báo bằng CSS (và HTML) thay vì JavaScript.

## Liên kết anchor và positioned element

Để liên kết một phần tử với một anchor, trước tiên bạn cần khai báo phần tử nào là anchor, sau đó chỉ định (các) positioned element nào cần liên kết với anchor đó. Điều này tạo ra một tham chiếu anchor giữa hai phần tử. Sự liên kết này có thể được tạo ra một cách tường minh thông qua CSS hoặc ngầm định.

### Liên kết anchor tường minh bằng CSS

Để khai báo một phần tử là anchor bằng CSS, bạn cần đặt tên anchor cho nó thông qua thuộc tính {{cssxref("anchor-name")}}. Tên anchor cần là một {{cssxref("dashed-ident")}}. Trong ví dụ này, chúng tôi cũng đặt {{cssxref("width")}} của anchor thành `fit-content` để có một anchor vuông nhỏ, giúp minh họa hiệu ứng neo tốt hơn.

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
  width: fit-content;
}
```

Để chuyển đổi một phần tử thành anchor-positioned element cần hai bước: Nó cần được [định vị](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning) tuyệt đối hoặc cố định bằng thuộc tính {{cssxref("position")}}. Sau đó, positioned element có thuộc tính {{cssxref("position-anchor")}} được đặt thành giá trị của thuộc tính `anchor-name` của anchor element để liên kết hai phần tử với nhau:

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
}
```

Chúng tôi sẽ áp dụng CSS trên cho HTML sau:

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

Kết quả sẽ hiển thị như sau:

{{ EmbedLiveSample("CSS-only method", "100%", "120") }}

Anchor và infobox hiện đã được liên kết, nhưng hiện tại bạn sẽ phải tin vào điều đó. Chúng chưa được gắn kết với nhau — nếu bạn định vị anchor và di chuyển nó sang nơi khác trên trang, nó sẽ di chuyển một mình, để lại infobox ở cùng một vị trí. Bạn sẽ thấy sự gắn kết thực sự khi chúng tôi xem xét việc [định vị các phần tử dựa trên vị trí anchor](#positioning_elements_relative_to_their_anchor).

### Liên kết anchor ngầm định

Trong một số trường hợp, một tham chiếu anchor ngầm định sẽ được tạo ra giữa hai phần tử, do tính chất ngữ nghĩa trong mối quan hệ của chúng:

- Khi sử dụng [Popover API](/en-US/docs/Web/API/Popover_API) để liên kết một popover với một điều khiển, một tham chiếu anchor ngầm định được tạo ra giữa hai phần tử. Điều này có thể xảy ra khi:
  - Khai báo liên kết một popover với một điều khiển bằng các thuộc tính [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget) và [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) hoặc các thuộc tính [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor) và `id`.
  - Liên kết theo chương trình một hành động popover như {{domxref("HTMLElement.showPopover", "showPopover()")}} với một điều khiển bằng tùy chọn `source`.
- Một phần tử {{htmlelement("select")}} và dropdown picker của nó được chọn vào tính năng [customizable select element](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) thông qua giá trị `base-select` của thuộc tính {{cssxref("appearance")}}. Trong trường hợp này, một mối quan hệ popover-invoker ngầm định được tạo ra giữa hai phần tử, điều này cũng có nghĩa là chúng sẽ có một tham chiếu anchor ngầm định.

> [!NOTE]
> Các phương thức trên liên kết một anchor với một phần tử, nhưng chúng chưa được gắn kết. Để gắn kết chúng với nhau, positioned element cần được định vị tương đối với anchor của nó, điều này được thực hiện bằng CSS.

### Xóa liên kết anchor

Nếu bạn muốn xóa một liên kết anchor tường minh đã được tạo ra trước đó giữa một anchor element và một positioned element, bạn có thể thực hiện một trong những điều sau:

1. Đặt giá trị thuộc tính `anchor-name` của anchor thành `none`, hoặc thành một `<dashed-ident>` khác, nếu bạn muốn một phần tử khác được neo vào nó.
2. Đặt thuộc tính `position-anchor` của positioned element thành `none`, hoặc thành một tên anchor không tồn tại trong tài liệu hiện tại, chẳng hạn như `--not-an-anchor-name`.

Trong trường hợp liên kết anchor ngầm định, bạn cần sử dụng phương thức thứ hai — phương thức đầu tiên không hoạt động. Điều này là do sự liên kết được kiểm soát nội bộ và bạn không thể xóa `anchor-name` thông qua CSS.

Ví dụ: để ngừng gắn kết picker của phần tử `<select>` có thể tùy chỉnh vào chính phần tử `<select>`, bạn có thể sử dụng rule sau:

```css
::picker(select) {
  position-anchor: none;
}
```

## Anchor scoping

Khi nhiều anchor element được đặt cùng một giá trị {{cssxref("anchor-name")}} và một positioned element có tên đó làm giá trị thuộc tính {{cssxref("position-anchor")}} của nó, positioned element sẽ được liên kết với anchor element _cuối cùng_ trong thứ tự nguồn có giá trị `anchor-name` đó.

Ví dụ: nếu một tài liệu chứa nhiều component lặp lại, mỗi component có một positioned element được gắn vào một anchor, tất cả các positioned element sẽ được neo vào anchor cuối cùng trên trang trừ khi mỗi component sử dụng một tên anchor khác nhau. Đây có lẽ không phải là hành vi mong muốn.

Thuộc tính {{cssxref("anchor-scope")}} có thể khắc phục vấn đề này bằng cách giới hạn khả năng hiển thị, hay "scope", của một giá trị `anchor-name` đến một subtree cụ thể. Kết quả là mỗi positioned element chỉ có thể được neo vào một phần tử trong cùng subtree của phần tử có scope được đặt trên nó.

- `anchor-scope: all` đặt scope sao cho _bất kỳ_ giá trị `anchor-name` nào được đặt trong subtree chỉ có thể được gắn kết bởi các positioned element trong cùng subtree đó.
- `anchor-scope: --my-anchor, --my-anchor2` đặt scope sao cho các giá trị `anchor-name` được chỉ định, khi được đặt trong subtree, chỉ có thể được gắn kết bởi các positioned element trong cùng subtree đó.
- `anchor-scope: none` là giá trị mặc định; nó chỉ định rằng không có anchor scoping nào được đặt.

Ví dụ: giả sử bạn có nhiều anchor và các phần tử {{htmlelement("div")}} được định vị theo anchor bên trong các container {{htmlelement("section")}}:

```html live-sample___anchor-scope
<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 1</div>
</section>

<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 2</div>
</section>

<section class="scoped">
  <div class="anchor">⚓︎</div>
  <div class="positioned">Positioned 3</div>
</section>
```

Chúng tôi biến mỗi `<div>` có class `anchor` thành một anchor element bằng cách đặt cho chúng `anchor-name` là `--my-anchor`. Sau đó chúng tôi định vị mỗi `<div>` có class `positioned` tương đối với một phần tử có tên anchor `--my-anchor` bằng cách đặt cho chúng absolute positioning, giá trị `position-anchor` là `--my-anchor`, và giá trị {{cssxref("position-area")}} là `right`. Cuối cùng, chúng tôi đặt anchor scope của mỗi container `<section>` bằng `anchor-scope: --my-anchor`:

```css hidden live-sample___anchor-scope
html {
  height: 100%;
}

body {
  height: inherit;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
}

.scoped {
  padding: 20px;
  background: #eeeeee;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: blue;
  width: fit-content;
  padding: 3px;
}

.positioned {
  background: orange;
  width: fit-content;
  padding: 3px;
}
```

```css live-sample___anchor-scope
.anchor {
  anchor-name: --my-anchor;
}

.positioned {
  position: absolute;
  position-anchor: --my-anchor;
  position-area: right;
}

.scoped {
  anchor-scope: --my-anchor;
}
```

Điều này dẫn đến hành vi định vị sau:

{{ EmbedLiveSample("anchor-scope", "100%", "150") }}

Mỗi positioned element được định vị tương đối với anchor bên trong cùng một phần tử `<section>`. Điều này là vì mỗi phần tử `<section>` có `anchor-scope` là `--my-anchor` được đặt trên nó; các positioned element bên trong mỗi scoped container do đó chỉ có thể được định vị tương đối với anchor `my-anchor` bên trong cùng container đó.

Nếu chúng tôi không đặt `anchor-scope: --my-anchor` trên các container, tất cả các positioned element sẽ được định vị tương đối với anchor cuối cùng trên trang.

## Định vị các phần tử tương đối với anchor của chúng

Như chúng tôi đã thấy trước đó, việc liên kết một positioned element với một anchor thực sự không có nhiều tác dụng khi đứng một mình. Mục tiêu của chúng tôi là đặt positioned element tương đối với anchor element liên kết của nó. Điều này được thực hiện bằng cách đặt giá trị [hàm `anchor()` của CSS](#using_inset_properties_with_anchor_function_values) trên một [inset property](/en-US/docs/Glossary/Inset_properties), [chỉ định `position-area`](#setting_a_position-area), hoặc căn giữa positioned element bằng [giá trị placement `anchor-center`](#centering_on_the_anchor_using_anchor-center).

> [!NOTE]
> CSS anchor positioning cũng cung cấp các cơ chế để chỉ định các vị trí dự phòng nếu vị trí mặc định của positioned element gây ra tràn viewport. Xem hướng dẫn [Fallback options and conditional hiding](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding) để biết thêm chi tiết.

> [!NOTE]
> Anchor element phải là một DOM node hiển thị để liên kết và định vị hoạt động. Nếu nó bị ẩn (ví dụ: thông qua [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display#none)), positioned element sẽ được định vị tương đối với ancestor được định vị gần nhất của nó. Chúng tôi thảo luận về cách ẩn một anchor-positioned element khi anchor của nó biến mất trong [Conditional hiding using `position-visibility`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding#conditionally_hiding_anchor-positioned_elements).

### Sử dụng inset property với giá trị hàm `anchor()`

Các phần tử được định vị tuyệt đối và cố định thông thường được định vị tường minh bằng cách đặt các giá trị {{cssxref("length")}} hoặc {{cssxref("percentage")}} trên {{glossary("inset properties")}}. Với `position: absolute`, giá trị inset position này là khoảng cách tuyệt đối tương đối với các cạnh của ancestor được định vị gần nhất. Với `position: fixed`, giá trị inset position là khoảng cách tuyệt đối tương đối với viewport.

CSS anchor positioning thay đổi mô hình này, cho phép các anchor-positioned element được đặt tương đối với các cạnh của (các) anchor liên kết của chúng. Module định nghĩa hàm [`anchor()`](/en-US/docs/Web/CSS/Reference/Values/anchor), là giá trị hợp lệ cho mỗi inset property. Khi được sử dụng, hàm đặt giá trị inset position là khoảng cách tuyệt đối tương đối với anchor element bằng cách định nghĩa anchor element, cạnh của anchor element mà positioned element đang được định vị tương đối với, và khoảng cách từ cạnh đó.

Các thành phần của hàm trông như sau:

```plain
anchor(<anchor-name> <anchor-side>, <fallback>)
```

- `<anchor-name>`
  - : Giá trị thuộc tính {{cssxref("anchor-name")}} của anchor element mà bạn muốn định vị cạnh của phần tử tương đối với. Đây là giá trị `<dashed-ident>`. Nếu bỏ qua, **default anchor** của phần tử sẽ được sử dụng. Đây là anchor được tham chiếu trong thuộc tính {{cssxref("position-anchor")}} của nó, hoặc liên kết với phần tử thông qua thuộc tính HTML [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor) không chuẩn.
    > [!NOTE]
    > Chỉ định `<anchor-name>` sẽ định vị phần tử tương đối với anchor đó, nhưng không cung cấp liên kết phần tử. Trong khi bạn có thể định vị các cạnh của một phần tử tương đối với nhiều anchor bằng cách chỉ định [các giá trị `<anchor-name>` khác nhau](/en-US/docs/Web/CSS/Reference/Values/anchor#positioning_an_element_relative_to_multiple_anchors) bên trong các hàm `anchor()` khác nhau trên cùng một phần tử, positioned element chỉ được liên kết với một anchor duy nhất.

- [`<anchor-side>`](/en-US/docs/Web/CSS/Reference/Values/anchor#anchor-side)
  - : Chỉ định vị trí tương đối với một cạnh, hoặc các cạnh, của anchor. Các giá trị hợp lệ bao gồm `center` của anchor, các cạnh vật lý (`top`, `left`, v.v.) hoặc logic (`start`, `self-end`, v.v.) của anchor, hoặc một `<percentage>` giữa start (`0%`) và end (`100%`) của trục của inset property mà `anchor()` được đặt trên. Nếu một giá trị được sử dụng mà không [tương thích](/en-US/docs/Web/CSS/Reference/Values/anchor#compatibility_of_inset_properties_and_anchor-side_values) với inset property mà hàm `anchor()` được đặt trên, giá trị fallback sẽ được sử dụng.

- `<fallback>`
  - : Một {{cssxref("length-percentage")}} định nghĩa khoảng cách sử dụng làm giá trị fallback nếu phần tử không được định vị tuyệt đối hoặc cố định, nếu giá trị `<anchor-side>` được sử dụng không tương thích với inset property mà hàm `anchor()` được đặt trên, hoặc nếu anchor element không tồn tại.

Giá trị trả về của hàm `anchor()` là một giá trị length được tính toán dựa trên vị trí của anchor. Nếu bạn đặt một length hoặc percentage trực tiếp trên inset property của anchor-positioned element, nó sẽ được định vị như thể nó không được gắn với anchor element. Đây là hành vi tương tự được thấy nếu giá trị `<anchor-side>` không tương thích với inset property mà nó được đặt trên và fallback được sử dụng. Hai khai báo này tương đương nhau:

```css example-bad
bottom: anchor(right, 50px);
bottom: 50px;
```

Cả hai đều đặt positioned element `50px` phía trên đáy của ancestor được định vị gần nhất của phần tử (nếu có) hoặc của initial containing block.

Các tham số `anchor()` phổ biến nhất bạn sẽ sử dụng sẽ tham chiếu đến một cạnh của default anchor. Bạn cũng thường thêm {{cssxref("margin")}} để tạo khoảng cách giữa cạnh của anchor và positioned element hoặc sử dụng `anchor()` bên trong hàm `calc()` để thêm khoảng cách đó.

Ví dụ: rule này định vị cạnh trái của positioned element ngay với cạnh phải của anchor element, sau đó thêm `margin-left` để tạo khoảng cách giữa các cạnh:

```css
.positionedElement {
  left: anchor(right);
  margin-left: 10px;
}
```

Giá trị trả về của hàm `anchor()` là một length. Điều này có nghĩa là bạn có thể sử dụng nó bên trong hàm {{cssxref("calc()")}}. Rule này định vị cạnh block end logic của positioned element cách cạnh block start logic của anchor element `10px`, thêm khoảng cách bằng hàm `calc()` để chúng tôi không cần thêm margin:

```css
.positionedElement {
  inset-block-end: calc(anchor(start) + 10px);
}
```

#### Ví dụ về `anchor()`

Hãy xem một ví dụ về `anchor()` trong thực tế. Chúng tôi đã sử dụng HTML tương tự như trong các ví dụ trước, nhưng với một số văn bản điền vào bên dưới và bên trên để làm cho nội dung tràn container và cuộn. Chúng tôi cũng sẽ đặt cho anchor element cùng `anchor-name` như trong các ví dụ trước:

```html hidden
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>
```

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

body {
  width: 50%;
  margin: 0 auto;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
}
```

Infobox được liên kết với anchor thông qua tên anchor và được đặt fixed positioning. Bằng cách bao gồm các thuộc tính {{cssxref("inset-block-start")}} và {{cssxref("inset-inline-start")}} (tương đương với {{cssxref("top")}} và {{cssxref("left")}} trong chế độ viết ngang từ trái sang phải), chúng tôi đã gắn kết nó với anchor. Chúng tôi thêm `margin` vào infobox để tạo khoảng cách giữa positioned element và anchor của nó:

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position-anchor: --my-anchor;
  position: fixed;
  inset-block-start: anchor(end);
  inset-inline-start: anchor(self-end);
  margin: 5px 0 0 5px;
}
```

Hãy xem xét kỹ hơn các khai báo định vị inset property:

- `inset-block-start: anchor(end)`: Đặt cạnh block start của positioned element bằng cạnh block end của anchor, được tính toán bằng hàm `anchor(end)`.
- `inset-inline-start: anchor(self-end)`: Đặt cạnh inline start của positioned element bằng cạnh inline end của anchor, được tính toán bằng hàm `anchor(self-end)`.

Kết quả như sau:

{{ EmbedLiveSample("`anchor()` example", "100%", "250") }}

Positioned element nằm cách anchor element `5px` phía dưới và `5px` sang phải. Nếu bạn cuộn tài liệu lên xuống, positioned element duy trì vị trí của nó tương đối với anchor element — nó được gắn kết với anchor element, không phải với viewport.

### Đặt `position-area`

Thuộc tính {{cssxref("position-area")}} cung cấp một giải pháp thay thế cho hàm `anchor()` để định vị các phần tử tương đối với anchor. Thuộc tính `position-area` hoạt động dựa trên khái niệm một lưới 3x3 ô gạch, với anchor element là ô trung tâm. Thuộc tính `position-area` có thể được sử dụng để định vị anchor positioned element trong bất kỳ ô nào trong chín ô, hoặc để nó trải rộng qua hai hoặc ba ô.

![Lưới position-area, như được mô tả bên dưới](/shared-assets/images/diagrams/css/anchor-positioning/position-area.svg)

Các ô lưới được chia thành các hàng và cột:

- Ba hàng được biểu diễn bằng các giá trị vật lý `top`, `center` và `bottom`. Chúng cũng có các giá trị tương đương logic như `start`, `center` và `end`, và các giá trị tọa độ như `y-start`, `center` và `y-end`.
- Ba cột được biểu diễn bằng các giá trị vật lý `left`, `center` và `right`. Chúng cũng có các giá trị tương đương logic như `start`, `center` và `end`, và các giá trị tọa độ như `x-start`, `center` và `x-end`.

Kích thước của ô trung tâm được xác định bởi [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của anchor element, trong khi khoảng cách giữa ô trung tâm và cạnh ngoài của lưới được xác định bởi containing block của positioned element.

Các giá trị thuộc tính `position-area` được cấu thành từ một hoặc hai giá trị dựa trên các giá trị hàng và cột được mô tả ở trên, với các tùy chọn spanning để định nghĩa vùng của lưới nơi phần tử sẽ được định vị.

Ví dụ:

Bạn có thể chỉ định hai giá trị để đặt positioned element vào một ô cụ thể của lưới. Ví dụ:

- `top left` (giá trị tương đương logic `start start`) sẽ đặt positioned element vào ô phía trên bên trái.
- `bottom center` (giá trị tương đương logic `end center`) sẽ đặt positioned element vào ô trung tâm phía dưới.

Bạn có thể chỉ định một giá trị hàng hoặc cột cộng với giá trị `span-*`. Giá trị đầu tiên chỉ định hàng hoặc cột để đặt positioned element vào, ban đầu đặt nó ở trung tâm, và giá trị kia chỉ định số lượng cột đó để span. Ví dụ:

- `top span-left` khiến positioned element được đặt vào hàng trên cùng, và span qua các ô trung tâm và bên trái của hàng đó.
- `y-end span-x-end` khiến positioned element được đặt ở cuối cột y, và span qua các ô trung tâm và x-end của cột đó.
- `block-end span-all` khiến positioned element được đặt ở hàng block end, và span qua các ô inline-start, center và inline-end của hàng đó.

Nếu bạn chỉ chỉ định một giá trị, hiệu ứng khác nhau tùy thuộc vào giá trị được đặt:

- Giá trị cạnh vật lý (`top`, `bottom`, `left` hoặc `right`) hoặc giá trị tọa độ (`y-start`, `y-end`, `x-start`, `x-end`) hoạt động như thể giá trị kia là `span-all`. Ví dụ: `top` cho hiệu ứng tương tự như `top span-all`.
- Giá trị cạnh logic (`start` hoặc `end`) hoạt động như thể giá trị kia được đặt thành cùng giá trị đó; ví dụ: `start` cho hiệu ứng tương tự như `start start`.
- Giá trị `center` hoạt động như thể cả hai giá trị đều được đặt thành `center` (vậy là `center center`).

> [!NOTE]
> Xem trang tham chiếu giá trị [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value) để biết mô tả chi tiết về tất cả các giá trị có sẵn. Trộn giá trị logic với giá trị vật lý sẽ làm cho khai báo không hợp lệ.

Hãy minh họa một số giá trị này; ví dụ này sử dụng HTML và các style CSS cơ sở giống như ví dụ trước, ngoại trừ việc chúng tôi đã bao gồm một phần tử {{htmlelement("select")}} để có thể thay đổi giá trị `position-area` của positioned element.

```html hidden
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>

<form>
  <label for="position-area-select">Choose a position-area:</label>
  <select id="position-area-select" name="position-area-select">
    <option>top</option>
    <option>bottom</option>
    <option>left</option>
    <option>right</option>
    <option>start</option>
    <option>end</option>
    <option>top left</option>
    <option>top right</option>
    <option>bottom left</option>
    <option>bottom right</option>
    <option>top span-left</option>
    <option>bottom span-right</option>
    <option>start span-start</option>
    <option>end span-end</option>
    <option>center</option>
    <option>center span-all</option>
    <option>bottom center</option>
    <option>end span-all</option>
  </select>
</form>
```

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

.anchor {
  anchor-name: --my-anchor;
}

body {
  width: 50%;
  margin: 0 auto;
}

form {
  background: white;
  border: 1px solid black;
  padding: 5px;
}

select {
  display: block;
  margin-top: 5px;
}

form {
  position: fixed;
  top: 0;
  right: 2px;
}
```

Infobox được đặt fixed positioning và liên kết với anchor bằng CSS. Khi tải, nó được đặt để gắn kết với anchor với `position-area: top;`, khiến nó được định vị ở đầu lưới position-area. Điều này sẽ bị ghi đè khi bạn chọn các giá trị khác từ menu `<select>`.

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top;
}
```

Chúng tôi cũng bao gồm một script ngắn để áp dụng các giá trị `position-area` mới được chọn từ menu `<select>` cho infobox:

```js
const infobox = document.querySelector(".infobox");
const selectElem = document.querySelector("select");

selectElem.addEventListener("change", () => {
  const area = selectElem.value;

  // Set the position-area to the value chosen in the select box
  infobox.style.positionArea = area;
});
```

Hãy thử chọn các giá trị `position-area` mới từ menu `<select>` để xem hiệu ứng chúng có trên vị trí của infobox:

{{ EmbedLiveSample("Setting a `position-area`", "100%", "250") }}

### Chiều rộng của positioned element

Trong ví dụ trên, chúng tôi đã không định kích thước positioned element một cách tường minh theo bất kỳ chiều nào. Chúng tôi cố ý bỏ qua việc định kích thước để cho phép bạn quan sát hành vi mà điều này gây ra.

Khi một positioned element được đặt vào các ô lưới `position-area` mà không có kích thước tường minh, nó căn chỉnh với vùng lưới được chỉ định và hoạt động như thể {{cssxref("width")}} được đặt thành {{cssxref("max-content")}}. Nó được định kích thước theo kích thước [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của nó, đó là chiều rộng của nội dung. Kích thước này được áp đặt bởi `position: fixed`. Các phần tử được định vị tuyệt đối và cố định được tự động định kích thước, kéo dài rộng khi cần để vừa với nội dung văn bản, trong khi bị giới hạn bởi cạnh của viewport. Trong trường hợp này, khi được đặt ở phía bên trái của lưới với bất kỳ giá trị `left` hoặc `inline-start` nào, văn bản sẽ xuống dòng. Nếu kích thước `max-content` của anchored element nhỏ hơn hoặc ngắn hơn anchor của nó, chúng sẽ không phát triển để khớp với kích thước của anchor.

Nếu positioned element được căn giữa theo chiều dọc, chẳng hạn với `position-area: bottom center`, nó sẽ căn chỉnh với ô lưới được chỉ định và chiều rộng sẽ giống với anchor element. Trong trường hợp này, chiều cao tối thiểu của nó là kích thước containing block của anchor element. Nó sẽ không tràn, vì `min-width` là {{cssxref("min-content")}}, nghĩa là nó sẽ ít nhất rộng bằng từ dài nhất của nó.

## Căn giữa trên anchor bằng `anchor-center`

Mặc dù bạn có thể căn giữa anchor-positioned element bằng các giá trị `center` của `position-area`, nhưng các inset property kết hợp với hàm `anchor()` cung cấp nhiều kiểm soát hơn về vị trí chính xác. CSS anchor positioning cung cấp một cách để căn giữa một anchor-positioned element tương đối với anchor của nó khi các inset property, thay vì `position-area`, được sử dụng để gắn kết.

Các thuộc tính {{cssxref("justify-self")}}, {{cssxref("align-self")}}, {{cssxref("justify-items")}} và {{cssxref("align-items")}} (và các shorthand {{cssxref("place-items")}} và {{cssxref("place-self")}} của chúng) tồn tại để cho phép các nhà phát triển dễ dàng căn chỉnh các phần tử theo hướng inline hoặc block bên trong các hệ thống layout khác nhau, ví dụ: dọc theo trục chính hoặc cross axis trong trường hợp các flex children. CSS anchor positioning cung cấp một giá trị bổ sung cho các thuộc tính này, `anchor-center`, căn chỉnh một positioned element với tâm của default anchor của nó.

Ví dụ này sử dụng HTML và CSS cơ sở giống như ví dụ trước. Infobox được đặt fixed positioning và gắn kết với cạnh dưới của anchor. Sau đó `justify-self: anchor-center` được sử dụng để đảm bảo nó được căn giữa theo chiều ngang trên tâm của anchor:

```html hidden
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>
```

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
  anchor-name: --my-anchor;
}

body {
  width: 50%;
  margin: 0 auto;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  top: calc(anchor(bottom) + 5px);
  justify-self: anchor-center;
}
```

Điều này căn giữa anchor-positioned element ở phía dưới anchor của nó:

{{ EmbedLiveSample("Centering on the anchor using `anchor-center`", "100%", "250") }}

## Định kích thước phần tử dựa trên kích thước anchor

Cũng như việc định vị một phần tử tương đối với vị trí anchor của nó, bạn cũng có thể định kích thước một phần tử tương đối với kích thước anchor của nó bằng hàm [`anchor-size()`](/en-US/docs/Web/CSS/Reference/Values/anchor-size) bên trong giá trị thuộc tính sizing.

Các thuộc tính sizing có thể nhận giá trị `anchor-size()` bao gồm:

- {{cssxref("width")}}
- {{cssxref("height")}}
- {{cssxref("min-width")}}
- {{cssxref("min-height")}}
- {{cssxref("max-width")}}
- {{cssxref("max-height")}}
- {{cssxref("block-size")}}
- {{cssxref("inline-size")}}
- {{cssxref("min-block-size")}}
- {{cssxref("min-inline-size")}}
- {{cssxref("max-block-size")}}
- {{cssxref("max-inline-size")}}

Các hàm `anchor-size()` phân giải thành các giá trị {{cssxref("length")}}. Cú pháp của chúng trông như sau:

```plain
anchor-size(<anchor-name> <anchor-size>, <length-percentage>)
```

- `<anchor-name>`
  - : Tên `<dashed-ident>` được đặt làm giá trị của thuộc tính {{cssxref("anchor-name")}} của anchor element mà bạn muốn định kích thước phần tử tương đối với. Nếu bỏ qua, **default anchor** của phần tử sẽ được sử dụng, đó là anchor được tham chiếu trong thuộc tính {{cssxref("position-anchor")}}.
- [`<anchor-size>`](/en-US/docs/Web/CSS/Reference/Values/anchor-size#anchor-size)
  - : Chỉ định kích thước của anchor element mà positioned element sẽ được định kích thước tương đối với. Điều này có thể được biểu đạt bằng các giá trị vật lý (`width` hoặc `height`) hoặc logic (`inline`, `block`, `self-inline` hoặc `self-block`).
- {{cssxref("length-percentage")}}
  - : Chỉ định kích thước sử dụng làm giá trị fallback nếu phần tử không được định vị tuyệt đối hoặc cố định, hoặc anchor element không tồn tại.

Các hàm `anchor-size()` phổ biến nhất bạn sẽ sử dụng sẽ chỉ tham chiếu đến một kích thước của default anchor. Bạn cũng có thể sử dụng chúng bên trong các hàm {{cssxref("calc")}}, để sửa đổi kích thước được áp dụng cho positioned element.

Ví dụ: rule này định kích thước chiều rộng của positioned element bằng chiều rộng của default anchor element:

```css
.elem {
  width: anchor-size(width);
}
```

Rule này định kích thước inline size của positioned element bằng 4 lần inline size của anchor element, với phép nhân được thực hiện bên trong hàm `calc()`:

```css
.elem {
  inline-size: calc(anchor-size(self-inline) * 4);
}
```

Hãy xem một ví dụ. HTML và CSS cơ sở giống như trong các ví dụ trước, ngoại trừ anchor element được đặt thuộc tính [`tabindex="0"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để có thể nhận focus. Infobox được đặt fixed positioning và liên kết với anchor theo cách tương tự như trước. Tuy nhiên, lần này chúng tôi gắn kết nó vào bên phải của anchor bằng `position-area`, và đặt cho nó chiều rộng bằng năm lần chiều rộng của anchor:

```html hidden
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor" tabindex="0">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>
```

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

.anchor {
  anchor-name: --my-anchor;
}

body {
  width: 50%;
  margin: 0 auto;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: right;
  margin-left: 5px;
  width: calc(anchor-size(width) * 5);
}
```

Ngoài ra, chúng tôi tăng {{cssxref("width")}} của anchor element khi {{cssxref(":hover")}} và {{cssxref(":focus")}}, và đặt {{cssxref("transition")}} để nó tạo animation khi trạng thái thay đổi.

```css
.anchor {
  text-align: center;
  width: 30px;
  transition: 1s width;
}

.anchor:hover,
.anchor:focus {
  width: 50px;
}
```

Di chuột qua hoặc tab đến anchor element — positioned element phát triển khi anchor phát triển, chứng minh rằng kích thước của anchor-positioned element tương đối với anchor của nó:

{{ EmbedLiveSample("Sizing elements based on anchor size", "100%", "250") }}

## Các cách sử dụng khác của `anchor-size()`

Bạn cũng có thể sử dụng `anchor-size()` trong các thuộc tính inset và margin vật lý và logic. Các phần bên dưới khám phá các cách sử dụng này chi tiết hơn, trước khi cung cấp một ví dụ sử dụng.

### Đặt vị trí phần tử dựa trên kích thước anchor

Bạn có thể sử dụng hàm [`anchor-size()`](/en-US/docs/Web/CSS/Reference/Values/anchor-size) bên trong giá trị [inset property](/en-US/docs/Glossary/Inset_properties) để định vị các phần tử dựa trên kích thước anchor element của chúng, ví dụ:

```css
left: anchor-size(width);
inset-inline-end: anchor-size(--my-anchor height, 100px);
```

Điều này không định vị một phần tử tương đối với vị trí anchor của nó như hàm [`anchor()`](/en-US/docs/Web/CSS/Reference/Values/anchor) hoặc thuộc tính {{cssxref("position-area")}} làm (xem [Định vị các phần tử tương đối với anchor của chúng](#positioning_elements_relative_to_their_anchor), ở trên); phần tử sẽ không thay đổi vị trí khi anchor thay đổi. Thay vào đó, phần tử sẽ được định vị theo các quy tắc thông thường của định vị [`absolute`](/en-US/docs/Web/CSS/Reference/Properties/position#absolute) hoặc [`fixed`](/en-US/docs/Web/CSS/Reference/Properties/position#fixed).

Điều này có thể hữu ích trong một số tình huống. Ví dụ: nếu anchor element của bạn chỉ có thể di chuyển theo chiều dọc, và luôn nằm bên cạnh cạnh của ancestor được định vị gần nhất theo chiều ngang, bạn có thể sử dụng `left: anchor-size(width)` để khiến anchor-positioned element luôn được định vị bên phải của anchor, ngay cả khi chiều rộng anchor thay đổi.

### Đặt margin phần tử dựa trên kích thước anchor

Bạn có thể sử dụng hàm [`anchor-size()`](/en-US/docs/Web/CSS/Reference/Values/anchor-size) bên trong giá trị thuộc tính `margin-*` để đặt margin phần tử dựa trên kích thước anchor element của chúng, ví dụ:

```css
margin-left: calc(anchor-size(width) / 4);
margin-block-start: anchor-size(--my-anchor self-block, 20px);
```

Điều này có thể hữu ích trong các trường hợp bạn muốn đặt margin của anchor-positioned element luôn bằng cùng một phần trăm của chiều rộng anchor element, ngay cả khi chiều rộng thay đổi.

### Ví dụ về vị trí và margin của `anchor-size()`

Hãy xem một ví dụ trong đó chúng tôi đặt margin và vị trí của anchor-positioned element tương đối với chiều rộng anchor element.

Trong HTML, chúng tôi chỉ định hai phần tử {{htmlelement("div")}}, một phần tử `anchor` và một phần tử `infobox` mà chúng tôi sẽ định vị tương đối với anchor. Chúng tôi đặt thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) cho anchor element để nó có thể được focus thông qua bàn phím. Chúng tôi cũng bao gồm văn bản điền để làm cho {{htmlelement("body")}} đủ cao để cần cuộn, nhưng điều này đã bị ẩn để ngắn gọn.

```html hidden
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar.
</p>
```

```html
<div class="anchor" tabindex="0">⚓︎</div>

<div class="infobox">
  <p>Infobox.</p>
</div>
```

```html hidden
<p>Vulputate ut pharetra sit amet aliquam.</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>
```

Trong CSS, trước tiên chúng tôi khai báo `<div>` `anchor` là anchor element bằng cách đặt cho nó {{cssxref("anchor-name")}}. Positioned element có thuộc tính {{cssxref("position")}} được đặt thành `absolute`, và được liên kết với anchor element thông qua thuộc tính {{cssxref("position-anchor")}}. Chúng tôi cũng đặt các kích thước {{cssxref("height")}} và {{cssxref("width")}} tuyệt đối cho anchor và infobox, và bao gồm {{cssxref("transition")}} cho anchor để các thay đổi chiều rộng được tạo animation mượt mà khi trạng thái thay đổi:

```css hidden
.anchor {
  font-size: 2rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  text-align: center;
  align-content: center;
  outline: 1px solid black;
}

body {
  width: 80%;
  margin: 0 auto;
  position: relative;
}

.infobox {
  align-content: center;
  color: darkblue;
  background-color: azure;
  outline: 1px solid #dddddd;
  font-size: 1rem;
  text-align: center;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
  width: 100px;
  height: 100px;
  transition: 1s all;
}

.infobox {
  position-anchor: --my-anchor;
  position: absolute;
  height: 100px;
  width: 100px;
}
```

Bây giờ đến phần thú vị nhất. Ở đây chúng tôi đặt `width` của anchor thành `300px` khi nó được hover hoặc focused. Sau đó chúng tôi đặt cho infobox:

- Giá trị `top` thành `anchor(top)`. Điều này khiến đỉnh của infobox luôn ở cùng hàng với đỉnh của anchor.
- Giá trị `left` thành `anchor-size(width)`. Điều này khiến cạnh trái của infobox được định vị cách khoảng cách được chỉ định từ cạnh trái của ancestor được định vị gần nhất. Trong trường hợp này, khoảng cách được chỉ định bằng chiều rộng của anchor element và ancestor được định vị gần nhất là phần tử `<body>`, vì vậy infobox xuất hiện bên phải anchor.
- Giá trị `margin-left` thành `calc(anchor-size(width)/4)`. Điều này khiến infobox luôn có left margin ngăn cách nó và anchor, bằng một phần tư chiều rộng của anchor.

```css
.anchor:hover,
.anchor:focus {
  width: 300px;
}

.infobox {
  top: anchor(top);
  left: anchor-size(width);
  margin-left: calc(anchor-size(width) / 4);
}
```

Kết quả hiển thị như sau:

{{EmbedLiveSample("Basic `anchor-size()` usage", "100%", "240")}}

Hãy thử tab đến anchor hoặc di chuột qua nó, và chú ý cách vị trí và left margin của infobox tăng trưởng tỉ lệ với chiều rộng của anchor element.

## Xem thêm

- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
- [Learn: Positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- [Learn: Sizing items in CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing)
