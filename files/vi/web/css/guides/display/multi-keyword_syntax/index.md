---
title: Using the multi-keyword syntax with CSS display
short-title: Using multi-keyword syntax
slug: Web/CSS/Guides/Display/Multi-keyword_syntax
page-type: guide
sidebar: cssref
---

[Module CSS display](/en-US/docs/Web/CSS/Guides/Display) định nghĩa cú pháp multi-keyword cho thuộc tính CSS {{cssxref("display")}}. Hướng dẫn này giải thích cú pháp multi-keyword.

> [!NOTE]
> Cú pháp multi-keyword còn được gọi là "cú pháp hai giá trị" hoặc "cú pháp nhiều giá trị".

## Điều gì xảy ra khi chúng ta thay đổi giá trị của thuộc tính display?

Một trong những điều đầu tiên chúng ta học về CSS là một số phần tử là block-level và một số là inline-level. Đây là các [outer](/en-US/docs/Web/CSS/Reference/Values/display-outside) display types của chúng. Ví dụ, một `<h1>` hoặc một `<p>` là block-level theo mặc định, và một `<span>` là inline-level. Sử dụng thuộc tính {{cssxref("display")}} chúng ta có thể chuyển đổi giữa block và inline. Ví dụ, để tạo tiêu đề inline, chúng ta sẽ sử dụng CSS sau:

```css
h1 {
  display: inline;
}
```

Thuộc tính `display` cũng cho phép chúng ta sử dụng [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) và [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) khi `display: grid` hoặc `display: flex` được đặt. Khái niệm quan trọng cần hiểu là việc thay đổi giá trị `display` của một phần tử có thể thay đổi formatting context của các con trực tiếp của nó. Khi bạn sử dụng `display: flex` hoặc `display: grid`, các con của phần tử trở thành các flex hoặc grid items và phản ứng với các thuộc tính trong các đặc tả grid và flexbox.

Tuy nhiên, điều mà grid và flexbox cho thấy là một phần tử có cả **outer** và **inner** display type. Outer display type mô tả phần tử là block-level hay inline-level. Inner display type mô tả cách các con của box đó hoạt động.

Ví dụ, khi chúng ta sử dụng `display: flex`, chúng ta tạo ra một container block-level với flex children. Các con được mô tả là tham gia vào một flex formatting context. Bạn có thể thấy điều này nếu bạn lấy một `<span>` — thường là một phần tử inline-level — và áp dụng `display: flex` cho nó. `<span>` trở thành một phần tử block-level. Nó hoạt động như các thứ block-level trong mối quan hệ với các box khác trong layout. Như thể bạn đã áp dụng `display: block` cho span, tuy nhiên chúng ta cũng nhận được hành vi thay đổi của các con.

Ví dụ live bên dưới có một `<span>` với `display: flex` được áp dụng. Nó đã trở thành một block-level box chiếm tất cả không gian có sẵn theo chiều inline. Bạn bây giờ có thể sử dụng `justify-content: space-between` để đặt khoảng trống này giữa hai flex items.

```html live-sample___span-flex
<span class="flex"> Some text <em>emphasized text</em> </span>
```

```css live-sample___span-flex
body {
  font: 1.2em / 1.5 sans-serif;
}
.flex {
  border: 5px solid #cccccc;
  display: flex;
  justify-content: space-between;
}
```

{{EmbedLiveSample("span-flex")}}

Cũng có thể tạo inline flex containers. Nếu bạn sử dụng giá trị đơn `inline-flex`, bạn sẽ có một inline-level box với flex children. Các con hoạt động theo cùng cách như flex children của một container block-level. Điều duy nhất thay đổi là cha bây giờ là một inline-level box. Do đó nó hoạt động như các thứ inline-level khác và không chiếm toàn bộ chiều rộng (hoặc kích thước theo chiều inline) mà một block-level box chiếm. Điều này có nghĩa là một số văn bản tiếp theo có thể xuất hiện cạnh flex container.

