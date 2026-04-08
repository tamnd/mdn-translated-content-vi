---
title: counter-reset
slug: Web/CSS/Reference/Properties/counter-reset
page-type: css-property
browser-compat: css.properties.counter-reset
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`counter-reset`** tạo các [bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters) được đặt tên và khởi tạo chúng về một giá trị cụ thể. Nó hỗ trợ tạo các bộ đếm đếm tăng từ một đến số lượng phần tử, cũng như các bộ đếm đếm giảm từ số lượng phần tử về một.

{{InteractiveExample("CSS Demo: counter-reset")}}

```css interactive-example-choice
counter-reset: none;
```

```css interactive-example-choice
counter-reset: chapter-count 0;
```

```css interactive-example-choice
counter-reset: chapter-count;
```

```css interactive-example-choice
counter-reset: chapter-count 5;
```

```css interactive-example-choice
counter-reset: chapter-count -5;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="chapters">
    <h1>Alice's Adventures in Wonderland</h1>
    <h2>Down the Rabbit-Hole</h2>
    <h2 id="example-element">The Pool of Tears</h2>
    <h2>A Caucus-Race and a Long Tale</h2>
    <h2>The Rabbit Sends in a Little Bill</h2>
  </div>
</section>
```

```css interactive-example
#default-example {
  text-align: left;
  counter-reset: chapter-count;
}

#example-element {
  background-color: lightblue;
  color: black;
}

h2 {
  counter-increment: chapter-count;
  font-size: 1em;
}

h2::before {
  content: "Chapter " counters(chapter-count, ".") ": ";
}
```

## Cú pháp

```css
/* Create a counter with initial default value 0 */
counter-reset: my-counter;

/* Create a counter and initialize as "-3" */
counter-reset: my-counter -3;

/* Create a reversed counter with initial default value */
counter-reset: reversed(my-counter);

/* Create a reversed counter and initialize as "-1" */
counter-reset: reversed(my-counter) -1;

/* Create reversed and regular counters at the same time */
counter-reset: reversed(pages) 10 items 1 reversed(sections) 4;

/* Remove all counter-reset declarations in less specific rules */
counter-reset: none;

/* Global values */
counter-reset: inherit;
counter-reset: initial;
counter-reset: revert;
counter-reset: revert-layer;
counter-reset: unset;
```

### Giá trị

Thuộc tính `counter-reset` chấp nhận một danh sách một hoặc nhiều tên bộ đếm phân tách bởi khoảng trắng, hoặc từ khóa `none`. Với tên bộ đếm, bộ đếm thông thường dùng định dạng `<counter-name>`, và bộ đếm đảo ngược dùng `reversed(<counter-name>)`, trong đó `<counter-name>` là {{cssxref("custom-ident", "&lt;custom-ident&gt;")}} hoặc `list-item` cho bộ đếm {{HTMLElement("ol")}} tích hợp sẵn. Tùy chọn, mỗi tên bộ đếm có thể được theo sau bởi một `<integer>` để đặt giá trị khởi tạo của nó.

- {{cssxref("custom-ident", "&lt;custom-ident&gt;")}}
  - : Chỉ định tên bộ đếm cần tạo và khởi tạo bằng định dạng {{cssxref("custom-ident", "&lt;custom-ident&gt;")}}. Ký hiệu hàm `reversed()` có thể được dùng để đánh dấu bộ đếm là đảo ngược.
- {{cssxref("&lt;integer&gt;")}}
  - : Giá trị khởi tạo để đặt trên bộ đếm mới được tạo. Mặc định là `0` nếu không chỉ định.
- `none`
  - : Chỉ định rằng không có khởi tạo bộ đếm nào xảy ra. Giá trị này hữu ích để ghi đè các giá trị `counter-reset` trong các quy tắc ít cụ thể hơn.

## Mô tả

Thuộc tính `counter-reset` có thể tạo cả bộ đếm thông thường và bộ đếm đảo ngược (trong các trình duyệt hỗ trợ). Bạn có thể tạo nhiều bộ đếm thông thường và đảo ngược, mỗi cái được phân tách bởi khoảng trắng. Bộ đếm có thể là tên độc lập hoặc cặp tên-giá trị được phân tách bởi khoảng trắng.

