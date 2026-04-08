---
title: ::after
slug: Web/CSS/Reference/Selectors/::after
page-type: css-pseudo-element
browser-compat: css.selectors.after
sidebar: cssref
---

Trong CSS, **`::after`** tạo ra một [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) là phần tử con cuối cùng của phần tử được chọn. Nó thường được dùng để thêm nội dung trang trí vào một phần tử thông qua thuộc tính {{CSSxRef("content")}}. Theo mặc định, nó là inline.

{{InteractiveExample("CSS Demo: ::after", "tabbed-standard")}}

```css interactive-example
a::after {
  content: " (" attr(href) ")";
}

.dead-link {
  text-decoration: line-through;
}

.dead-link::after {
  content: url("/shared-assets/images/examples/warning.svg");
  display: inline-block;
  width: 12px;
  height: 12px;
}
```

```html interactive-example
<p>
  The sailfish is named for its sail-like dorsal fin and is widely considered
  the fastest fish in the ocean.
  <a href="https://en.wikipedia.org/wiki/Sailfish"
    >You can read more about it here</a
  >.
</p>

<p>
  The red lionfish is a predatory scorpionfish that lives on coral reefs of the
  Indo-Pacific Ocean and more recently in the western Atlantic.
  <a href="" class="dead-link">You can read more about it here</a>.
</p>
```

## Cú pháp

```css-nolint
::after {
  content: /* value */;
  /* properties */
}
```

## Mô tả

Phần tử giả `::after` là một hộp inline được tạo ra như một phần tử con trực tiếp của phần tử mà nó được liên kết, hay còn gọi là "phần tử gốc". Nó thường được dùng để thêm nội dung trang trí vào một phần tử thông qua thuộc tính {{CSSxRef("content")}}, chẳng hạn như biểu tượng, dấu ngoặc kép hoặc các trang trí khác.

Các phần tử giả `::after` không thể áp dụng cho _{{ glossary("replaced elements")}}_ chẳng hạn như {{htmlelement("img")}}, vì nội dung của chúng được xác định bởi tài nguyên bên ngoài và không bị ảnh hưởng bởi kiểu dáng của tài liệu hiện tại.

Một phần tử giả `::after` với giá trị {{cssxref("display")}} là `list-item` sẽ hoạt động như một mục danh sách, và do đó có thể tạo ra một phần tử giả {{cssxref("::marker")}} giống như phần tử {{htmlelement("li")}}.

Nếu thuộc tính {{cssxref("content")}} không được chỉ định, có giá trị không hợp lệ, hoặc có giá trị `normal` hay `none`, thì phần tử giả `::after` sẽ không được hiển thị. Nó hoạt động như thể `display: none` được đặt.

