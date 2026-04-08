---
title: Handling overflow in multi-column layout
short-title: Handling overflow
slug: Web/CSS/Guides/Multicol_layout/Handling_overflow
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta xem xét cách xử lý overflow trong layout multi-column (_multicol_), cả bên trong các column box và trong các tình huống khi có nhiều nội dung hơn so với những gì container có thể chứa.

## Overflow bên trong column boxes

Một tình huống overflow xảy ra khi kích thước của một phần tử lớn hơn column box. Ví dụ, tình huống này có thể xảy ra khi một hình ảnh trong một cột rộng hơn giá trị {{cssxref("column-width")}} hoặc chiều rộng của cột dựa trên số lượng cột được khai báo bằng {{cssxref("column-count")}}.

Trong tình huống này, nội dung nên tràn ra ngoài vào cột tiếp theo, thay vì bị cắt bởi column box.

```html live-sample___image
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <img
    alt="A close-up of two hot air balloons being inflated."
    src="https://mdn.github.io/shared-assets/images/examples/balloons3.jpg" />
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <p>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale. Celery potato scallion desert raisin horseradish spinach
    carrot soko.
  </p>
</div>
```

```css live-sample___image
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 250px;
}
```

Ví dụ này được hiển thị như sau:

{{EmbedLiveSample("image", "", "440px")}}

Có hai cột văn bản. Ở cột trái, có một bức ảnh rộng hơn cột. Hình ảnh mở rộng sang cột thứ hai, xuất hiện phía sau văn bản của cột phải. Luồng văn bản trong cột phải không bị ảnh hưởng bởi bức ảnh nhô ra, nhưng giao diện bị ảnh hưởng.

Nếu bạn muốn một hình ảnh vừa với column box, việc đặt `max-width: 100%` sẽ ngăn hình ảnh phát triển vượt quá container của nó, trong trường hợp này là column box.

```html hidden live-sample___image-max-width
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <img
    alt="A close-up of two hot air balloons being inflated."
    src="https://mdn.github.io/shared-assets/images/examples/balloons3.jpg" />
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <p>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale. Celery potato scallion desert raisin horseradish spinach
    carrot soko.
  </p>
</div>
```

```css live-sample___image-max-width
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 250px;
}
img {
  max-width: 100%;
}
```

Kết quả hiển thị đã được cập nhật trông như sau:

{{EmbedLiveSample("image-max-width", "", "440px")}}

## Nhiều cột hơn mức vừa vào

Cách xử lý các cột tràn phụ thuộc vào việc ngữ cảnh media có bị phân mảnh hay không, chẳng hạn như in, hay là liên tục, chẳng hạn như một trang web.

