---
title: Spanning and balancing columns
slug: Web/CSS/Guides/Multicol_layout/Spanning_balancing_columns
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta xem xét cách làm cho các phần tử trải dài qua các cột bên trong container multi-column (_multicol_) và cách kiểm soát việc các cột được lấp đầy như thế nào.

## Trải dài qua các cột

Để làm cho một phần tử trải dài qua các cột, hãy sử dụng thuộc tính {{cssxref("column-span")}} với giá trị `all`. Điều này sẽ khiến phần tử trở thành một _spanner_, trải dài qua tất cả các cột.

Bất kỳ phần tử con nào của multicol container đều có thể được biến thành spanner, bao gồm cả con trực tiếp và con gián tiếp. Ví dụ, một tiêu đề lồng trực tiếp bên trong container có thể trở thành spanner, cũng như một tiêu đề lồng bên trong một {{HTMLElement("section")}} lồng bên trong multicol container.

Trong ví dụ dưới đây, phần tử `<h2>` được đặt thành `column-span: all` và trải dài qua tất cả các cột.

```html live-sample___h2-span
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
    corn soko endive gumbo gourd.
  </p>
  <h2>A heading</h2>
  <p>
    Parsley shallot courgette tatsoi pea sprouts fava bean collard greens
    dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko
    zucchini.
  </p>
  <p>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale. Celery potato scallion desert raisin horseradish spinach
    carrot soko.
  </p>
</div>
```

```css live-sample___h2-span
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 250px;
}

h2 {
  column-span: all;
  background-color: #4d4e53;
  color: white;
}
```

{{EmbedLiveSample("h2-span", "", "420px")}}

Trong ví dụ thứ hai này, tiêu đề nằm bên trong một phần tử {{HTMLElement("article")}}, nhưng vẫn trải dài qua nội dung như mong đợi.

```html live-sample___nested-h2-span
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
    corn soko endive gumbo gourd.
  </p>
  <article>
    <h2>A heading</h2>
    <p>
      Parsley shallot courgette tatsoi pea sprouts fava bean collard greens
      dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko
      zucchini.
    </p>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </article>
</div>
```

```css live-sample___nested-h2-span
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 250px;
}

h2 {
  column-span: all;
  background-color: #4d4e53;
  color: white;
}
```

{{EmbedLiveSample("nested-h2-span", "", "420px")}}

Khi một spanner được đưa vào, nó phá vỡ luồng của các cột; các cột khởi động lại sau spanner, tạo ra một tập hợp column box mới một cách hiệu quả. Nội dung không nhảy qua một phần tử spanning.

### Giới hạn của column-span

`column-span` chỉ có thể có hai giá trị. Giá trị ban đầu `none` có nghĩa là phần tử không trải dài và nằm trong một cột. Giá trị `all` có nghĩa là phần tử trải dài qua tất cả các cột. Không có giá trị nào cho phép trải dài một phần, chẳng hạn như có một phần tử trải dài hai trong ba cột.

### Những điều cần lưu ý

Nếu phần tử spanning nằm bên trong một phần tử khác có margins, padding và border hoặc màu nền, hộp có thể xuất hiện phía trên spanner với phần còn lại của nội dung được hiển thị bên dưới. Vì lý do này, cần cẩn thận khi đặt một phần tử để trải dài qua tất cả các cột, đảm bảo tình huống này được tính đến.

```html hidden live-sample___mpb-span
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
    corn soko endive gumbo gourd.
  </p>
  <article>
    <h2>A heading</h2>
    <p>
      Parsley shallot courgette tatsoi pea sprouts fava bean collard greens
      dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko
      zucchini.
    </p>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </article>
</div>
```

```css live-sample___mpb-span
body {
  font: 1.2em / 1.5 sans-serif;
}

article {
  border: 1px solid red;
  padding: 10px;
}

.container {
  column-width: 250px;
}
h2 {
  background-color: #4d4e53;
  color: white;
  column-span: all;
}
```

{{EmbedLiveSample("mpb-span", "", "420px")}}

Ngoài ra, nếu một phần tử spanning xuất hiện muộn hơn trong nội dung, nó có thể gây ra hành vi không mong muốn khi không có đủ nội dung để tạo các cột sau spanner. Hãy sử dụng spanning một cách cẩn thận và kiểm tra ở các breakpoints khác nhau để đảm bảo bạn nhận được hiệu ứng như mong muốn.

## Lấp đầy và cân bằng các cột

Một tập hợp cột cân bằng là nơi tất cả các cột có xấp xỉ cùng lượng nội dung. Lấp đầy và cân bằng có liên quan khi lượng nội dung không khớp với lượng không gian được cung cấp, chẳng hạn khi khai báo {{CSSXref("height")}} trên container.

Giá trị ban đầu cho {{cssxref("column-fill")}} là `balance`. Giá trị `balance` có nghĩa là tất cả các cột được cân bằng nhiều nhất có thể. Trong các ngữ cảnh phân mảnh, chẳng hạn như [paged media](/en-US/docs/Web/CSS/Guides/Paged_media), chỉ có fragment cuối cùng được cân bằng. Điều này có nghĩa là trên trang cuối cùng, tập hợp column box cuối cùng được cân bằng.

Giá trị cân bằng khác, `balance-all`, cân bằng tất cả các cột trong các ngữ cảnh phân mảnh.

Các cột trong ví dụ này chứa hình ảnh và một số văn bản, được cân bằng. Hình ảnh, không thể ngắt được, nằm trong cột đầu tiên. Các cột khác được cân bằng, lấp đầy với lượng văn bản bằng nhau.

```html live-sample___balance
<div class="container">
  <img
    alt="Multiple hot air balloons in a clear sky, a crowd of spectators gather in the foreground."
    src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion.
  </p>
</div>
```

```css live-sample___balance
body {
  font: 1.2em / 1.5 sans-serif;
}
h2 {
  background-color: #4d4e53;
  color: white;
}
img {
  max-width: 100%;
}
.container {
  column-width: 200px;
  column-fill: balance;
  height: 250px;
}
```

{{EmbedLiveSample("balance", "", "250px")}}

Giá trị `auto` cho `column-fill` lấp đầy một cột tuần tự, lấp đầy cột đầu tiên theo hướng inline-start, trước khi đặt nội dung vào các cột tiếp theo, thay vì cân bằng và lấp đầy tất cả các cột đều nhau. Trong ví dụ này, chúng ta đã thay đổi `column-fill` thành `auto`. Các cột được lấp đầy đến chiều cao của container, để lại các cột trống ở cuối.

```html hidden live-sample___auto
<div class="container">
  <img
    alt="Multiple hot air balloons in a clear sky, a crowd of spectators gather in the foreground."
    src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion.
  </p>
</div>
```

```css live-sample___auto
body {
  font: 1.2em / 1.5 sans-serif;
}
h2 {
  background-color: #4d4e53;
  color: white;
}
img {
  max-width: 100%;
}

.container {
  column-width: 150px;
  column-fill: auto;
  height: 250px;
}
```

{{EmbedLiveSample("auto", "", "250px")}}

## Các bước tiếp theo

Trong hướng dẫn tiếp theo, bạn sẽ tìm hiểu [cách multicol xử lý overflow](/en-US/docs/Web/CSS/Guides/Multicol_layout/Handling_overflow) trong các cột và khi có nhiều cột hơn số cột có thể vừa trong container.
