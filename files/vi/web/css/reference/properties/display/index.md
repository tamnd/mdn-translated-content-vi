---
title: display
slug: Web/CSS/Reference/Properties/display
page-type: css-property
browser-compat: css.properties.display
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`display`** thiết lập liệu một phần tử có được xử lý như một [hộp block hay inline](/en-US/docs/Web/CSS/Guides/Display/Flow_layout) và layout được sử dụng cho các phần tử con của nó, chẳng hạn như [flow layout](/en-US/docs/Web/CSS/Guides/Display/Flow_layout), [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) hay [flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).

Về mặt hình thức, thuộc tính **`display`** thiết lập _kiểu display_ bên trong và bên ngoài của một phần tử. Kiểu bên ngoài thiết lập sự tham gia của phần tử trong [flow layout](/en-US/docs/Web/CSS/Guides/Display/Flow_layout); kiểu bên trong thiết lập layout của các phần tử con. Một số giá trị của `display` được định nghĩa đầy đủ trong các đặc tả riêng của chúng; ví dụ, chi tiết về những gì xảy ra khi khai báo `display: flex` được định nghĩa trong đặc tả CSS Flexible Box Model.

{{InteractiveExample("CSS Demo: display")}}

```css interactive-example-choice
display: block;
```

```css interactive-example-choice
display: inline flow-root;
```

```css interactive-example-choice
display: none;
```

```css interactive-example-choice
display: flex;
```

```css interactive-example-choice
display: grid;
```

```html interactive-example
<p>
  Apply different <code>display</code> values on the dashed orange-bordered
  <code>div</code>, which contains three child elements.
</p>
<section class="default-example" id="default-example">
  <div class="example-container">
    Some text A.
    <div id="example-element">
      <div class="child">Child 1</div>
      <div class="child">Child 2</div>
      <div class="child">Child 3</div>
    </div>
    Some text B.
  </div>
</section>
```

```css interactive-example
.example-container {
  width: 100%;
  height: 100%;
}

code {
  background: #88888888;
}

#example-element {
  border: 3px dashed orange;
}

.child {
  display: inline-block;
  padding: 0.5em 1em;
  background-color: #ccccff;
  border: 1px solid #ababab;
  color: black;
}
```

## Cú pháp

```css
/* display ngắn gọn */
display: none;
display: contents;
display: block;
display: flow-root;
display: inline;
display: inline-block;
display: list-item;
display: inline list-item;
display: flex;
display: inline-flex;
display: grid;
display: inline-grid;
display: table;
display: inline-table;

/* display đầy đủ */
display: block flow;
display: block flow-root;
display: inline flow;
display: inline flow-root;
display: block flow list-item;
display: inline flow list-item;
display: block flex;
display: inline flex;
display: block grid;
display: inline grid;
display: block table;
display: inline table;

/* giá trị toàn cục */
display: inherit;
display: initial;
display: revert;
display: revert-layer;
display: unset;
```

Thuộc tính CSS `display` được chỉ định bằng các giá trị từ khóa.

## Các giá trị theo nhóm

Các giá trị từ khóa có thể được nhóm thành sáu danh mục giá trị.

### Bên ngoài (Outside)

- {{CSSxRef("&lt;display-outside&gt;")}}
  - : Các từ khóa này chỉ định kiểu display bên ngoài của phần tử, về cơ bản là vai trò của nó trong flow layout:
    - `block`
      - : Phần tử tạo ra một hộp block, tạo ra ngắt dòng cả trước và sau phần tử khi ở trong luồng bình thường.
    - `inline`
      - : Phần tử tạo ra một hoặc nhiều hộp inline không tạo ra ngắt dòng trước hoặc sau chúng. Trong luồng bình thường, phần tử tiếp theo sẽ nằm trên cùng một dòng nếu có khoảng trống.

> [!NOTE]
> Khi thuộc tính display được chỉ định chỉ với một giá trị **bên ngoài** (ví dụ: `display: block` hoặc `display: inline`), giá trị bên trong mặc định là `flow` (ví dụ: `display: block flow` và `display: inline flow`).

