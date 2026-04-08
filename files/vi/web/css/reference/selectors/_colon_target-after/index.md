---
title: :target-after
slug: Web/CSS/Reference/Selectors/:target-after
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.target-after
sidebar: cssref
---

{{SeeCompatTable}}

**`:target-after`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) chọn các scroll marker đứng _sau_ scroll marker đang hoạt động (cái hiện tại khớp với {{cssxref(":target-current")}}) trong một nhóm scroll marker. Bạn có thể dùng bộ chọn này để tạo kiểu cho các mục điều hướng đứng sau vị trí điều hướng hiện tại trong nhóm scroll marker.

> [!NOTE]
> Lớp giả `:target-after` chỉ hợp lệ trên các phần tử giả {{cssxref("::scroll-marker")}} và các phần tử đã được chỉ định làm scroll marker thông qua thuộc tính {{cssxref("scroll-target-group")}}.

## Cú pháp

```css-nolint
:target-after {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho các mục điều hướng trước và sau scroll marker đang hoạt động

Trong ví dụ này, chúng ta dùng lớp giả {{cssxref(":target-before")}} và `:target-after` để tô sáng các scroll marker trước và sau cái đang hoạt động, chỉ ra các mục người dùng đã xem và những mục còn lại phía trước.

#### HTML

Đánh dấu chứa một mục lục được tạo bằng danh sách có thứ tự ({{htmlelement("ol")}}/{{htmlelement("li")}}) và các phần tử {{htmlelement("a")}}. Theo sau đó là một loạt các phần tử {{htmlelement("section")}} chứa nội dung.

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

```html hidden live-sample___targeting-before-and-after
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

Chúng ta đặt `scroll-target-group: auto` trên `<ol>` để biến nó thành container nhóm scroll marker và để trình duyệt xác định phần tử `<a>` nào là scroll marker đang hoạt động tại bất kỳ thời điểm nào (tức là liên kết nào có mục tiêu hiện đang trong tầm nhìn). Sau đó chúng ta tạo kiểu cho lớp giả `:target-current` với màu {{cssxref("color")}} `red` để nó nổi bật rõ ràng.

```css hidden live-sample___targeting-before-and-after
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

@supports not selector(:target-after) {
  body::before {
    content: "Your browser does not support the :target-before and :target-after pseudo-classes.";
    color: black;
    background-color: #ffcd33;
    text-align: center;
    padding: 1rem;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 1;
  }
}
```

```css live-sample___targeting-before-and-after
ol {
  scroll-target-group: auto;
}

:target-current {
  color: red;
}
```

Cuối cùng, chúng ta dùng lớp giả `:target-before` để tạo kiểu cho tất cả các phần tử `<a>` trước scroll marker đang hoạt động với màu xám và gạch ngang, làm cho chúng trông đã hoàn thành, và chúng ta dùng lớp giả `:target-after` để tạo kiểu cho tất cả các phần tử `<a>` sau scroll marker đang hoạt động với đường gạch chân sáng.

```css live-sample___targeting-before-and-after
a:target-before {
  color: gray;
  text-decoration: line-through;
}

a:target-after {
  text-decoration: underline orange 2px;
}
```

#### Kết quả

Hãy thử điều hướng bằng cách nhấp vào các liên kết hoặc cuộn. Trong cả hai trường hợp, bạn sẽ thấy màu văn bản đỏ di chuyển giữa các liên kết để khớp với phần hiện đang trong tầm nhìn. Các liên kết trước và sau liên kết đỏ hiện tại cũng cập nhật để sử dụng các kiểu được định nghĩa trong các quy tắc `a:target-before` và `a:target-after`.

{{EmbedLiveSample("targeting-before-and-after", "100%", 500)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-marker-group")}}
- {{cssxref("scroll-target-group")}}
- {{cssxref(":target-current")}}, {{cssxref(":target-before")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref("::scroll-marker-group")}}
- [Creating CSS carousels](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
