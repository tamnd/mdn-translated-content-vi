---
title: contain
slug: Web/CSS/Reference/Properties/contain
page-type: css-property
browser-compat: css.properties.contain
sidebar: cssref
---

Thuộc tính CSS **`contain`** cho biết rằng một phần tử và nội dung của nó càng độc lập với phần còn lại của cây tài liệu càng tốt.
Containment (cô lập) cho phép tách biệt một phần của DOM, mang lại lợi ích hiệu năng bằng cách giới hạn tính toán bố cục, style, paint, kích thước hoặc bất kỳ tổ hợp nào trong một cây con DOM thay vì toàn bộ trang. Containment cũng có thể được dùng để phạm vi hóa bộ đếm và dấu ngoặc kép CSS.

{{InteractiveExample("CSS Demo: contain")}}

```css interactive-example-choice
contain: none;
```

```css interactive-example-choice
contain: size;
```

```css interactive-example-choice
contain: layout;
```

```css interactive-example-choice
contain: paint;
```

```css interactive-example-choice
contain: strict;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="card" id="example-element">
    <h2>Element with '<code>contain</code>'</h2>
    <p>
      The Goldfish is a species of domestic fish best known for its bright
      colors and patterns.
    </p>
    <div class="fixed"><p>Fixed right 4px</p></div>
  </div>
</section>
```

```css interactive-example
h2 {
  margin-top: 0;
}

#default-example {
  text-align: left;
  padding: 4px;
  font-size: 16px;
}

.card {
  text-align: left;
  border: 3px dotted;
  padding: 20px;
  margin: 10px;
  width: 85%;
  min-height: 150px;
}

.fixed {
  position: fixed;
  border: 3px dotted;
  right: 4px;
  padding: 4px;
  margin: 4px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
contain: none;
contain: strict;
contain: content;
contain: size;
contain: inline-size;
contain: layout;
contain: style;
contain: paint;

/* Nhiều từ khóa */
contain: size paint;
contain: size layout paint;
contain: inline-size layout;

/* Giá trị toàn cục */
contain: inherit;
contain: initial;
contain: revert;
contain: revert-layer;
contain: unset;
```

### Giá trị

Thuộc tính `contain` có thể có bất kỳ giá trị nào sau đây:

- Từ khóa `none` **hoặc**
- Một hoặc nhiều từ khóa cách nhau bằng dấu cách `size` (hoặc `inline-size`), `layout`, `style`, và `paint` theo bất kỳ thứ tự nào **hoặc**
- Một trong các giá trị viết tắt `strict` hoặc `content`

Các từ khóa có ý nghĩa như sau:

- `none`
  - : Phần tử hiển thị bình thường, không áp dụng containment.
- `strict`
  - : Áp dụng tất cả các quy tắc containment cho phần tử. Tương đương với `contain: size layout paint style`.
- `content`
  - : Áp dụng tất cả các quy tắc containment ngoại trừ `size` cho phần tử. Tương đương với `contain: layout paint style`.
- `size`
  - : Áp dụng size containment cho phần tử theo cả chiều ngang và dọc. Kích thước của phần tử có thể được tính toán độc lập, bỏ qua các phần tử con. Giá trị này không thể kết hợp với `inline-size`.
- `inline-size`
  - : Áp dụng inline size containment cho phần tử. Kích thước ngang (inline size) của phần tử có thể được tính toán độc lập, bỏ qua các phần tử con. Giá trị này không thể kết hợp với `size`.
- `layout`
  - : Bố cục nội bộ của phần tử được cô lập với phần còn lại của trang. Điều này có nghĩa là không có gì bên ngoài phần tử ảnh hưởng đến bố cục nội bộ của nó, và ngược lại.
- `style`
  - : Đối với các thuộc tính có thể ảnh hưởng đến nhiều hơn chỉ một phần tử và con của nó, các hiệu ứng không thoát ra ngoài phần tử chứa. Bộ đếm và dấu ngoặc kép được phạm vi hóa cho phần tử và nội dung của nó.
- `paint`
  - : Các phần tử con của phần tử không hiển thị bên ngoài ranh giới của nó. Nếu vùng chứa nằm ngoài màn hình, trình duyệt không cần vẽ các phần tử bên trong — chúng cũng phải nằm ngoài màn hình vì được chứa hoàn toàn bởi hộp đó. Nếu một phần tử con tràn ra ngoài ranh giới của phần tử chứa, phần tử con đó sẽ bị cắt theo border-box của phần tử chứa.

## Mô tả

Có bốn loại CSS containment: size, layout, style và paint, được đặt trên vùng chứa.
Thuộc tính là danh sách cách nhau bằng dấu cách gồm một tập con của năm giá trị chuẩn hoặc một trong hai giá trị viết tắt.
Các thay đổi đối với các thuộc tính được chứa trong vùng chứa không lan truyền ra ngoài phần tử được chứa đến phần còn lại của trang.
Lợi ích chính của containment là trình duyệt không phải re-render DOM hoặc bố cục trang thường xuyên, dẫn đến cải thiện hiệu năng nhỏ khi hiển thị trang tĩnh và cải thiện hiệu năng lớn hơn trong các ứng dụng động hơn.

Sử dụng thuộc tính `contain` hữu ích trên các trang có các nhóm phần tử được cho là độc lập, vì nó có thể ngăn nội bộ phần tử gây ra tác dụng phụ bên ngoài hộp giới hạn của nó.

