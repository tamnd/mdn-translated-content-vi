---
title: Visual formatting model
slug: Web/CSS/Guides/Display/Visual_formatting_model
page-type: guide
sidebar: cssref
---

Trong CSS, **visual formatting model** mô tả cách user agent lấy cây tài liệu, xử lý và hiển thị nó cho phương tiện trực quan. Điều này bao gồm {{glossary("continuous media")}} chẳng hạn như màn hình máy tính và [paged media](/en-US/docs/Web/CSS/Guides/Paged_media) chẳng hạn như sách hoặc tài liệu in bằng các chức năng in của trình duyệt. Hầu hết thông tin áp dụng cho cả continuous media và paged media.

Trong visual formatting model, mỗi phần tử trong cây tài liệu tạo ra không hoặc nhiều box theo box model. Layout của các box này được điều chỉnh bởi:

- Kích thước và loại box.
- Positioning scheme (normal flow, float, và absolute positioning).
- Mối quan hệ giữa các phần tử trong cây tài liệu.
- Thông tin bên ngoài (ví dụ: kích thước viewport, kích thước intrinsic của hình ảnh, v.v.).

Phần lớn thông tin về visual formatting model được định nghĩa trong CSS2, tuy nhiên, các CSS layout module khác nhau đã mở rộng thông tin này. Khi đọc các đặc tả, bạn thường sẽ tìm thấy các tham chiếu đến model như được định nghĩa trong CSS2, vì vậy hiểu biết về model và các thuật ngữ được sử dụng để mô tả nó trong CSS2 rất có giá trị khi đọc các đặc tả layout khác.

Trong tài liệu này, chúng tôi định nghĩa model và giới thiệu một số thuật ngữ và khái niệm liên quan, liên kết đến các trang cụ thể hơn để biết thêm chi tiết.

## Vai trò của viewport

Trong continuous media, {{glossary("viewport")}} là vùng xem của cửa sổ trình duyệt. User agents có thể thay đổi layout của trang khi kích thước viewport thay đổi — ví dụ, nếu bạn thay đổi kích thước cửa sổ hoặc thay đổi hướng của thiết bị di động.

Nếu viewport nhỏ hơn kích thước của tài liệu thì user agent cần cung cấp cách để cuộn đến các phần của tài liệu không được hiển thị. Chúng ta thường thấy điều này dưới dạng cuộn theo **block dimension** — theo chiều dọc trong ngôn ngữ nằm ngang, từ trên xuống dưới. Tuy nhiên, bạn cũng có thể thiết kế thứ gì đó yêu cầu cuộn theo **inline dimension**.

## Tạo box

**Box generation** là phần của CSS visual formatting model tạo ra các box từ các phần tử của tài liệu. Các box được tạo ra có các loại khác nhau, ảnh hưởng đến visual formatting của chúng. Loại box được tạo ra phụ thuộc vào giá trị của thuộc tính CSS {{cssxref("display")}}.

Ban đầu được định nghĩa trong CSS2, thuộc tính `display` đã được mở rộng trong các module [CSS display](/en-US/docs/Web/CSS/Guides/Display), [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) và [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout). Ngoài ra, một số thuật ngữ xung quanh display đã được cập nhật và làm rõ trong những năm kể từ CSS2.

CSS lấy tài liệu nguồn của bạn và render nó lên một canvas. Để làm điều này, nó tạo ra một cấu trúc trung gian, **cây box**, đại diện cho cấu trúc định dạng của tài liệu được render. Mỗi box trong cây box đại diện cho phần tử tương ứng của nó (hoặc pseudo-element) trong không gian và/hoặc thời gian trên canvas, trong khi mỗi text run trong cây box cũng đại diện cho nội dung của các text node tương ứng của nó.

Sau đó, đối với mỗi phần tử, CSS tạo ra không hoặc nhiều box theo đặc tả bởi giá trị thuộc tính `display` của phần tử đó.

