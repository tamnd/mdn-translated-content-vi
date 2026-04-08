---
title: At-rules
slug: Web/CSS/Guides/Syntax/At-rules
page-type: guide
spec-urls: https://drafts.csswg.org/css-syntax/
sidebar: cssref
---

**At-rules** là các [câu lệnh CSS](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_statements) hướng dẫn CSS cách hoạt động. Chúng bắt đầu bằng dấu at, `@` (U+0040 COMMERCIAL AT), theo sau là một định danh. Chúng bao gồm tất cả mọi thứ từ từ khóa at cho đến dấu chấm phẩy tiếp theo, `;` (U+003B SEMICOLON), hoặc [CSS block](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_declaration_blocks) tiếp theo, tùy cái nào đến trước.

At-rules được dùng để nhóm và cấu trúc các style rule cũng như các at-rule khác, khai báo thông tin style không liên kết trực tiếp với nội dung được chọn, và quản lý các cấu trúc cú pháp như import và ánh xạ từ khóa namespace.

## Cú pháp

At-rule được định nghĩa trong module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax), với các at-rule khác nhau được định nghĩa trong các module tương ứng. Chúng thường có một trong hai dạng tùy thuộc vào quy tắc cụ thể và mục đích của nó: statement at-rule và block at-rule, có thể chứa các qualified rule lồng nhau, at-rule hoặc các khai báo.

### Statement at-rules

```css
/* Cấu trúc chung */
@identifier (RULE);

/* Ví dụ: báo trình duyệt sử dụng bộ ký tự UTF-8 */
@charset "utf-8";
```

Statement at-rule kết thúc bằng dấu chấm phẩy. Có nhiều statement at-rule, được chỉ định bởi các định danh của chúng, mỗi cái có cú pháp khác nhau:

- {{cssxref("@charset")}}
  - : Một thuật toán (có dạng cú pháp của at-rule, nhưng không phải là định nghĩa) xác định bộ ký tự dự phòng được stylesheet sử dụng ([CSS Syntax](/en-US/docs/Web/CSS/Guides/Syntax)).
- {{cssxref("@import")}}
  - : Báo CSS engine bao gồm một stylesheet bên ngoài ([CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)).
- {{cssxref("@layer")}}
  - : Xác định thứ tự ưu tiên trong trường hợp có nhiều cascade layer ([CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)). Cũng được dùng như [block at-rule](#layer_2) để định nghĩa style của một layer.
- {{cssxref("@namespace")}}
  - : Định nghĩa namespace mặc định cho stylesheet hoặc tiền tố namespace mà selector chỉ khớp nếu namespace và các thành phần selector khác khớp ([CSS namespaces](/en-US/docs/Web/CSS/Guides/Namespaces)).

### Block at-rules

```css
@identifier (RULE) {
}
```

Block at-rule kết thúc bằng khối `{}`chứa các rule lồng nhau, các at-rule khác, hoặc các khai báo thuộc tính hay descriptor.

- {{cssxref("@counter-style")}}
  - : Định nghĩa các kiểu counter tùy chỉnh và mở rộng các kiểu danh sách được định nghĩa sẵn ([CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)).
- {{cssxref("@container")}}
  - : Một conditional group rule áp dụng nội dung của nó nếu container đáp ứng các [`<container-condition>`](/en-US/docs/Web/CSS/Reference/At-rules/@container#container-condition) ([CSS containment](/en-US/docs/Web/CSS/Guides/Containment)).
- {{cssxref("@font-face")}}
  - : Định nghĩa vị trí tài nguyên font, cả cục bộ và bên ngoài, cùng với các đặc tính kiểu dáng khi các tài nguyên đó được sử dụng với {{cssxref("font-family")}} đã khai báo ([CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)).
- {{cssxref("@font-feature-values")}} (cộng với `@swash`, `@ornaments`, `@annotation`, `@stylistic`, `@styleset` và `@character-variant`)
  - : Kiểm soát hiển thị font theo từng font-family bằng cách định nghĩa các lựa chọn thay thế dành riêng cho font, hoặc tên tùy chỉnh, cho các chỉ số feature trong {{cssxref("font-variant-alternates")}} ở OpenType ([CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)).
- {{cssxref("@keyframes")}} (và alias `@-webkit-keyframes`)
  - : Định nghĩa một animation được đặt tên bằng cách mô tả các kiểu CSS cho các bước trung gian (hoặc keyframe) trong chuỗi animation ([CSS animations](/en-US/docs/Web/CSS/Guides/Animations)).
- {{cssxref("@layer")}}
  - : Tạo một cascade layer được đặt tên với các CSS rule cho layer đó bên trong ([CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)). Cũng được dùng như [statement at-rule](#layer) để xác định thứ tự ưu tiên trong trường hợp có nhiều cascade layer.
- {{cssxref("@media")}}
  - : Một conditional group rule áp dụng nội dung của nó nếu thiết bị đáp ứng các tiêu chí của điều kiện được định nghĩa bằng _media query_ ([CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)).
- {{cssxref("@page")}}
  - : Chỉ định các khía cạnh của một trang cần in, chẳng hạn kích thước, hướng và margin ([CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media)).
- {{cssxref("@position-try")}}
  - : Định nghĩa các tùy chọn vị trí tùy chỉnh có thể được dùng để xác định các tùy chọn vị trí và căn chỉnh dự phòng cho các phần tử được định vị theo anchor ([CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)).
- {{cssxref("@property")}}
  - : Định nghĩa một [CSS custom property](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties), cho phép kiểm tra và ràng buộc kiểu thuộc tính, đặt giá trị mặc định và xác định liệu custom property có thể kế thừa giá trị hay không ([CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables)).
- {{cssxref("@scope")}}
  - : Định nghĩa một phạm vi để áp dụng chúng cho các phần tử được chọn và các style để áp dụng cho các phần tử trong phạm vi đó ([CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)).
- {{cssxref("@starting-style")}}
  - : Định nghĩa các giá trị thuộc tính bắt đầu cho một phần tử để transition từ khi phần tử nhận được bản cập nhật style đầu tiên, chẳng hạn khi transition từ `display: none` ([CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions)).
- {{cssxref("@supports")}}
  - : Một conditional group rule áp dụng nội dung của nó nếu trình duyệt hỗ trợ các tính năng CSS của điều kiện đã cho ([CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)).
- {{cssxref("@view-transition")}}
  - : Chọn tài liệu hiện tại tham gia vào [view transition](/en-US/docs/Web/API/View_Transition_API), và cả tài liệu đích trong trường hợp các transition điều hướng giữa các tài liệu.

## Đặc tả

{{Specifications}}

## Xem thêm

- [CSS at-rules](/en-US/docs/Web/CSS/Reference/At-rules)
- [CSS at-rule functions](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
- [Nesting at-rules](/en-US/docs/Web/CSS/Guides/Nesting/At-rules)
- [CSS statements](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_statements)
- Interface [CSSRule](/en-US/docs/Web/API/CSSRule)
- Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
