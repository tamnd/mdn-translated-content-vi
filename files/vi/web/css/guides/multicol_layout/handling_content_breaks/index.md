---
title: Handling content breaks in multi-column layout
short-title: Handling content breaks
slug: Web/CSS/Guides/Multicol_layout/Handling_content_breaks
page-type: guide
sidebar: cssref
---

Nội dung giữa các column box trong multicol layout ngắt theo cách tương tự như nó ngắt giữa các trang trong paged media. Trong cả hai ngữ cảnh, bạn có thể kiểm soát nơi và cách nội dung ngắt bằng cách sử dụng các thuộc tính của module [CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation). Trong hướng dẫn này, chúng ta thấy cách fragmentation hoạt động trong một _multi-column container_ hay gọi tắt là _multicol container_.

## Kiến thức cơ bản về fragmentation

Module CSS fragmentation cung cấp chi tiết về cách nội dung ngắt giữa các fragmentation container hay _fragmentainers_. Module [multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout), mặt khác, định nghĩa các thuộc tính {{cssxref("break-after")}}, {{cssxref("break-before")}}, và {{cssxref("break-inside")}} cung cấp một số kiểm soát trong và giữa các cột. Trong multicol layout, một column box là một fragment container.

Một column box có thể chứa các markup khác và có nhiều vị trí mà một ngắt sẽ không lý tưởng. Ví dụ, chúng ta thường muốn tiêu đề hình ảnh không bị tách ra sang một cột mới cách xa hình ảnh mà nó đề cập. Ngoài ra, kết thúc một cột bằng một tiêu đề trông kỳ lạ. Các thuộc tính fragmentation multicol cung cấp cho chúng ta cách kiểm soát điều này.

Có nhiều vị trí chúng ta có thể muốn kiểm soát các ngắt:

- Ngắt bên trong các box, ví dụ bên trong một phần tử figure.
- Ngắt trước và sau các box, ví dụ về tiêu đề ở trên.
- Ngắt giữa các dòng.

## Ngắt bên trong các box

Để kiểm soát ngắt bên trong các box, hãy sử dụng thuộc tính {{cssxref("break-inside")}}. Thuộc tính này nhận các giá trị:

- `auto`
- `avoid`
- `avoid-page`
- `avoid-column`
- `avoid-region`

Trong ví dụ dưới đây, chúng ta đã áp dụng break-inside cho phần tử figure để ngăn tiêu đề bị tách ra khỏi hình ảnh.

```html live-sample___break-inside
<div class="container">
  <figure>
    <img
      alt="Multiple hot air balloons in a clear sky, a crowd of spectators gather in the foreground."
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
    <figcaption>Balloons</figcaption>
  </figure>
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
  </p>
</div>
```

```css live-sample___break-inside
body {
  font: 1.2em / 1.5 sans-serif;
}

img {
  max-width: 100%;
}
figure {
  margin: 0;
  break-inside: avoid;
}
figcaption {
  font-weight: bold;
  border-bottom: 2px solid #999999;
}
.container {
  column-width: 200px;
}
```

{{EmbedLiveSample("break-inside", "", "230px")}}

## Ngắt trước và sau các box

Các thuộc tính {{cssxref("break-before")}} và {{cssxref("break-after")}} được sử dụng để kiểm soát ngắt trước và sau các phần tử. Chúng nhận các giá trị sau khi trong ngữ cảnh multicol:

- auto
- avoid
- avoid-column
- column

Trong ví dụ tiếp theo này, chúng ta đang buộc ngắt cột trước một phần tử `h2`.

```html live-sample___break-before
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon.
  </p>
  <h2>My heading</h2>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <p>Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce.</p>
</div>
```

```css live-sample___break-before
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 250px;
}

h2 {
  break-before: column;
}
```

{{EmbedLiveSample("break-before", "", "250px")}}

## Ngắt giữa các dòng

Các thuộc tính {{cssxref("orphans")}} và {{cssxref("widows")}}, thuộc module CSS fragmentation, cũng hữu ích và đáng đề cập. Thuộc tính `orphans` kiểm soát số dòng còn lại một mình ở cuối một fragment. Thuộc tính `widows` kiểm soát số dòng còn lại một mình ở đầu một fragment.

Các thuộc tính `orphans` và `widows` nhận một {{CSSXref("integer")}} làm giá trị, đại diện cho số dòng cần giữ cùng nhau ở cuối và đầu của một fragment tương ứng. Lưu ý rằng các thuộc tính này chỉ hoạt động bên trong một block container, chẳng hạn như một đoạn văn. Nếu block có ít dòng hơn số bạn chỉ định làm giá trị, tất cả các dòng sẽ được giữ cùng nhau.

Trong ví dụ dưới đây, chúng ta đang sử dụng thuộc tính `orphans` để kiểm soát số dòng còn lại ở cuối cột. Bạn có thể thay đổi giá trị đó để xem tác động đến việc ngắt nội dung.

```html live-sample___orphans
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <p>Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce.</p>
</div>
```

```css live-sample___orphans
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  column-width: 250px;
  orphans: 3;
}
```

{{EmbedLiveSample("orphans", "", "240px")}}

## Khi mọi thứ không hoạt động như mong đợi

Nếu bạn có lượng nội dung nhỏ và đang cố gắng kiểm soát ngắt trên nhiều phần tử, nội dung của bạn cần ngắt ở đâu đó, vì vậy bạn có thể không luôn nhận được kết quả như ý muốn. Ở một mức độ nào đó, việc sử dụng fragmentation của bạn luôn là một gợi ý cho trình duyệt, để kiểm soát các ngắt theo cách này nếu có thể. Nếu nội dung không ngắt ở nơi bạn định, kết quả có thể trông lộn xộn, nhưng nội dung vẫn có thể truy cập được cho người dùng của bạn.