> [!NOTE]
> Các box thường được gọi theo loại display của chúng — ví dụ, một box được tạo bởi phần tử có `display: block` được gọi là "block box" hoặc chỉ là "block". Tuy nhiên lưu ý rằng block boxes, block-level boxes và block containers đều có sự khác biệt tinh tế; xem phần [block boxes](#block_boxes) bên dưới để biết thêm chi tiết.

### Principal box

Khi một phần tử tạo ra một hoặc nhiều box, một trong số đó là **principal box**, chứa các box con của nó và nội dung được tạo ra trong cây box, và cũng là box tham gia vào bất kỳ positioning scheme nào.

Một số phần tử có thể tạo ra các box bổ sung ngoài principal box, ví dụ `display: list-item` tạo ra nhiều hơn một box (ví dụ: một **principal block box** và một **child marker box**). Và một số giá trị (chẳng hạn như `none` hoặc `contents`) khiến phần tử và/hoặc các con của nó không tạo ra bất kỳ box nào cả.

### Anonymous boxes

Một **anonymous box** được tạo ra khi không có phần tử HTML nào để sử dụng cho box. Tình huống này xảy ra khi, ví dụ, bạn khai báo `display: flex` trên phần tử cha, và ngay bên trong đó có một đoạn văn bản không được chứa trong một phần tử khác. Để cố định cây box, một anonymous box được tạo ra xung quanh đoạn văn bản đó. Nó sau đó sẽ hoạt động như một flex item, tuy nhiên, nó không thể được chọn và định kiểu như một box thông thường vì không có phần tử nào để chọn.

```html live-sample___anonymous-flex
<div class="flex">
  I am wrapped in an anonymous box
  <p>I am in the paragraph</p>
  I am wrapped in an anonymous box.
</div>
```

```css live-sample___anonymous-flex
body {
  font: 1.2em sans-serif;
  margin: 20px;
}

.flex {
  display: flex;
}

.flex > * {
  background-color: rebeccapurple;
  color: white;
}
```

{{EmbedLiveSample("anonymous-flex")}}

Điều tương tự xảy ra khi bạn có các text run xen kẽ với các phần tử block. Trong ví dụ tiếp theo tôi có một chuỗi bên trong một `<div>`; ở giữa chuỗi là một phần tử `<p>` chứa một phần của văn bản.

```html live-sample___anonymous-block
<div class="example">
  I am wrapped in an anonymous box
  <p>I am in the paragraph</p>
  I am wrapped in an anonymous box.
</div>
```

```css live-sample___anonymous-block
body {
  font: 1.2em sans-serif;
  margin: 20px;
}

.example > * {
  background-color: rebeccapurple;
  color: white;
}
```

{{EmbedLiveSample("anonymous-block")}}

Chuỗi được chia thành ba box trong cây box. Phần chuỗi trước phần tử đoạn văn được bao bọc trong một anonymous box, sau đó chúng ta có `<p>`, tạo ra một box, và sau đó là một anonymous box khác.

Điều cần lưu ý về các anonymous box này là chúng kế thừa styles từ cha trực tiếp của chúng, nhưng bạn không thể thay đổi cách chúng trông bằng cách chọn anonymous box. Trong ví dụ của tôi, tôi đang sử dụng bộ chọn con trực tiếp để chọn các con của container. Điều này không thay đổi các anonymous box, vì chúng không phải là "phần tử" như vậy.

**Inline anonymous boxes** được tạo ra khi một chuỗi bị chia bởi một inline element, ví dụ, một câu bao gồm một phần được bao bọc với `<em></em>`. Điều này chia câu thành ba inline box — một anonymous inline box trước phần được nhấn mạnh, phần được bao bọc trong phần tử `<em>`, rồi sau đó là một anonymous inline box cuối. Giống như các anonymous block box, các anonymous inline box này không thể được định kiểu độc lập theo cách mà `<em>` có thể; chúng chỉ kế thừa các styles của container.

Các formatting context khác cũng tạo ra anonymous box. [Grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) hoạt động theo cùng cách như ví dụ [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) ở trên, biến các chuỗi văn bản thành một grid item với một anonymous box. [Multiple-column](/en-US/docs/Web/CSS/Guides/Multicol_layout) layout tạo ra các anonymous column box xung quanh các cột; chúng cũng không thể được định kiểu hoặc được chọn theo bất kỳ cách nào khác. [Table layout](/en-US/docs/Web/CSS/Guides/Table) sẽ thêm các anonymous box để tạo ra cấu trúc bảng đúng — ví dụ thêm một anonymous table row — nếu không có box nào với `display: table-row`.

### Line boxes

**Line boxes** là các box bao quanh mỗi dòng văn bản. Bạn có thể thấy sự khác biệt giữa line boxes và containing block của chúng nếu bạn float một mục và sau đó theo sau nó bằng một block có màu nền.

Trong ví dụ sau, các line boxes theo sau `<div>` float bị rút ngắn để bao quanh float. Background của box chạy sau float, vì mục float đã được lấy ra khỏi flow.

```html live-sample___line-boxes
<div class="float"></div>
<p class="following">
  This text is following the float, the line boxes are shortened to make room
  for the float but the box of the element still takes position in normal flow.
</p>
```

```css live-sample___line-boxes
body {
  font: 1.2em sans-serif;
  margin: 20px;
}

.float {
  float: left;
  width: 150px;
  height: 150px;
  background-color: rebeccapurple;
  margin: 20px;
}

.following {
  background-color: #cccccc;
}
```

{{EmbedLiveSample("line-boxes", "", "250px")}}

## Positioning schemes và các phần tử in-flow và out-of-flow

Trong CSS, một box có thể được bố cục theo ba positioning scheme — **normal flow**, **floats**, hoặc **absolute positioning**.

### Normal flow

Trong CSS, normal flow bao gồm block-level formatting của block boxes, inline-level formatting của inline boxes, và cũng bao gồm relative và sticky positioning của block-level và inline-level boxes.

Đọc thêm về [flow layout](/en-US/docs/Web/CSS/Guides/Display/Flow_layout) trong CSS.

### Floats

Trong float model, một box đầu tiên được bố cục theo normal flow, sau đó được lấy ra khỏi flow và được định vị, thường là sang trái hoặc phải. Nội dung có thể chảy dọc theo một bên của float.

Tìm hiểu thêm về [floats](/en-US/docs/Learn_web_development/Core/CSS_layout/Floats).

### Absolute positioning

Trong absolute positioning model (cũng bao gồm cả `fixed` positioning), một box bị loại bỏ hoàn toàn khỏi normal flow và được gán một vị trí tương đối với một containing block (là viewport trong trường hợp fixed positioning) hoặc với một hoặc nhiều anchor elements trong [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning).

Một phần tử được gọi là **out of flow** nếu nó được float, absolute positioned, hoặc là phần tử gốc. Một phần tử được gọi là **in-flow** nếu nó không nằm ngoài flow.

Đọc về [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout).

## Formatting contexts và thuộc tính display

Các box có thể được mô tả có **outer display type**, là `block` hoặc `inline`. Outer display type này đề cập đến cách box hoạt động cùng với các phần tử khác trên trang.

Các box cũng có inner display type, xác định cách các con của chúng hoạt động. Đối với block và inline layout bình thường, hoặc normal flow, display type này là `flow`. Điều này có nghĩa là các phần tử con cũng sẽ là `block` hoặc `inline`.

Tuy nhiên, inner display type có thể là thứ gì đó như `grid` hoặc `flex`, trong trường hợp đó các con trực tiếp sẽ hiển thị dưới dạng grid hoặc flex items. Trong trường hợp như vậy, phần tử được mô tả là tạo ra một grid hoặc flex [formatting context](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts). Theo nhiều cách, điều này tương tự như một block formatting context, tuy nhiên, các con hoạt động như flex hoặc grid items thay vì các mục trong normal flow.

Các tương tác giữa block-level và inline-level boxes được mô tả trong tham chiếu thuộc tính {{cssxref("display")}}.

Ngoài ra, các tham chiếu cho các giá trị cụ thể của display giải thích cách các formatting contexts này hoạt động về mặt box layout.

- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout)
- Module [CSS table](/en-US/docs/Web/CSS/Guides/Table)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)

