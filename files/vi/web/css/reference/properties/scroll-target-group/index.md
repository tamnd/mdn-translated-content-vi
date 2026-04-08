---
title: scroll-target-group
slug: Web/CSS/Reference/Properties/scroll-target-group
page-type: css-property
status:
  - experimental
browser-compat: css.properties.scroll-target-group
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`scroll-target-group`** [CSS](/en-US/docs/Web/CSS) xác định liệu một phần tử có phải là vùng chứa nhóm scroll marker hay không.

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-target-group: none;
scroll-target-group: auto;

/* Giá trị toàn cục */
scroll-target-group: inherit;
scroll-target-group: initial;
scroll-target-group: revert;
scroll-target-group: revert-layer;
scroll-target-group: unset;
```

Thuộc tính `scroll-target-group` được chỉ định là một trong các giá trị từ khóa sau:

### Giá trị

- `none`
  - : Phần tử không phải là vùng chứa nhóm scroll marker.
- `auto`
  - : Phần tử là vùng chứa nhóm scroll marker.

## Mô tả

Đặt `scroll-target-group: auto` trên một phần tử biểu thị nó là **vùng chứa nhóm scroll marker**. Điều này nhóm các mục điều hướng lại với nhau cho phép người dùng điều hướng giữa các phần tử trên trang (chẳng hạn như các mục carousel hoặc các phần bài viết) và làm nổi bật phần tử đang được hiển thị.

Bất kỳ phần tử {{htmlelement("a")}} nào có định danh fragment bên trong vùng chứa đều tự động được đặt làm scroll marker. Phần tử anchor có scroll target đang trong tầm nhìn có thể được định kiểu thông qua lớp giả {{cssxref(":target-current")}}.

### Sự khác biệt giữa `scroll-target-group` và `scroll-marker-group`

Các vùng chứa nhóm scroll marker được tạo bằng `scroll-target-group` hoạt động tương tự như các vùng chứa được tạo bằng thuộc tính {{cssxref("scroll-marker-group")}}, với một số khác biệt:

- Với `scroll-target-group`, bạn phải tự tạo markup để đại diện cho vùng chứa nhóm scroll marker và các scroll marker, trong khi `scroll-marker-group` tự động tạo một tập hợp pseudo-element để đại diện cho vùng chứa ({{cssxref("::scroll-marker-group")}}) và các marker (một hoặc nhiều instance của {{cssxref("::scroll-marker")}}). Những pseudo-element này tự động có các liên kết điều hướng dự kiến với {{glossary("scroll container")}} mà chúng được tạo ra. Sử dụng `scroll-marker-group` cung cấp thiết lập nhanh hơn vì bạn không cần sử dụng markup của riêng mình. Tuy nhiên, việc tạo markup của riêng bạn và đặt nó làm vùng chứa nhóm scroll marker thông qua `scroll-target-group` cung cấp nhiều khả năng kiểm soát và linh hoạt hơn.
- Các liên kết được chỉ định là scroll marker thông qua `scroll-target-group` không có hành vi điều hướng đặc biệt, trong khi các marker được tạo thông qua `scroll-marker-group` tự động có ngữ nghĩa [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)/[`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) áp dụng cho chúng, có nghĩa là chúng hoạt động như một mục đơn trong thứ tự tab và người dùng có thể di chuyển giữa các scroll marker bằng các phím mũi tên. Một lần nữa, `scroll-marker-group` cung cấp hành vi mặc định hữu ích, nhưng bạn có tính linh hoạt khi cung cấp ngữ nghĩa và hành vi thay thế cho các marker được chỉ định bằng `scroll-target-group`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản `scroll-target-group`

Ví dụ này hiển thị một trang có mục lục liên kết đến các phần khác nhau.

#### HTML

Markup của chúng ta có một loạt phần tử {{htmlelement("section")}} chứa nội dung và mục lục được tạo bằng danh sách có thứ tự ({{htmlelement("ol")}}/{{htmlelement("li")}}) và các phần tử {{htmlelement("a")}}.

```html
<nav id="toc">
  <ol>
    <li><a href="#intro">Introduction</a></li>
    <li><a href="#ch1">Chapter 1</a></li>
    <li><a href="#ch2">Chapter 2</a></li>
    <li><a href="#ch3">Chapter 3</a></li>
    <li><a href="#ch4">Chapter 4</a></li>
  </ol>
</nav>
<section id="intro" class="chapter">
  <h1>Prose of the century</h1>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
</section>
<section id="ch1" class="chapter">
  <h2>Chapter 1</h2>

  <!-- ... -->
</section>
<section id="ch2" class="chapter">
  <h2>Chapter 2</h2>

  <!-- ... -->
</section>

<!-- ... -->
```