> [!NOTE]
> Bạn có thể sử dụng cú pháp một giá trị như một phương án dự phòng cho cú pháp nhiều từ khóa, ví dụ `display: inline flex` có thể có phương án dự phòng sau
>
> ```css
> .container {
>   display: inline-flex;
>   display: inline flex;
> }
> ```
>
> Xem [Sử dụng cú pháp nhiều từ khóa với CSS display](/en-US/docs/Web/CSS/Guides/Display/Multi-keyword_syntax) để biết thêm thông tin.

### Bên trong (Inside)

- {{CSSxRef("&lt;display-inside&gt;")}}
  - : Các từ khóa này chỉ định kiểu display bên trong của phần tử, định nghĩa kiểu ngữ cảnh định dạng mà nội dung của nó được dàn xếp (giả sử nó là một phần tử không được thay thế). Khi một trong các từ khóa này được sử dụng một mình như một giá trị đơn, kiểu display bên ngoài của phần tử mặc định là `block` (ngoại trừ `ruby`, mặc định là `inline`).
    - `flow`
      - : Phần tử dàn xếp nội dung của nó bằng flow layout (block-and-inline layout).

        Nếu kiểu display bên ngoài của nó là `inline` và nó đang tham gia vào một ngữ cảnh định dạng block hoặc inline, thì nó tạo ra một hộp inline. Ngược lại nó tạo ra một hộp block.

        Tùy thuộc vào giá trị của các thuộc tính khác (chẳng hạn như {{CSSxRef("position")}}, {{CSSxRef("float")}}, hoặc {{CSSxRef("overflow")}}) và liệu bản thân nó có đang tham gia vào một ngữ cảnh định dạng block hoặc inline hay không, nó sẽ thiết lập một [ngữ cảnh định dạng block](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) (BFC) mới cho nội dung của nó hoặc tích hợp nội dung của nó vào ngữ cảnh định dạng cha.

    - `flow-root`
      - : Phần tử tạo ra một hộp block thiết lập một [ngữ cảnh định dạng block](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới, xác định nơi gốc định dạng nằm.
    - `table`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("table")}}. Nó định nghĩa một hộp ở cấp block.
    - `flex`
      - : Phần tử hoạt động như một phần tử ở cấp block và dàn xếp nội dung của nó theo [mô hình flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).
    - `grid`
      - : Phần tử hoạt động như một phần tử ở cấp block và dàn xếp nội dung của nó theo [mô hình grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts).
    - `ruby`
      - : Phần tử hoạt động như một phần tử ở cấp inline và dàn xếp nội dung của nó theo mô hình định dạng ruby. Nó hoạt động như các phần tử HTML {{HTMLElement("ruby")}} tương ứng.

> [!NOTE]
> Khi thuộc tính display được chỉ định chỉ với một giá trị **bên trong** (ví dụ: `display: flex` hoặc `display: grid`), giá trị bên ngoài mặc định là `block` (ví dụ: `display: block flex` và `display: block grid`).

### Mục danh sách (List Item)

- {{CSSxRef("&lt;display-listitem&gt;")}}
  - : Phần tử tạo ra một hộp block cho nội dung và một hộp inline mục danh sách riêng biệt.

Một giá trị đơn là `list-item` sẽ khiến phần tử hoạt động như một mục danh sách.
Điều này có thể được sử dụng cùng với {{CSSxRef("list-style-type")}} và {{CSSxRef("list-style-position")}}.

`list-item` cũng có thể được kết hợp với bất kỳ từ khóa {{CSSxRef("&lt;display-outside&gt;")}} nào và từ khóa `flow` hoặc `flow-root` {{CSSxRef("&lt;display-inside&gt;")}}.

