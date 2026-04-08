---
title: "& nesting selector"
slug: Web/CSS/Reference/Selectors/Nesting_selector
page-type: css-selector
browser-compat: css.selectors.nesting
sidebar: cssref
---

**Bộ chọn lồng nhau `&`** trong CSS chỉ định rõ ràng mối quan hệ giữa các quy tắc cha và con khi dùng [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting). Nó làm cho các bộ chọn của quy tắc con lồng nhau _tương đối với phần tử cha_. Nếu không có bộ chọn lồng nhau `&`, bộ chọn quy tắc con sẽ chọn các phần tử con. Các bộ chọn quy tắc con có cùng trọng số [specificity](/en-US/docs/Web/CSS/Guides/Nesting/Nesting_and_specificity) như thể chúng nằm trong {{cssxref(":is()")}}.

> [!NOTE]
> _Quy tắc con_ không có nghĩa là _bộ chọn phần tử con_. Quy tắc con có thể nhắm đến phần tử cha hoặc phần tử con tùy thuộc vào việc sử dụng bộ chọn lồng nhau `&`.

Nếu không được dùng trong quy tắc kiểu lồng nhau, bộ chọn lồng nhau `&` đại diện cho [phạm vi gốc](/en-US/docs/Web/CSS/Reference/Selectors/:scope).

## Cú pháp

```css
parentRule {
  /* parent rule style properties */
  & childRule {
    /* child rule style properties */
  }
}
```

### Bộ chọn lồng nhau `&` và khoảng trắng

Xem xét đoạn code sau đây, trong đó việc lồng nhau được thực hiện _không có_ bộ chọn lồng nhau `&`.

```css
.parent-rule {
  /* parent rule properties */
  .child-rule {
    /* child rule properties */
  }
}
```

Khi trình duyệt phân tích các bộ chọn lồng nhau, nó tự động thêm khoảng trắng giữa các bộ chọn để tạo ra một quy tắc bộ chọn CSS mới. Đoạn code sau đây hiển thị các quy tắc tương đương không lồng nhau:

```css
.parent-rule {
  /* parent rule style properties */
}

.parent-rule .child-rule {
  /* style properties for .child-rule descendants for .parent-rule ancestors */
}
```

Khi quy tắc lồng nhau cần được gắn kết (không có khoảng trắng) với quy tắc cha, chẳng hạn khi sử dụng {{cssxref('Pseudo-classes', 'pseudo-class')}} hoặc tạo [bộ chọn kết hợp](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector), bộ chọn lồng nhau `&` phải được thêm vào ngay trước để đạt được hiệu quả mong muốn.

Hãy xem xét một ví dụ, trong đó chúng ta muốn tạo kiểu cho một phần tử, cung cấp các kiểu được áp dụng mọi lúc, và cũng lồng nhau một số kiểu chỉ được áp dụng khi di chuột qua. Nếu bộ chọn lồng nhau `&` không được bao gồm, khoảng trắng được thêm vào và chúng ta sẽ có một bộ quy tắc áp dụng các kiểu lồng nhau cho bất kỳ _phần tử con được di chuột qua của bộ chọn quy tắc cha_. Tuy nhiên, đây không phải là điều chúng ta muốn.

```css
.parent-rule {
  /* parent rule properties */
  :hover {
    /* child rule properties */
  }
}

/* the browser parses the above nested rules as shown below */
.parent-rule {
  /* parent rule properties */
}

.parent-rule *:hover {
  /* child rule properties */
}
```

Khi thêm bộ chọn lồng nhau `&` không có khoảng trắng, các phần tử khớp với quy tắc cha sẽ được tạo kiểu khi được di chuột qua.

```css
.parent-rule {
  /* parent rule properties */
  &:hover {
    /* child rule properties */
  }
}

/* the browser parses the above nested rules as shown below */
.parent-rule {
  /* parent rule properties */
}

.parent-rule:hover {
  /* child rule properties */
}
```

### Thêm bộ chọn lồng nhau `&` vào cuối

