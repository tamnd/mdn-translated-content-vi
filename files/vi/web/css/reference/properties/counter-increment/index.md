---
title: counter-increment
slug: Web/CSS/Reference/Properties/counter-increment
page-type: css-property
browser-compat: css.properties.counter-increment
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`counter-increment`** có thể được dùng để tăng hoặc giảm giá trị của các [bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters) được đặt tên theo các giá trị chỉ định, hoặc để ngăn tất cả bộ đếm hoặc một bộ đếm cụ thể không thay đổi giá trị.

Nếu một bộ đếm được đặt tên trong danh sách các bộ đếm và giá trị được phân tách bởi khoảng trắng không tồn tại, nó sẽ được tạo mới. Nếu không có giá trị nào được cung cấp cho một bộ đếm trong danh sách, bộ đếm đó sẽ được tăng thêm `1`.

Giá trị của bộ đếm có thể được đặt lại về bất kỳ số nguyên nào bằng thuộc tính CSS {{cssxref("counter-reset")}}.

{{InteractiveExample("CSS Demo: counter-increment")}}

```css interactive-example-choice
counter-increment: example-counter;
```

```css interactive-example-choice
counter-increment: example-counter 0;
```

```css interactive-example-choice
counter-increment: example-counter 5;
```

```css interactive-example-choice
counter-increment: example-counter -5;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">Counter value:</div>
</section>
```

```css interactive-example
#default-example {
  text-align: left;
  counter-reset: example-counter;
}

#example-element::after {
  content: counter(example-counter);
}
```

## Cú pháp

```css
/* Increases "my-counter" by 1 */
counter-increment: my-counter;

/* Decreases "my-counter" by 1 */
counter-increment: my-counter -1;

/* Increases "counter1" by 1 and decreases "counter2" by 4 */
counter-increment: counter1 counter2 -4;

/* Increases "page" by 1, "section" by 2, while "chapter" doesn't change */
counter-increment: chapter 0 section 2 page;

/* Do not increment/decrement anything: used to override less specific rules */
counter-increment: none;

/* Global values */
counter-increment: inherit;
counter-increment: initial;
counter-increment: revert;
counter-increment: revert-layer;
counter-increment: unset;
```

### Giá trị

Thuộc tính `counter-increment` nhận làm giá trị một danh sách tên bộ đếm phân tách bởi khoảng trắng được chỉ định dưới dạng `<custom-ident>` với giá trị `<integer>` tùy chọn, hoặc từ khóa `none`. Bạn có thể chỉ định bao nhiêu bộ đếm cần tăng tùy ý, với mỗi tên hoặc cặp tên-số được phân tách bởi khoảng trắng.

- {{cssxref("&lt;custom-ident&gt;")}}
  - : Chỉ định tên của bộ đếm cần tăng hoặc giảm.
- {{cssxref("&lt;integer&gt;")}}
  - : Chỉ định giá trị cần thêm vào bộ đếm. Nếu số nguyên đứng trước dấu `-`, giá trị sẽ bị trừ khỏi bộ đếm. Mặc định là `1` nếu không có giá trị nào được chỉ định.
- `none`
  - : Cho biết không có bộ đếm nào được tăng hoặc giảm. Giá trị này cũng có thể được dùng để hủy tất cả bộ đếm khỏi việc tăng hoặc giảm trong các quy tắc cụ thể hơn. Đây là giá trị mặc định của thuộc tính.

> [!NOTE]
> Sử dụng giá trị `none` ngăn tất cả bộ đếm tăng hoặc giảm cho các phần tử được chọn nơi quy tắc này áp dụng. Để chỉ ngăn các bộ đếm cụ thể tăng hoặc giảm, đặt giá trị `integer` là `0` trên (các) bộ đếm liên quan.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Giảm giá trị bộ đếm

Trong ví dụ này, chúng ta hiển thị một chuỗi số đếm ngược. Để làm điều này, chúng ta dùng một bộ đếm để hiển thị các số bắt đầu từ 100 và giảm đi 7 mỗi lần.

#### HTML

```html
<div>
  <i></i><i></i><i></i><i></i><i></i><i></i><i></i> <i></i><i></i><i></i><i></i
  ><i></i><i></i><i></i> <i></i><i></i><i></i><i></i><i></i><i></i><i></i>
  <i></i><i></i><i></i><i></i><i></i><i></i><i></i>
</div>
```

#### CSS

Chúng ta đặt giá trị ban đầu của bộ đếm tên `sevens` là `100` bằng cách dùng {{cssxref("counter-reset")}}. Sau đó, với mỗi {{HTMLElement("i")}}, chúng ta giảm bộ đếm đi `7`.

Để đặt lần đếm đầu tiên là `100`, chúng ta nhắm vào phần tử `<i>` đầu tiên bằng cách dùng lớp giả {{cssxref(":first-of-type")}} và đặt `counter-increment: none;`. Ngoài ra, thuộc tính {{cssxref("content")}} được dùng trong phần tử giả {{cssxref("::before")}} để hiển thị giá trị của bộ đếm bằng hàm [`counter()`](/en-US/docs/Web/CSS/Reference/Values/counter).

```css
div {
  counter-reset: sevens 100;
}
i {
  counter-increment: sevens -7;
}
i:first-of-type {
  counter-increment: none;
}
i::before {
  content: counter(sevens);
}
```

```css hidden
div {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  height: 300px;
  width: 200px;
}
i {
  flex: 0 0 2em;
}
```

#### Kết quả

{{EmbedLiveSample("Decreasing the counter value", 140, 300)}}

Nếu chúng ta không dùng `counter-reset` (hoặc {{cssxref("counter-set")}}) để tạo bộ đếm và đặt giá trị thành `100`, bộ đếm `sevens` vẫn sẽ được tạo nhưng với giá trị khởi tạo là `0`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính bộ đếm: {{cssxref("counter-set")}}, {{cssxref("counter-reset")}}
- At-rule bộ đếm: {{cssxref("@counter-style")}}
- Hàm bộ đếm: {{cssxref("counter()")}}, {{cssxref("counters()")}}
- Hướng dẫn [Sử dụng bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