```html live-sample___inline-flex
<div class="flex">
  <div>One</div>
  <div>Two</div>
</div>
Text following the flex container.
```

```css live-sample___inline-flex
body {
  font: 1.2em / 1.5 sans-serif;
}
.flex > div {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.flex {
  border: 5px solid #cccccc;
  display: inline-flex;
}
```

{{EmbedLiveSample("inline-flex")}}

Điều tương tự cũng đúng khi làm việc với grid layout. Sử dụng `display: grid` sẽ cho bạn một block-level box tạo ra một grid formatting context cho các con trực tiếp. Sử dụng `display: inline-grid` sẽ tạo một inline-level box, tạo ra một grid formatting context cho các con.

## Sử dụng cú pháp multi-keyword

Như bạn có thể thấy từ giải thích ở trên, thuộc tính `display` có quyền năng đáng kể. Ngoài việc chỉ ra một thứ gì đó là block-level hay inline-level trong mối quan hệ với các box khác trên trang, nó còn chỉ ra formatting context bên trong box mà nó được áp dụng. Để mô tả hành vi này tốt hơn, thuộc tính `display` cho phép hai giá trị — một giá trị outer và inner — được đặt trên nó. Cú pháp đơn giá trị ban đầu vẫn hợp lệ.

Điều này có nghĩa là thay vì đặt `display: flex` để tạo một block-level box với flex children, chúng ta sử dụng `display: block flex`. Thay vì `display: inline-flex` để tạo một inline-level box với flex children, chúng ta sử dụng `display: inline flex`. Ví dụ dưới đây minh họa các giá trị này.

```html live-sample___multi-keyword-flex
<h1>Multiple values for display</h1>

<div class="flex flex1">
  <div>Item One</div>
  <div>Item Two</div>
  <div>Item Three</div>
</div>

<p>The first example is a block element with flex children.</p>

<div class="flex flex2">
  <div>Item One</div>
  <div>Item Two</div>
  <div>Item Three</div>
</div>
The second example is an inline element with flex children.
```

```css live-sample___multi-keyword-flex
body {
  font: 1.2em / 1.5 sans-serif;
}
.flex {
  border: 5px solid #cccccc;
  gap: 10px;
}

.flex > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.flex1 {
  display: block flex;
}

.flex2 {
  display: inline flex;
}
```

{{EmbedLiveSample("multi-keyword-flex", "", "300px")}}

