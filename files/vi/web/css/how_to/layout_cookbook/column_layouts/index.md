---
title: Column layouts
slug: Web/CSS/How_to/Layout_cookbook/Column_layouts
page-type: how-to
sidebar: cssref
---

Bạn thường sẽ cần tạo một bố cục có nhiều cột, và CSS cung cấp một số cách để làm điều này. Việc bạn sử dụng [Multi-column](/en-US/docs/Web/CSS/Guides/Multicol_layout), [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) hay [Grid](/en-US/docs/Web/CSS/Guides/Grid_layout) layout sẽ phụ thuộc vào những gì bạn đang cố gắng đạt được, và trong công thức này chúng ta khám phá các tùy chọn đó.

![ba kiểu bố cục khác nhau, mỗi kiểu có hai cột trong container.](cookbook-multiple-columns.png)

## Yêu cầu

Có một số mẫu thiết kế bạn có thể muốn đạt được với các cột của mình:

- [Một luồng nội dung liên tục được chia thành các cột kiểu báo](#a_continuous_thread_of_content_—_multi-column_layout).
- [Một hàng mục được sắp xếp dưới dạng cột, tất cả có chiều cao bằng nhau](#a_single_row_of_items_with_equal_heights_—_flexbox).
- [Nhiều hàng cột được căn chỉnh theo hàng và cột](#lining_items_up_in_rows_and_columns_—_grid_layout).

## Các công thức

Bạn cần chọn các phương pháp layout khác nhau để đáp ứng yêu cầu của mình.

### Một luồng nội dung liên tục — multi-column layout

Nếu bạn tạo các cột bằng multi-column layout, văn bản của bạn sẽ vẫn là một luồng liên tục lấp đầy từng cột lần lượt. Các cột phải có cùng kích thước, và bạn không thể nhắm mục tiêu vào từng cột riêng lẻ hay nội dung của từng cột riêng lẻ.

Bạn có thể kiểm soát khoảng cách giữa các cột bằng thuộc tính {{cssxref("column-gap")}} hoặc {{cssxref("gap")}}, và thêm đường phân chia giữa các cột bằng {{cssxref("column-rule")}}.

Nhấp vào "Play" trong các khối code bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___multi-column-layout-example
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
  </p>
</div>
```

```css live-sample___multi-column-layout-example
.container {
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  padding: 20px;
  font: 1.2em sans-serif;

  column-width: 10em;
  column-rule: 1px solid rgb(75 70 74);
}
```

{{EmbedLiveSample("multi-column-layout-example", "", "350px")}}

Trong ví dụ này, chúng ta sử dụng thuộc tính {{cssxref("column-width")}} để đặt chiều rộng tối thiểu mà các cột cần có trước khi trình duyệt thêm một cột bổ sung. Thuộc tính rút gọn {{cssxref("columns")}} có thể được dùng để đặt thuộc tính `column-width` và {{cssxref("column-count")}}, một trong hai có thể xác định số lượng cột tối đa được cho phép.

Sử dụng multicol khi:

- Bạn muốn văn bản của mình hiển thị trong các cột kiểu báo.
- Bạn có một bộ mục nhỏ muốn chia thành các cột.
- Bạn không cần nhắm mục tiêu vào từng hộp cột riêng lẻ để tạo kiểu.

### Một hàng mục có chiều cao bằng nhau — flexbox

Flexbox có thể được dùng để chia nội dung thành các cột bằng cách đặt {{cssxref("display", "display: flex;")}} để biến phần tử cha thành flex-container. Chỉ cần thêm một thuộc tính này sẽ biến tất cả các phần tử con (phần tử con, pseudo-element và text node) thành các flex item trên một dòng duy nhất. Đặt thuộc tính rút gọn {{cssxref("flex")}} với giá trị số đơn phân phối đều tất cả khoảng trống có sẵn, thường làm cho tất cả các flex item có cùng kích thước miễn là không có nội dung không xuống dòng buộc mục phải lớn hơn.

Margins hoặc thuộc tính `gap` có thể được dùng để tạo khoảng cách giữa các mục, nhưng hiện không có thuộc tính CSS nào thêm đường phân chia giữa các flex item.

```html live-sample___columns-flexbox-example
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

```css live-sample___columns-flexbox-example
.container {
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  padding: 20px 10px;
  font: 1.2em sans-serif;

  display: flex;
}

.container > * {
  padding: 10px;
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;

  margin: 0 10px;
  flex: 1;
}
```

{{EmbedLiveSample("columns-flexbox-example", "", "400px")}}

Để tạo bố cục với các flex item xuống hàng mới, hãy đặt thuộc tính {{cssxref("flex-wrap")}} trên container thành `wrap`. Lưu ý rằng mỗi dòng flex phân phối khoảng trống chỉ cho dòng đó. Các mục trên một dòng không nhất thiết phải căn chỉnh với các mục trên các dòng khác, như bạn sẽ thấy trong ví dụ dưới đây. Đây là lý do tại sao flexbox được mô tả là một chiều. Nó được thiết kế để kiểm soát bố cục theo hàng hoặc cột, nhưng không phải cả hai cùng lúc.

```html live-sample___columns-flexbox-wrapping-example
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

```css live-sample___columns-flexbox-wrapping-example
.container {
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  padding: 20px 10px;
  width: 500px;
  font: 1.2em sans-serif;

  display: flex;
  flex-wrap: wrap;
}

.container > * {
  padding: 10px;
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;

  margin: 0 10px;
  flex: 1 1 200px;
}
```

{{EmbedLiveSample("columns-flexbox-wrapping-example", "", "450px")}}

Sử dụng flexbox:

- Cho hàng hoặc cột đơn các mục.
- Khi bạn muốn căn chỉnh trên trục chéo sau khi bố cục các mục.
- Khi bạn không cần các mục được bọc chia sẻ khoảng trống dọc theo dòng của chúng mà không căn chỉnh với các mục trên các dòng khác.

### Căn chỉnh các mục theo hàng và cột — grid layout

Nếu bạn muốn một grid hai chiều trong đó các mục được căn chỉnh theo cả hàng _lẫn_ cột, thì bạn nên chọn CSS grid layout. Tương tự như cách flexbox hoạt động trên các phần tử con trực tiếp của flex container, grid layout hoạt động trên các phần tử con trực tiếp của grid container. Chỉ cần đặt {{cssxref("display", "display: grid;")}} trên container. Các thuộc tính đặt trên container này — như {{cssxref("grid-template-columns")}} và {{cssxref("grid-template-rows")}} — xác định cách các mục được phân phối dọc theo hàng và cột.

Nhấp vào "Play" trong các khối code bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___grid-layout-example
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens.
  </p>

  <p>
    Nori grape silver beet broccoli kombu beet greens fava bean potato quandong
    celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens
    parsnip. .
  </p>
</div>
```

```css live-sample___grid-layout-example
.container {
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  padding: 20px;
  width: 500px;
  font: 1.2em sans-serif;

  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 20px;
}

.container > * {
  padding: 10px;
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;
  margin: 0;
}
```

{{EmbedLiveSample("grid-layout-example", "", "450px")}}

Sử dụng grid:

- Cho nhiều hàng hoặc cột các mục.
- Khi bạn muốn căn chỉnh các mục trên cả trục block lẫn inline.
- Khi bạn muốn các mục được căn chỉnh theo hàng và cột.

## Tài nguyên trên MDN

- [Guide to Multi-column Layout](/en-US/docs/Web/CSS/Guides/Multicol_layout)
- [Guide to flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- [Guide to CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
