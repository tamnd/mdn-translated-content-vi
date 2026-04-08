---
title: Styling columns
slug: Web/CSS/Guides/Multicol_layout/Styling_columns
page-type: guide
sidebar: cssref
---

Vì các column box được tạo ra bên trong các container multi-column (_multicol_) là các anonymous box nên không thể tạo kiểu cho từng cột riêng lẻ, nhưng chúng ta có thể tạo kiểu cho các khoảng cách giữa các cột và container nói chung. Hướng dẫn này giải thích cách thay đổi khoảng cách và tạo kiểu các đường kẻ giữa các cột.

## Column gaps

Khoảng cách giữa các cột được kiểm soát bằng thuộc tính {{CSSXref("column-gap")}} hoặc {{CSSXref("gap")}}. Thuộc tính `column-gap` được định nghĩa trong module [multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout). Thuộc tính `gap` được định nghĩa trong module [box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment). Đây là một thuộc tính thống nhất để định nghĩa khoảng cách giữa các box trong tất cả các layout hỗ trợ gaps, bao gồm [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment) và [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items).

Giá trị ban đầu của `column-gap` là `1em`, giúp ngăn các cột chạy vào nhau. Trong các phương pháp layout khác, `column-gap` được hỗ trợ như một từ đồng nghĩa cho `gap`, nhưng với giá trị ban đầu là `0`. Giá trị từ khóa `normal` đặt `column-gap` về giá trị ban đầu.

Bạn có thể thay đổi khoảng cách bằng cách sử dụng bất kỳ giá trị {{cssxref("length")}} nào. Trong ví dụ dưới đây, `column-gap` được đặt thành `40px`.

```html live-sample___column-gap
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

```css live-sample___column-gap
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-count: 3;
  column-gap: 40px;
}
```

{{EmbedLiveSample("column-gap", "", "300px")}}

Giá trị được phép cho `column-gap` là {{cssxref("length-percentage")}}, nghĩa là phần trăm được phép. Giá trị phần trăm cho `column-gap` được tính toán dưới dạng phần trăm của chiều rộng multicol container.

## Column rules

Đặc tả định nghĩa {{CSSXref("column-rule-width")}}, {{CSSXref("column-rule-style")}} và {{CSSXref("column-rule-color")}}, cung cấp shorthand {{CSSXref("column-rule")}}. Các thuộc tính này hoạt động theo cách hoàn toàn giống như các thuộc tính {{CSSXref("border")}}: bất kỳ {{CSSXref("line-style")}} nào cũng có thể được sử dụng như `column-rule-style`, giống như cho {{CSSXref("border-style")}} hợp lệ.

Các thuộc tính này được áp dụng cho phần tử, là multicol container, và do đó tất cả các cột sẽ có cùng một đường kẻ. Các đường kẻ chỉ được vẽ giữa các cột chứ không phải trên các cạnh ngoài. Các đường kẻ cũng chỉ được vẽ giữa các cột có nội dung.

Trong ví dụ tiếp theo này, một đường kẻ chấm 5px với màu `rebeccapurple` đã được tạo ra bằng cách sử dụng các giá trị longhand.

```html hidden live-sample___column-rule
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

```css live-sample___column-rule
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-count: 3;
  column-rule-width: 5px;
  column-rule-style: dotted;
  column-rule-color: rebeccapurple;
}
```

{{EmbedLiveSample("column-rule", "", "300px")}}

Lưu ý rằng bản thân đường kẻ không chiếm bất kỳ không gian nào: một đường kẻ rộng sẽ không đẩy các cột ra xa để tạo chỗ cho đường kẻ. Thay vào đó, đường kẻ phủ lên khoảng cách.

Ví dụ dưới đây sử dụng một đường kẻ rất rộng `40px` và khoảng cách `10px`. Đường kẻ hiển thị bên dưới nội dung cột. Để tạo không gian ở cả hai bên của đường kẻ, khoảng cách cần được tăng lên lớn hơn `40px`.

```html hidden live-sample___column-rule-wide
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

```css live-sample___column-rule-wide
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-count: 3;
  column-gap: 10px;
  column-rule: 40px solid rebeccapurple;
}
```

{{EmbedLiveSample("column-rule-wide", "", "300px")}}

## Các bước tiếp theo

Bài viết này trình bày chi tiết tất cả các cách hiện tại để tạo kiểu cho column boxes. Trong hướng dẫn tiếp theo, chúng ta sẽ xem xét cách làm cho các phần tử bên trong container [trải dài qua tất cả các cột](/en-US/docs/Web/CSS/Guides/Multicol_layout/Spanning_balancing_columns).
