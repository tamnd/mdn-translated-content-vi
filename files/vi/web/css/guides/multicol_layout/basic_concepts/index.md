---
title: Basic concepts of multi-column layouts
short-title: Basic concepts
slug: Web/CSS/Guides/Multicol_layout/Basic_concepts
page-type: guide
sidebar: cssref
---

Multi-column layout, thường được gọi là multicol layout, là một đặc tả để dàn trang nội dung thành một tập hợp các column box giống như các cột trên báo in. Hướng dẫn này giải thích cách đặc tả hoạt động kèm theo một số ví dụ sử dụng phổ biến.

## Các thuộc tính chính

Multicol layout khác với bất kỳ phương pháp layout nào khác trong CSS; nó phân mảnh nội dung, bao gồm tất cả các phần tử con, thành các cột. Điều này xảy ra theo cách tương tự như nội dung bị phân mảnh thành các trang khi chúng ta làm việc với [CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media) bằng cách tạo print stylesheet.

Trong hướng dẫn này và các hướng dẫn tiếp theo, chúng ta sẽ thảo luận về các thuộc tính sau được định nghĩa trong module [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout):

- {{cssxref("column-width")}}
- {{cssxref("column-count")}}
- {{cssxref("columns")}} shorthand
- {{cssxref("column-rule-color")}}
- {{cssxref("column-rule-style")}}
- {{cssxref("column-rule-width")}}
- {{cssxref("column-rule")}} shorthand
- {{cssxref("column-span")}}
- {{cssxref("column-fill")}}
- {{cssxref("column-gap")}}
- {{cssxref("break-after")}}
- {{cssxref("break-before")}}
- {{cssxref("break-inside")}}

## Định nghĩa các cột

Bằng cách thêm thuộc tính `column-count` hoặc `column-width` vào một phần tử, hoặc sử dụng shorthand `columns`, phần tử đó trở thành _multi-column container_ hay gọi tắt là _multicol container_. Các cột là các anonymous box; chúng được mô tả là _column boxes_ trong đặc tả.

### Chỉ định số lượng cột

Thuộc tính `column-count` chỉ định số lượng cột mà bạn muốn nội dung hiển thị. Trình duyệt sau đó sẽ phân bổ lượng không gian chính xác cho mỗi column box để tạo ra số lượng cột được yêu cầu.

Trong ví dụ dưới đây, chúng ta sử dụng thuộc tính `column-count` để tạo ba cột trên phần tử `.container`. Nội dung, bao gồm cả các phần tử con của `.container`, sau đó được chia thành ba cột.

```html live-sample___column-count
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

```css live-sample___column-count
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-count: 3;
}
```

{{EmbedLiveSample("column-count", "", "280px")}}

Trong ví dụ trên, nội dung được bọc trong các thẻ đoạn văn `<p>` với kiểu dáng mặc định. Do đó, có một margin phía trên mỗi đoạn văn. Bạn có thể thấy cách margin này khiến dòng văn bản đầu tiên bị đẩy xuống. Điều này là do một multicol container tạo ra một [block formatting context (BFC)](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mà do đó các margin trên các phần tử con không collapse với bất kỳ margin nào trên container.

### Chỉ định chiều rộng của các cột

Thuộc tính `column-width` được sử dụng để đặt chiều rộng tối ưu cho mỗi column box. Nếu bạn khai báo chiều rộng cột, trình duyệt sẽ tính toán xem có bao nhiêu cột có chiều rộng đó vừa với multicol container và phân bổ không gian dư thừa đều giữa các cột. Do đó, chiều rộng cột nên được xem như chiều rộng tối thiểu vì các column box có thể rộng hơn do không gian bổ sung.

Trong trường hợp một cột duy nhất có ít không gian hơn giá trị của `column-width`, column box sẽ co lại để nhỏ hơn chiều rộng cột đã khai báo.

Trong ví dụ bên dưới, thuộc tính `column-width` được đặt thành `200px`. Chúng ta nhận được nhiều cột 200 pixel nhất có thể vừa với container, với không gian dư thừa được chia đều.

```html hidden live-sample___column-width
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

```css live-sample___column-width
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 200px;
}
```

{{EmbedLiveSample("column-width", "", "280px")}}

### Chỉ định cả số lượng và chiều rộng cột

Nếu bạn chỉ định cả hai thuộc tính trên một multicol container, thì `column-count` sẽ hoạt động như số lượng cột tối đa. Do đó, hành vi như được mô tả cho `column-width` sẽ xảy ra, cho đến khi số lượng cột trong `column-count` đạt được. Sau thời điểm này, không có thêm cột nào được vẽ, và không gian dư thừa được phân bổ đều giữa các cột hiện có, ngay cả khi có đủ chỗ cho thêm các cột theo kích thước `column-width` đã chỉ định.

Khi sử dụng cả hai thuộc tính cùng nhau, bạn có thể nhận được ít cột hơn so với giá trị được chỉ định trong `column-count`.

Trong ví dụ tiếp theo này, chúng ta sử dụng `column-width` là `200px` và `column-count` là `2`. Ngay cả khi có đủ chỗ cho nhiều hơn hai cột, chúng ta vẫn chỉ có hai cột. Nếu không có đủ chỗ cho hai cột ít nhất 200 pixel mỗi cột, chúng ta chỉ có một cột.

```html hidden live-sample___column-count-width
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
    carrot soko. .
  </p>
</div>
```

```css live-sample___column-count-width
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-count: 2;
  column-width: 200px;
}
```

{{EmbedLiveSample("column-count-width", "", "280px")}}

### Shorthand cho thuộc tính cột

Bạn có thể sử dụng shorthand `columns` để đặt giá trị `column-count` và `column-width`. Nếu bạn chỉ định một đơn vị độ dài, giá trị sẽ được sử dụng cho `column-width`, và nếu bạn chỉ định một số nguyên, giá trị sẽ được sử dụng cho `column-count`. Bạn có thể đặt cả hai thuộc tính, phân tách hai giá trị bằng khoảng trắng.

CSS này sẽ cho kết quả giống như [ví dụ đầu tiên](#chỉ_định_số_lượng_cột), với `column-count` được đặt thành `3`.

```css
.container {
  columns: 3;
}
```

CSS này sẽ cho kết quả giống như [ví dụ thứ hai](#chỉ_định_chiều_rộng_của_các_cột), với `column-width` là `200px`.

```css
.container {
  columns: 200px;
}
```

CSS này sẽ cho kết quả giống như [ví dụ thứ ba](#chỉ_định_cả_số_lượng_và_chiều_rộng_cột), với cả `column-count` và `column-width` được đặt.

```css
.container {
  columns: 2 200px;
}
```

## Các bước tiếp theo

Trong hướng dẫn này, chúng ta đã tìm hiểu cách sử dụng cơ bản của multi-column layout. Trong hướng dẫn tiếp theo, chúng ta sẽ xem xét mức độ chúng ta có thể [tạo kiểu cho bản thân các cột](/en-US/docs/Web/CSS/Guides/Multicol_layout/Styling_columns).
