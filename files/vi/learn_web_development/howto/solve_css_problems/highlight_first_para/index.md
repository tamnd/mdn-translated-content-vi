---
title: How to highlight the first paragraph
short-title: Highlight the first paragraph
slug: Learn_web_development/Howto/Solve_CSS_problems/Highlight_first_para
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn có thể tìm hiểu cách làm nổi bật đoạn văn đầu tiên bên trong một container.

## Định kiểu đoạn văn đầu tiên

Bạn muốn làm cho đoạn văn đầu tiên trở nên lớn hơn và in đậm. Bạn có thể thêm một class vào đoạn văn đầu tiên và chọn nó theo cách đó, tuy nhiên sử dụng pseudo-class selector linh hoạt hơn — điều này có nghĩa là bạn có thể nhắm mục tiêu đoạn văn dựa trên vị trí của nó trong tài liệu, và bạn sẽ không phải di chuyển class thủ công nếu thứ tự nguồn thay đổi.

## Sử dụng pseudo-class

Một {{cssxref("pseudo-classes","pseudo-class")}} hoạt động như thể bạn đã áp dụng một class; tuy nhiên, thay vì sử dụng class selector, CSS chọn dựa trên cấu trúc tài liệu. Có nhiều pseudo-class khác nhau có thể chọn những thứ khác nhau. Trong trường hợp của chúng ta, chúng ta sẽ sử dụng {{cssxref(":first-child")}}. Điều này sẽ chọn phần tử là phần tử con đầu tiên của một phần tử cha.

```html live-sample___highlight_first_para
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

```css live-sample___highlight_first_para
.wrapper p:first-child {
  font-weight: bold;
  font-size: 130%;
}
```

{{EmbedLiveSample("highlight_first_para")}}

Bạn có thể thử thay đổi {{cssxref(":first-child")}} thành {{cssxref(":last-child")}} trong ví dụ trực tiếp ở trên, và bạn sẽ chọn đoạn văn cuối cùng.

Bất cứ khi nào bạn cần nhắm mục tiêu một thứ gì đó trong tài liệu của mình, bạn có thể kiểm tra xem một trong những {{cssxref("pseudo-classes")}} có sẵn có thể làm điều đó cho bạn không.

## Xem thêm

- Trang tham khảo {{cssxref("pseudo-classes")}}.
- [Learn CSS: Pseudo-classes and pseudo-elements.](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