> [!NOTE]
> Nếu không có giá trị bên trong nào được chỉ định, nó sẽ mặc định là `flow`.
> Nếu không có giá trị bên ngoài nào được chỉ định, hộp chính sẽ có kiểu display bên ngoài là `block`.

### Nội bộ (Internal)

- {{CSSxRef("&lt;display-internal&gt;")}}
  - : Một số mô hình layout như `table` và `ruby` có cấu trúc bên trong phức tạp, với nhiều vai trò khác nhau mà các phần tử con và hậu duệ của chúng có thể đảm nhận.
    Phần này định nghĩa các giá trị display "nội bộ" đó, chỉ có ý nghĩa trong chế độ layout cụ thể đó.
    - `table-row-group`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("tbody")}}.
    - `table-header-group`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("thead")}}.
    - `table-footer-group`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("tfoot")}}.
    - `table-row`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("tr")}}.
    - `table-cell`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("td")}}.
    - `table-column-group`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("colgroup")}}.
    - `table-column`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("col")}}.
    - `table-caption`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("caption")}}.
    - `ruby-base`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("rb")}}.
    - `ruby-text`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("rt")}}.
    - `ruby-base-container`
      - : Các phần tử này được tạo ra dưới dạng các hộp ẩn danh.
    - `ruby-text-container`
      - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("rtc")}}.

### Hộp (Box)

