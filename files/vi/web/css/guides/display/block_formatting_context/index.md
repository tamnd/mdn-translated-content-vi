---
title: Block formatting context
slug: Web/CSS/Guides/Display/Block_formatting_context
page-type: guide
spec-urls: https://drafts.csswg.org/css-display/#block-formatting-context
sidebar: cssref
---

**Block formatting context** (BFC) là một phần của quá trình render CSS trực quan của trang web. Đây là vùng mà layout của các block box xảy ra và trong đó các float tương tác với các phần tử khác.

Một block formatting context được tạo ra bởi ít nhất một trong những điều sau:

- Phần tử gốc của tài liệu (`<html>`).
- Float (các phần tử có {{ cssxref("float") }} khác `none`).
- Các phần tử được định vị tuyệt đối (các phần tử có {{ cssxref("position") }} là `absolute` hoặc `fixed`).
- Các inline-block (các phần tử có {{cssxref("display", "display: inline-block")}}). Đây là kiểu display mặc định cho các phần tử {{htmlelement("button")}} và button {{htmlelement("input")}}.
- Các ô table (các phần tử có {{cssxref("display", "display: table-cell")}}, là mặc định cho các ô table HTML).
- Các caption của table (các phần tử có {{cssxref("display", "display: table-caption")}}, là mặc định cho các caption của table HTML).
- Các ô table ẩn danh được tạo ngầm định bởi các phần tử có {{cssxref("display", "display: table")}}, `table-row`, `table-row-group`, `table-header-group`, `table-footer-group` (là mặc định cho các table, hàng table, thân table, tiêu đề table và chân table HTML tương ứng), hoặc `inline-table`.
- Các phần tử có {{cssxref("display", "display: flow-root")}}.
- Các flex item (con trực tiếp của phần tử có {{cssxref("display", "display: flex")}} hoặc `inline-flex`) nếu chúng không phải là container [flex](/en-US/docs/Glossary/Flex_Container), [grid](/en-US/docs/Glossary/Grid_Container) hay [table](/en-US/docs/Web/CSS/Guides/Table).
- Các grid item (con trực tiếp của phần tử có {{cssxref("display", "display: grid")}} hoặc `inline-grid`) nếu chúng không phải là container [flex](/en-US/docs/Glossary/Flex_Container), [grid](/en-US/docs/Glossary/Grid_Container) hay [table](/en-US/docs/Web/CSS/Guides/Table).
- Các phần tử block có {{ cssxref("overflow") }} có giá trị khác `visible` và `clip`.
- Các phần tử có {{cssxref("contain", "contain: layout")}}, `content`, hoặc `paint`.
- Các multicol container (các phần tử có {{ cssxref("column-count") }} hoặc {{ cssxref("column-width") }} khác `auto`, bao gồm các phần tử có `column-count: 1`).
- {{cssxref("column-span", "column-span: all")}}, ngay cả khi phần tử `column-span: all` không được chứa trong multicol container.

Các formatting context ảnh hưởng đến layout vì một phần tử thiết lập block formatting context mới sẽ:

- chứa các float bên trong.
- loại trừ các float bên ngoài.
- ngăn chặn [margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing).

