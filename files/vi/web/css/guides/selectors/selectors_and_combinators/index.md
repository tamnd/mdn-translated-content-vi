---
title: CSS selectors and combinators
short-title: Selectors and combinators
slug: Web/CSS/Guides/Selectors/Selectors_and_combinators
page-type: guide
spec-urls:
  - https://drafts.csswg.org/selectors/
  - https://drafts.csswg.org/css-pseudo/
sidebar: cssref
---

CSS selector được dùng để định nghĩa mẫu của các phần tử mà bạn muốn chọn để áp dụng một tập hợp quy tắc CSS. Combinator định nghĩa mối quan hệ giữa các selector. Sử dụng nhiều loại selector và combinator khác nhau, bạn có thể chọn chính xác và tạo kiểu cho các phần tử mong muốn dựa trên loại, thuộc tính, trạng thái hoặc mối quan hệ với các phần tử khác.

## Các loại selector

Có hơn 80 selector và combinator. CSS selector có thể được nhóm theo các danh mục dưới đây dựa trên loại phần tử chúng có thể chọn.

### Basic selector

[Type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) chọn tất cả các phần tử có tên node đã cho. Ví dụ, `div` sẽ chọn tất cả phần tử {{HTMLElement("div")}} và `input` sẽ khớp với bất kỳ phần tử {{HTMLElement("input")}} nào. [Universal selector](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors), được ký hiệu bằng dấu hoa thị (`*`), là loại type selector đặc biệt chọn tất cả phần tử.

[Class selector](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors) chọn tất cả các phần tử có thuộc tính `class` được chỉ định, ký hiệu bằng tên class đứng sau dấu chấm (`.`). Ví dụ, `.index` sẽ khớp với bất kỳ phần tử nào có `class="index"`. [ID selector](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors) chọn một phần tử dựa trên giá trị thuộc tính `id` của nó. Selector là `id` đứng sau dấu thăng (U+0023, `#`). Ví dụ, `#toc` sẽ khớp với phần tử có `id="toc"`. Cả [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) lẫn [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) đều là thuộc tính toàn cục. Trong tài liệu chỉ nên có một phần tử với `id` nhất định; nhưng nếu có nhiều hơn một, ID selector sẽ khớp với tất cả phần tử có `id` đó.

Khi kết hợp type selector hoặc universal selector với class hoặc id selector để tạo [compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector), type selector hoặc universal selector phải đứng trước class hoặc id.

#### CSS