- {{CSSxRef("&lt;display-box&gt;")}}
  - : Các giá trị này định nghĩa liệu một phần tử có tạo ra các hộp display hay không.
    - `contents`
      - : Các phần tử này không tạo ra một hộp cụ thể bởi chính chúng. Chúng được thay thế bởi hộp giả của chúng và các hộp con của chúng. Lưu ý rằng đặc tả CSS Display Level 3 định nghĩa cách giá trị `contents` ảnh hưởng đến "các phần tử bất thường" — các phần tử không được render thuần túy bởi các khái niệm hộp CSS như các phần tử được thay thế. Xem [Phụ lục B: Hiệu ứng của display: contents trên các phần tử bất thường](https://drafts.csswg.org/css-display/#unbox) để biết thêm chi tiết.

    - `none`
      - : Tắt hiển thị của một phần tử để nó không có hiệu ứng trên layout (tài liệu được render như thể phần tử không tồn tại). Tất cả các phần tử con cũng có hiển thị của chúng bị tắt.
        Để một phần tử chiếm khoảng không gian mà nó thường chiếm, nhưng không thực sự render bất cứ điều gì, hãy sử dụng thuộc tính {{CSSxRef("visibility")}} thay thế.

### Kết hợp sẵn (Precomposed)

- {{CSSxRef("&lt;display-legacy&gt;")}}
  - : CSS 2 sử dụng cú pháp một từ khóa kết hợp sẵn cho thuộc tính `display`, yêu cầu các từ khóa riêng biệt cho các biến thể ở cấp block và ở cấp inline của cùng một chế độ layout.
    - `inline-block`
      - : Phần tử tạo ra một hộp block sẽ được dàn theo nội dung xung quanh như thể nó là một hộp inline đơn (hoạt động giống như một phần tử được thay thế).

        Nó tương đương với `inline flow-root`.

    - `inline-table`
      - : Giá trị `inline-table` không có ánh xạ trực tiếp trong HTML. Nó hoạt động như một phần tử HTML {{HTMLElement("table")}}, nhưng như một hộp inline, thay vì một hộp ở cấp block. Bên trong hộp table là một ngữ cảnh ở cấp block.

        Nó tương đương với `inline table`.

    - `inline-flex`
      - : Phần tử hoạt động như một phần tử ở cấp inline và dàn xếp nội dung của nó theo mô hình flexbox.

        Nó tương đương với `inline flex`.

    - `inline-grid`
      - : Phần tử hoạt động như một phần tử ở cấp inline và dàn xếp nội dung của nó theo mô hình grid.

        Nó tương đương với `inline grid`.

### Nên sử dụng cú pháp nào?

[Mô-đun CSS display](/en-US/docs/Web/CSS/Guides/Display) mô tả cú pháp nhiều từ khóa cho các giá trị bạn có thể sử dụng với thuộc tính `display` để xác định rõ ràng kiểu display **bên ngoài** và **bên trong**.
Các giá trị từ khóa đơn (các giá trị `<display-legacy>` kết hợp sẵn) được hỗ trợ để tương thích ngược.

Ví dụ, sử dụng hai giá trị bạn có thể chỉ định một flex container inline như sau:

```css
.container {
  display: inline flex;
}
```

Điều này cũng có thể được chỉ định bằng giá trị đơn kế thừa:

```css
.container {
  display: inline-flex;
}
```

Để biết thêm thông tin về những thay đổi này, xem hướng dẫn [Sử dụng cú pháp nhiều từ khóa với CSS display](/en-US/docs/Web/CSS/Guides/Display/Multi-keyword_syntax).

## Mô tả

Các trang riêng lẻ cho các kiểu giá trị khác nhau mà `display` có thể được đặt có nhiều ví dụ về các giá trị đó trong thực tế — xem phần [Cú pháp](#cú_pháp). Ngoài ra, xem các tài liệu sau đây, bao gồm các giá trị display khác nhau một cách chi tiết.

### Giá trị nhiều từ khóa

- [Sử dụng cú pháp nhiều từ khóa với CSS display](/en-US/docs/Web/CSS/Guides/Display/Multi-keyword_syntax)

### CSS Flow Layout (display: block, display: inline)

- [Bố cục block và inline trong luồng bình thường](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout)
- [Flow layout và overflow](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_overflow)
- [Flow layout và các chế độ viết](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes)
- [Giới thiệu về ngữ cảnh định dạng](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts)
- [Trong luồng và ngoài luồng](/en-US/docs/Web/CSS/Guides/Display/In_flow_and_out_of_flow)

### display: flex

- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Kiểm soát tỉ lệ các mục flex dọc theo trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- [Làm chủ việc bọc các mục flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items)
- [Sắp xếp các mục flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)
- [Mối quan hệ của flexbox với các phương pháp layout khác](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Relationship_with_other_layout_methods)
- [Các trường hợp sử dụng điển hình của flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Use_cases)

### display: grid

- [Các khái niệm cơ bản về grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- [Mối quan hệ với các phương pháp layout khác](/en-US/docs/Web/CSS/Guides/Grid_layout/Relationship_with_other_layout_methods)
- [Căn chỉnh dựa theo dòng](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- [Các vùng grid template](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
- [Layout sử dụng các dòng grid được đặt tên](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines)
- [Tự động căn chỉnh trong grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement)
- [Căn chỉnh các mục trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment)
- [Grid, các giá trị logic và chế độ viết](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes)
- [CSS grid layout và khả năng truy cập](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility)
- [Thực hiện các layout phổ biến bằng grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Common_grid_layouts)

### Hoạt ảnh của display

[Các trình duyệt hỗ trợ](#browser_compatibility) tạo hoạt ảnh cho `display` với [kiểu hoạt ảnh rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete). Điều này thường có nghĩa là thuộc tính sẽ chuyển đổi giữa hai giá trị ở mức 50% trong quá trình hoạt ảnh giữa hai giá trị.

Có một ngoại lệ, đó là khi tạo hoạt ảnh đến hoặc từ `display: none`. Trong trường hợp này, trình duyệt sẽ chuyển đổi giữa hai giá trị sao cho nội dung được hoạt ảnh hiển thị trong toàn bộ thời gian của hoạt ảnh. Ví dụ:

- Khi tạo hoạt ảnh `display` từ `none` sang `block` (hoặc giá trị `display` hiển thị khác), giá trị sẽ chuyển sang `block` ở `0%` của thời gian hoạt ảnh để nó hiển thị xuyên suốt.
- Khi tạo hoạt ảnh `display` từ `block` (hoặc giá trị `display` hiển thị khác) sang `none`, giá trị sẽ chuyển sang `none` ở `100%` của thời gian hoạt ảnh để nó hiển thị xuyên suốt.

Hành vi này hữu ích để tạo các hoạt ảnh vào/ra khi bạn muốn ví dụ xóa một container khỏi DOM với `display: none`, nhưng có nó mờ dần với {{cssxref("opacity")}} thay vì biến mất ngay lập tức.

Khi tạo hoạt ảnh `display` với [CSS animations](/en-US/docs/Web/CSS/Guides/Animations), bạn cần cung cấp giá trị `display` bắt đầu trong một keyframe rõ ràng (ví dụ sử dụng `0%` hoặc `from`). Xem [Sử dụng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết ví dụ.

Khi tạo hoạt ảnh `display` với [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions), cần có hai tính năng bổ sung:

- {{cssxref("@starting-style")}} cung cấp các giá trị bắt đầu cho các thuộc tính bạn muốn transition từ khi phần tử được hoạt ảnh hiển thị lần đầu. Điều này cần thiết để tránh hành vi không mong muốn. Theo mặc định, CSS transitions không được kích hoạt khi cập nhật style đầu tiên của phần tử hoặc khi kiểu `display` thay đổi từ `none` sang kiểu khác.
- [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) cần được đặt trong khai báo {{cssxref("transition-property")}} (hoặc rút gọn {{cssxref("transition")}}) để bật các transition của `display`.

Để xem ví dụ về việc transition thuộc tính `display`, hãy xem trang [`@starting-style`](/en-US/docs/Web/CSS/Reference/At-rules/@starting-style#examples) và [`transition-behavior`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior#examples).

## Khả năng truy cập

### display: none

Sử dụng giá trị `none` cho `display` trên một phần tử sẽ xóa nó khỏi [cây khả năng truy cập](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis). Điều này sẽ khiến phần tử đó và tất cả các phần tử con của nó không còn được thông báo bởi công nghệ đọc màn hình.

Nếu bạn muốn ẩn phần tử về mặt thị giác, một phương án thay thế dễ tiếp cận hơn là sử dụng [sự kết hợp của các thuộc tính](https://webaim.org/techniques/css/invisiblecontent/) để xóa nó về mặt thị giác khỏi màn hình nhưng vẫn có thể truy cập được bởi các công nghệ hỗ trợ như trình đọc màn hình.

Mặc dù `display: none` ẩn nội dung khỏi cây khả năng truy cập, các phần tử bị ẩn nhưng được tham chiếu từ các thuộc tính `aria-describedby` hoặc `aria-labelledby` của các phần tử hiển thị vẫn được tiếp cận bởi các công nghệ hỗ trợ.

### display: contents

Các triển khai hiện tại trong một số trình duyệt sẽ xóa khỏi [cây khả năng truy cập](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis) bất kỳ phần tử nào có giá trị `display` là `contents` (nhưng các phần tử con sẽ vẫn còn). Điều này sẽ khiến phần tử đó không còn được thông báo bởi công nghệ đọc màn hình. Đây là hành vi không chính xác theo [đặc tả CSS](https://drafts.csswg.org/css-display/#valdef-display-contents).

- [Đánh dấu dễ tiếp cận hơn với display: contents | Hidde de Vries](https://hidde.blog/more-accessible-markup-with-display-contents/)
- [Display: Contents không phải là CSS Reset | Adrian Roselli](https://adrianroselli.com/2018/05/display-contents-is-not-a-css-reset.html)

### Bảng (Tables)

Trong một số trình duyệt, việc thay đổi giá trị `display` của phần tử {{HTMLElement("table")}} thành `block`, `grid`, hoặc `flex` sẽ thay đổi biểu diễn của nó trong [cây khả năng truy cập](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis). Điều này sẽ khiến bảng không còn được thông báo đúng cách bởi công nghệ đọc màn hình.

- [Nội dung ẩn để cải thiện a11y | Go Make Things](https://gomakethings.com/hidden-content-for-better-a11y/)
- [MDN Hiểu WCAG, giải thích Nguyên tắc 1.3](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.3_%e2%80%94_create_content_that_can_be_presented_in_different_ways)
- [Hiểu Tiêu chí Thành công 1.3.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-programmatic.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh giá trị display

Trong ví dụ này, chúng ta có hai phần tử container ở cấp block, mỗi phần tử có ba phần tử con inline. Bên dưới đó, chúng ta có một menu select cho phép bạn áp dụng các giá trị `display` khác nhau cho các container, cho phép bạn so sánh và đối chiếu cách các giá trị khác nhau ảnh hưởng đến layout của phần tử và các phần tử con của chúng.

Chúng ta đã đưa vào {{cssxref("padding")}} và {{cssxref("background-color")}} trên các container và các phần tử con của chúng, để dễ dàng nhìn thấy hiệu ứng mà các giá trị display mang lại.

#### HTML

```html
<article class="container">
  <span>First</span>
  <span>Second</span>
  <span>Third</span>
</article>

<article class="container">
  <span>First</span>
  <span>Second</span>
  <span>Third</span>
</article>

<div>
  <label for="display">Choose a display value:</label>
  <select id="display">
    <option selected>block</option>
    <option>block flow</option>
    <option>inline</option>
    <option>inline flow</option>
    <option>flow</option>
    <option>flow-root</option>
    <option>block flow-root</option>
    <option>table</option>
    <option>block table</option>
    <option>flex</option>
    <option>block flex</option>
    <option>grid</option>
    <option>block grid</option>
    <option>list-item</option>
    <option>block flow list-item</option>
    <option>inline flow list-item</option>
    <option>block flow-root list-item</option>
    <option>inline flow-root list-item</option>
    <option>contents</option>
    <option>none</option>
    <option>inline-block</option>
    <option>inline flow-root</option>
    <option>inline-table</option>
    <option>inline table</option>
    <option>inline-flex</option>
    <option>inline flex</option>
    <option>inline-grid</option>
    <option>inline grid</option>
  </select>
</div>
```

#### CSS

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
  letter-spacing: 1px;
  padding-top: 10px;
}

article {
  background-color: red;
}

article span {
  background-color: black;
  color: white;
  margin: 1px;
}

article,
span {
  padding: 10px;
  border-radius: 7px;
}

article,
div {
  margin: 20px;
}
```

#### JavaScript

```js
const articles = document.querySelectorAll(".container");
const select = document.querySelector("select");

function updateDisplay() {
  articles.forEach((article) => {
    article.style.display = select.value;
  });
}

select.addEventListener("change", updateDisplay);

updateDisplay();
```

#### Kết quả

{{EmbedLiveSample('display_value_comparison','100%', 440)}}

Lưu ý rằng một số giá trị nhiều từ khóa được thêm vào để minh họa có các giá trị tương đương sau:

- `block` = `block flow`
- `inline` = `inline flow`
- `flow` = `block flow`
- `flow-root` = `block flow-root`
- `table` = `block table`
- `flex` = `block flex`
- `grid` = `block grid`
- `list-item` = `block flow list-item`
- `inline-block` = `inline flow-root`
- `inline-table` = `inline table`
- `inline-flex` = `inline flex`
- `inline-grid` = `inline grid`

Bạn có thể tìm thêm ví dụ trong các trang cho từng kiểu display riêng biệt dưới phần [Các giá trị theo nhóm](#các_giá_trị_theo_nhóm).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("visibility")}}, {{CSSxRef("float")}}, {{CSSxRef("position")}}
- {{CSSxRef("grid")}}, {{CSSxRef("flex")}}
- [Mô-đun CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout)
- Thuộc tính SVG {{SVGAttr("display")}}
- [Bố cục block và inline trong luồng bình thường](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout)
- [Giới thiệu về ngữ cảnh định dạng](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts)
