---
title: view-transition-name
slug: Web/CSS/Reference/Properties/view-transition-name
page-type: css-property
browser-compat: css.properties.view-transition-name
sidebar: cssref
---

Thuộc tính **`view-transition-name`** của [CSS](/vi/docs/Web/CSS) chỉ định ảnh chụp [chuyển đổi xem](/vi/docs/Web/API/View_Transition_API) mà các phần tử được chọn sẽ tham gia. Điều này cho phép bạn hoạt ảnh hóa các phần tử đó riêng biệt so với phần còn lại của trang, sử dụng hoạt ảnh cross-fade mặc định trong quá trình chuyển đổi xem. Bạn có thể xác định kiểu hoạt ảnh tùy chỉnh cho những phần tử này.

## Cú pháp

```css
/* Các ví dụ giá trị <custom-ident> */
view-transition-name: header;
view-transition-name: figure-caption;

/* Giá trị từ khóa */
view-transition-name: none;
view-transition-name: match-element;

/* Giá trị toàn cục */
view-transition-name: inherit;
view-transition-name: initial;
view-transition-name: revert;
view-transition-name: revert-layer;
view-transition-name: unset;
```

### Giá trị

- {{cssxref("custom-ident")}}
  - : Tên định danh khiến phần tử được chọn tham gia vào một ảnh chụp riêng biệt từ ảnh chụp gốc. `<custom-ident>` không được là `auto`, `match-element`, `none` hay giá trị [từ khóa toàn CSS](/vi/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords).
- `match-element`
  - : Trình duyệt tự động gán một tên duy nhất cho phần tử được chọn. Tên này được dùng để chụp phần tử riêng biệt so với tất cả các phần tử khác trên trang. (Tên này là nội bộ và không thể đọc được từ DOM.)
- `none`
  - : Phần tử được chọn sẽ không tham gia vào một ảnh chụp riêng biệt, trừ khi nó có phần tử cha được đặt `view-transition-name`, trong trường hợp đó nó sẽ được chụp như một phần của phần tử đó.

## Mô tả