### Independent formatting contexts

Các phần tử hoặc tham gia vào formatting context của containing block của chúng hoặc thiết lập một independent formatting context. Một grid container, ví dụ, thiết lập một **grid formatting context** mới cho các con của nó.

**Independent formatting contexts** chứa floats, và margins không collapse qua các ranh giới của formatting context. Do đó, việc tạo một block formatting context mới có thể đảm bảo rằng floats và margins ở lại bên trong một box. Để làm điều này, thêm `display: flow-root` vào box mà bạn muốn tạo một [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới.

Ví dụ sau đây cho thấy hiệu ứng của `display: flow-root`. Box có nền đen dường như bao quanh mục float và văn bản. Nếu bạn xóa `display: flow-root`, mục float sẽ lồi ra khỏi đáy của box vì nó không còn được chứa nữa.

```html live-sample___block-flow-root
<div class="container">
  <div class="item">Floated</div>
  <p>Text following the float.</p>
</div>
```

```css hidden live-sample___block-flow-root
body {
  font: 1.2em sans-serif;
  margin: 20px;
}
.container {
  background-color: #333333;
  color: white;
}

.item {
  background-color: white;
  border: 1px solid #999999;
  color: #333333;
  width: 100px;
  height: 100px;
  padding: 10px;
}
```

```css live-sample___block-flow-root
.container {
  display: flow-root;
}

.item {
  margin: 10px;
  float: left;
}
```

{{EmbedLiveSample("block-flow-root", "", "250px")}}

### Block boxes

Trong các đặc tả, block boxes, block-level boxes và block containers đều được gọi là **block boxes** ở một số nơi nhất định. Những thứ này có phần khác nhau và thuật ngữ block box chỉ nên được sử dụng nếu không có sự mơ hồ.

#### Block containers

Một **block container** chứa chỉ inline-level boxes tham gia vào một inline formatting context, hoặc chỉ block-level boxes tham gia vào một block formatting context. Vì lý do này, chúng ta thấy hành vi được giải thích ở trên, nơi các anonymous box được giới thiệu để đảm bảo tất cả các mục có thể tham gia vào một block hoặc inline formatting context. Một phần tử là một block container chỉ khi nó chứa các block-level hoặc inline-level box.

#### Inline-level và block-level boxes

Đây là các box được chứa bên trong block container tham gia vào inline hoặc block layout, tương ứng.

#### Block boxes

Một block box là một block-level box cũng là một block container. Như được mô tả trong CSS `display`, một box có thể là block-level box, nhưng không phải cũng là block container (ví dụ nó có thể là flex hoặc grid container).

## Xem thêm

- Hướng dẫn [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [Comments](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- [Box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- [Layout modes](/en-US/docs/Glossary/Layout_mode)
- [Margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
- {{glossary("Replaced elements")}}
- {{DOMxRef("VisualViewport")}} interface
- {{glossary("Scroll container")}}
