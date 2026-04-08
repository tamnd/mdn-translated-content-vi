---
title: Pseudo-elements
slug: Web/CSS/Reference/Selectors/Pseudo-elements
page-type: landing-page
spec-urls:
  - https://drafts.csswg.org/css-pseudo/
  - https://drafts.csswg.org/css-position-4/
  - https://drafts.csswg.org/css-shadow-parts/
  - https://w3c.github.io/webvtt/
sidebar: cssref
---

**Pseudo-element** CSS là một từ khóa được thêm vào bộ chọn, cho phép bạn tạo kiểu cho một phần cụ thể của các phần tử được chọn.

> [!NOTE]
> Trang này là chỉ mục của tất cả các pseudo-element trong CSS. Trang [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements) giới thiệu module định nghĩa một số, nhưng không phải tất cả, các pseudo-element này.

## Cú pháp

```css
selector::pseudo-element {
  property: value;
}
```

Ví dụ: {{CSSxRef("::first-line")}} có thể được dùng để thay đổi font của dòng đầu tiên của một đoạn văn.

```css
/* The first line of every <p> element. */
p::first-line {
  color: blue;
  text-transform: uppercase;
}
```

Dấu hai chấm kép (`::`) được dùng cho pseudo-element. Điều này phân biệt pseudo-element với [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) sử dụng một dấu hai chấm (`:`) trong ký hiệu của chúng. Lưu ý, các trình duyệt hỗ trợ cú pháp dấu hai chấm đơn cho bốn pseudo-element gốc: `::before`, `::after`, `::first-line`, và `::first-letter`.