Theo mặc định, khi chuyển đổi xem được áp dụng cho ứng dụng web, tất cả các thay đổi giao diện người dùng xảy ra trong quá trình chuyển đổi đó được chụp và hoạt ảnh hóa cùng nhau. Đây là ảnh chụp mặc định — hay `root` — (xem [Cây phần tử giả chuyển đổi xem](/vi/docs/Web/API/View_Transition_API/Using#the_view_transition_pseudo-element_tree)). Theo mặc định, hoạt ảnh này là cross-fade mượt mà, có thể thấy trong [demo SPA View Transitions](https://mdn.github.io/dom-examples/view-transitions/spa/).

Nếu bạn muốn một số phần tử được hoạt ảnh hóa khác với ảnh chụp `root` trong quá trình chuyển đổi xem, bạn có thể làm điều đó bằng cách cho chúng một `view-transition-name` khác, ví dụ:

```css
figcaption {
  view-transition-name: figure-caption;
}
```

Sau đó bạn có thể chỉ định hoạt ảnh nào bạn muốn cho ảnh chụp trước và sau bằng các phần tử giả chuyển đổi xem liên quan — {{cssxref("::view-transition-old()")}} và {{cssxref("::view-transition-new()")}}. Ví dụ:

```css
::view-transition-old(figure-caption) {
  animation: 0.25s linear both shrink-x;
}

::view-transition-new(figure-caption) {
  animation: 0.25s 0.25s linear both grow-x;
}
```

Nếu bạn không muốn một phần tử được chụp riêng biệt, bạn có thể chỉ định giá trị `view-transition-name` là `none`:

```css
.dont-animate-me {
  view-transition-name: none;
}
```

`<custom-ident>` của `view-transition-name` phải là duy nhất cho mỗi phần tử được hiển thị tham gia vào chuyển đổi xem. Nếu hai phần tử được hiển thị có cùng `view-transition-name` cùng lúc, {{domxref("ViewTransition.ready")}} {{JSxRef("Promise")}} sẽ bị từ chối và chuyển đổi sẽ bị bỏ qua.

### Chỉ định giá trị `view-transition-name` tự động

Đôi khi bạn muốn hoạt ảnh hóa nhiều phần tử giao diện người dùng riêng biệt trong một chuyển đổi xem. Điều này thường xảy ra khi bạn có danh sách các phần tử trên trang và muốn sắp xếp lại chúng theo một cách nào đó:

```html
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
  <li>Item 4</li>

  <!-- ... -->

  <li>Item 99</li>
</ul>
```

Việc đặt tên duy nhất cho từng phần tử có thể bất tiện, đặc biệt khi số lượng phần tử tăng lên:

```css-nolint
li:nth-child(1) {
  view-transition-name: item1;
}
li:nth-child(2) {
  view-transition-name: item2;
}
li:nth-child(3) {
  view-transition-name: item3;
}
li:nth-child(4) {
  view-transition-name: item4;
}

/* ... */

li:nth-child(99) {
  view-transition-name: item99;
}
```

Để giải quyết vấn đề này, bạn có thể dùng giá trị `match-element`, khiến trình duyệt đặt cho mỗi phần tử được chọn một `view-transition-name` nội bộ duy nhất:

```css
li {
  view-transition-name: match-element;
}
```

Vì `match-element` gán các giá trị `view-transition-name` tự động dựa trên danh tính phần tử, nó chỉ có thể được dùng cho các chuyển đổi xem cùng tài liệu. Các định danh nội bộ được tạo tự động không thể chuyển giao qua các phần tử hoặc tài liệu khác nhau.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản của `view-transition-name`

Ví dụ này lấy từ [demo SPA View Transitions](https://mdn.github.io/dom-examples/view-transitions/spa/), là một thư viện ảnh cơ bản. [Chuyển đổi xem SPA cơ bản](/vi/docs/Web/API/View_Transition_API/Using#basic_spa_view_transition) cung cấp giải thích chi tiết hơn về cách demo này hoạt động.

Hầu hết các thay đổi giao diện người dùng được hoạt ảnh hóa bằng ảnh chụp chuyển đổi `root`. Tuy nhiên, `<figcaption>` được cho `view-transition-name` là `figure-caption` để cho phép nó được hoạt ảnh hóa khác với phần còn lại của trang:

```css
figcaption {
  view-transition-name: figure-caption;
}
```

Đoạn code sau áp dụng hoạt ảnh tùy chỉnh chỉ cho `<figcaption>`:

```css
@keyframes grow-x {
  from {
    transform: scaleX(0);
  }
  to {
    transform: scaleX(1);
  }
}

@keyframes shrink-x {
  from {
    transform: scaleX(1);
  }
  to {
    transform: scaleX(0);
  }
}

::view-transition-group(figure-caption) {
  height: auto;
  right: 0;
  left: auto;
  transform-origin: right center;
}

::view-transition-old(figure-caption) {
  animation: 0.25s linear both shrink-x;
}

::view-transition-new(figure-caption) {
  animation: 0.25s 0.25s linear both grow-x;
}
```

Chúng ta tạo hoạt ảnh CSS tùy chỉnh và áp dụng nó cho các phần tử giả `::view-transition-old(figure-caption)` và `::view-transition-new(figure-caption)`. Chúng ta cũng áp dụng các kiểu khác để giữ chúng ở cùng vị trí và ngăn kiểu mặc định can thiệp vào hoạt ảnh tùy chỉnh.

### Dùng giá trị `match-element`

Ví dụ này chứa danh sách các công nghệ — HTML, CSS, SVG và JS — được hiển thị trong thanh bên bên cạnh vùng nội dung chính, ban đầu trống. Nhấp vào tiêu đề của một công nghệ sẽ hoạt ảnh hóa nội dung của nó vào vùng nội dung bên cạnh hiển thị thêm chi tiết.

#### HTML

Phần tử {{htmlelement("main")}} chứa [danh sách không có thứ tự](/vi/docs/Web/HTML/Reference/Elements/ul) và phần tử {{htmlelement("article")}}. Nhiều phần tử con {{htmlelement("li")}} bên trong danh sách mỗi phần tử chứa một phần tử {{htmlelement("a")}} bên trong [tiêu đề](/vi/docs/Web/HTML/Reference/Elements/Heading_Elements).

```html
<main class="match-element-applied">
  <ul>
    <li>
      <h2><a href="#">HTML</a></h2>
      <h3>HyperText Markup Language</h3>
      <p>
        HyperText Markup Language (HTML) is the most basic building block of the
        web. It defines the meaning and structure of web content. HTML provides
        the fundamental building blocks for structuring web documents and apps.
      </p>
    </li>
    <li>
      <h2><a href="#">CSS</a></h2>
      <h3>Cascading Style Sheets</h3>
      <p>
        Cascading Style Sheets (CSS) is a stylesheet language used to describe
        the presentation of a document written in HTML or XML (including XML
        dialects such as SVG, MathML or XHTML). CSS describes how elements
        should be rendered on screen, on paper, in speech, or on other media.
      </p>
    </li>
    <li>
      <h2><a href="#">SVG</a></h2>
      <h3>Scalable Vector Graphics</h3>
      <p>
        Scalable Vector Graphics (SVG) is an XML-based markup language for
        describing two-dimensional based vector graphics.
      </p>
    </li>
    <li>
      <h2><a href="#">JS</a></h2>
      <h3>JavaScript</h3>
      <p>
        JavaScript (JS) is the web's native programming language. JavaScript is
        a lightweight, interpreted (or just-in-time compiled) programming
        language with first-class functions. While it is most well-known as the
        scripting language for web pages, many non-browser environments, such as
        Node.js, also use it.
      </p>
    </li>
  </ul>
  <article></article>
</main>
```

```html hidden
<form>
  <label for="match-element-checkbox">
    Apply <code>match-element</code> to list items?
  </label>
  <input type="checkbox" id="match-element-checkbox" checked />
</form>
```

#### CSS

Chúng ta dùng [flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout) để bố cục `<li>` và `<article>` cạnh nhau, và để các mục danh sách chia sẻ không gian bằng nhau trong cột đầu tiên. Danh sách chiếm 35% chiều rộng vùng chứa, trong khi `<article>` lấp đầy không gian ngang còn lại.

```css hidden
/* General styles and resets */
* {
  box-sizing: border-box;
  font-size: 0.9rem;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
  height: 100%;
}

body {
  margin: 0;
  height: inherit;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
li h2 {
  margin: 0;
}

ul {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

li {
  overflow: hidden;
  container-type: inline-size;
}

li p {
  display: none;
}

li.active-item p {
  display: block;
}

li:nth-child(1) {
  background-color: #cbc0d3;
  border: 20px solid #cbc0d3;
}

li:nth-child(2) {
  background-color: #efd3d7;
  border: 20px solid #efd3d7;
}

li:nth-child(3) {
  background-color: #feeafa;
  border: 20px solid #feeafa;
}

li:nth-child(4) {
  background-color: #dee2ff;
  border: 20px solid #dee2ff;
}

/* Links */

a {
  text-decoration: none;
  color: rgb(0 0 255 / 0.8);
}

a:hover,
a:focus {
  color: rgb(100 100 255);
}

/* Form and checkbox styles */
form {
  position: absolute;
  bottom: 0;
  right: 0;
  z-index: 2;
  background-color: white;
  padding: 10px;
  border: 1px solid black;
}
```

```css
main {
  container-type: inline-size;
  width: 100%;
  height: 100%;
  display: flex;
  gap: 2cqw;
  position: relative;
}

ul {
  width: 35cqw;
  display: flex;
  flex-direction: column;
  gap: 1cqw;
}

article {
  flex: 1;
}

li {
  flex: 1;
}
```

Chúng ta cũng xác định quy tắc chọn các phần tử có class `active-item`. Khi class này được áp dụng cho phần tử, quy tắc khiến nó được đặt vị trí chính xác phía trên phần tử `<article>`. Class này sẽ được áp dụng cho các mục danh sách qua JavaScript khi liên kết của chúng được nhấp, điều này sẽ khởi động chuyển đổi xem.

```css
.active-item {
  position: absolute;
  z-index: 1;
  translate: 37cqw;
  width: calc(100% - 37cqw);
  height: 100%;
}
```

Theo mặc định, tất cả các phần tử trong chuyển đổi xem được hoạt ảnh hóa cùng nhau trong một cross-fade duy nhất. Tuy nhiên trong ví dụ này, chúng ta không muốn điều đó — chúng ta muốn mỗi mục danh sách có hoạt ảnh di chuyển riêng. Chúng ta có thể đạt được điều này bằng cách áp dụng `view-transition-name: match-element` cho mỗi mục danh sách:

```css
.match-element-applied li {
  view-transition-name: match-element;
}
```

Class `match-element-applied` được áp dụng cho phần tử `<main>` theo mặc định, đó là lý do tại sao hộp kiểm trong khung Kết quả ban đầu được chọn. Nếu bạn bỏ chọn nó, class bị xóa và hoạt ảnh cross-fade mặc định có hiệu lực. Bạn có thể bật/tắt hộp kiểm để so sánh hoạt ảnh mặc định với hoạt ảnh được áp dụng khi `view-transition-name: match-element` được sử dụng.

Tiếp theo, chúng ta tùy chỉnh hoạt ảnh bằng cách dùng phần tử giả {{cssxref("::view-transition-group()")}} để áp dụng `animation-duration` cho tất cả các nhóm chuyển đổi xem (được biểu thị bằng định danh `*`) và cho tất cả các ảnh chụp cũ và mới một {{cssxref("height")}} là `100%`. Điều này giải quyết sự khác biệt về tỷ lệ khung hình giữa các ảnh chụp cũ và mới và làm cho hoạt ảnh trông mượt hơn:

```css
::view-transition-group(*) {
  animation-duration: 0.5s;
}

html::view-transition-old(*),
html::view-transition-new(*) {
  height: 100%;
}
```

#### JavaScript

Trong ví dụ này, class `active-item` được áp dụng cho các mục danh sách khi liên kết của chúng được nhấp; điều này được thực hiện qua hàm `updateActiveItem()`:

```js
const mainElem = document.querySelector("main");
let prevElem;
let checkboxElem = document.querySelector("input");

// View transition code
function updateActiveItem(event) {
  // Get the list item that contains the clicked link
  const clickedElem = event.target.parentElement.parentElement;

  // Set the active-item class on the list item
  clickedElem.className = "active-item";

  // Keep track of the previous item that was clicked, if any.
  // Remove the active-item class from the previous item so that only
  // one list item is placed over the <article> at any one time
  if (prevElem === clickedElem) {
    prevElem.className = "";
    prevElem = undefined;
  } else if (prevElem) {
    prevElem.className = "";
    prevElem = clickedElem;
  } else {
    prevElem = clickedElem;
  }
}

mainElem.addEventListener("click", (event) => {
  event.preventDefault(); // Prevent iframe from scrolling when clicked
  // Do nothing unless a link is clicked inside the <main> element
  if (event.target.tagName !== "A") {
    return;
  }

  // Run updateActiveItem() on its own if view transitions are not supported
  if (!document.startViewTransition) {
    updateActiveItem(event);
  } else {
    // Run updateActiveItem() via startViewTransition()
    const transition = document.startViewTransition(() =>
      updateActiveItem(event),
    );
  }
});

// Toggle the class on <main> to control whether or not match-element is applied

checkboxElem.addEventListener("change", () => {
  mainElem.classList.toggle("match-element-applied");
});
```

Chạy hàm `updateActiveItem()` qua hàm `startViewTransition()` giúp hoạt ảnh hóa việc hiển thị chi tiết công nghệ một cách mượt mà.

#### Kết quả

Nhấp vào tiêu đề công nghệ trong thanh bên và chú ý hiệu ứng hoạt ảnh nội dung của nó vào vùng nội dung chính.

Cũng có một hộp kiểm, được chọn theo mặc định, nên `view-transition-name: match-element` được áp dụng. Bỏ chọn hộp kiểm và nhấp tiêu đề một lần nữa để xem cách chuyển đổi xem hoạt động khi không có `view-transition-name: match-element`.

{{EmbedLiveSample("using_the-match-element_value", "", "400")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("view-transition-class")}}
- {{cssxref("::view-transition-group()")}}
- {{cssxref("::view-transition-old()")}}
- {{cssxref("::view-transition-new()")}}
- [View Transition API](/vi/docs/Web/API/View_Transition_API)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
