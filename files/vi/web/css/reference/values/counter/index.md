---
title: counter()
slug: Web/CSS/Reference/Values/counter
page-type: css-function
browser-compat: css.types.counter
sidebar: cssref
---

Hàm **`counter()`** trong [CSS](/vi/docs/Web/CSS) trả về một chuỗi đại diện cho giá trị hiện tại của bộ đếm được đặt tên, nếu có.

Hàm `counter()` thường được sử dụng trong [pseudo-element](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements) thông qua thuộc tính {{cssxref("content")}}, nhưng về lý thuyết, nó có thể được sử dụng ở bất kỳ đâu mà giá trị {{cssxref("string")}} được hỗ trợ.

{{InteractiveExample("CSS Demo: counter()", "tabbed-shorter")}}

```css interactive-example
.double-list {
  counter-reset: count -1;
}

.double-list li {
  counter-increment: count 2;
}

.double-list li::marker {
  content: counter(count, decimal) ") ";
}
```

```html interactive-example
<p>Best Dynamic Duos in Sports:</p>
<ol class="double-list">
  <li>Simone Biles + Jonathan Owens</li>
  <li>Serena Williams + Venus Williams</li>
  <li>Aaron Judge + Giancarlo Stanton</li>
  <li>LeBron James + Dwyane Wade</li>
  <li>Xavi Hernandez + Andres Iniesta</li>
</ol>
```

## Cú pháp

```css
/* Sử dụng cơ bản */
counter(counter-name);

/* thay đổi hiển thị bộ đếm */
counter(counter-name, upper-roman)
```

Bản thân [Bộ đếm](/vi/docs/Web/CSS/Guides/Counter_styles/Using_counters) không có hiệu ứng hiển thị.
Các hàm `counter()` và {{cssxref("counters()")}} là thứ làm cho bộ đếm hữu ích bằng cách trả về các chuỗi (hoặc hình ảnh) do nhà phát triển định nghĩa.

### Giá trị

Hàm `counter()` chấp nhận tối đa hai tham số. Tham số đầu tiên là `<counter-name>`. Tham số thứ hai tùy chọn là `<counter-style>`.

- `<counter-name>`
  - : Một {{cssxref("&lt;custom-ident&gt;")}} xác định bộ đếm, là cùng tên phân biệt chữ hoa chữ thường được sử dụng với các giá trị thuộc tính {{cssxref("counter-reset")}} và {{cssxref("counter-increment")}}. Tên bộ đếm không thể bắt đầu bằng hai dấu gạch ngang và không thể là `none`, `unset`, `initial`, hoặc `inherit`.
- `<counter-style>`
  - : Tên {{cssxref("&lt;list-style-type&gt;")}}, tên {{cssxref("&lt;@counter-style&gt;")}} hoặc hàm {{cssxref("symbols()")}}, trong đó tên kiểu bộ đếm là kiểu bộ đếm được định nghĩa trước `numeric`, `alphabetic`, hoặc `symbolic`, kiểu bộ đếm được định nghĩa trước chữ hán phức tạp Đông Á hoặc Ethiopic, hoặc [kiểu bộ đếm được định nghĩa trước](/vi/docs/Web/CSS/Guides/Counter_styles) khác. Nếu bỏ qua, kiểu bộ đếm mặc định là `decimal`.

> [!NOTE]
> Để nối các giá trị bộ đếm khi lồng bộ đếm, sử dụng hàm {{cssxref("counters()")}}, cung cấp thêm tham số {{cssxref("string")}}.

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### lower-roman so với lower-alpha

Trong ví dụ này, chúng ta hiển thị bộ đếm sử dụng kiểu danh sách `lower-roman` và `lower-alpha`.

#### HTML

```html
<ol>
  <li></li>
  <li></li>
  <li></li>
</ol>
```

#### CSS

```css-nolint
ol {
  counter-reset: count;
}
li {
  counter-increment: count;
}
li::after {
  content:
    "[" counter(count, lower-roman) "] == ["
    counter(count, lower-alpha) "]";
}
```

#### Kết quả

{{EmbedLiveSample("lower-roman compared to lower-alpha", "100%", 150)}}

### Hiển thị bộ đếm sử dụng ba kiểu

Trong ví dụ này, chúng ta sử dụng hàm `counter()` ba lần.

#### HTML

```html
<ol>
  <li></li>
  <li></li>
  <li></li>
</ol>
```

#### CSS

Chúng ta bao gồm hàm `counter()` với ba kiểu bộ đếm khác nhau, bao gồm giá trị thập phân mặc định. Chúng ta đã thêm padding vào danh sách để cung cấp không gian cho chuỗi `::marker` dài.

```css-nolint
ol {
  counter-reset: listCounter;
  padding-left: 5em;
}
li {
  counter-increment: listCounter;
}
li::marker {
  content:
    "Item #" counter(listCounter) " is: ";
}
li::after {
  content:
    "[" counter(listCounter, decimal-leading-zero) "] == ["
    counter(listCounter, upper-roman) "]";
}
```

#### Kết quả

{{EmbedLiveSample("Displaying a counter using three styles", "100%", 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Counters](/vi/docs/Web/CSS/Guides/Counter_styles/Using_counters)
- {{cssxref("counter-reset")}}
- {{cssxref("counter-set")}}
- {{cssxref("counter-increment")}}
- {{cssxref("@counter-style")}}
- Hàm CSS [`counters()`](/vi/docs/Web/CSS/Reference/Values/counters)
- Mô-đun [CSS lists and counters](/vi/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/vi/docs/Web/CSS/Guides/Counter_styles)
- Mô-đun [CSS generated content](/vi/docs/Web/CSS/Guides/Generated_content)
