---
title: How to highlight a paragraph that comes after a heading
short-title: Highlight a paragraph after a heading
slug: Learn_web_development/Howto/Solve_CSS_problems/Highlight_para_after_h1
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn có thể tìm hiểu cách làm nổi bật một đoạn văn xuất hiện ngay sau một tiêu đề.

## Định kiểu đoạn văn đầu tiên sau tiêu đề

Một mẫu phổ biến là định kiểu đoạn văn đầu tiên trong một bài viết khác với những đoạn văn sau nó. Thông thường đoạn văn đầu tiên này sẽ đến ngay sau một tiêu đề, và nếu đây là trường hợp trong thiết kế của bạn, bạn có thể sử dụng sự kết hợp các phần tử đó để nhắm mục tiêu đoạn văn.

## Combinator anh chị em tiếp theo (next-sibling combinator)

CSS có một nhóm [CSS Selectors](/en-US/docs/Web/CSS/Guides/Selectors) được gọi là **combinators**, vì chúng chọn các phần tử dựa trên sự kết hợp của các selector. Trong trường hợp của chúng ta, chúng ta sẽ sử dụng [next-sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator). Combinator này chọn một phần tử dựa trên việc nó nằm kế bên một phần tử khác. Trong HTML của chúng ta, chúng ta có một {{htmlelement("Heading_Elements", "h1")}} theo sau bởi một {{htmlelement("p")}}. `<p>` là anh chị em tiếp theo của `<h1>` vì vậy chúng ta có thể chọn nó bằng `h1 + p`.

```html live-sample___highlight_h1_plus_para
<div class="wrapper">
  <h1>A heading</h1>
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</div>
```

```css live-sample___highlight_h1_plus_para
.wrapper h1 + p {
  font-weight: bold;
  font-size: 130%;
  color: rebeccapurple;
}
```

{{EmbedLiveSample("highlight_h1_plus_para", "", "220px")}}

## Xem thêm

- [Learn CSS: Basic selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)
- [Learn CSS: Combinators](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators)