Trong ví dụ này, chúng ta khai báo bốn [simple selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#simple_selector) và một [compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector) sử dụng bốn loại basic selector như đã mô tả ở trên.

```css
* {
  font-style: italic;
}
p {
  color: red;
}
.myClass {
  text-decoration: underline;
}
#myId {
  font-family: monospace;
}
p.myClass#myId {
  font-size: 1.5rem;
}
```

#### HTML

```html
<p class="myClass" id="myId">I match everything.</p>
<p>I match the universal and type selectors only.</p>
```

#### Kết quả

{{EmbedLiveSample("Basic selectors", "100%", 120)}}

## Combinator

Sử dụng CSS combinator, chúng ta có thể kết hợp các selector để chọn các node DOM dựa trên mối quan hệ của chúng với các phần tử khác trong cây node tài liệu. Việc kết hợp selector với combinator tạo ra [complex selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#complex_selector).

### Descendant combinator

[Descendant combinator](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator), được ký hiệu bằng một hoặc nhiều khoảng trắng, chọn các node là hậu duệ của phần tử đầu tiên. Ví dụ, `div span` sẽ khớp với tất cả phần tử {{HTMLElement("span")}} nằm bên trong phần tử {{HTMLElement("div")}}.

### Child combinator

[Child combinator](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator) cụ thể hơn descendant combinator. Được ký hiệu bằng ký tự lớn hơn (`>`), child combinator chọn các node là con trực tiếp của phần tử đầu tiên. So với ví dụ trước, `div > span` sẽ chỉ khớp với các phần tử {{HTMLElement("span")}} là con trực tiếp của phần tử {{HTMLElement("div")}}.

### Subsequent-sibling combinator

Ngoài descendant selector, CSS còn cho phép chọn phần tử dựa trên quan hệ anh chị em. [Subsequent-sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator), được ký hiệu bằng dấu ngã (`~`), chọn các phần tử anh chị em. Với `A ~ B`, tất cả phần tử khớp với `B` sẽ được chọn nếu chúng đứng sau `A`, với điều kiện `A` và `B` có cùng phần tử cha. Ví dụ, `h2 ~ p` sẽ khớp với tất cả phần tử {{HTMLElement("p")}} đứng sau {{HTMLElement("Heading_Elements", "h2")}}, dù ngay liền hay không.

### Next-sibling combinator

[Next-sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator), được ký hiệu bằng dấu cộng (`+`), tương tự subsequent-sibling. Tuy nhiên, với `A + B`, nó chỉ khớp với `B` nếu `B` đứng ngay sau `A`, với cả hai cùng phần tử cha. Điều chỉnh ví dụ trước, `h2 + p` sẽ chỉ khớp với phần tử `<p>` duy nhất _ngay liền_ theo sau một phần tử `<h2>`.

### Column combinator

Ngoài ra còn có [column combinator](/en-US/docs/Web/CSS/Reference/Selectors/Column_combinator), được ký hiệu bằng hai ký tự pipe (`||`), khi được hỗ trợ sẽ chọn các node thuộc về một cột. Ví dụ, `col || td` sẽ khớp với tất cả phần tử {{HTMLElement("td")}} thuộc phạm vi của {{HTMLElement("col")}}.

### Namespace separator

[Namespace separator](/en-US/docs/Web/CSS/Reference/Selectors/Namespace_separator) là combinator khác thường được dùng kết hợp với at-rule {{CSSXref("@namespace")}}. Combinator này được ký hiệu bằng một ký tự pipe (`|`). Nó cho phép giới hạn [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) và [universal selector](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors) trong một namespace cụ thể. Ví dụ, bằng cách định nghĩa namespace như `@namespace SVG url('http://www.w3.org/2000/svg');`, bạn có thể bao gồm các selector chỉ nhắm đến phần tử lồng trong namespace SVG. Khai báo `SVG|a` sẽ khớp với các liên kết trong SVG chứ không phải trong phần còn lại của tài liệu. Namespace có thể hữu ích khi nhắm mục tiêu vào nội dung MathML, SVG hoặc XML khác trong HTML.

#### CSS

Trong ví dụ này, chúng ta khai báo năm [relative selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#relative_selector) sử dụng [simple selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#simple_selector) kết hợp với combinator.

```css
h2 + p ~ p {
  font-style: italic;
}
h2 + p + p {
  color: red;
}
.myClass + p {
  text-decoration: underline;
}
#myId > .myClass {
  outline: 3px dashed red;
}
* > p {
  font-size: 1.1rem;
}
```

#### HTML

```html
<h2 class="myClass" id="myId">
  No selectors match. <span class="myClass">This span has an outline</span> as
  it is both myClass and a child of #myId.
</h2>
<p>The first paragraph is underlined. All the paragraphs are 1.1rem.</p>
<p>
  The second paragraph is red. This and the following paragraphs are italic.
</p>
<p>The third paragraph is NOT red. It is italic and 1.1rem.</p>
<p class="myClass">
  Does not have an outline; this is a sibling of H2, not a child. It is italic
  and 1.1rem.
</p>
```

#### Kết quả

{{EmbedLiveSample("Combinators", "100%", 500)}}

### Tạo complex selector với CSS nesting

Các complex selector trên cũng có thể được định nghĩa bằng simple selector, combinator và [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting), có hoặc không có [`&` nesting selector](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector).

#### CSS

Trong ví dụ này, chúng ta tái tạo năm relative selector tương tự bằng cách sử dụng simple selector kết hợp với combinator, nhưng lần này dùng CSS nesting.

```css
h2 {
  & + p {
    & ~ p {
      font-style: italic;
    }
    & + p {
      color: red;
    }
  }
}
.myClass {
  & + p {
    text-decoration: underline;
  }
}
#myId {
  & > .myClass {
    outline: 3px dashed red;
  }
}
* {
  & > p {
    font-size: 1.1rem;
  }
}
```

#### HTML

```html
<h2 class="myClass" id="myId">
  No selectors match. <span class="myClass">This span has an outline</span> as
  it is both myClass and a child of #myId.
</h2>
<p>The first paragraph is underlined. All the paragraphs are 1.1rem.</p>
<p>
  The second paragraph is red. This and the following paragraphs are italic.
</p>
<p>The third paragraph is NOT red. It is italic and 1.1rem.</p>
<p class="myClass">
  Does not have an outline; this is a sibling of H2, not a child. It is italic
  and 1.1rem.
</p>
```

#### Kết quả

{{EmbedLiveSample("creating_complex_selectors_with_css_nesting", "100%", 300)}}

## Attribute selector

[Attribute selector](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) chọn tất cả phần tử có thuộc tính được chỉ định hoặc có thuộc tính với giá trị khớp chuỗi con, tùy cách viết selector.
Ví dụ, `[type]` sẽ khớp với tất cả phần tử có thuộc tính `type` được đặt (với bất kỳ giá trị nào), và `[type="submit"]` sẽ khớp với `<input type="submit">` và `<button type="submit">`, hoặc bất kỳ phần tử nào có `type="submit"`, dù cặp thuộc tính-giá trị này chỉ được hỗ trợ trên {{HTMLElement("input")}} và {{HTMLElement("button")}}. Sự khớp không phân biệt chữ hoa chữ thường.

Độ nhạy chữ hoa chữ thường của thuộc tính phụ thuộc vào ngôn ngữ. Thông thường trong HTML, nếu thuộc tính là {{glossary("enumerated")}}, giá trị trong selector không phân biệt hoa thường, ngay cả khi giá trị không thuộc danh sách liệt kê hoặc thuộc tính không hợp lệ với phần tử đó. Với các thuộc tính không liệt kê như `class`, `id`, `data-*` bất kỳ, hoặc các thuộc tính không phải HTML như `role`, `aria-*`, sự khớp giá trị phân biệt hoa thường; có thể làm không phân biệt bằng modifier không phân biệt hoa thường (`i`).

## Pseudo-class selector

Module [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) định nghĩa hơn 60 [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes). Pseudo-class là [simple selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#simple_selector), đứng trước dấu hai chấm (`:`), cho phép chọn phần tử dựa trên thông tin trạng thái không có trong cây tài liệu. {{CSSxRef("pseudo-classes")}} có thể dùng để tạo kiểu phần tử dựa trên _trạng thái_ của nó.
Ví dụ, simple selector {{cssxref(":target")}} nhắm đến phần tử của URL chứa fragment identifier, còn [compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector) [`a:visited`](/en-US/docs/Web/CSS/Reference/Selectors/:visited) khớp với tất cả phần tử {{HTMLElement("a")}} mà người dùng đã truy cập.

Pseudo-class có thể được phân loại thành các nhóm: [element display state](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#element_display_state_pseudo-classes), [input](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#input_pseudo-classes), [linguistic](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#linguistic_pseudo-classes), [location](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#location_pseudo-classes), [resource state](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#resource_state_pseudo-classes), [time-dimensional](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#time-dimensional_pseudo-classes), [tree-structural](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#tree-structural_pseudo-classes), [user action](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#user_action_pseudo-classes) và [functional](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#functional_pseudo-classes).

Nhiều pseudo-class có thể được kết hợp để tạo [compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector). Khi kết hợp pseudo-class vào compound selector cùng với type selector hoặc universal selector, pseudo-class phải đứng sau type selector hoặc universal selector (nếu có).

## Pseudo-element selector

Không phải tất cả CSS selector đều được định nghĩa trong [module CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors). CSS pseudo-element selector được định nghĩa trong [module CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements).

CSS [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements), đứng trước hai dấu hai chấm (`::`), đại diện cho các thực thể không có trong HTML. Ví dụ, simple selector {{cssxref("::marker")}} chọn các dấu đầu dòng của mục danh sách, còn compound selector [`p::first-line`](/en-US/docs/Web/CSS/Reference/Selectors/::first-line) khớp với dòng đầu tiên của tất cả phần tử {{HTMLElement("p")}}.

## Đặc tả kỹ thuật

{{Specifications}}

Xem bảng đặc tả của [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#specifications) và [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#specifications) để biết chi tiết.

## Xem thêm

- [Selector list](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list)
- [CSS selector structure](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [CSS nesting module](/en-US/docs/Web/CSS/Guides/Nesting)