- Trong fragmented media, sau khi một fragment (ví dụ, một trang) được lấp đầy bằng các cột, các cột sẽ chuyển sang một trang mới và lấp đầy trang đó bằng các cột.
- Trong continuous media, nếu chiều cao được đặt trên một multi-column container, các cột tràn theo hướng inline theo mặc định. Trên web, điều này có nghĩa là bạn sẽ thấy thanh cuộn ngang. Hành vi này có thể được ghi đè bằng cách sử dụng {{cssxref("column-height")}} và {{cssxref("column-wrap")}} để thực thi [column wrapping](#sử_dụng_column_wrapping_cho_multicol).

Ví dụ này cho thấy hành vi overflow continuous media mặc định. Multicol container có {{CSSXref("height")}} được đặt và có nhiều văn bản hơn không gian để tạo các cột; do đó, chúng ta nhận được các cột được tạo ra bên ngoài container.

```html hidden live-sample___overflow-inline
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <p>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale. Celery potato scallion desert raisin horseradish spinach
    carrot soko.
  </p>
</div>
```

```css live-sample___overflow-inline
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 200px;
  height: 180px;
  border: 2px dashed;
}
```

Ví dụ này được hiển thị như sau:

{{EmbedLiveSample("overflow-inline", "", "240px")}}

Cuộn ngang để xem các cột tràn ra.

## Sử dụng vertical media queries

Một vấn đề với multicol trên web là nếu các cột cao hơn viewport, người đọc sẽ cần cuộn trang lên xuống để đọc, điều này không phải là trải nghiệm người dùng tốt. Một cách để tránh điều này là chỉ áp dụng các thuộc tính cột khi bạn biết có đủ không gian dọc.

Trong ví dụ dưới đây, chúng ta đã sử dụng `height` [@media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) để đảm bảo có đủ không gian dọc trước khi áp dụng các thuộc tính cột.

```html hidden live-sample___min-height
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <p>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale. Celery potato scallion desert raisin horseradish spinach
    carrot soko.
  </p>
</div>
```

```css live-sample___min-height
body {
  font: 1.2em / 1.5 sans-serif;
}

@media (height >= 300px) {
  .container {
    column-width: 200px;
  }
}
```

Ví dụ này được hiển thị như sau:

{{EmbedLiveSample("min-height", "", "340px")}}

## Sử dụng column wrapping cho multicol

Các thuộc tính {{cssxref("column-height")}} và {{cssxref("column-wrap")}} có thể được sử dụng để đặt chiều cao cố định cho các cột được tạo ra và buộc các cột dư thừa tràn sang các hàng bổ sung theo hướng block. Trong writing mode ngang, điều này dẫn đến các hàng cột cuộn dọc, thay vì một hàng duy nhất cuộn ngang. Hãy xem một ví dụ.

HTML chứa nội dung văn bản cơ bản, được ẩn để ngắn gọn.

```html hidden
<p>
  This is a bunch of text split into three columns using the CSS
  <code>column-count</code> property with a value of <code>3</code>. It also
  includes a <code>column-height</code> value of <code>95vh</code>. The
  <code>column-wrap</code> value is set to its initial value, <code>auto</code>;
  when a <code>column-height</code> value is included,
  <code>column-wrap: auto</code> resolves to <code>wrap</code>, which allows the
  columns to wrap onto multiple rows. The text is equally distributed over the
  columns, and placed into multiple rows.
</p>

<p>
  The <code>column-height</code> and <code>column-wrap</code> properties were
  introduced in
  <a href="https://drafts.csswg.org/css-multicol-2/"
    >CSS Multi-column Layout Module Level 2</a
  >.
</p>
```

Chúng ta áp dụng một số kiểu dáng cho nội dung. Đáng chú ý nhất là chúng ta đặt {{cssxref("column-count")}} của phần tử `<body>` thành `2` và `column-height` thành `95vh` để mỗi hàng cột lấp đầy viewport. Chúng ta không cần đặt rõ ràng `column-wrap` thành `wrap`: khi `column-height` được đặt thành giá trị {{cssxref("&lt;length>")}}, giá trị ban đầu của `column-wrap` (`auto`) được giải thành `wrap`, đây thường là hành vi bạn muốn.

```css
body {
  font-size: 1.3em;
  line-height: 1.5;
  column-count: 3;
  column-height: 95vh;
}
```

```css hidden
html {
  font-family: sans-serif;
}

body {
  width: 70%;
  margin: 0 auto;
}

p:first-of-type {
  margin-top: 0;
}
```

```css hidden
@supports not (column-height: 5em) {
  body::before {
    content: "Your browser does not support the 'column-height' property.";
    background-color: wheat;
    position: fixed;
    inset: 40% 0;
    height: fit-content;
    text-align: center;
    padding: 1rem 0;
  }
}
```

Ví dụ này được hiển thị như sau:

{{EmbedLiveSample('Sử dụng column wrapping cho multicol', 'auto', 240)}}

## Các bước tiếp theo

Trong hướng dẫn cuối cùng của chuỗi này, chúng ta sẽ xem [cách fragmentation hoạt động với multicol layouts](/en-US/docs/Web/CSS/Guides/Multicol_layout/Handling_content_breaks) để cho chúng ta khả năng kiểm soát cách nội dung ngắt giữa các cột.