> [!WARNING]
> Có [sự khác biệt giữa thuộc tính `counter-reset` và `counter-set`](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters#difference_between_counter-set_and_counter-reset). Sau khi tạo bộ đếm bằng `counter-reset`, bạn có thể điều chỉnh giá trị của nó bằng thuộc tính {{cssxref("counter-set")}}. Điều này có vẻ ngược đời vì, mặc dù tên của nó, thuộc tính `counter-reset` được dùng để tạo và khởi tạo bộ đếm, trong khi thuộc tính `counter-set` được dùng để đặt lại giá trị của bộ đếm hiện có.

Đặt `counter-increment: none` trên một selector với độ đặc hiệu cao hơn sẽ ghi đè việc tạo bộ đếm được đặt tên trên các selector có độ đặc hiệu thấp hơn.

### Giá trị khởi tạo mặc định

Các giá trị khởi tạo mặc định của cả bộ đếm thông thường và đảo ngược cho phép triển khai hai mẫu đánh số phổ biến nhất: đếm tăng từ một đến số lượng phần tử và đếm giảm từ số lượng phần tử về một. Bằng cách thêm giá trị bộ đếm cho bộ đếm được đặt tên, bộ đếm của bạn có thể đếm tăng hoặc giảm bắt đầu từ một giá trị số nguyên.

Bộ đếm thông thường mặc định là `0` nếu không có giá trị đặt lại nào được cung cấp. Theo mặc định, bộ đếm thông thường tăng thêm một, có thể điều chỉnh bằng thuộc tính {{cssxref("counter-increment")}}.

```css
h1 {
  /* Create the counters "chapter" and "page" and set to initial default value.
     Create the counter "section" and set to "4". */
  counter-reset: chapter section 4 page;
}
```

### Bộ đếm đảo ngược

Khi tạo bộ đếm đảo ngược mà không có giá trị, bộ đếm sẽ bắt đầu với giá trị bằng số lượng phần tử trong tập hợp, đếm giảm để phần tử cuối cùng trong tập hợp là `1`. Theo mặc định, bộ đếm đảo ngược giảm đi một; điều này cũng có thể được thay đổi bằng thuộc tính `counter-increment`.

```css
h1 {
  /* Create reversed counters "chapter" and "section".
      Set "chapter" as the number of elements and "section" as "10".
      Create the counter "pages" with the initial default value. */
  counter-reset: reversed(chapter) reversed(section) 10 pages;
}
```

### Bộ đếm `list-item` tích hợp sẵn

Danh sách có thứ tự ({{HTMLElement("ol")}}) đi kèm với các bộ đếm `list-item` tích hợp sẵn kiểm soát việc đánh số của chúng. Các bộ đếm này tự động tăng hoặc giảm một đơn vị với mỗi mục danh sách. Thuộc tính `counter-reset` có thể được dùng để đặt lại các bộ đếm `list-item`. Giống như với các bộ đếm khác, bạn có thể ghi đè giá trị tăng mặc định cho các bộ đếm `list-item` bằng cách dùng thuộc tính {{cssxref("counter-increment")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ghi đè bộ đếm `list-item`

Trong ví dụ này, thuộc tính `counter-reset` được dùng để đặt giá trị bắt đầu cho bộ đếm `list-item` ngầm định.

#### HTML

```html
<ol>
  <li>First</li>
  <li>Second</li>
  <li>Third</li>
  <li>Fourth</li>
  <li>Fifth</li>
</ol>
```

#### CSS

Sử dụng `counter-reset`, chúng ta đặt bộ đếm `list-item` ngầm định bắt đầu từ giá trị khác giá trị mặc định `1`:

```css
ol {
  counter-reset: list-item 3;
}
```

#### Kết quả

{{EmbedLiveSample("Overriding the list-item counter", 140, 300)}}

Sử dụng `counter-reset`, chúng ta đặt bộ đếm `list-item` ngầm định bắt đầu đếm từ `3` cho mỗi `ol`. Sau đó, mục đầu tiên sẽ được đánh số 4, mục thứ hai được đánh số 5, v.v., tương tự như hiệu ứng của việc viết [`<ol start="4">`](/en-US/docs/Web/HTML/Reference/Elements/ol#start) trong HTML.

### Sử dụng bộ đếm đảo ngược

Trong ví dụ sau, chúng ta đã khai báo một bộ đếm đảo ngược tên 'priority'. Bộ đếm được dùng để đánh số năm nhiệm vụ.

```html
<ul class="stack">
  <li>Task A</li>
  <li>Task B</li>
  <li>Task C</li>
  <li>Task D</li>
  <li>Task E</li>
</ul>
```

```css hidden
@supports not (counter-reset: reversed(priority)) {
  .stack {
    display: none;
  }
  body::after {
    content: "Your browser doesn't support the reversed counters yet.";
  }
}
```

```css
li::before {
  content: counter(priority) ". ";
  counter-increment: priority -1;
}

.stack {
  counter-reset: reversed(priority);
  list-style: none;
}
```

{{EmbedLiveSample("Using a reverse counter", 140, 150)}}

Trong kết quả, các mục được đánh số theo thứ tự đảo ngược từ 5 đến 1. Lưu ý trong code chúng ta không chỉ định giá trị khởi tạo của bộ đếm. Trình duyệt tự động tính giá trị khởi tạo vào thời điểm bố cục bằng cách sử dụng giá trị tăng của bộ đếm.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Sử dụng bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)
- Thuộc tính {{cssxref("counter-increment")}}
- Thuộc tính {{cssxref("counter-set")}}
- At-rule {{cssxref("@counter-style")}}
- Hàm {{cssxref("counter()")}} và {{cssxref("counters()")}}
- Thuộc tính {{cssxref("content")}}
- Lớp giả {{cssxref("::marker")}}
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