> [!NOTE]
> Đặc tả [Selectors Level 3](https://drafts.csswg.org/selectors-3/#gen-content) đã giới thiệu ký hiệu dấu hai chấm kép `::after` để phân biệt [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) với [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements). Các trình duyệt cũng chấp nhận ký hiệu dấu hai chấm đơn `:after`, được giới thiệu trong CSS2.

Theo mặc định, các phần tử giả `::before` và `::after` chia sẻ cùng ngữ cảnh xếp chồng với phần tử cha của chúng. Nếu không có {{cssxref("z-index")}} được đặt tường minh, nội dung được tạo ra bởi phần tử giả `::after` sẽ xuất hiện phía trên nội dung của phần tử giả `::before` vì `::after` được hiển thị sau trong luồng DOM.

## Khả năng tiếp cận

Việc sử dụng phần tử giả `::after` để thêm nội dung không được khuyến khích, vì nó không được trình đọc màn hình truy cập một cách đáng tin cậy.

## Ví dụ

### Sử dụng cơ bản

Hãy tạo hai lớp: một cho các đoạn văn nhàm chán và một cho các đoạn văn thú vị. Chúng ta có thể dùng các lớp này để thêm phần tử giả vào cuối các đoạn văn.

#### HTML

```html
<p class="boring-text">Here is some plain old boring text.</p>
<p>Here is some normal text that is neither boring nor exciting.</p>
<p class="exciting-text">Contributing to MDN is fun.</p>
```

#### CSS

```css
.exciting-text::after {
  content: " <- EXCITING!";
  color: darkgreen;
  font-weight: bolder;
}

.boring-text::after {
  content: " <- BORING";
  color: darkviolet;
  font-weight: bolder;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_usage', 500, 150)}}

### Ví dụ trang trí

Chúng ta có thể tạo kiểu cho văn bản hoặc hình ảnh trong thuộc tính {{CSSxRef("content")}} theo hầu hết bất kỳ cách nào chúng ta muốn.

#### HTML

```html
<span class="ribbon">Look at the orange box after this text. </span>
```

#### CSS

```css
.ribbon {
  background-color: #5bc8f7;
}

.ribbon::after {
  content: "This is a fancy orange box.";
  background-color: #ffba10;
  border-color: black;
  border-style: dotted;
}
```

#### Kết quả

{{EmbedLiveSample('Decorative_example', 450, 20)}}

### Chú giải công cụ

Ví dụ này sử dụng `::after`, kết hợp với biểu thức CSS [`attr()`](/en-US/docs/Web/CSS/Reference/Values/attr) và thuộc tính dữ liệu tùy chỉnh `data-description` [custom data attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*), để tạo chú giải công cụ. Không cần JavaScript!

Chúng ta cũng có thể hỗ trợ người dùng bàn phím với kỹ thuật này, bằng cách thêm `tabindex` là `0` để mỗi `span` có thể nhận tiêu điểm bằng bàn phím, và sử dụng bộ chọn CSS `:focus`. Điều này cho thấy `::before` và `::after` linh hoạt đến mức nào, mặc dù để có trải nghiệm dễ tiếp cận nhất, một widget tiết lộ ngữ nghĩa được tạo theo cách khác (chẳng hạn với các phần tử [details và summary](/en-US/docs/Web/HTML/Reference/Elements/details)) có thể phù hợp hơn.

#### HTML

```html
<p>
  Here we have some
  <span tabindex="0" data-description="collection of words and punctuation">
    text
  </span>
  with a few
  <span tabindex="0" data-description="small popups that appear when hovering">
    tooltips</span
  >.
</p>
```

#### CSS

```css
span[data-description] {
  position: relative;
  text-decoration: underline;
  color: blue;
  cursor: help;
}

span[data-description]:hover::after,
span[data-description]:focus::after {
  content: attr(data-description);
  position: absolute;
  left: 0;
  top: 24px;
  min-width: 200px;
  border: 1px #aaaaaa solid;
  border-radius: 10px;
  background-color: #ffffcc;
  padding: 12px;
  color: black;
  font-size: 14px;
  z-index: 1;
}
```

#### Kết quả

{{EmbedLiveSample('Tooltips', 450, 120)}}

### Phần tử giả lồng nhau `::after::marker`

Phần tử giả lồng nhau `::after::marker` [nested pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#nesting_pseudo-elements) chọn {{CSSxRef("::marker")}} danh sách của một phần tử giả `::after` mà bản thân nó là một mục danh sách, tức là có thuộc tính {{CSSxRef("display")}} được đặt thành `list-item`.

Trong demo này, chúng ta tạo ra các mục danh sách bổ sung trước và sau menu điều hướng danh sách bằng cách dùng `::before` và `::after` (đặt chúng thành `display: list-item` để chúng hoạt động như các mục danh sách). Sau đó, chúng ta dùng `ul::before::marker` và `ul::after::marker` để đặt màu khác cho các điểm đánh dấu danh sách của chúng.

#### HTML

```html
<ul>
  <li><a href="#">Introduction</a></li>
  <li><a href="#">Getting started</a></li>
  <li><a href="#">Understanding the basics</a></li>
</ul>
```

#### CSS

```css
ul {
  font-size: 1.5rem;
  font-family: "Helvetica", "Arial", sans-serif;
}

ul::before,
ul::after {
  display: list-item;
  color: orange;
}

ul::before {
  content: "Start";
}

ul::after {
  content: "End";
}

ul::before::marker,
ul::after::marker {
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('`::after::marker` nested pseudo-elements', 450, 200)}}

Trong khi các dấu đầu dòng danh sách của ba mục điều hướng được tạo ra vì chúng là các phần tử `<li>`, "Start" và "End" đã được chèn vào thông qua các phần tử giả và `::marker` được dùng để tạo kiểu cho các dấu đầu dòng của chúng.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("::before")}}
- {{CSSxRef("content")}}
