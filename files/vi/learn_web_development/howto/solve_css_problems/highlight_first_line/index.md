---
title: How to highlight the first line of a paragraph
short-title: Highlight the first line of a paragraph
slug: Learn_web_development/Howto/Solve_CSS_problems/Highlight_first_line
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn sẽ tìm hiểu cách làm nổi bật dòng văn bản đầu tiên trong đoạn văn, ngay cả khi bạn không biết dòng đó dài bao nhiêu.

## Định kiểu dòng văn bản đầu tiên

Bạn muốn làm cho dòng đầu tiên của đoạn văn trở nên lớn hơn và in đậm. Việc bọc một thẻ `<span>` xung quanh dòng đầu tiên có nghĩa là bạn có thể định kiểu nó theo bất kỳ cách nào, tuy nhiên nếu dòng đầu tiên trở nên ngắn hơn do kích thước viewport nhỏ hơn, văn bản đã được định kiểu sẽ bọc xuống dòng tiếp theo.

## Sử dụng pseudo-element

Một {{cssxref("pseudo-elements", "pseudo-element")}} có thể thay thế `<span>`; tuy nhiên, nó linh hoạt hơn — nội dung chính xác được chọn bởi pseudo-element được tính toán khi trình duyệt đã hiển thị nội dung, vì vậy nó sẽ hoạt động ngay cả khi kích thước viewport thay đổi.

Trong trường hợp này, chúng ta cần sử dụng pseudo-element {{cssxref("::first-line")}}. Nó chọn dòng định dạng đầu tiên của mỗi đoạn văn, nghĩa là bạn có thể định kiểu nó theo yêu cầu của mình.

```html live-sample___highlight_first_line
<div class="wrapper">
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

```css live-sample___highlight_first_line
.wrapper p::first-line {
  font-weight: bold;
  font-size: 130%;
}
```

{{EmbedLiveSample("highlight_first_line")}}

> [!NOTE]
> Tất cả các pseudo-element hoạt động theo cách này. Chúng hoạt động như thể bạn đã chèn một phần tử vào tài liệu, nhưng chúng làm điều đó một cách động dựa trên nội dung khi nó hiển thị ở runtime.

## Kết hợp pseudo-elements với các selector khác

Trong ví dụ trên, pseudo-element chọn dòng đầu tiên của mỗi đoạn văn. Để chỉ chọn dòng đầu tiên của đoạn văn đầu tiên, bạn có thể kết hợp nó với một selector khác. Trong trường hợp này, chúng ta sử dụng {{cssxref(":first-child")}} {{cssxref("pseudo-classes", "pseudo-class")}}. Điều này cho phép chúng ta chọn dòng đầu tiên của phần tử con đầu tiên của `.wrapper` nếu phần tử con đầu tiên đó là một đoạn văn.

```html live-sample___highlight_first_line2
<div class="wrapper">
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

```css live-sample___highlight_first_line2
.wrapper p:first-child::first-line {
  font-weight: bold;
  font-size: 130%;
}
```

{{EmbedLiveSample("highlight_first_line2")}}

> [!NOTE]
> Khi kết hợp pseudo-elements với các selector khác trong một selector [phức tạp](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#complex_selector) hoặc [compound](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector), các pseudo-element phải xuất hiện sau tất cả các thành phần khác trong selector mà chúng xuất hiện.

## Xem thêm

- Trang tham khảo {{cssxref("pseudo-elements", "pseudo-elements")}}.
- [Learn CSS: Pseudo-classes and pseudo-elements](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements).
