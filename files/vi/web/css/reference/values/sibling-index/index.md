---
title: sibling-index()
slug: Web/CSS/Reference/Values/sibling-index
page-type: css-function
browser-compat: css.types.sibling-index
sidebar: cssref
---

Hàm **`sibling-index()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) trả về một số nguyên đại diện cho vị trí của phần tử hiện tại trong cây DOM so với tất cả các phần tử anh em của nó. Giá trị trả về là số chỉ mục vị trí của con theo ngữ cảnh trong tất cả các phần tử anh em trong một phần tử cha, với con đầu tiên trả về `1` và con cuối cùng trả về `length` của {{domxref("Element.children")}}.

> [!NOTE]
> Giống như lớp giả {{CSSxRef(":nth-child()")}}, `sibling-index()` bắt đầu từ 1, không phải 0.

> [!NOTE]
> Hàm {{CSSxRef("counter()")}} cung cấp kết quả tương tự nhưng trả về `<string>` (phù hợp hơn cho [nội dung được tạo](/vi/docs/Web/CSS/Guides/Generated_content)), trong khi `sibling-index()` trả về `<integer>` (có thể dùng cho các phép tính).

{{InteractiveExample("CSS Demo: sibling-index()")}}

```css interactive-example-choice
--width: calc(sibling-index() * 30px);
```

```css interactive-example-choice
--width: calc(sibling-index() * 20px);
```

```css interactive-example-choice
--width: calc(sibling-index() * 10px);
```

```css interactive-example-choice
--width: 100px;
```

```html interactive-example
<ul id="example-element">
  <li>1</li>
  <li>2</li>
  <li>3</li>
  <li>4</li>
  <li>5</li>
  <li>6</li>
  <li>7</li>
  <li>8</li>
  <li>9</li>
  <li>10</li>
</ul>
```

```css interactive-example
#example-element {
  list-style-type: none;
  padding: 0;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
}

#example-element > li {
  text-align: center;
  padding: 2px;
  border-radius: 8px;
  width: var(--width, calc(sibling-index() * 30px));
  color: white;
  background-color: hsl(
    calc(360deg / sibling-count() * sibling-index()) 50% 50%
  );
}
```

## Cú pháp

```css-nolint
sibling-index()
```

### Tham số

Hàm `sibling-index()` không chấp nhận tham số.

### Giá trị trả về

Một số nguyên; vị trí của phần tử hiện tại trong thứ tự anh em của cây DOM.

## Ví dụ

### Chiều rộng danh sách động

Ví dụ này minh họa cách tăng động chiều rộng của mỗi mục {{htmlelement("li")}} trong {{htmlelement("ul")}} lên `50px`.

#### HTML

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
</ul>
```

#### CSS

```css
li {
  width: calc(sibling-index() * 50px);
  background-color: #ffaaaa;
}
```

#### Kết quả

{{EmbedLiveSample("Dynamic list width", "300", "100")}}

### Hoạt hình tuần tự

Kết hợp `sibling-index()` với hoạt hình CSS mở ra những khả năng mới. Trong ví dụ này, độ mờ của các phần tử theo thứ tự tuần tự được đặt bằng cách thiết lập {{cssxref("animation-delay")}} dựa trên thứ tự của chúng trong DOM.

#### HTML

Chúng ta bao gồm một phần tử container với bốn con:

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
</ul>
```

#### CSS

Chúng ta áp dụng hoạt hình `fade-in` cho mỗi phần tử. Chúng ta sử dụng hàm `sibling-index()` trong hàm {{cssxref("calc()")}} để đặt thời lượng của `animation-delay` dựa trên vị trí của phần tử nguồn trong thứ tự nguồn. {{cssxref("animation-fill-mode")}} áp dụng keyframe `0%` của hoạt hình cho đến khi `animation-duration` hết hạn.

```css
ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

li {
  animation-name: fade-in;
  animation-duration: 1s;
  animation-iteration-count: 1;
  animation-timing-function: linear;
  animation-fill-mode: backwards;
  animation-delay: calc(1s * sibling-index());
}

@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Sequential animations", "300", "100")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("sibling-count()")}}
- {{cssxref("counter()")}}