Pseudo-element không tồn tại độc lập. Phần tử mà pseudo-element là một phần của nó được gọi là _phần tử gốc_. Pseudo-element phải xuất hiện sau tất cả các thành phần khác trong bộ chọn [phức tạp](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#complex_selector) hoặc [kết hợp](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector). Phần tử cuối cùng trong bộ chọn là phần tử gốc của pseudo-element. Ví dụ: bạn có thể chọn dòng đầu tiên của đoạn văn bằng `p::first-line` nhưng không thể chọn các con của dòng đầu tiên. Vì vậy `p::first-line > *` là không hợp lệ.

Pseudo-element có thể được chọn dựa trên trạng thái hiện tại của phần tử gốc. Ví dụ: `p:hover::first-line` chọn dòng đầu tiên (pseudo-element) của đoạn văn khi bản thân đoạn văn đang được di chuột qua (pseudo-class).

> [!NOTE]
> Khi [danh sách bộ chọn](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#selector_list) chứa bộ chọn không hợp lệ, toàn bộ khối kiểu bị bỏ qua.

## Pseudo-element chữ

- {{CSSxRef("::first-line")}}
  - : Hộp dòng đầu tiên của phần tử gốc.
- {{CSSxRef("::first-letter")}}
  - : Chữ cái, số hoặc ký tự biểu tượng đầu tiên trên dòng đầu tiên của phần tử gốc.
- {{CSSxRef("::cue")}}
  - : Các cue [WebVTT](/en-US/docs/Web/API/WebVTT_API) trong phần tử được chọn.
    Cái này có thể được dùng để [tạo kiểu cho phụ đề và các cue khác](/en-US/docs/Web/API/WebVTT_API#styling_webvtt_in_html_or_a_stylesheet) trong phương tiện có track VTT.
    Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements) cũng định nghĩa các sub-pseudo element `::postfix` và `::prefix`. Chúng chưa được bất kỳ trình duyệt nào hỗ trợ.

## Pseudo-element làm nổi bật

Chọn các phần tài liệu dựa trên nội dung và trạng thái tài liệu, cho phép các vùng đó được tạo kiểu khác nhau để chỉ ra trạng thái đó cho người dùng.

- {{CSSxRef("::grammar-error")}}
  - : Một phần văn bản mà trình duyệt cho là sai ngữ pháp.
- {{CSSxRef("::highlight()")}}
  - : Các phần tử trong [highlight registry](/en-US/docs/Web/API/CSS/highlights_static). Được dùng để tạo các highlight tùy chỉnh.
- {{CSSxRef("::search-text")}}
  - : Kết quả tìm kiếm được xác định bởi tính năng tìm kiếm văn bản "Find" hoặc "Find in page" của tác nhân người dùng.
- {{CSSxRef("::selection")}}
  - : Phần tài liệu đã được chọn.
- {{CSSxRef("::spelling-error")}}
  - : Một phần văn bản mà trình duyệt cho là sai chính tả.
- {{CSSxRef("::target-text")}}
  - : Phần tử đích của tài liệu. Phần tử đích được xác định bằng [fragment của URL](/en-US/docs/Web/URI/Reference/Fragment).

## Pseudo-element tuân theo cây

Các pseudo-element này hoạt động như các phần tử thông thường, phù hợp liền mạch trong mô hình hộp. Chúng hoạt động như một phần tử con có thể được tạo kiểu trực tiếp trong hệ thống phân cấp phần tử gốc.

- {{CSSxRef("::before")}}
  - : Tạo ra một pseudo-element là con đầu tiên của phần tử được chọn.
- {{CSSxRef("::after")}}
  - : Tạo ra một pseudo-element là con cuối cùng của phần tử được chọn.
- {{CSSxRef("::column")}}
  - : Mỗi mảnh cột của [bố cục nhiều cột](/en-US/docs/Web/CSS/Guides/Multicol_layout).
- {{CSSxRef("::marker")}}
  - : Hộp marker được tạo tự động của mục danh sách.
- {{CSSxRef("::backdrop")}}
  - : Phông nền của phần tử gốc được hiển thị trong [lớp trên cùng](/en-US/docs/Glossary/Top_layer).
- {{CSSxRef("::scroll-button()")}}
  - : Tạo ra một nút có thể điều khiển việc cuộn của {{glossary("scroll container")}} mà nó được áp dụng.
- {{CSSxRef("::scroll-marker")}}
  - : Tạo ra một pseudo-element là scroll marker — một nút đích cuộn cho phần tử gốc của nó được lồng trong một scroll-marker group.
- {{CSSxRef("::scroll-marker-group")}}
  - : Tạo ra một container trước hoặc sau scroll container để chứa các pseudo-element {{cssxref("::scroll-marker")}} được tạo ra trên phần tử hoặc các phần tử con của nó.

## Pseudo-element được hỗ trợ bởi phần tử

Các pseudo-element này là các phần tử thực không thể chọn theo cách khác.

- {{CSSxRef("::details-content")}}
  - : Nội dung có thể mở rộng/thu gọn của phần tử {{HTMLElement("details")}}.
- {{cssxref("::part()")}}
  - : Bất kỳ phần tử nào trong [cây shadow](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) có thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) khớp.
- {{cssxref("::slotted()")}}
  - : Bất kỳ phần tử nào được đặt vào một slot bên trong template HTML.

## Pseudo-element liên quan đến biểu mẫu

Các pseudo-element này liên quan đến các điều khiển biểu mẫu.

- {{CSSxRef("::checkmark")}}
  - : Nhắm đến dấu kiểm được đặt bên trong phần tử `<option>` hiện đang được chọn của [phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) để cung cấp chỉ báo trực quan về phần tử nào đang được chọn.
- {{CSSxRef("::file-selector-button")}}
  - : Nút của {{HTMLElement("input") }} với [`type="file"`](/en-US/docs/Web/HTML/Reference/Elements/input/file).
- {{CSSxRef("::picker()")}}
  - : Phần picker của một phần tử, ví dụ picker thả xuống của [phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select).
- {{CSSxRef("::picker-icon")}}
  - : Biểu tượng picker bên trong các điều khiển biểu mẫu có biểu tượng liên quan. Trong trường hợp [phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), nó chọn mũi tên chỉ xuống khi select bị đóng.
- {{CSSxRef("::placeholder")}}
  - : Văn bản placeholder trong trường nhập liệu.

## Chỉ mục theo bảng chữ cái

Pseudo-element được định nghĩa bởi một tập hợp các thông số kỹ thuật CSS bao gồm các mục sau:

A

- {{CSSxRef("::after")}}

B

- {{CSSxRef("::backdrop")}}
- {{CSSxRef("::before")}}

C

- {{CSSxRef("::column")}}
- {{CSSxRef("::checkmark")}}
- {{CSSxRef("::cue")}} (and {{cssxref("::cue()")}})

D

- {{CSSxRef("::details-content")}}

F

- {{CSSxRef("::file-selector-button")}}
- {{CSSxRef("::first-letter")}}
- {{CSSxRef("::first-line")}}

G

- {{CSSxRef("::grammar-error")}}

H

- {{CSSxRef("::highlight()")}}

M

- {{CSSxRef("::marker")}}

P

- {{cssxref("::part()")}}
- {{CSSxRef("::picker()")}}
- {{CSSxRef("::picker-icon")}}
- {{CSSxRef("::placeholder")}}

S

- {{CSSxRef("::scroll-button()")}}
- {{CSSxRef("::scroll-marker")}}
- {{CSSxRef("::scroll-marker-group")}}
- {{CSSxRef("::selection")}}
- {{cssxref("::slotted()")}}
- {{CSSxRef("::spelling-error")}}

T

- {{CSSxRef("::target-text")}}

V

- {{cssxref("::view-transition")}}
- {{cssxref("::view-transition-image-pair()")}}
- {{cssxref("::view-transition-group()")}}
- {{cssxref("::view-transition-new()")}}
- {{cssxref("::view-transition-old()")}}

### Pseudo-element không chuẩn

Các pseudo-element không chuẩn có tiền tố vendor bao gồm:

#### Tiền tố `-moz-`

- {{CSSxRef("::-moz-color-swatch")}}
- {{CSSxRef("::-moz-focus-inner")}}
- {{CSSxRef("::-moz-list-bullet")}}
- {{CSSxRef("::-moz-list-number")}}
- {{CSSxRef("::-moz-meter-bar")}}
- {{CSSxRef("::-moz-progress-bar")}}
- {{CSSxRef("::-moz-range-progress")}}
- {{CSSxRef("::-moz-range-thumb")}}
- {{CSSxRef("::-moz-range-track")}}

#### Tiền tố `-webkit-`

- {{CSSxRef("::-webkit-inner-spin-button")}}
- {{CSSxRef("::-webkit-meter-bar")}}
- {{CSSxRef("::-webkit-meter-even-less-good-value")}}
- {{CSSxRef("::-webkit-meter-inner-element")}}
- {{CSSxRef("::-webkit-meter-optimum-value")}}
- {{CSSxRef("::-webkit-meter-suboptimum-value")}}
- {{CSSxRef("::-webkit-progress-bar")}}
- {{CSSxRef("::-webkit-progress-inner-element")}}
- {{CSSxRef("::-webkit-progress-value")}}
- {{CSSxRef("::-webkit-scrollbar")}}
- {{CSSxRef("::-webkit-search-cancel-button")}}
- {{CSSxRef("::-webkit-search-results-button")}}
- {{CSSxRef("::-webkit-slider-runnable-track")}}
- {{CSSxRef("::-webkit-slider-thumb")}}

## Lồng nhau pseudo-element

Bạn có thể kết hợp một số bộ chọn pseudo-element lại với nhau để tạo kiểu cho pseudo-element lồng bên trong các pseudo-element khác. Các tổ hợp pseudo-element lồng nhau sau được hỗ trợ:

- {{CSSxRef("::after")}}
  - `::after::marker`: Chọn pseudo-element {{CSSxRef("::marker")}} của pseudo-element `::after`, khi `::after` được tạo kiểu như một mục danh sách, với {{CSSxRef("display", "display: list-item")}}.
- {{CSSxRef("::before")}}
  - `::before::marker`: Chọn pseudo-element {{CSSxRef("::marker")}} của pseudo-element `::before`, khi `::before` được tạo kiểu như một mục danh sách, với {{CSSxRef("display", "display: list-item")}}.

Hãy xem các trang tham chiếu pseudo-element riêng lẻ để biết ví dụ và thông tin tương thích trình duyệt.

## Kế thừa của pseudo-element làm nổi bật

[Pseudo-element làm nổi bật](#highlight_pseudo-elements), chẳng hạn như {{CSSxref("::selection")}}, {{CSSxref("::target-text")}}, {{CSSxref("::highlight()")}}, {{CSSxref("::spelling-error")}}, và {{CSSxref("::grammar-error")}}, tuân theo mô hình kế thừa nhất quán khác với [kế thừa phần tử thông thường](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance).

Khi bạn áp dụng kiểu cho pseudo-element làm nổi bật, chúng kế thừa từ cả hai:

1. Các phần tử cha của chúng (theo kế thừa thông thường).
2. Các pseudo-element làm nổi bật của phần tử cha (theo kế thừa highlight).

Điều này có nghĩa là nếu bạn tạo kiểu cho cả pseudo-element làm nổi bật của phần tử cha và pseudo-element làm nổi bật của phần tử con, văn bản được làm nổi bật của con sẽ kết hợp các thuộc tính từ cả hai nguồn.

Dưới đây là một ví dụ cụ thể.

Đầu tiên, chúng ta có HTML bao gồm hai phần tử {{htmlelement("div")}} lồng nhau. Một phần nội dung văn bản được bao gồm trực tiếp bên trong `<div>` cha, và một phần được lồng bên trong `<div>` con.

```html live-sample___highlight_inheritance
<div class="parent">
  Parent text
  <div class="child">Child text</div>
</div>
```

Tiếp theo, chúng ta thêm CSS chọn các phần tử `<div>` cha và con riêng biệt và cho chúng các giá trị {{cssxref("color")}} khác nhau, đồng thời chọn văn bản được chọn của cha và con ({{cssxref("::selection")}}). Điều này cho mỗi `<div>` một {{cssxref("background-color")}} khác nhau và đặt `color` văn bản khác nhau trên lựa chọn của cha.

```css live-sample___highlight_inheritance
/* Style for the parent element */
.parent {
  color: blue;
}

/* Style for the parent's selected text */
.parent::selection {
  background-color: yellow;
  color: red;
}

/* Style for the child element */
.child {
  color: green;
}

/* Style for the child's selected text */
.child::selection {
  background-color: orange;
}
```

Ví dụ hiển thị như sau:

{{EmbedLiveSample("highlight_inheritance", , "150")}}

Hãy thử chọn văn bản trong cả phần tử cha và phần tử con. Chú ý rằng:

1. Khi bạn chọn văn bản cha, nó sử dụng nền vàng và màu văn bản đỏ được định nghĩa trong `.parent::selection`.
2. Khi bạn chọn văn bản con, nó sử dụng:
   - Nền cam từ `.child::selection`.
   - Màu văn bản đỏ được kế thừa từ pseudo-element `::selection` của cha.

Điều này minh họa cách pseudo-element làm nổi bật của con kế thừa từ cả phần tử cha và pseudo-element làm nổi bật của cha.

[Thuộc tính tùy chỉnh CSS (biến)](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) trong pseudo-element làm nổi bật kế thừa từ phần tử gốc của chúng (phần tử chúng đang được áp dụng), không qua chuỗi kế thừa highlight. Ví dụ:

```css
:root {
  --selection-color: lightgreen;
}

::selection {
  color: var(--selection-color);
}

.blue {
  --selection-color: blue;
}
```

Khi sử dụng bộ chọn phổ quát với pseudo-element làm nổi bật, nó ngăn kế thừa highlight. Ví dụ:

```css
/* This prevents highlight inheritance */
*::selection {
  color: lightgreen;
}

/* Prefer this to allow inheritance */
:root::selection {
  color: lightgreen;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements) module
- [Pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
- [Learn: Pseudo-classes and pseudo-elements](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
- [Inheritance changes for CSS selection styling](https://developer.chrome.com/blog/selection-styling) - Detailed explanation of the highlight pseudo-elements inheritance model changes in Chrome 134