Các flex và grid container, được định nghĩa bằng cách đặt ({{ cssxref("display") }} của phần tử thành `flex`, `grid`, `inline-flex`, hoặc `inline-grid`, thiết lập một flex hoặc grid formatting context mới. Những thứ này tương tự như block formatting context ngoại trừ không có children floating có sẵn bên trong flex hoặc grid container, nhưng các formatting context này loại trừ các float bên ngoài và ngăn chặn margin collapsing.

## Ví dụ

Hãy xem một vài trong số này để thấy hiệu ứng của việc tạo ra một BFC mới.

### Chứa các float bên trong

Trong ví dụ sau, chúng ta có nội dung float có chiều cao bằng với nội dung bên cạnh nó. Chúng ta có một phần tử được float bên trong một `<div>` với `border` được áp dụng. Nội dung của `<div>` đó đã được float cùng với phần tử được float. Vì nội dung của float cao hơn nội dung bên cạnh nó, border của `<div>` bây giờ chạy xuyên qua float. Như được giải thích trong [hướng dẫn về các phần tử trong flow và ngoài flow](/en-US/docs/Web/CSS/Guides/Display/In_flow_and_out_of_flow), float đã bị đưa ra khỏi flow vì vậy `background` và `border` của `<div>` chỉ chứa nội dung và không chứa float.

**sử dụng `overflow: auto`**

Đặt `overflow: auto` hoặc đặt các giá trị khác với giá trị ban đầu của `overflow: visible` tạo ra một BFC mới chứa float. `<div>` của chúng ta bây giờ trở thành một mini-layout bên trong layout của chúng ta. Bất kỳ phần tử con nào sẽ được chứa bên trong nó.

Vấn đề với việc sử dụng `overflow` để tạo một BFC mới là thuộc tính `overflow` được thiết kế để nói với trình duyệt về cách bạn muốn xử lý nội dung tràn. Có một số trường hợp bạn sẽ thấy mình gặp phải các thanh cuộn không mong muốn hoặc shadow bị cắt khi bạn sử dụng thuộc tính này thuần túy để tạo ra một BFC. Ngoài ra, có khả năng không đọc được đối với developer trong tương lai, vì có thể không rõ ràng tại sao bạn sử dụng `overflow` cho mục đích này. Nếu bạn sử dụng `overflow`, bạn nên comment code để giải thích.

**sử dụng `display: flow-root`**

Giá trị `display: flow-root` cho phép chúng ta tạo một BFC mới mà không có bất kỳ tác dụng phụ có vấn đề tiềm năng nào. Sử dụng `display: flow-root` trên containing block tạo ra một BFC mới.

Với `display: flow-root;` trên `<div>`, mọi thứ bên trong container đó tham gia vào block formatting context của container đó, và các float sẽ không nhô ra khỏi đáy của phần tử.

Tên giá trị `flow-root` có ý nghĩa khi bạn hiểu rằng bạn đang tạo ra thứ gì đó hoạt động như phần tử `root` (phần tử `<html>` trong trình duyệt) về cách nó tạo ra một context mới cho flow layout bên trong nó.

#### HTML

```html
<section>
  <div class="box1">
    <div class="float">I am a floated box!</div>
    <p>I am content inside the container.</p>
  </div>
</section>
<section>
  <div class="box2">
    <div class="float">I am a floated box!</div>
    <p>I am content inside the <code>overflow:auto</code> container.</p>
  </div>
</section>
<section>
  <div class="box3">
    <div class="float">I am a floated box!</div>
    <p>I am content inside the <code>display:flow-root</code> container.</p>
  </div>
</section>
```

#### CSS

```css
section {
  height: 150px;
}
.box1 {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
}
.box2,
.box3 {
  background-color: aliceblue;
  border: 5px solid steelblue;
}
.box2 {
  overflow: auto;
}
.box3 {
  display: flow-root;
}
.float {
  float: left;
  width: 200px;
  height: 100px;
  background-color: rgb(255 255 255 / 50%);
  border: 1px solid black;
  padding: 10px;
}
```

{{EmbedLiveSample("Contain_internal_floats", 200, 480)}}

### Loại trừ các float bên ngoài

Trong ví dụ sau, chúng ta sử dụng `display: flow-root` và các float, tạo ra hai hộp cạnh nhau chứng minh rằng một phần tử trong normal flow thiết lập một BFC mới và không chồng lên margin box của bất kỳ float nào trong cùng block formatting context như phần tử đó.

#### HTML

```html
<section>
  <div class="float">Try to resize this outer float</div>
  <div class="box"><p>Normal</p></div>
</section>
<section>
  <div class="float">Try to resize this outer float</div>
  <div class="box2">
    <p><code>display:flow-root</code></p>
  </div>
</section>
```

#### CSS

```css
section {
  height: 150px;
}
.box {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
}
.box2 {
  background-color: aliceblue;
  border: 5px solid steelblue;
  display: flow-root;
}
.float {
  float: left;
  overflow: hidden; /* required by resize:both */
  resize: both;
  margin-right: 25px;
  width: 200px;
  height: 100px;
  background-color: rgb(255 255 255 / 75%);
  border: 1px solid black;
  padding: 10px;
}
```

{{EmbedLiveSample("Exclude_external_floats", 200, 330)}}

### Ngăn chặn margin collapsing

Bạn có thể tạo một BFC mới để tránh [margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing) giữa hai phần tử liền kề.

#### Ví dụ margin collapsing

Trong ví dụ này chúng ta có hai phần tử {{HTMLElement("div")}} liền kề nhau, mỗi phần tử có vertical margin là `10px`. Do margin collapsing, khoảng cách dọc giữa chúng là `10px`, không phải `20px` như chúng ta có thể mong đợi.

```html
<div class="blue"></div>
<div class="red"></div>
```

```css
.blue,
.red {
  height: 50px;
  margin: 10px 0;
}

.blue {
  background: blue;
}

.red {
  background: red;
}
```

{{EmbedLiveSample("Margin collapsing example", 120, 170)}}

#### Ngăn chặn margin collapsing

Trong ví dụ này, chúng ta bao bọc `<div>` thứ hai trong một `<div>` bên ngoài, và tạo một BFC mới bằng cách sử dụng `overflow: hidden` trên `<div>` bên ngoài. BFC mới này ngăn chặn margin của `<div>` được lồng vào không collapse với margin của `<div>` bên ngoài.

```html
<div class="blue"></div>
<div class="outer">
  <div class="red"></div>
</div>
```

```css
.blue,
.red {
  height: 50px;
  margin: 10px 0;
}

.blue {
  background: blue;
}

.red {
  background: red;
}

.outer {
  overflow: hidden;
  background: transparent;
}
```

{{EmbedLiveSample("Preventing margin collapsing", 120, 170)}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- [Box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- [Layout modes](/en-US/docs/Glossary/Layout_mode)
- [Visual formatting models](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
- [Margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
- [Initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value), [computed](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value), [used values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value), and [actual](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value) values
- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
- {{glossary("Replaced elements")}}
