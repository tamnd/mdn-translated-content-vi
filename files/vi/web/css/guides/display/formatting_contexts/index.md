---
title: Introduction to formatting contexts
short-title: Formatting contexts
slug: Web/CSS/Guides/Display/Formatting_contexts
page-type: guide
sidebar: cssref
---

Bài viết này giới thiệu khái niệm về formatting contexts, trong đó có nhiều loại bao gồm block formatting contexts, inline formatting contexts và flex formatting contexts. Những kiến thức cơ bản về cách chúng hoạt động và cách bạn có thể sử dụng các hành vi này cũng được giới thiệu.

Mọi thứ trên trang đều là một phần của **formatting context**, hoặc một vùng đã được định nghĩa để bố cục nội dung theo một cách cụ thể. Một **block formatting context** (BFC) sẽ bố cục các phần tử con theo các quy tắc block layout, một **flex formatting context** sẽ bố cục các con của nó dưới dạng {{Glossary("flex item", "flex items")}}, v.v. Mỗi formatting context có các quy tắc cụ thể về cách bố cục hoạt động trong ngữ cảnh đó.

## Block formatting contexts

Phần tử ngoài cùng trong một tài liệu sử dụng các quy tắc block layout thiết lập **initial block formatting context** đầu tiên. Điều này có nghĩa là mọi phần tử bên trong phần tử `<html>` đều được bố cục theo normal flow tuân theo các quy tắc block và inline layout. Các phần tử tham gia trong một BFC sử dụng các quy tắc được nêu trong CSS Box Model, xác định cách margins, borders và padding của một phần tử tương tác với các block khác trong cùng ngữ cảnh.

### Tạo một block formatting context mới

Phần tử {{HTMLElement("html")}} không phải là phần tử duy nhất có khả năng tạo một block formatting context. Bất kỳ phần tử block-level nào cũng có thể được tạo để tạo ra một BFC bằng cách áp dụng một số thuộc tính CSS nhất định.

Một BFC mới được tạo ra trong các tình huống sau:

- các phần tử được đặt float bằng {{cssxref("float")}}
- các phần tử [được định vị tuyệt đối](/en-US/docs/Web/CSS/Reference/Properties/position#types_of_positioning)
- các phần tử có {{cssxref("display", "display: inline-block", "#inline-block")}}
- các ô bảng hoặc các phần tử có `display: table-cell`, bao gồm cả các ô bảng ẩn danh được tạo khi sử dụng các thuộc tính `display: table-*`
- các caption bảng hoặc các phần tử có `display: table-caption`
- các phần tử block nơi `overflow` có giá trị khác với `visible`
- các phần tử có `display: flow-root` hoặc `display: flow-root list-item`
- các phần tử có {{cssxref("contain", "contain: layout", "#layout")}}, `content`, hoặc `strict`
- {{Glossary("flex item", "flex items")}}
- grid items
- [multicol containers](/en-US/docs/Web/CSS/Guides/Multicol_layout/Basic_concepts)
- các phần tử có {{cssxref("column-span")}} được đặt thành `all`

Điều này hữu ích vì một BFC mới sẽ hoạt động giống như tài liệu ngoài cùng ở chỗ nó trở thành một mini-layout bên trong layout chính. Một BFC chứa mọi thứ bên trong nó, {{cssxref("float")}} và {{cssxref("clear")}} chỉ áp dụng cho các mục bên trong cùng một formatting context, và margins chỉ collapse giữa các phần tử trong cùng một formatting context.

### Ví dụ tạo BFC

Hãy cùng xem một vài ví dụ để thấy hiệu ứng của việc tạo một BFC mới.

Trong ví dụ dưới đây, chúng ta có một phần tử float bên trong một `<div>` với border được áp dụng. Nội dung của `<div>` đó đã float cạnh phần tử float. Vì nội dung của float cao hơn nội dung bên cạnh nó, border của `<div>` bây giờ chạy qua float. Như đã giải thích trong [hướng dẫn về các phần tử in-flow và out of flow](/en-US/docs/Web/CSS/Guides/Display/In_flow_and_out_of_flow), float đã được lấy ra khỏi flow nên background và border của div chỉ chứa nội dung chứ không chứa float.

```html live-sample___float
<div class="box">
  <div class="float">I am a floated box!</div>
  <p>I am content inside the container.</p>
</div>
```

```css live-sample___float
body {
  font: 1.2em sans-serif;
}

.box {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
}

.float {
  float: left;
  width: 200px;
  height: 100px;
  background-color: white;
  border: 1px solid black;
  padding: 10px;
}
```

{{EmbedLiveSample("float")}}

Việc tạo một BFC mới sẽ chứa float đó. Một cách điển hình để làm điều này trong quá khứ là đặt `overflow: auto` hoặc đặt các giá trị khác với giá trị khởi tạo `overflow: visible`.

```html hidden live-sample___bfc-overflow
<div class="box">
  <div class="float">I am a floated box!</div>
  <p>I am content inside the container.</p>
</div>
```

```css live-sample___bfc-overflow
body {
  font: 1.2em sans-serif;
}
.box {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
  overflow: auto;
}

.float {
  float: left;
  width: 200px;
  height: 150px;
  background-color: white;
  border: 1px solid black;
  padding: 10px;
}
```

{{EmbedLiveSample("bfc-overflow", "", "220px")}}

Việc đặt `overflow: auto` đã tạo một BFC mới chứa float. `<div>` của chúng ta bây giờ trở thành một mini-layout bên trong layout của chúng ta. Bất kỳ phần tử con nào cũng sẽ được chứa bên trong nó.

Vấn đề với việc sử dụng `overflow` để tạo một BFC mới là thuộc tính `overflow` được dùng để nói với trình duyệt cách bạn muốn xử lý nội dung tràn ra ngoài. Có một số trường hợp bạn sẽ thấy mình gặp các thanh cuộn không mong muốn hoặc các shadow bị cắt khi sử dụng thuộc tính này chỉ để tạo BFC. Ngoài ra, nó có thể không rõ ràng cho nhà phát triển trong tương lai, vì có thể không rõ tại sao bạn lại sử dụng `overflow` cho mục đích này. Nếu bạn làm điều này, đó là ý tưởng tốt để chú thích code để giải thích.

### Tạo BFC một cách rõ ràng bằng display: flow-root

Sử dụng `display: flow-root` (hoặc `display: flow-root list-item`) trên containing block sẽ tạo một BFC mới mà không có bất kỳ tác dụng phụ nào có thể gây vấn đề.

```html hidden live-sample___bfc-flow-root
<div class="box">
  <div class="float">I am a floated box!</div>
  <p>I am content inside the container.</p>
</div>
```

```css live-sample___bfc-flow-root
body {
  font: 1.2em sans-serif;
}
.box {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
  display: flow-root;
}
```

```css hidden live-sample___bfc-flow-root
.float {
  float: left;
  width: 200px;
  height: 100px;
  background-color: white;
  border: 1px solid black;
  padding: 10px;
}
```

{{EmbedLiveSample("bfc-flow-root")}}

Với `display: flow-root` trên {{HTMLElement("div")}}, mọi thứ bên trong container đó đều tham gia vào block formatting context của container đó, và các float sẽ không lồi ra khỏi đáy của phần tử.

Tên của từ khóa `flow-root` đề cập đến thực tế là bạn đang tạo ra thứ gì đó hoạt động về bản chất như một phần tử gốc mới (giống như cách {{HTMLElement("html")}} làm), xét về cách ngữ cảnh mới được tạo ra và flow layout của nó hoạt động.

## Inline formatting contexts

Inline formatting contexts tồn tại bên trong các formatting contexts khác và có thể được coi là ngữ cảnh của một đoạn văn. Đoạn văn tạo ra một inline formatting context bên trong đó các phần tử như {{HTMLElement("strong")}}, {{HTMLElement("a")}}, hoặc {{HTMLElement("span")}} được sử dụng trên văn bản.

Box model không áp dụng đầy đủ cho các mục tham gia trong một inline formatting context. Trong một writing mode nằm ngang, horizontal padding, borders và margin sẽ được áp dụng cho phần tử và đẩy văn bản ra xa sang trái và phải. Tuy nhiên, margins ở trên và dưới phần tử sẽ không được áp dụng. Vertical padding và borders sẽ được áp dụng nhưng có thể chồng lên nội dung phía trên và phía dưới vì, trong inline formatting context, các line boxes sẽ không bị đẩy ra xa nhau bởi padding và borders.

```html live-sample___inline
<p>
  Before that night—<strong>a memorable night</strong>, as it was to
  prove—hundreds of millions of people had watched the rising smoke-wreaths of
  their fires without drawing any special inspiration from the fact.
</p>
```

```css live-sample___inline
body {
  font: 1.2em sans-serif;
}
p {
  margin-top: 2em;
}
strong {
  margin: 20px;
  padding: 20px;
  border: 5px solid rebeccapurple;
}
```

{{EmbedLiveSample("inline")}}

## Các formatting contexts khác

Hướng dẫn này đề cập đến flow layout và do đó không đề cập đến các formatting contexts có thể có khác. Do đó, hữu ích khi hiểu rằng việc tạo bất kỳ loại formatting context nào cũng sẽ thay đổi cách các phần tử bên trong formatting context đó hoạt động. Hành vi này luôn được mô tả trong đặc tả và cũng ở đây trên MDN.

## Tóm tắt

Trong hướng dẫn này, chúng ta đã xem xét chi tiết hơn về block và inline formatting contexts và chủ đề quan trọng về việc tạo một block formatting context (BFC). Trong hướng dẫn tiếp theo, chúng ta sẽ tìm hiểu [cách normal flow tương tác với các writing modes khác nhau](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes).

## Xem thêm

- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- [Visual formatting model](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
- [CSS Box Model](/en-US/docs/Web/CSS/Guides/Box_model)