Có các ánh xạ cho tất cả các giá trị hiện có của `display`; các giá trị phổ biến nhất được liệt kê trong bảng bên dưới. Để xem danh sách đầy đủ, hãy xem bảng trong [đặc tả thuộc tính `display`](https://drafts.csswg.org/css-display/#display-value-summary).

| Giá trị đơn    | Giá trị đa từ khóa |
| -------------- | ------------------ |
| `block`        | `block flow`       |
| `flow-root`    | `block flow-root`  |
| `inline`       | `inline flow`      |
| `inline-block` | `inline flow-root` |
| `flex`         | `block flex`       |
| `inline-flex`  | `inline flex`      |
| `grid`         | `block grid`       |
| `inline-grid`  | `inline grid`      |

## display: block flow-root và display: inline flow-root

Về cách cú pháp nhiều giá trị này giúp làm rõ CSS layout, chúng ta có thể xem xét một số giá trị trong bảng trên có thể ít quen thuộc hơn với bạn. Multi-keyword `display: block flow-root` ánh xạ đến một giá trị đơn; `display: flow-root`. Mục đích duy nhất của giá trị này là tạo ra một [Block Formatting Context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) (BFC) mới. Một BFC đảm bảo rằng mọi thứ bên trong box của bạn ở lại bên trong, và những thứ bên ngoài box không thể xâm nhập vào nó.

Trong ví dụ dưới đây, hai phần tử `<p>`, một bên trong `<div>`, minh họa cách các giá trị display ảnh hưởng đến formatting contexts.
Phần tử `<div>` đầu tiên với các control demo bị ẩn để chúng ta có thể tập trung vào các phần tử tiếp theo.
Các phần tử mà chúng ta nên tập trung vào là các `<div>` và `<p>` "parent", "child", và "sibling" mà bạn có thể phân biệt qua các ID của chúng.

Điều đáng chú ý về layout này là không có nội dung nào giữa các phần tử parent và child, và phần tử child có top margin được áp dụng.
Bạn có thể mong đợi top margin sẽ đẩy phần tử child xuống bên trong phần tử parent, nhưng điều xảy ra thay vào đó là thứ được gọi là [_margin collapse_](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing).
Trong trường hợp này, margin của phần tử child kéo dài lên phía trên bounding box của parent và đẩy phần tử parent xuống thêm trên trang.
Điều này dễ nhìn thấy hơn nếu bạn kiểm tra box model của phần tử child [trong browser developer tools của bạn](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#using_browser_devtools_to_view_the_box_model).

Thay đổi tùy chọn được chọn trong phần tử `<select>` để xem hiệu ứng của các giá trị `display` khác nhau.
Bạn có thể sử dụng bất kỳ giá trị nào với `flow-root` để tạo một formatting context mới cho parent, làm cho margin của phần tử child tương đối với outer edge của parent và tránh margin collapse.
Thay đổi giữa `display: flow-root` và `display: block flow-root` sẽ đạt được kết quả tương tự như từ khóa đơn `flow-root`.

```js hidden live-sample___flow-root
const parentDiv = document.getElementById("parent");
const siblingDiv = document.getElementById("sibling");
const displayTypeSelect = document.getElementById("displayType");

function changeDisplayType() {
  parentDiv.style.display = displayTypeSelect.value;
  siblingDiv.style.display = displayTypeSelect.value;
}

displayTypeSelect.addEventListener("change", changeDisplayType);
```

```css hidden live-sample___flow-root
#controls {
  padding: 1rem;
  outline: 2px dashed black;
}
body {
  margin: 10px;
  font-family: sans-serif;
}
```

```css live-sample___flow-root
div,
p {
  outline: 2px solid black;
  background-color: cornflowerblue;
  display: block;
  margin-bottom: 2rem;
}

#parent {
  background-color: oldlace;
  min-height: 2rem;
}

#child {
  margin-top: 4rem;
  outline: 2px dashed red;
}

#sibling {
  background-color: lavender;
}
```

```html hidden live-sample___flow-root
<div id="controls">
  <label for="displayType">display:</label>
  <select id="displayType">
    <option value="block">block</option>
    <option value="flow-root">flow-root</option>
    <option value="block flow-root">block flow-root</option>
    <option value="inline">inline</option>
    <option value="inline flow-root">inline flow-root</option>
  </select>
</div>
```

```html live-sample___flow-root
<div id="parent">
  <p id="child">The #child paragraph (nested in #parent).</p>
</div>
<p id="sibling">The #sibling paragraph (sibling of #parent).</p>
```

{{EmbedLiveSample("flow-root", '90%', 380)}}

Giá trị `flow-root` có ý nghĩa nếu bạn nghĩ về block và inline layout, đôi khi được gọi là [normal flow](/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction#normal_layout_flow). Trang HTML của chúng ta tạo ra một formatting context mới (floats và margins không thể kéo dài ra ngoài các ranh giới) và nội dung của chúng ta được bố cục trong normal flow, sử dụng block và inline layout, trừ khi chúng ta thay đổi giá trị của `display` để sử dụng một số formatting context khác. Tạo một grid hoặc flex container cũng tạo ra một formatting context mới (tương ứng là grid hoặc flex formatting context). Chúng cũng chứa mọi thứ bên trong chúng. Tuy nhiên, nếu bạn muốn chứa floats và margins nhưng tiếp tục sử dụng block và inline layout, bạn có thể tạo một flow root mới và bắt đầu lại với block và inline layout. Từ điểm đó trở xuống, mọi thứ đều được chứa bên trong flow root mới.

Đây là lý do tại sao `display: flow-root` có thể được viết bằng cú pháp multi-keyword `display: block flow-root`. Bạn đang tạo một block formatting context, với một block-level box và các con tham gia vào normal flow. Còn `display: inline flow-root`? Đây là cách hiện tại để mô tả `display: inline-block`.

Giá trị `display: inline-block` đã tồn tại từ những ngày đầu của CSS. Lý do chúng ta có xu hướng sử dụng nó là để cho phép padding đẩy các mục inline ra xa khỏi một phần tử, khi tạo các mục điều hướng chẳng hạn, hoặc khi muốn thêm background với padding vào một phần tử inline như trong ví dụ dưới đây.

```html live-sample___inline-block
<p>
  This paragraph has a span <span class="inline-block">with padding</span> it is
  an inline-block so the padding is contained and pushes the other line boxes
  away.
</p>
```

```css live-sample___inline-block
body {
  font: 1.2em / 1.5 sans-serif;
}
p {
  border: 2px dashed;
  width: 300px;
}
.inline-block {
  background-color: rgb(0 0 0 / 0.4);
  color: white;
  padding: 10px;
  display: inline-block;
}
```

{{EmbedLiveSample("inline-block", "", "200px")}}

Tuy nhiên, một phần tử có `display: inline-block` cũng sẽ chứa floats. Nó chứa mọi thứ bên trong inline-level box. Do đó `display: inline-block` làm chính xác những gì `display: flow-root` làm, nhưng với một inline-level thay vì block-level box. Cú pháp hai giá trị mô tả chính xác những gì đang xảy ra với giá trị này. Trong ví dụ trên, bạn có thể thay đổi `display: inline-block` thành `display: inline flow-root` và nhận được kết quả tương tự.

## Còn các giá trị cũ của display?

Các giá trị đơn của `display` được mô tả trong đặc tả là các giá trị kế thừa (legacy values), và hiện tại bạn không được lợi ích gì từ việc sử dụng các phiên bản multi-keyword, vì có một ánh xạ trực tiếp cho mỗi phiên bản multi-keyword đến một phiên bản kế thừa, như được minh họa trong bảng trên.

Để xử lý các giá trị đơn của `display`, [đặc tả](https://drafts.csswg.org/css-display/#outer-role) giải thích những gì cần làm nếu chỉ giá trị outer là `block` hoặc `inline` được sử dụng:

> "If a `<display-outside>` value is specified but `<display-inside>` is omitted, the element's inner display type defaults to flow."

Điều này có nghĩa là hành vi chính xác như trong thế giới giá trị đơn. Nếu bạn chỉ định `display: block` hoặc `display: inline`, điều đó thay đổi giá trị outer display của box nhưng bất kỳ con nào tiếp tục trong normal flow.
Nếu chỉ có giá trị inner là `flex`, `grid`, hoặc `flow-root` được chỉ định thì [đặc tả](https://drafts.csswg.org/css-display/#inner-model) giải thích rằng giá trị outer nên được đặt thành `block`:

> "If a `<display-inside>` value is specified but `<display-outside>` is omitted, the element's outer display type defaults to block—except for ruby, which defaults to inline."

Cuối cùng, chúng ta có một số [giá trị inline-level tiền soạn sẵn](https://drafts.csswg.org/css-display/#legacy-display) kế thừa:

- `inline-block`
- `inline-table`
- `inline-flex`
- `inline-grid`

Nếu một trình duyệt hỗ trợ gặp các giá trị này dưới dạng giá trị đơn, nó sẽ xử lý chúng giống như các phiên bản multi-keyword:

- `inline flow-root`
- `inline table`
- `inline flex`
- `inline grid`

Vì vậy, tất cả các tình huống hiện tại đều được bao gồm gọn gàng, có nghĩa là chúng ta duy trì khả năng tương thích của các trang web hiện có và mới sử dụng các giá trị đơn, trong khi cho phép đặc tả phát triển.