Bộ chọn lồng nhau `&` cũng có thể được thêm vào cuối để đảo ngược ngữ cảnh của các quy tắc.

```css
.card {
  /* .card styles */
  .featured & {
    /* .featured .card styles */
  }
}

/* the browser parses above nested rules as */

.card {
  /* .card styles */
}

.featured .card {
  /* .featured .card styles */
}
```

Bộ chọn lồng nhau `&` có thể được đặt nhiều lần:

```css
.card {
  /* .card styles */
  .featured & & & {
    /* .featured .card .card .card styles */
  }
}

/* the browser parses above nested rules as */

.card {
  /* .card styles */
}

.featured .card .card .card {
  /* .featured .card .card .card styles */
}
```

### Không thể đại diện cho pseudo-element

Bộ chọn `&` tương đương với bộ chọn {{cssxref(":is()")}}, và có cùng giới hạn là không thể đại diện cho pseudo-element.

Ví dụ, với quy tắc kiểu sau, không có nội dung được tạo ra nào sẽ được tô màu đỏ, ngay cả khi lồng trong `<div class="important">`, vì `.important :is(.foo::before)` không thể khớp bất kỳ thứ gì.

```css
.foo::before {
  content: "Hello";

  .important & {
    color: red;
  }
}
```

Giới hạn này cũng áp dụng cho [at-rule lồng nhau](/en-US/docs/Web/CSS/Guides/Nesting/At-rules), có các thuộc tính được bao bọc ngầm trong bộ chọn `&`. Ví dụ, với quy tắc sau, không có nội dung được tạo ra nào sẽ được tô màu đỏ, ngay cả trên màn hình nhỏ, vì thuộc tính `color: red` được bao bọc ngầm trong bộ chọn `&`, trong trường hợp này là `:is(.foo::before)`.

```css
.foo::before {
  content: "Hello";

  @media (width < 600px) {
    color: red;
  }
}
```

## Ví dụ

Cả hai ví dụ sau đây đều tạo ra cùng một kết quả. Ví dụ đầu tiên sử dụng kiểu CSS thông thường, và ví dụ thứ hai sử dụng bộ chọn lồng nhau `&`.

### Sử dụng kiểu CSS thông thường

Ví dụ này sử dụng cách tạo kiểu CSS thông thường.

#### HTML

```html
<p class="example">
  This paragraph <a href="#">contains a link</a>, try hovering or focusing it.
</p>
```

#### CSS

```css
.example {
  font-family: system-ui;
  font-size: 1.2rem;
}

.example > a {
  color: tomato;
}

.example > a:hover,
.example > a:focus {
  color: ivory;
  background-color: tomato;
}
```

#### Kết quả

{{EmbedLiveSample('Original_CSS_styles','100%','65')}}

### Sử dụng `&` trong kiểu CSS lồng nhau

Ví dụ này sử dụng cách tạo kiểu CSS lồng nhau.

#### HTML

```html
<p class="example">
  This paragraph <a href="#">contains a link</a>, try hovering or focusing it.
</p>
```

#### CSS

```css
.example {
  font-family: system-ui;
  font-size: 1.2rem;
  & > a {
    color: tomato;
    &:hover,
    &:focus {
      color: ivory;
      background-color: tomato;
    }
  }
}
```

#### Kết quả

{{EmbedLiveSample('Nested_CSS_styles','100%','65')}}

### Sử dụng `&` bên ngoài quy tắc lồng nhau

Nếu không được dùng trong quy tắc kiểu lồng nhau, bộ chọn lồng nhau `&` đại diện cho [phạm vi gốc](/en-US/docs/Web/CSS/Reference/Selectors/:scope).

```html
<p>Hover over the output box to change document's background color.</p>
```

```css
& {
  color: blue;
  font-weight: bold;
}

&:hover {
  background-color: wheat;
}
```

#### Kết quả

Trong trường hợp này, tất cả các kiểu áp dụng cho [tài liệu](/en-US/docs/Web/API/Document).

{{EmbedLiveSample('Usage_outside_nested_rule','100%','65')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting/Using)
- [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting) module
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