```html hidden live-sample___basic-usage
<nav id="toc">
  <ol>
    <li><a href="#intro">Introduction</a></li>
    <li><a href="#ch1">Chapter 1</a></li>
    <li><a href="#ch2">Chapter 2</a></li>
    <li><a href="#ch3">Chapter 3</a></li>
    <li><a href="#ch4">Chapter 4</a></li>
  </ol>
</nav>
<section id="intro" class="chapter">
  <h1>My story</h1>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
</section>
<section id="ch1" class="chapter">
  <h2>Chapter 1</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
  <p>
    Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
    orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
    ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat.
    Suspendisse ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra
    congue. Duis ornare egestas augue ut luctus. Proin blandit quam nec lacus
    varius commodo et a urna. Ut id ornare felis, eget fermentum sapien.
  </p>
  <p>
    Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
    ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
    est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
    tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies
    lectus sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
    vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
    penatibus et magnis dis parturient montes, nascetur ridiculus mus.
  </p>
</section>
<section id="ch2" class="chapter">
  <h2>Chapter 2</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
  <p>
    Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
    orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
    ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat.
    Suspendisse ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra
    congue. Duis ornare egestas augue ut luctus. Proin blandit quam nec lacus
    varius commodo et a urna. Ut id ornare felis, eget fermentum sapien.
  </p>
</section>
<section id="ch3" class="chapter">
  <h2>Chapter 3</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
  <p>
    Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
    orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
    ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat.
    Suspendisse ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra
    congue. Duis ornare egestas augue ut luctus. Proin blandit quam nec lacus
    varius commodo et a urna. Ut id ornare felis, eget fermentum sapien.
  </p>
</section>
<section id="ch4" class="chapter">
  <h2>Chapter 4</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
  <p>
    Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
    orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
    ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat.
    Suspendisse ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra
    congue. Duis ornare egestas augue ut luctus. Proin blandit quam nec lacus
    varius commodo et a urna. Ut id ornare felis, eget fermentum sapien.
  </p>
</section>
```

#### CSS

Chúng ta đã ẩn hầu hết các kiểu dáng để ngắn gọn. Quan trọng nhất trong ví dụ này, chúng ta đã đặt `scroll-target-group: auto` trên `<ol>` để biến nó thành vùng chứa nhóm scroll marker và kích hoạt thuật toán của trình duyệt để tính toán phần tử `<a>` nào là `:target-current` tại bất kỳ thời điểm nào (tức là liên kết nào có mục tiêu đang trong tầm nhìn). Sau đó, chúng ta định kiểu lớp giả `:target-current` với màu `red` {{cssxref("color")}} để nó nổi bật rõ ràng.

```css hidden live-sample___basic-usage
body {
  font: 1.2em / 1.5 system-ui;
  width: 50%;
  max-width: 700px;
  margin: 0 auto;
}

nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: center;
}

section {
  padding-top: 60px;
}

a {
  color: black;
  text-decoration: none;
}

a:hover,
a:focus {
  text-decoration: underline;
}

ol {
  display: flex;
  width: 100%;
  justify-content: space-around;
  list-style-type: none;
  padding: 20px 0;
  margin: 0;
  background: white;
}
```

```css live-sample___basic-usage
ol {
  scroll-target-group: auto;
}

:target-current {
  color: red;
}
```

#### Kết quả

Thử điều hướng bằng cách kích hoạt các liên kết và bằng cách cuộn. Bạn sẽ thấy rằng trong mỗi trường hợp, phần tô đỏ di chuyển giữa các liên kết để khớp với phần đang được hiển thị.

{{EmbedLiveSample("basic-usage", "100%", 500)}}

### CSS carousel với scroll marker `scroll-target-group`

