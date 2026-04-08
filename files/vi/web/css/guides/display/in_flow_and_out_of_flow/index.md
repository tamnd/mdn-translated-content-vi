---
title: In flow and out of flow
slug: Web/CSS/Guides/Display/In_flow_and_out_of_flow
page-type: guide
sidebar: cssref
---

[Hướng dẫn trước](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout) đã giải thích về block và inline layout trong normal flow. Tất cả các phần tử nằm trong flow sẽ được bố cục bằng phương pháp này.

## Ví dụ về các phần tử trong flow

Ví dụ sau chứa một tiêu đề, một đoạn văn, một danh sách và một đoạn văn cuối chứa phần tử `strong`. Tiêu đề và các đoạn văn là block level, phần tử `strong` là inline. Danh sách, được hiển thị bằng flexbox để sắp xếp các mục thành một hàng, cũng tham gia vào block và inline layout — container có kiểu `display` bên ngoài là `block`.

```html live-sample___in-flow
<div class="box">
  <h1>A heading</h1>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>

  <ul>
    <li>One</li>
    <li>Two</li>
    <li>Three</li>
  </ul>
  <p>
    Their names were <strong>Stephen and Joseph Montgolfier</strong>, they were
    papermakers by trade, and were noted as possessing thoughtful minds and a
    deep interest in all scientific knowledge and new discovery.
  </p>
</div>
```

```css live-sample___in-flow
body {
  font: 1.2em sans-serif;
}
.box > * {
  border: 1px solid green;
}

ul {
  display: flex;
  justify-content: space-around;
  list-style: none;
  margin: 0;
}
```

{{EmbedLiveSample("in-flow", "", "300px")}}

Tất cả các phần tử đều được coi là "trong flow"; chúng xuất hiện trên trang theo thứ tự mà chúng có trong source.

## Đưa một mục ra khỏi flow

Tất cả các phần tử đều nằm trong flow ngoại trừ:

- các mục float
- các mục có `position: absolute` (bao gồm `position: fixed` hoạt động theo cùng cách)
- phần tử gốc (`html`)

Các mục out-of-flow tạo ra một [Block Formatting Context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) (BFC) mới, và do đó, mọi thứ bên trong chúng có thể được coi là một mini layout, tách biệt với phần còn lại của trang. Do đó, phần tử gốc nằm ngoài flow, như là container cho mọi thứ trong tài liệu của chúng ta, và thiết lập Block Formatting Context cho tài liệu.

### Các mục float

Trong ví dụ này, có một `div` và sau đó là hai đoạn văn. Một màu nền đã được thêm vào các đoạn văn, và `div` được float sang trái. `div` bây giờ nằm ngoài flow.

Với tư cách là một float, nó đầu tiên được bố cục theo vị trí mà nó sẽ có trong normal flow, sau đó được lấy ra khỏi flow và di chuyển sang trái càng xa càng tốt.

```html live-sample___float
<div class="box">
  <div class="float">I am a floated box!</div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___float
body {
  font: 1.2em sans-serif;
}
p {
  background-color: #cccccc;
}

.float {
  float: left;
  font-weight: bold;
  width: 200px;
  border: 2px dotted black;
  padding: 10px;
}
```

{{EmbedLiveSample("float", "", "260px")}}

Bạn có thể thấy màu nền của đoạn văn tiếp theo chạy bên dưới, chỉ có các line boxes của đoạn văn đó bị rút ngắn để tạo ra hiệu ứng bao quanh nội dung xung quanh float. Box của đoạn văn vẫn hiển thị theo các quy tắc của normal flow. Đây là lý do tại sao, để tạo khoảng trống xung quanh một mục float, bạn phải thêm margin vào mục đó, để đẩy các line boxes ra xa nó. Bạn không thể áp dụng bất kỳ điều gì cho nội dung in-flow tiếp theo để đạt được điều đó.

### Absolute positioning

Đặt `position: absolute` hoặc `position: fixed` cho một mục sẽ loại bỏ nó khỏi flow, và mọi khoảng trống mà nó đã chiếm sẽ bị xóa bỏ. Trong ví dụ tiếp theo tôi có ba phần tử đoạn văn, phần tử thứ hai có `position: absolute`, với các giá trị offset là `top: 30px` và `right: 30px`. Nó đã bị loại bỏ khỏi document flow.

```html live-sample___abspos
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
  <p class="abspos">
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___abspos
body {
  font: 1.2em sans-serif;
}
.box {
  width: 70%;
}
p {
  border: 2px solid green;
}

.abspos {
  position: absolute;
  background-color: green;
  color: white;
  top: 30px;
  right: 30px;
  width: 400px;
}
```

{{EmbedLiveSample("abspos", "", "240px")}}

Sử dụng `position: fixed` cũng loại bỏ mục khỏi flow, tuy nhiên các offset được dựa trên viewport thay vì containing block.

Khi đưa một mục ra khỏi flow bằng cách positioning, bạn sẽ cần quản lý khả năng nội dung bị chồng lên nhau. Out of flow về cơ bản có nghĩa là các phần tử khác trên trang của bạn không còn biết rằng phần tử đó tồn tại nên sẽ không phản ứng với nó.

### Relative positioning và flow

Nếu bạn đặt relative positioning cho một mục với `position: relative`, nó vẫn nằm trong flow. Tuy nhiên, bạn có thể sử dụng các giá trị offset để di chuyển nó. Khoảng trống mà nó đã được đặt trong normal flow vẫn được giữ lại, như bạn có thể thấy trong ví dụ dưới đây.

```html live-sample___relative
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
  <p class="relative">
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___relative
body {
  font: 1.2em sans-serif;
}
.box {
  width: 70%;
}
p {
  border: 2px solid green;
}

.relative {
  position: relative;
  background-color: green;
  color: white;
  bottom: 50px;
  left: 50px;
  width: 400px;
}
```

{{EmbedLiveSample("relative", "", "360px")}}

Khi bạn làm bất cứ điều gì để loại bỏ hoặc dịch chuyển một mục khỏi vị trí mà nó sẽ được đặt trong normal flow, bạn có thể cần phải quản lý nội dung và nội dung xung quanh nó để tránh sự chồng lên nhau. Dù điều đó liên quan đến việc clearing floats, hay đảm bảo rằng một phần tử có `position: absolute` không ngồi trên một số nội dung khác. Vì lý do này, các phương pháp loại bỏ phần tử ra khỏi flow nên được sử dụng với sự hiểu biết về tác động mà chúng gây ra.

## Tóm tắt

Trong hướng dẫn này, chúng ta đã giải thích cách đưa một phần tử ra khỏi flow để đạt được một số loại positioning rất cụ thể. Trong hướng dẫn tiếp theo, chúng ta sẽ xem xét một vấn đề liên quan, đó là tạo một [Block Formatting Context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context), trong [Introduction to formatting contexts](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts).

## Xem thêm

- [Learn: Positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
