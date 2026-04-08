---
title: counter-set
slug: Web/CSS/Reference/Properties/counter-set
page-type: css-property
browser-compat: css.properties.counter-set
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`counter-set`** đặt [bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters) trên phần tử về các giá trị đã cho.

Nếu các bộ đếm không tồn tại, thuộc tính `counter-set` sẽ tạo một bộ đếm mới cho mỗi tên bộ đếm trong danh sách các cặp bộ đếm và giá trị phân tách bằng khoảng trắng. Tuy nhiên, để tạo bộ đếm mới, nên sử dụng thuộc tính CSS {{cssxref("counter-reset")}}.

Nếu một tên bộ đếm trong danh sách không có giá trị, giá trị của bộ đếm đó sẽ được đặt thành `0`.

> [!NOTE]
> Giá trị của bộ đếm có thể được tăng hoặc giảm bằng thuộc tính CSS {{cssxref("counter-increment")}}.

{{InteractiveExample("CSS Demo: counter-set")}}

```css interactive-example-choice
counter-set: none;
```

```css interactive-example-choice
counter-set: chapter-count 0;
```

```css interactive-example-choice
counter-set: chapter-count;
```

```css interactive-example-choice
counter-set: chapter-count 5;
```

```css interactive-example-choice
counter-set: chapter-count -5;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="chapters">
    <h1>Alice's Adventures in Wonderland</h1>
    <h2>Down the Rabbit-Hole</h2>
    <h2 id="example-element">The Pool of Tears</h2>
    <h2>A Caucus-Race and a Long Tale</h2>
    <h2>The Rabbit Sends in a Little Bill</h2>
  </div>
</section>
```

```css interactive-example
#default-example {
  text-align: left;
  counter-set: chapter-count;
}

#example-element {
  background-color: #37077c;
  color: white;
}

h2 {
  counter-increment: chapter-count;
  font-size: 1em;
}

h2::before {
  content: "Chapter " counter(chapter-count) ": ";
}
```

## Cú pháp

```css
/* Đặt "my-counter" về 0 */
counter-set: my-counter;

/* Đặt "my-counter" về -1 */
counter-set: my-counter -1;

/* Đặt "counter1" về 1, và "counter2" về 4 */
counter-set: counter1 1 counter2 4;

/* Hủy bất kỳ bộ đếm nào có thể đã được đặt trong các quy tắc kém cụ thể hơn */
counter-set: none;

/* Giá trị toàn cục */
counter-set: inherit;
counter-set: initial;
counter-set: revert;
counter-set: revert-layer;
counter-set: unset;
```

Thuộc tính `counter-set` được chỉ định là một trong các dạng sau:

- Một `<custom-ident>` đặt tên cho bộ đếm, theo sau tùy chọn là một `<integer>`. Bạn có thể chỉ định nhiều bộ đếm để đặt lại, mỗi tên hoặc cặp tên-số được phân tách bằng dấu cách.
- Giá trị từ khóa `none`.

### Giá trị

- {{cssxref("custom-ident", "&lt;custom-ident&gt;")}}
  - : Tên của bộ đếm cần đặt.
- {{cssxref("&lt;integer&gt;")}}
  - : Giá trị để đặt bộ đếm tại mỗi lần xuất hiện của phần tử. Mặc định là `0` nếu không được chỉ định. Nếu hiện tại không có bộ đếm nào với tên đã cho trên phần tử, phần tử sẽ tạo một bộ đếm mới với tên đó có giá trị ban đầu là `0` (mặc dù sau đó có thể ngay lập tức đặt hoặc tăng giá trị đó thành một giá trị khác).
- `none`
  - : Không thực hiện việc đặt bộ đếm nào. Giá trị này có thể được dùng để ghi đè `counter-set` được định nghĩa trong một quy tắc kém cụ thể hơn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt các bộ đếm có tên

```css
h1 {
  counter-set: chapter section 1 page;
  /* Đặt bộ đếm chapter và page về 0,
     và bộ đếm section về 1 */
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)
- {{cssxref("counter-increment")}}
- {{cssxref("counter-reset")}}
- {{cssxref("@counter-style")}}
- Hàm {{cssxref("counter()")}} và {{cssxref("counters()")}}
- Thuộc tính {{cssxref("content")}}
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
