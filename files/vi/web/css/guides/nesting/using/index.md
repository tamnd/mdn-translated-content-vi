---
title: Using CSS nesting
short-title: Using nesting
slug: Web/CSS/Guides/Nesting/Using
page-type: guide
sidebar: cssref
---

Module [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting) cho phép bạn viết stylesheet sao cho dễ đọc hơn, có tính module hóa cao hơn và dễ bảo trì hơn. Vì bạn không phải lặp lại các selector liên tục, kích thước tệp cũng có thể được giảm thiểu.

CSS nesting khác với các CSS preprocessor như [Sass](https://sass-lang.com/) ở chỗ nó được trình duyệt phân tích cú pháp trực tiếp thay vì được biên dịch trước bởi một CSS preprocessor. Ngoài ra, trong CSS nesting, [specificity của nesting selector `&`](/en-US/docs/Web/CSS/Guides/Nesting/Nesting_and_specificity) tương tự như hàm {{cssxref(':is',':is()')}}; nó được tính dựa trên specificity cao nhất trong danh sách selector liên quan.

Hướng dẫn này trình bày các cách khác nhau để sắp xếp nesting trong CSS.

## Selector con

Bạn có thể sử dụng CSS nesting để tạo selector con của một phần tử cha, từ đó dùng để nhắm mục tiêu các phần tử con của những phần tử cha cụ thể. Điều này có thể thực hiện có hoặc không có [nesting selector `&`](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector).

Có một số trường hợp mà việc sử dụng nesting selector `&` là cần thiết hoặc hữu ích:

- Khi kết hợp các selector lại với nhau, chẳng hạn sử dụng [compound selector](#compound_selectors) hoặc [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes).
- Để đảm bảo tương thích ngược.
- Làm chỉ báo trực quan giúp dễ đọc hơn — khi nhìn thấy nesting selector `&`, bạn biết rằng CSS nesting đang được sử dụng.

```css
/* Không có nesting selector */
.parent {
  /* styles cho parent */
  .child {
    /* styles cho con của parent */
  }
}

/* Có nesting selector */
.parent {
  /* styles cho parent */
  & .child {
    /* styles cho con của parent */
  }
}

/* trình duyệt sẽ phân tích cả hai thành */
.parent {
  /* styles cho parent */
}
.parent .child {
  /* styles cho con của parent */
}
```

### Ví dụ

Trong các ví dụ này — một cái không có và một cái có nesting selector `&` — phần tử `<input>` bên trong `<label>` được tạo kiểu khác với phần tử `<input>` là anh em của `<label>`.

#### Không có nesting selector

##### HTML

```html-nolint
<form>
  <label for="name">Name:
    <input type="text" id="name" />
  </label>
  <label for="email">email:</label>
  <input type="text" id="email" />
</form>
```

##### CSS

```css hidden
form,
label {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
```

```css
input {
  /* styles cho input không nằm trong label  */
  border: tomato 2px solid;
}
label {
  /* styles cho label */
  font-family: system-ui;
  font-size: 1.25rem;

  input {
    /* styles cho input nằm trong label  */
    border: blue 2px dashed;
  }
}
```

##### Kết quả

{{EmbedLiveSample('Without_nesting_selector','100%','120')}}

#### Có nesting selector

```html-nolint hidden
<form>
  <label for="name">Name:
    <input type="text" id="name" />
  </label>
  <label for="email">email:</label>
  <input type="text" id="email" />
</form>
```

##### CSS

```css hidden
form,
label {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
```

```css
input {
  /* styles cho input không nằm trong label  */
  border: tomato 2px solid;
}
label {
  /* styles cho label */
  font-family: system-ui;
  font-size: 1.25rem;

  & input {
    /* styles cho input nằm trong label  */
    border: blue 2px dashed;
  }
}
```

##### Kết quả

{{EmbedLiveSample('With_nesting_selector','100%','120')}}

## Combinator

[CSS Combinator](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators) cũng có thể được sử dụng có hoặc không có nesting selector `&`.

### Ví dụ

#### Lồng sibling combinator

Trong ví dụ này, đoạn văn đầu tiên sau mỗi `<h2>` được nhắm đến bằng [next-sibling combinator (`+`)](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator) sử dụng CSS nesting.

##### HTML

```html
<h2>Heading</h2>
<p>This is the first paragraph.</p>
<p>This is the second paragraph.</p>
```

##### CSS

```css
h2 {
  color: tomato;
  + p {
    color: white;
    background-color: black;
  }
}
/* đoạn code này cũng có thể viết với nesting selector & */
/* 
h2 {
  color: tomato;
  & + p {
    color: white;
    background-color: black;
  }
}
*/
```

##### Kết quả

{{EmbedLiveSample('Nesting_the_sibling_combinator','100%','135')}}

## Compound selector

Khi sử dụng [compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector) trong CSS lồng, bạn **phải** dùng nesting selector `&`. Điều này là vì trình duyệt sẽ tự động thêm khoảng trắng giữa các selector không dùng nesting selector `&`.

Để nhắm đến phần tử có `class="a b"`, nesting selector `&` là bắt buộc, nếu không khoảng trắng sẽ làm hỏng compound selector.

```css
.a {
  /* styles cho phần tử có class="a" */
  .b {
    /* styles cho phần tử có class="b" là con cháu của class="a" */
  }
  &.b {
    /* styles cho phần tử có class="a b" */
  }
}

/* trình duyệt phân tích thành */
.a {
  /* styles cho phần tử có class="a" */
}
.a .b {
  /* styles cho phần tử có class="b" là con cháu của class="a" */
}
.a.b {
  /* styles cho phần tử có class="a b" */
}
```

### Ví dụ

#### Nesting và compound selector

Trong ví dụ này, nesting selector `&` được sử dụng để tạo compound selector nhằm tạo kiểu cho các phần tử có nhiều class.

##### HTML

```html
<div class="notices">
  <div class="notice">
    <h2 class="notice-heading">Notice</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
  </div>
  <div class="notice warning">
    <h2 class="warning-heading">Warning</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
  </div>
  <div class="notice success">
    <h2 class="success-heading">Success</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
  </div>
</div>
```

##### CSS

Styles cho `.notices` để tạo cột sử dụng [flexbox layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).

```css
.notices {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  width: 90%;
  margin: auto;
}
```

Trong đoạn CSS bên dưới, nesting được dùng để tạo compound selector cả có và không có `&`. Selector cấp cao nhất định nghĩa các style cơ bản cho các phần tử có `class="notice"`. Sau đó, nesting selector `&` được dùng để tạo compound selector cho các phần tử có `class="notice warning"` hoặc `class="notice success"`. Ngoài ra, việc sử dụng nesting để tạo compound selector mà không dùng `&` có thể thấy ở selector `.notice .notice-heading::before`.

```css
.notice {
  width: 90%;
  justify-content: center;
  border-radius: 1rem;
  border: black solid 2px;
  background-color: #ffc107;
  color: black;
  padding: 1rem;
  .notice-heading::before {
    /* tương đương với `.notice .notice-heading::before` */
    content: "ℹ︎ ";
  }
  &.warning {
    /* tương đương với `.notice.warning` */
    background-color: #d81b60;
    border-color: #d81b60;
    color: white;
    .warning-heading::before {
      /* tương đương với `.notice.warning .warning-heading::before` */
      content: "! ";
    }
  }
  &.success {
    /* tương đương với `.notice.success` */
    background-color: #004d40;
    border-color: #004d40;
    color: white;
    .success-heading::before {
      /* tương đương với `.notice.success .success-heading::before` */
      content: "✓ ";
    }
  }
}
```

##### Kết quả

{{EmbedLiveSample('Nesting_and_compound_selectors','100%', '455')}}

## Nesting selector được nối thêm phía sau

Nesting selector `&` cũng có thể được nối thêm vào phía sau một selector lồng, có tác dụng đảo ngược ngữ cảnh.

Điều này có thể hữu ích khi chúng ta có styles cho phần tử con thay đổi khi phần tử cha được gán một class khác:

```html
<div>
  <span class="foo">text</span>
</div>
```

So với:

```html
<div class="bar">
  <span class="foo">text</span>
</div>
```

```css
.foo {
  /* styles .foo */
  .bar & {
    /* styles .bar .foo */
  }
}
```

### Ví dụ

#### Nối thêm nesting selector

Trong ví dụ này có 3 thẻ card, một trong số đó là card nổi bật. Tất cả card đều giống nhau ngoại trừ card nổi bật sẽ có màu khác cho tiêu đề. Bằng cách nối thêm nesting selector `&`, style cho `.featured h2` có thể được lồng trong style của `h2`.

##### HTML

```html
<div class="wrapper">
  <article class="card">
    <h2>Card 1</h2>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</p>
  </article>
  <article class="card featured">
    <h2>Card 2</h2>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</p>
  </article>
  <article class="card">
    <h2>Card 3</h2>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</p>
  </article>
</div>
```

##### CSS

```css
.wrapper {
  display: flex;
  flex-direction: row;
  gap: 0.25rem;
  font-family: system-ui;
}
```

Trong đoạn CSS sau, ta tạo styles cho `.card` và `.card h2`. Sau đó, trong khối style của `h2`, ta lồng class `.featured` với nesting selector `&` được nối thêm, tạo ra style cho `.card :is(.featured h2)`, tương đương với `:is(.card h2):is(.featured h2)`.

```css
.card {
  padding: 0.5rem;
  border: 1px solid black;
  border-radius: 0.5rem;
  & h2 {
    /* tương đương với `.card h2` */
    color: slateblue;
    .featured & {
      /* tương đương với `:is(.card h2):is(.featured h2)` */
      color: tomato;
    }
  }
}
```

##### Kết quả

{{EmbedLiveSample('Appending_nesting_selector','100%','250')}}

## Quy tắc khai báo lồng

Quy tắc khai báo lồng là các quy tắc CSS được phân tích theo thứ tự chúng được viết trong tài liệu CSS.

Với đoạn CSS sau:

```css
.foo {
  background-color: silver;
  @media screen {
    color: tomato;
  }
  color: black;
}
```

`background-color` được phân tích trước và đặt thành silver, sau đó quy tắc `@media` được đánh giá, và cuối cùng là `color`.

CSSOM phân tích CSS theo cách sau:

```plain
↳ CSSStyleRule
  .style
    - background-color: silver
  ↳ CSSMediaRule
    ↳ CSSNestedDeclarations
      .style (CSSStyleDeclaration, 1) =
      - color: tomato
  ↳ CSSNestedDeclarations
    .style (CSSStyleDeclaration, 1) =
      - color: black
```

Lưu ý rằng để duy trì thứ tự phân tích, tất cả các quy tắc trước nesting được xử lý như `CSSRules` cấp cao nhất, trong khi bất kỳ quy tắc cấp cao nhất nào sau nesting được biểu diễn như `CSSNestedDeclarations`.
Đó là lý do tại sao `color-black` nằm bên trong một khai báo lồng dù nó là khai báo cấp cao nhất trong tài liệu gốc.

> [!NOTE]
> Hỗ trợ cho quy tắc này được thêm vào với {{domxref("CSSNestedDeclarations")}}.
> Các trình duyệt [không hỗ trợ giao diện này](/en-US/docs/Web/API/CSSNestedDeclarations#browser_compatibility) có thể phân tích các quy tắc lồng theo thứ tự sai.

## Nối chuỗi (không thể thực hiện)

Trong các CSS preprocessor như [Sass](https://sass-lang.com/), có thể sử dụng nesting để nối chuỗi nhằm tạo class mới. Điều này phổ biến trong các phương pháp luận CSS như [BEM](https://getbem.com/naming/).

```css example-bad
.component {
  &__child-element {
  }
}
/* Trong Sass, điều này trở thành */
.component__child-element {
}
```

> [!WARNING]
> Điều này không thể thực hiện trong CSS nesting: khi không sử dụng [combinator](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators), selector lồng được xử lý như một [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors). Cho phép nối chuỗi sẽ phá vỡ điều này.

Trong [compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector), type selector phải đứng đầu. Viết `&Element` (một [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors)) sẽ làm cho CSS selector và toàn bộ khối selector không hợp lệ. Vì type selector phải đứng đầu, compound selector phải được viết là `Element&`.

```css example-good
.my-class {
  element& {
  }
}

/* trình duyệt phân tích thành compound selector */
.my-class {
}
element.my-class {
}
```

## Quy tắc style lồng không hợp lệ

Nếu một quy tắc CSS lồng không hợp lệ thì tất cả các style bên trong đó sẽ bị bỏ qua. Điều này không ảnh hưởng đến các quy tắc cha hoặc quy tắc đứng trước.

Trong ví dụ sau, có một selector không hợp lệ (`%` không phải ký tự hợp lệ cho selector). Quy tắc chứa selector này bị bỏ qua, nhưng các quy tắc hợp lệ tiếp theo thì không.

```css example-bad
.parent {
  /* styles .parent hoạt động bình thường */
  & %invalid {
    /* styles %invalid đều bị bỏ qua */
  }
  & .valid {
    /* styles .parent .valid hoạt động bình thường */
  }
}
```

## Xem thêm

- Module [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting)
- [Nesting selector `&`](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector)
- [Lồng at-rule `@`](/en-US/docs/Web/CSS/Guides/Nesting/At-rules)
- [Nesting và specificity](/en-US/docs/Web/CSS/Guides/Nesting/Nesting_and_specificity)
- {{domxref("CSSNestedDeclarations")}}
- [The Nested Declarations Rule](https://drafts.csswg.org/css-nesting-1/#nested-declarations-rule)
