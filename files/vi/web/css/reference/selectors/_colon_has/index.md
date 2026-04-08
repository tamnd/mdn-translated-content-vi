---
title: :has()
slug: Web/CSS/Reference/Selectors/:has
page-type: css-pseudo-class
browser-compat: css.selectors.has
sidebar: cssref
---

**`:has()`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) hàm trong [CSS](/en-US/docs/Web/CSS), đại diện cho một phần tử nếu bất kỳ [bộ chọn tương đối](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#relative_selector) nào được truyền làm đối số khớp với ít nhất một phần tử khi được neo vào phần tử này. Lớp giả này cung cấp một cách để chọn phần tử cha hoặc phần tử anh chị em trước đó so với một phần tử tham chiếu, bằng cách nhận một [danh sách bộ chọn tương đối](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#relative_selector_list) làm đối số.

```css
/* Selects an h1 heading with a
paragraph element that immediately follows
the h1 and applies the style to h1 */
h1:has(+ p) {
  margin-bottom: 0;
}
```

Lớp giả `:has()` nhận [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của bộ chọn cụ thể nhất trong đối số của nó, tương tự như cách {{cssxref(":is()")}} và {{cssxref(":not()")}} hoạt động.

## Cú pháp

```css-nolint
:has(<relative-selector-list>) {
  /* ... */
}
```

Nếu bản thân lớp giả `:has()` không được hỗ trợ trong trình duyệt, toàn bộ khối bộ chọn sẽ thất bại trừ khi `:has()` nằm trong một danh sách bộ chọn tha thứ, chẳng hạn như trong [`:is()`](/en-US/docs/Web/CSS/Reference/Selectors/:is) và [`:where()`](/en-US/docs/Web/CSS/Reference/Selectors/:where).

Lớp giả `:has()` không thể được lồng trong một `:has()` khác.

Các phần tử giả cũng không phải là bộ chọn hợp lệ bên trong `:has()` và các phần tử giả không phải là neo hợp lệ cho `:has()`. Điều này là vì nhiều phần tử giả tồn tại có điều kiện dựa trên kiểu dáng của tổ tiên của chúng, và việc cho phép chúng được truy vấn bởi `:has()` có thể dẫn đến truy vấn vòng tròn.

## Ví dụ

### Chọn phần tử cha

Bạn có thể đang tìm kiếm một "kết hợp cha [combinator](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators#combinators)", cho phép bạn đi lên cây DOM và chọn cha của một phần tử cụ thể. Lớp giả `:has()` thực hiện điều đó bằng cách sử dụng `parent:has(child)` (cho bất kỳ cha nào) hoặc `parent:has(> child)` (cho cha trực tiếp). Ví dụ này cho thấy cách tạo kiểu cho một phần tử `<section>` khi nó chứa một phần tử con với lớp `featured`.

```html
<section>
  <article class="featured">Featured content</article>
  <article>Regular content</article>
</section>
<section>
  <article>Regular content</article>
</section>
```

```css
section:has(.featured) {
  border: 2px solid blue;
}
```

### Kết quả

{{EmbedLiveSample('Selecting a parent element', , 200)}}

### Với bộ kết hợp anh chị em

Khai báo kiểu `:has()` trong ví dụ sau điều chỉnh khoảng cách sau các tiêu đề `<h1>` nếu chúng được theo sau ngay bởi tiêu đề `<h2>`.

#### HTML

```html
<section>
  <article>
    <h1>Morning Times</h1>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
    </p>
  </article>
  <article>
    <h1>Morning Times</h1>
    <h2>Delivering you news every morning</h2>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
    </p>
  </article>
</section>
```

#### CSS

```css hidden
section {
  display: flex;
  align-items: start;
  justify-content: space-around;
}

article {
  display: inline-block;
  width: 40%;
}

h1,
h2 {
  font-size: 1.2em;
}

h2 {
  font-size: 1em;
  color: rgb(150 149 149);
}
```

```css
h1,
h2 {
  margin: 0 0 1rem 0;
}

h1:has(+ h2) {
  margin: 0 0 0.25rem 0;
}
```

#### Kết quả

{{EmbedLiveSample('With_the_sibling_combinator', 600, 150)}}

Ví dụ này hiển thị hai văn bản tương tự nhau song song để so sánh — bên trái có tiêu đề `H1` theo sau là đoạn văn, bên phải có tiêu đề `H1` theo sau là tiêu đề `H2` rồi đến đoạn văn. Trong ví dụ bên phải, `:has()` giúp chọn phần tử `H1` được theo sau ngay bởi phần tử `H2` (được chỉ báo bởi bộ kết hợp anh chị em kế tiếp [`+`](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator)) và quy tắc CSS giảm khoảng cách sau phần tử `H1` đó. Nếu không có lớp giả `:has()`, bạn không thể sử dụng bộ chọn CSS để chọn một anh chị em trước đó của kiểu khác hoặc một phần tử cha.

### Với lớp giả :is()

Ví dụ này dựa trên ví dụ trước để cho thấy cách chọn nhiều phần tử bằng `:has()`.

#### HTML

```html
<section>
  <article>
    <h1>Morning Times</h1>
    <h2>Delivering you news every morning</h2>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
    </p>
  </article>
  <article>
    <h1>Morning Times</h1>
    <h2>Delivering you news every morning</h2>
    <h3>8:00 am</h3>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
    </p>
  </article>
</section>
```

#### CSS

```css hidden
section {
  display: flex;
  align-items: start;
  justify-content: space-around;
}

article {
  display: inline-block;
  width: 40%;
}

h1 {
  font-size: 1.2em;
}

h2 {
  font-size: 1em;
  color: rgb(150 149 149);
}

h3 {
  font-size: 0.9em;
  color: darkgrey;
}
```

```css
h1,
h2,
h3 {
  margin: 0 0 1rem 0;
}

:is(h1, h2, h3):has(+ :is(h2, h3, h4)) {
  margin: 0 0 0.25rem 0;
}
```

#### Kết quả

{{EmbedLiveSample('With_the_:is()_pseudo-class', 600, 170)}}

Ở đây, lớp giả [`:is()`](/en-US/docs/Web/CSS/Reference/Selectors/:is) đầu tiên được dùng để chọn bất kỳ phần tử tiêu đề nào trong danh sách. Lớp giả `:is()` thứ hai được dùng để truyền một danh sách các bộ chọn anh chị em kế tiếp làm đối số cho `:has()`. Lớp giả `:has()` giúp chọn bất kỳ phần tử `H1`, `H2`, hoặc `H3` nào được theo sau ngay bởi (được chỉ báo bởi [`+`](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator)) phần tử `H2`, `H3`, hoặc `H4`, và quy tắc CSS giảm khoảng cách sau các phần tử `H1`, `H2`, hoặc `H3` đó.

Bộ chọn này cũng có thể được viết như sau:

```css
:is(h1, h2, h3):has(+ h2, + h3, + h4) {
  margin: 0 0 0.25rem 0;
}
```

### Phép toán logic

Bộ chọn quan hệ `:has()` có thể được dùng để kiểm tra xem một trong nhiều điều kiện có đúng không, hoặc tất cả các điều kiện có đúng không.

Bằng cách sử dụng các giá trị phân cách bởi dấu phẩy bên trong bộ chọn quan hệ `:has()`, bạn đang kiểm tra xem có bất kỳ tham số nào tồn tại không. `x:has(a, b)` sẽ tạo kiểu cho `x` nếu phần tử con `a` HOẶC `b` tồn tại.

Bằng cách kết nối nhiều bộ chọn quan hệ `:has()` với nhau, bạn đang kiểm tra xem tất cả các tham số có tồn tại không. `x:has(a):has(b)` sẽ tạo kiểu cho `x` nếu phần tử con `a` VÀ `b` đều tồn tại.

```css
body:has(video, audio) {
  /* styles to apply if the content contains audio OR video */
}
body:has(video):has(audio) {
  /* styles to apply if the content contains both audio AND video */
}
```

## Tương đồng giữa :has() và biểu thức chính quy

Thú vị là, chúng ta có thể liên hệ một số cấu trúc CSS `:has()` với [khẳng định lookahead](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion) trong biểu thức chính quy, vì cả hai đều cho phép bạn chọn các phần tử (hoặc chuỗi trong biểu thức chính quy) dựa trên điều kiện mà không thực sự chọn phần tử (hoặc chuỗi) khớp với điều kiện đó.

### Lookahead dương (?=pattern)

Trong biểu thức chính quy `abc(?=xyz)`, chuỗi `abc` chỉ được khớp nếu nó được theo sau ngay bởi chuỗi `xyz`. Vì đây là phép toán lookahead, `xyz` không được đưa vào kết quả khớp.

Cấu trúc tương đồng trong CSS sẽ là `.abc:has(+ .xyz)`: nó chọn phần tử `.abc` chỉ khi có anh chị em kế tiếp `.xyz`. Phần `:has(+ .xyz)` hoạt động như phép toán lookahead vì phần tử `.abc` được chọn, không phải phần tử `.xyz`.

### Lookahead âm (?!pattern)

Tương tự, với trường hợp lookahead âm, trong biểu thức chính quy `abc(?!xyz)`, chuỗi `abc` chỉ được khớp nếu nó _không_ được theo sau bởi `xyz`. Cấu trúc CSS tương đồng `.abc:has(+ :not(.xyz))` không chọn phần tử `.abc` nếu phần tử kế tiếp là `.xyz`.

## Cân nhắc về hiệu suất

Một số cách sử dụng lớp giả `:has()` có thể ảnh hưởng đáng kể đến hiệu suất trang, đặc biệt trong các cập nhật động (DOM mutations). Các engine trình duyệt phải đánh giá lại các bộ chọn `:has()` khi DOM thay đổi, và các bộ chọn phức tạp hoặc không được giới hạn tốt có thể dẫn đến các phép tính tốn kém.

### Tránh neo quá rộng

Bộ chọn neo (phần `A` trong `A:has(B)`) không nên là một phần tử có quá nhiều phần tử con, như `body`, `:root`, hoặc `*`. Việc neo `:has()` vào các bộ chọn quá chung chung có thể làm giảm hiệu suất vì bất kỳ thay đổi DOM nào trong toàn bộ subtree của một phần tử được chọn rộng đều yêu cầu trình duyệt kiểm tra lại điều kiện `:has()`.

```css example-bad
/* Avoid anchoring :has() to broad elements */
body:has(.sidebar) {
  /* styles */
}
:root:has(.content) {
  /* styles */
}
*:has(.item) {
  /* styles */
}
```

Thay vào đó, hãy neo `:has()` vào các phần tử cụ thể như `.container` hoặc `.gallery` để giảm phạm vi và cải thiện hiệu suất.

```css example-good
/* Use specific containers to limit scope */
.container:has(.sidebar-expanded) {
  /* styles */
}
.content-wrapper:has(> article[data-priority="high"]) {
  /* styles */
}
.gallery:has(> img[data-loaded="false"]) {
  /* styles */
}
```

### Giảm thiểu việc duyệt qua subtree

Bộ chọn bên trong (phần `B` trong `A:has(B)`) nên sử dụng các bộ kết hợp như `>` hoặc `+` để giới hạn việc duyệt. Khi bộ chọn bên trong `:has()` không được ràng buộc chặt chẽ, trình duyệt có thể cần duyệt qua toàn bộ subtree của phần tử neo cho mỗi DOM mutation để kiểm tra xem điều kiện vẫn đúng hay không.

Trong ví dụ này, bất kỳ thay đổi nào trong `.ancestor` đều yêu cầu kiểm tra tất cả phần tử con để tìm `.foo`:

```css example-bad
/* May trigger full subtree traversal */
.ancestor:has(.foo) {
  /* styles */
}
```

Việc sử dụng bộ kết hợp con hoặc anh chị em giới hạn phạm vi của bộ chọn bên trong, giảm chi phí hiệu suất của DOM mutations. Trong ví dụ này, trình duyệt chỉ cần kiểm tra phần tử con trực tiếp hoặc phần tử con của một anh chị em cụ thể:

```css example-good
/* More constrained - limits traversal */
.ancestor:has(> .foo) {
  /* direct child */
}
.ancestor:has(+ .sibling .foo) {
  /* descendant of adjacent sibling */
}
```

Một số bộ chọn bên trong nhất định có thể buộc trình duyệt duyệt qua chuỗi tổ tiên cho mỗi DOM mutation, tìm kiếm các neo tiềm năng có thể cần cập nhật. Điều này xảy ra khi cấu trúc ngụ ý cần kiểm tra các tổ tiên của phần tử bị thay đổi.

Trong ví dụ này, bất kỳ thay đổi DOM nào đều yêu cầu kiểm tra xem phần tử bị thay đổi có phải là bất kỳ phần tử nào (`*`) là phần tử con trực tiếp của `.foo` hay không, và liệu cha của nó (hoặc các tổ tiên tiếp theo) có phải là `.ancestor` hay không.

```css example-bad
/* Might trigger ancestor traversal */
.ancestor:has(.foo > *) {
  /* styles */
}
```

Việc ràng buộc bộ chọn bên trong với các lớp cụ thể hoặc bộ kết hợp con trực tiếp (ví dụ, `.specific-child` trong đoạn tiếp theo) giảm các lần duyệt tổ tiên tốn kém bằng cách giới hạn việc kiểm tra của trình duyệt vào một phần tử được xác định rõ ràng, cải thiện hiệu suất.

```css example-good
/* Constrain the inner selector to avoid ancestor traversals */
.ancestor:has(.foo > .specific-child) {
  /* styles */
}
```

> [!NOTE]
> Các đặc tính hiệu suất này có thể được cải thiện khi các trình duyệt tối ưu hóa các triển khai `:has()`, nhưng các ràng buộc cơ bản vẫn còn: `:has()` cần duyệt qua toàn bộ subtree, vì vậy bạn cần giảm thiểu kích thước của subtree. Trong một bộ chọn như `A:has(B)`, hãy đảm bảo `A` của bạn không có quá nhiều phần tử con, và đảm bảo `B` của bạn được ràng buộc chặt chẽ để tránh duyệt không cần thiết.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`:is()`](/en-US/docs/Web/CSS/Reference/Selectors/:is), [`:where()`](/en-US/docs/Web/CSS/Reference/Selectors/:where), [`:not()`](/en-US/docs/Web/CSS/Reference/Selectors/:not)
- [Bộ chọn và bộ kết hợp CSS](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
- [Cấu trúc bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure)
- [Danh sách bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list)
- [Mô-đun bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
- [Chọn và duyệt qua cây DOM](/en-US/docs/Web/API/Document_Object_Model/Selection_and_traversal_on_the_DOM_tree)
