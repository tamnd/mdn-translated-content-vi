---
title: Using multi-column layouts
slug: Web/CSS/Guides/Multicol_layout/Using
page-type: guide
sidebar: cssref
---

Các thuộc tính được định nghĩa trong **module CSS multi-column layout** mở rộng _block layout mode_, cho phép định nghĩa nhiều cột văn bản. Người dùng gặp khó khăn khi đọc văn bản nếu các dòng quá dài. Nếu mắt mất quá nhiều thời gian để di chuyển từ cuối một dòng đến đầu dòng tiếp theo, người đọc có thể mất dấu dòng họ đang đọc. Để cung cấp trải nghiệm người dùng tốt hơn khi đọc văn bản trên màn hình lớn, bạn nên giới hạn chiều rộng của văn bản bằng cách sử dụng các cột văn bản đặt cạnh nhau, giống như các tờ báo làm.

## Sử dụng các cột

### Số lượng và chiều rộng cột

Hai thuộc tính CSS kiểm soát liệu và có bao nhiêu cột sẽ xuất hiện: {{cssxref("column-count")}} và {{cssxref("column-width")}}.

Thuộc tính `column-count` đặt số lượng cột thành một số cụ thể. Ví dụ:

## Ví dụ 1

### HTML

```html
<div id="col">
  <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua.
  </p>
  <p>
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
    aliquip ex ea commodo consequat.
  </p>
  <p>
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
    eu fugiat nulla pariatur.
  </p>
  <p>
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
    deserunt mollit anim id est laborum.
  </p>
</div>
```

### CSS

```css
#col {
  column-count: 2;
}
```

### Kết quả

Nội dung sẽ được hiển thị trong hai cột:

{{EmbedLiveSample("Example_1", "100%")}}

Thuộc tính `column-width` đặt chiều rộng cột tối thiểu mong muốn. Nếu `column-count` không được đặt, thì trình duyệt sẽ tự động tạo ra nhiều cột nhất có thể vừa với chiều rộng có sẵn.

## Ví dụ 2

### HTML

```html
<div id="wid">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</div>
```

### CSS

```css
#wid {
  column-width: 100px;
}
```

### Kết quả

{{EmbedLiveSample("Example_2", "100%")}}

Trong một multi-column block, nội dung tự động chảy từ cột này sang cột tiếp theo khi cần thiết. Tất cả chức năng HTML, CSS và DOM đều được hỗ trợ trong các cột, cũng như chỉnh sửa và in.

### Shorthand columns

Bạn có thể sử dụng {{cssxref("column-count")}} hoặc {{cssxref("column-width")}}. Vì các giá trị cho những thuộc tính này không chồng lấp, nên thường tiện lợi hơn khi sử dụng shorthand {{cssxref("columns")}}.

## Ví dụ 3

Trong ví dụ này, khai báo CSS `column-width: 12em` được thay thế bằng `columns: 12em`.

### HTML

```html
<div id="col_short">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</div>
```

### CSS

```css
#col_short {
  columns: 12em;
}
```

{{EmbedLiveSample("Example_3", "100%")}}

## Ví dụ 4

Trong ví dụ này, khai báo CSS `column-count: 4` được thay thế bằng `columns: 4`.

### HTML

```html
<div id="columns_4">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</div>
```

### CSS

```css
#columns_4 {
  columns: 4;
}
```

### Kết quả

{{EmbedLiveSample("Example_4", "100%")}}

## Ví dụ 5

Hai khai báo CSS `column-width: 8em` và `column-count: 12` có thể được thay thế bằng `columns: 12 8em`. Phần `column-count` của shorthand là số lượng cột tối đa sẽ có. `column-width` là chiều rộng tối thiểu mỗi cột nên có.

### HTML

```html
<div id="columns_12">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</div>
```

### CSS

```css
#columns_12 {
  columns: 12 8em;
}
```

### Kết quả

{{EmbedLiveSample("Example_5", "100%")}}

Giả sử khoảng cách `1em` mặc định giữa các cột, nếu container rộng hơn `103em` (12 cột \* chiều rộng `8em` mỗi cột + 7 khoảng cách `1em`), sẽ có 12 cột, mỗi cột có chiều rộng `8em` hoặc hơn. Nếu container rộng dưới `103em`, sẽ có ít hơn 12 cột. Nếu container rộng dưới `17em` (cột `8em` + cột `8em` + khoảng cách `1em`), nội dung sẽ được hiển thị dưới dạng một cột duy nhất không có column gap.

### Cân bằng chiều cao

CSS columns yêu cầu chiều cao cột phải được cân bằng: nghĩa là, trình duyệt tự động đặt chiều cao cột tối đa sao cho chiều cao của nội dung trong mỗi cột xấp xỉ bằng nhau. Firefox thực hiện điều này.

Tuy nhiên, trong một số tình huống, cũng hữu ích khi đặt chiều cao tối đa của các cột một cách rõ ràng, sau đó dàn trang nội dung bắt đầu từ cột đầu tiên và tạo ra nhiều cột khi cần thiết, có thể tràn sang bên phải. Do đó, nếu chiều cao bị giới hạn, bằng cách đặt các thuộc tính CSS {{cssxref("height")}} hoặc {{cssxref("max-height")}} trên một multi-column block, mỗi cột được phép phát triển đến chiều cao đó và không cao hơn trước khi thêm cột mới. Chế độ này cũng hiệu quả hơn nhiều cho layout.

### Column Gaps

Có một khoảng cách giữa các cột. Mặc định được khuyến nghị là `1em`. Kích thước này có thể được thay đổi bằng cách áp dụng thuộc tính {{cssxref("column-gap")}} cho multi-column block:

## Ví dụ 6

### HTML

```html
<div id="column_gap">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</div>
```

### CSS

```css
#column_gap {
  column-count: 5;
  column-gap: 2em;
}
```

### Kết quả

{{EmbedLiveSample("Example_6", "100%")}}

## Kết luận

CSS columns là một layout primitive có thể giúp làm cho các khối văn bản lớn dễ đọc hơn khi nội dung responsive được xem trên các viewport rộng. Các nhà phát triển sáng tạo có thể tìm thấy nhiều cách sử dụng cho chúng, đặc biệt là kết hợp với [container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries) và với tính năng tự động cân bằng chiều cao.
