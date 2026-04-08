---
title: Using CSS counters
short-title: Using counters
slug: Web/CSS/Guides/Counter_styles/Using_counters
page-type: guide
spec-urls: https://drafts.csswg.org/css-lists/#auto-numbering
sidebar: cssref
---

**CSS counters** cho phép bạn điều chỉnh sự xuất hiện của nội dung dựa trên vị trí của nó trong tài liệu.
Ví dụ, bạn có thể sử dụng counters để tự động đánh số các tiêu đề trên trang web hoặc thay đổi việc đánh số trên danh sách có thứ tự.

Counters về cơ bản là các biến được duy trì bởi CSS mà các giá trị của chúng có thể được tăng lên hoặc giảm xuống bởi các quy tắc CSS theo dõi số lần chúng được sử dụng. Các điều sau đây ảnh hưởng đến giá trị counter trên một phần tử:

1. Counters được [kế thừa](#counter_inheritance_and_propagation) từ phần tử cha hoặc nhận từ sibling trước đó.
2. Counters mới được khởi tạo bằng thuộc tính {{cssxref("counter-reset")}}.
3. Counters được tăng lên bằng thuộc tính {{cssxref("counter-increment")}}.
4. Counters được đặt trực tiếp thành một giá trị bằng thuộc tính {{cssxref("counter-set")}}.

Bạn có thể định nghĩa các named counters tùy chỉnh của riêng mình, và bạn cũng có thể thao tác với counter `list-item` được tạo theo mặc định cho tất cả các danh sách có thứ tự.

## Sử dụng counters

Để sử dụng một counter, trước tiên nó phải được khởi tạo thành một giá trị bằng thuộc tính {{cssxref("counter-reset")}}.
Giá trị counter có thể được tăng lên hoặc giảm xuống bằng thuộc tính {{cssxref("counter-increment")}} và có thể được đặt trực tiếp thành một giá trị cụ thể bằng thuộc tính {{cssxref("counter-set")}}.
Giá trị hiện tại của một counter được hiển thị bằng hàm {{cssxref("counter()")}} hoặc {{cssxref("counters()")}}, thường trong thuộc tính {{CSSxRef("content")}} của [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements).

Counters chỉ có thể được đặt, reset, hoặc tăng lên trong các phần tử tạo ra boxes.
Ví dụ, nếu một phần tử được đặt thành `display: none` thì bất kỳ thao tác counter nào trên phần tử đó sẽ bị bỏ qua.

Các thuộc tính của counters có thể được giới hạn trong phạm vi các phần tử cụ thể bằng cách sử dụng style containment được mô tả chi tiết hơn trong thuộc tính {{cssxref("contain")}}.

### Thao tác giá trị counter

Để sử dụng CSS counter, trước tiên nó phải được khởi tạo thành một giá trị bằng thuộc tính {{cssxref("counter-reset")}}.
Thuộc tính cũng có thể được sử dụng để thay đổi giá trị counter thành bất kỳ số cụ thể nào.

Dưới đây chúng ta khởi tạo một counter có tên `section` với giá trị mặc định (0).

```css
counter-reset: section;
```

Bạn cũng có thể khởi tạo nhiều counters, tùy chọn chỉ định giá trị ban đầu cho mỗi counter.
Dưới đây chúng ta khởi tạo các counters `section` và `topic` với giá trị mặc định, và counter `page` thành 3.

```css
counter-reset: section page 3 topic;
```

Sau khi khởi tạo, giá trị counter có thể được tăng lên hoặc giảm xuống bằng cách sử dụng {{cssxref("counter-increment")}}.
Ví dụ, khai báo sau sẽ tăng counter `section` lên một trên mỗi thẻ `h3`.

```css
h3::before {
  counter-increment: section; /* Tăng giá trị counter section lên 1 */
}
```

Bạn có thể chỉ định lượng tăng hoặc giảm sau tên counter. Nó có thể là số dương hoặc số âm, nhưng mặc định là `1` nếu không có số nguyên nào được cung cấp.

Ngoài việc được tăng lên hoặc giảm xuống, counters cũng có thể được đặt rõ ràng thành một giá trị bằng thuộc tính {{cssxref("counter-set")}}.

```css
.done::before {
  counter-set: section 20;
}
```

Tên counter không được là `none`, `inherit`, hoặc `initial`; nếu không khai báo sẽ bị bỏ qua.

### Hiển thị counter

Giá trị của một counter có thể được hiển thị bằng cách sử dụng hàm {{cssxref("counter()")}} hoặc {{cssxref("counters()")}} trong thuộc tính {{cssxref("content")}}.

Ví dụ, khai báo sau sử dụng `counter()` để thêm tiền tố cho mỗi tiêu đề `h3` với văn bản `Section <number>:`, trong đó `<number>` là giá trị của count theo dạng thập phân (kiểu hiển thị mặc định):

```css
body {
  counter-reset: section; /* Đặt counter có tên 'section', giá trị ban đầu là 0. */
}

h3::before {
  counter-increment: section; /* Tăng giá trị counter section lên 1 */
  content: "Section " counter(section) ": "; /* Hiển thị giá trị counter theo kiểu mặc định (thập phân) */
}
```

Hàm {{cssxref("counter()")}} được sử dụng khi việc đánh số các mức lồng nhau không bao gồm ngữ cảnh của các mức cha.
Ví dụ, ở đây mỗi mức lồng nhau bắt đầu lại từ một:

```plain
1 One
  1 Nested one
  2 Nested two
2 Two
  1 Nested one
  2 Nested two
  3 Nested three
3 Three
```

Hàm {{cssxref("counters()")}} được sử dụng khi count cho các mức lồng nhau phải bao gồm count từ các mức cha.
Ví dụ, bạn có thể sử dụng điều này để bố trí các phần như được hiển thị:

```plain
1 One
  1.1 Nested one
  1.2 Nested two
2 Two
  2.1 Nested one
  2.2 Nested two
  2.3 Nested three
3 Three
```

Hàm {{cssxref("counter()")}} có hai dạng: `counter(<counter-name>)` và `counter(<counter-name>, <counter-style>)`.
Văn bản được tạo ra là giá trị của counter trong cùng có tên đã cho trong phạm vi tại pseudo-element.

Hàm {{cssxref("counters()")}} cũng có hai dạng: `counters(<counter-name>, <separator>)` và `counters(<counter-name>, <separator>, <counter-style>)`.
Văn bản được tạo ra là giá trị của tất cả các counters có tên đã cho trong phạm vi tại pseudo-element đã cho, từ ngoài cùng đến trong cùng, được phân tách bởi chuỗi được chỉ định (`<separator>`).

Counter được render theo `<counter-style>` được chỉ định cho cả hai phương thức (mặc định là `decimal`).
Bạn có thể sử dụng bất kỳ giá trị {{cssxref("list-style-type")}} nào hoặc các [kiểu tùy chỉnh](/en-US/docs/Web/CSS/Guides/Counter_styles) của riêng bạn.

Các ví dụ minh họa việc sử dụng `counter()` và `counters()` được đưa ra bên dưới trong [ví dụ cơ bản](#basic_example) và [Ví dụ về counter lồng nhau](#example_of_a_nested_counter), tương ứng.

### Reversed counters

Một reversed counter là counter được thiết kế để đếm xuống (giảm dần) thay vì đếm lên (tăng dần).
Reversed counters được tạo bằng cách sử dụng ký hiệu hàm `reversed()` khi đặt tên counter trong {{cssxref("counter-reset")}}.

Reversed counters có giá trị ban đầu mặc định bằng số lượng phần tử (không giống như các counters thông thường có giá trị mặc định là 0).
Điều này cho phép triển khai một counter đếm từ số lượng phần tử xuống một.

Ví dụ, để tạo một reversed counter có tên `section` với giá trị ban đầu mặc định, bạn sẽ sử dụng cú pháp sau:

```css
counter-reset: reversed(section);
```

Bạn tất nhiên có thể chỉ định bất kỳ giá trị ban đầu nào bạn muốn.

Giá trị counter được giảm xuống bằng cách chỉ định giá trị âm cho {{cssxref("counter-increment")}}.

> [!NOTE]
> Bạn cũng có thể sử dụng {{cssxref("counter-increment")}} để giảm một counter không reversed.
> Lợi ích chính của việc sử dụng reversed counter là giá trị ban đầu mặc định, và counter `list-item` tự động giảm reversed counters.

### Kế thừa và truyền counter

Mỗi phần tử hoặc pseudo-element có một tập hợp counters trong phạm vi của phần tử đó. Các counters ban đầu trong tập hợp được nhận từ phần tử cha và sibling trước đó. Các giá trị counter được nhận từ phần tử con cuối cùng của sibling trước đó, sibling cuối cùng, hoặc phần tử cha.

Khi một phần tử khai báo một counter, counter được lồng bên trong counter có cùng tên nhận từ phần tử cha. Nếu phần tử cha không có counter có cùng tên thì counter được thêm vào tập hợp counters của phần tử như nó là. Một counter có cùng tên nhận từ sibling trước đó sẽ bị xóa khỏi tập hợp counters.

Hàm {{cssxref("counter()")}} truy xuất counter trong cùng với tên được cung cấp. Và hàm {{cssxref("counters()")}} truy xuất toàn bộ counter tree với tên đã cho.

Trong ví dụ sau, chúng ta đang minh họa một inherited counter có tên `primary` và một sibling counter có tên `secondary`. Tất cả các phần tử `<div>` hiển thị counters của chúng bằng hàm `counters()`. Lưu ý rằng tất cả các counters đã được tạo bằng thuộc tính `counter-reset`, và không có counter nào được tăng lên.

```html
<section>
  counter-reset: primary 3
  <div>A</div>
  <div>B</div>
  <div>C</div>
  <div class="same-primary-name">D</div>
  <span> counter-reset: primary 6</span>
  <div>E</div>
  <div class="new-secondary-name">F</div>
  <span> counter-reset: secondary 5</span>
  <div>G</div>
  <div>H</div>
  <div class="same-secondary-name">I&nbsp;</div>
  <span> counter-reset: secondary 10</span>
  <div>J&nbsp;</div>
  <div>K</div>
  <section></section>
</section>
```

```css hidden
.same-primary-name,
.new-secondary-name,
.same-secondary-name {
  display: inline-block;
}

@counter-style style {
  system: numeric;
  symbols: "" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10";
}
```

```css
/* tạo counter 'primary' trên phần tử cha của divs */
section {
  counter-reset: primary 3;
}

div::after {
  content: " ('primary' counters: " counters(primary, "-", style)
    ", 'secondary' counters: " counters(secondary, "-", style) ")";
  color: blue;
}

/* tạo counter 'primary' mới */
.same-primary-name {
  counter-reset: primary 6;
}

/* tạo counter 'secondary' trên div 'F' */
.new-secondary-name {
  counter-reset: secondary 5;
}

/* ghi đè sibling counter 'secondary' */
.same-secondary-name {
  counter-reset: secondary 10;
}
```

{{EmbedLiveSample("Counter inheritance and propagation", "100%", 250)}}

Phần tử section khởi tạo một counter có tên `primary` với giá trị `3`, và tất cả các `<div>` con nhận counter `primary` được kế thừa. Phần tử 'D' tạo ra một counter `primary` mới (giá trị `6`) được lồng trong counter nhận từ cha, do đó phần tử có hai counters có tên `primary` với các giá trị `3` và `6`.

Phần tử 'F' tạo ra counter `secondary` (giá trị `5`) lần đầu tiên, và truyền counter đến sibling tiếp theo 'G'. Phần tử 'G' truyền counter đến phần tử tiếp theo 'H' và cứ thế tiếp tục. Tiếp theo, phần tử 'I' tạo ra một counter mới có cùng tên `secondary` (giá trị `10`), nhưng nó loại bỏ counter `secondary` (giá trị `5`) nhận từ sibling trước đó 'H' và truyền counter của riêng mình cho 'J'.

### Sự khác biệt giữa counter-set và counter-reset

Thuộc tính {{cssxref("counter-set")}} cập nhật một counter hiện có và nếu không có counter nào với tên đó tồn tại thì một counter mới được khởi tạo. Thuộc tính {{cssxref("counter-reset")}} _luôn luôn_ tạo ra một counter mới.

Trong ví dụ sau, chúng ta có hai sub-lists bên trong một parent list. Mỗi list item đã được đánh số bằng cách sử dụng một counter có tên 'item'. Sub-list đầu tiên sử dụng thuộc tính {{cssxref("counter-set")}} và sub-list thứ hai sử dụng thuộc tính {{cssxref("counter-reset")}} để thay đổi counter 'item'.

```html
<ul class="parent">
  <li>A</li>
  <li>B</li>
  <li>
    C (the counter updated using `counter-set`)
    <ul class="sub-list-one">
      <li>sub-A</li>
      <li>sub-B</li>
    </ul>
  </li>
  <li>D</li>
  <li>
    E (a new counter created using `counter-reset`)
    <ul class="sub-list-two">
      <li>sub-A</li>
      <li>sub-B</li>
      <li>sub-C</li>
    </ul>
  </li>
  <li>F</li>
  <li>G</li>
</ul>
```

```css hidden
ul {
  list-style: none;
}
```

```css
/* tạo counter mới lần đầu tiên */
.parent {
  counter-reset: item 0;
}

/* tăng counter trên mỗi list item */
li {
  counter-increment: item;
}

/* hiển thị số trên list items */
li::before {
  content: counter(item) " ";
}

/* thay đổi giá trị counter hiện có */
.sub-list-one {
  counter-set: item 10;
}

/* thay đổi giá trị counter */
.sub-list-two {
  counter-reset: item 0;
}
```

{{EmbedLiveSample("Difference between counter-set and counter-reset", "100%", 300)}}

Lưu ý cách các list items của sub-list đầu tiên bắt đầu nhận số từ `11`, và việc đánh số được tiếp tục trong parent list. Điều này là do thuộc tính `counter-set` cập nhật cùng counter 'item' được khai báo trên phần tử `.parent`. Sau đó lưu ý cách các list items của sub-list thứ hai nhận việc đánh số mới bắt đầu từ '1' và các parent list items sau đó không mang theo việc đánh số. Điều này là do thuộc tính `counter-reset` đã tạo ra một counter mới có cùng tên nên các parent list items tiếp tục sử dụng counter cũ.

### List item counters

Các danh sách có thứ tự, được tạo bằng các phần tử {{HTMLElement("ol")}}, có ngầm định một counter có tên `list-item`.

Giống như các counters khác, giá trị ban đầu mặc định là 0 cho các counters tăng dần và "số lượng items" cho reversed counters.
Không giống như các author-created counters, `list-item` _tự động_ tăng lên hoặc giảm xuống một cho mỗi phần tử danh sách, tùy thuộc vào việc counter có bị reversed hay không.

Counter `list-item` có thể được sử dụng để thao tác hành vi mặc định của danh sách có thứ tự bằng CSS.
Ví dụ, bạn có thể thay đổi giá trị ban đầu mặc định, hoặc sử dụng {{cssxref("counter-increment")}} để thay đổi cách các list items tăng lên hoặc giảm xuống.

## Ví dụ

### Ví dụ cơ bản

Ví dụ này thêm "Section \[giá trị counter]:" vào đầu mỗi tiêu đề.

#### CSS

```css
body {
  counter-reset: section; /* Đặt counter có tên 'section', giá trị ban đầu là 0. */
}

h3::before {
  counter-increment: section; /* Tăng giá trị counter section lên 1 */
  content: "Section " counter(section) ": "; /* Hiển thị chữ 'Section ', giá trị
                                                counter section, và dấu hai chấm trước nội dung
                                                của mỗi h3 */
}
```

#### HTML

```html
<h3>Introduction</h3>
<h3>Body</h3>
<h3>Conclusion</h3>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", "100%", 150)}}

### Ví dụ cơ bản: reversed counter

Ví dụ này giống với ví dụ trên nhưng sử dụng reversed counter.
Nếu trình duyệt của bạn hỗ trợ ký hiệu hàm `reversed()`, kết quả sẽ trông như thế này:

![reversed counter](reversed_headings_basic.png)

#### CSS

```css
body {
  counter-reset: reversed(
    section
  ); /* Đặt counter có tên 'section', giá trị ban đầu là 0. */
}

h3::before {
  counter-increment: section -1; /* Giảm giá trị counter section xuống 1 */
  content: "Section " counter(section) ": "; /* Hiển thị chữ 'Section ', giá trị
                                                counter section, và dấu hai chấm trước nội dung
                                                của mỗi h3 */
}
```

#### HTML

```html
<h3>Introduction</h3>
<h3>Body</h3>
<h3>Conclusion</h3>
```

#### Kết quả

{{EmbedLiveSample("Basic example: reversed counter", "100%", 150)}}

### Một ví dụ phức tạp hơn

Counter không nhất thiết phải được hiển thị mỗi lần nó được tăng lên.
Ví dụ này đếm tất cả các liên kết với counter chỉ hiển thị khi một liên kết không có văn bản, như một sự thay thế tiện lợi.

#### CSS

```css
:root {
  counter-reset: link;
}

a[href] {
  counter-increment: link;
}

a[href]:empty::after {
  content: "[" counter(link) "]";
}
```

#### HTML

```html
<p>See <a href="https://www.mozilla.org/" aria-label="Mozilla"></a></p>
<p>Do not forget to <a href="contact-me.html">leave a message</a>!</p>
<p>See also <a href="https://developer.mozilla.org/" aria-label="MDN"></a></p>
```

#### Kết quả

{{EmbedLiveSample("A_more_sophisticated_example", "100%", 150)}}

### Ví dụ về counter lồng nhau

Một CSS counter đặc biệt hữu ích để tạo danh sách phác thảo, vì một instance mới của counter được tự động tạo trong các phần tử con.
Sử dụng hàm {{cssxref("counters()")}}, văn bản phân tách có thể được chèn giữa các mức counter lồng nhau khác nhau.

#### CSS

```css
ol {
  counter-reset: section; /* Tạo một instance mới của
                             counter section với mỗi phần tử ol */
  list-style-type: none;
}

li::before {
  counter-increment: section; /* Chỉ tăng instance này
                                            của counter section */
  content: counters(section, ".") " "; /* Kết hợp các giá trị của tất cả các instance
                                          của counter section, được phân tách
                                          bởi dấu chấm */
}
```

#### HTML

```html-nolint
<ol>
  <li>item</li>          <!-- 1     -->
  <li>item               <!-- 2     -->
    <ol>
      <li>item</li>      <!-- 2.1   -->
      <li>item</li>      <!-- 2.2   -->
      <li>item           <!-- 2.3   -->
        <ol>
          <li>item</li>  <!-- 2.3.1 -->
          <li>item</li>  <!-- 2.3.2 -->
        </ol>
        <ol>
          <li>item</li>  <!-- 2.3.1 -->
          <li>item</li>  <!-- 2.3.2 -->
          <li>item</li>  <!-- 2.3.3 -->
        </ol>
      </li>
      <li>item</li>      <!-- 2.4   -->
    </ol>
  </li>
  <li>item</li>          <!-- 3     -->
  <li>item</li>          <!-- 4     -->
</ol>
<ol>
  <li>item</li>          <!-- 1     -->
  <li>item</li>          <!-- 2     -->
</ol>
```

#### Kết quả

{{EmbedLiveSample("Example_of_a_nested_counter", "100%", 350)}}

## Đặc tả

{{Specifications}}

## Xem thêm

- {{cssxref("contain")}}
- {{cssxref("counter-reset")}}
- {{cssxref("counter-set")}}
- {{cssxref("counter-increment")}}
- {{cssxref("@counter-style")}}
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