> [!NOTE]
> Sử dụng các giá trị `layout`, `paint`, `strict` hoặc `content` cho thuộc tính này tạo ra:
>
> 1. Một [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) mới (cho các phần tử con có thuộc tính {{cssxref("position")}} là `absolute` hoặc `fixed`).
> 2. Một [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới.
> 3. Một [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Paint containment

Ví dụ sau đây cho thấy cách sử dụng `contain: paint` để ngăn các phần tử con của một phần tử vẽ bên ngoài ranh giới của nó.

```css
div {
  width: 100px;
  height: 100px;
  background: red;
  margin: 10px;
  font-size: 20px;
}

.contain-paint {
  contain: paint;
}
```

```html
<div class="contain-paint">
  <p>This text will be clipped to the bounds of the box.</p>
</div>
<div>
  <p>This text will not be clipped to the bounds of the box.</p>
</div>
```

{{EmbedLiveSample("Paint_containment", "100%", 280)}}

### Layout containment

Hãy xem xét ví dụ dưới đây cho thấy cách các phần tử hoạt động có và không có layout containment được áp dụng:

```html
<div class="card contain-layout">
  <h2>Card 1</h2>
  <div class="fixed"><p>Fixed box 1</p></div>
  <div class="float"><p>Float box 1</p></div>
</div>
<div class="card">
  <h2>Card 2</h2>
  <div class="fixed"><p>Fixed box 2</p></div>
  <div class="float"><p>Float box 2</p></div>
</div>
<div class="card">
  <h2>Card 3</h2>
  <!-- ... -->
</div>
```

```css hidden
p {
  margin: 4px;
  padding: 4px;
}

h2 {
  margin-bottom: 4px;
  padding: 10px;
}

div {
  border-radius: 4px;
  box-shadow: 0 2px 4px 0 gray;
  padding: 6px;
  margin: 6px;
}
```

```css
.card {
  width: 70%;
  height: 90px;
}

.fixed {
  position: fixed;
  right: 10px;
  top: 10px;
  background: coral;
}

.float {
  float: left;
  margin: 10px;
  background: aquamarine;
}

.contain-layout {
  contain: layout;
}
```

Thẻ đầu tiên có layout containment được áp dụng, và bố cục của nó được cô lập với phần còn lại của trang.
Chúng ta có thể tái sử dụng thẻ này ở nơi khác trên trang mà không lo về việc tính toán lại bố cục của các phần tử khác.
Nếu các float chồng lên ranh giới thẻ, các phần tử trên phần còn lại của trang không bị ảnh hưởng.
Khi trình duyệt tính toán lại cây con của phần tử chứa, chỉ phần tử đó được tính toán lại. Không có gì bên ngoài phần tử được chứa cần được tính toán lại.
Ngoài ra, hộp fixed dùng thẻ làm vùng chứa bố cục để định vị chính nó.

Thẻ thứ hai và thứ ba không có containment.
Ngữ cảnh bố cục cho hộp fixed trong thẻ thứ hai là phần tử gốc nên hộp fixed được đặt ở góc trên bên phải của trang.
Một float chồng lên ranh giới thẻ thứ hai làm thẻ thứ ba có sự dịch chuyển bố cục không mong muốn, rõ ràng qua vị trí của phần tử `<h2>`.
Khi tính toán lại xảy ra, nó không bị giới hạn trong một vùng chứa.
Điều này ảnh hưởng đến hiệu năng và gây rối với phần còn lại của bố cục trang.

{{EmbedLiveSample("Layout_containment", "100%", 350)}}

### Style containment

Style containment phạm vi hóa [bộ đếm](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters) và [dấu ngoặc kép](/en-US/docs/Web/CSS/Reference/Properties/quotes) cho phần tử được chứa.
Đối với bộ đếm CSS, các thuộc tính {{cssxref("counter-increment")}} và {{cssxref("counter-set")}} được phạm vi hóa cho phần tử như thể phần tử đó ở gốc tài liệu.

#### Containment và bộ đếm

Ví dụ dưới đây xem xét cách bộ đếm hoạt động khi style containment được áp dụng:

```html
<ul>
  <li>Item A</li>
  <li>Item B</li>
  <li class="container">Item C</li>
  <li>Item D</li>
  <li>Item E</li>
</ul>
```

```css
body {
  counter-reset: list-items;
}

li::before {
  counter-increment: list-items;
  content: counter(list-items) ": ";
}

.container {
  contain: style;
}
```

Nếu không có containment, bộ đếm sẽ tăng từ 1 đến 5 cho mỗi mục danh sách.
Style containment làm cho thuộc tính {{cssxref("counter-increment")}} được phạm vi hóa cho cây con của phần tử và bộ đếm bắt đầu lại từ 1:

{{EmbedLiveSample('Containment_and_counters', '100%', 140)}}

#### Containment và dấu ngoặc kép

Dấu ngoặc kép CSS cũng bị ảnh hưởng tương tự khi các giá trị `content` liên quan đến dấu ngoặc kép được phạm vi hóa cho phần tử:

```html
<!-- With style containment -->
<span class="open-quote">
  outer
  <span class="contain-style">
    <span class="open-quote">inner</span>
  </span>
</span>
<span class="close-quote">close</span>
<br />
<!-- Without containment -->
<span class="open-quote">
  outer
  <span>
    <span class="open-quote">inner</span>
  </span>
</span>
<span class="close-quote">close</span>
```

```css
body {
  quotes: "[" "]" "‹" "›";
}
.open-quote::before {
  content: open-quote;
}

.close-quote::after {
  content: close-quote;
}

.contain-style {
  contain: style;
}
```

Do containment, dấu đóng ngoặc đầu tiên bỏ qua span bên trong và dùng dấu đóng ngoặc của span bên ngoài thay thế:

{{EmbedLiveSample('Containment_and_quotes', '100%', 40)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- Thuộc tính CSS {{cssxref("content-visibility")}}
- Thuộc tính CSS {{cssxref("position")}}