Ví dụ này hiển thị cách tạo các scroll marker [CSS carousel](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) bằng `scroll-target-group`. Mã cho ví dụ này tương tự như ví dụ [Carousel với các trang đơn](/en-US/docs/Web/CSS/Guides/Overflow/Carousels#carousel_with_single_pages) của chúng ta; chúng ta chỉ giải thích sự khác biệt bên dưới.

#### HTML

Markup có ID được đặt trên các mục danh sách xác định mỗi trang và một danh sách có thứ tự được thêm vào mà chúng ta sẽ biến thành vùng chứa nhóm scroll marker bằng CSS.

```html live-sample___carousel
<h1>CSS carousel single item per page</h1>
<ul>
  <li id="page1">
    <h2>Page 1</h2>
  </li>
  <li id="page2">
    <h2>Page 2</h2>
  </li>
  <li id="page3">
    <h2>Page 3</h2>
  </li>
  <li id="page4">
    <h2>Page 4</h2>
  </li>
</ul>
<ol>
  <li><a href="#page1">1</a></li>
  <li><a href="#page2">2</a></li>
  <li><a href="#page3">3</a></li>
  <li><a href="#page4">4</a></li>
</ol>
```

#### CSS

Chúng ta tạo vùng chứa nhóm scroll marker và các scroll marker bằng cách đặt `scroll-target-group` trên phần tử `<ol>`. Phần còn lại của mã để định kiểu cho các phần tử này rất tương tự, ngoại trừ chúng ta đang nhắm mục tiêu các phần tử do chúng ta chọn (`<ol>` và `<a>`) thay vì các pseudo-element {{cssxref("::scroll-marker-group")}} và {{cssxref("::scroll-marker")}}.

Chúng ta hoàn thiện mã bằng cách đặt một số kiểu dáng trên các trạng thái `:target-current`, `a:hover` và `a:focus` để chỉ ra trang đang được hiển thị và liên kết nào đang được di chuột/focus.

```css hidden live-sample___carousel
/* General styles */

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  text-align: center;
}

button {
  background-color: white;
}

/* General styling of list as scrolling carousel */

ul {
  width: 100%;
  height: 400px;
  padding: 20px;
  gap: 4%;
  display: grid;
  grid-auto-flow: column;
  grid-auto-columns: 100%;
  overflow-x: scroll;
  scroll-snap-type: x mandatory;
}

ul li {
  list-style-type: none;
  background-color: #eeeeee;
  border: 1px solid #dddddd;
  padding: 20px;

  scroll-snap-align: center;
}

/* CSS scroll buttons */

/* Style the scroll buttons */

ul::scroll-button(*) {
  border: 0;
  font-size: 2rem;
  background: none;
  color: rgb(0 0 0 / 0.7);
  cursor: pointer;
}

ul::scroll-button(*):hover,
ul::scroll-button(*):focus {
  color: black;
}

ul::scroll-button(*):active {
  translate: 1px 1px;
}

ul::scroll-button(*):disabled {
  color: rgb(0 0 0 / 0.2);
}

ul::scroll-button(left) {
  content: "◄";
}

ul::scroll-button(right) {
  content: "►";
}

/* Position the scroll buttons */

ul {
  anchor-name: --my-carousel;
}

ul::scroll-button(*) {
  position: absolute;
  position-anchor: --my-carousel;
}

ul::scroll-button(left) {
  right: calc(anchor(left) - 70px);
  top: calc(anchor(bottom) - 80px);
}

ul::scroll-button(right) {
  left: calc(anchor(right) - 70px);
  top: calc(anchor(bottom) - 80px);
}
```

```css live-sample___carousel
ol {
  position: absolute;
  position-anchor: --my-carousel;
  top: calc(anchor(bottom) - 90px);
  justify-self: anchor-center;
  display: flex;
  justify-content: center;
  gap: 20px;

  list-style-type: none;
  padding: 0;
  scroll-target-group: auto;
}

ol a {
  width: 28px;
  height: 28px;
  display: inline-block;
  text-align: center;
  text-decoration: none;
  padding-top: 4px;
  color: black;
  background-color: transparent;
  border: 2px solid black;
  border-radius: 50%;
}

ol a:hover,
ol a:focus,
:target-current {
  background-color: black;
  color: white;
}
```

#### Kết quả

Thử điều hướng theo ba cách sau: bằng cách kích hoạt các liên kết scroll marker, bằng cách cuộn ngang hoặc bằng cách nhấn các nút cuộn ở hai bên. Bạn sẽ thấy rằng trong mỗi trường hợp, phần tô sáng di chuyển giữa các liên kết để khớp với phần đang được hiển thị.

{{EmbedLiveSample("carousel", "100%", 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-marker-group")}}
- Pseudo-element {{cssxref("::scroll-marker-group")}} và {{cssxref("::scroll-marker")}}
- Lớp giả {{cssxref(":target-current")}}, {{cssxref(":target-before")}} và {{cssxref(":target-after")}}
- [Tạo CSS carousel](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
