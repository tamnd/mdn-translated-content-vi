---
title: "Introduction to CSS syntax: declarations, rulesets, and statements"
short-title: Introduction
slug: Web/CSS/Guides/Syntax/Introduction
page-type: guide
sidebar: cssref
---

Mục tiêu cơ bản của ngôn ngữ Cascading Stylesheet ([CSS](/en-US/docs/Web/CSS)) là cho phép một browser engine tô màu các phần tử của trang với các đặc điểm cụ thể, như màu sắc, vị trí, hoặc trang trí. _Cú pháp CSS_ phản ánh mục tiêu này và các khối xây dựng cơ bản của nó là:

- **Thuộc tính** (property) là một định danh, tức là một _tên_ có thể đọc được bởi con người, định nghĩa tính năng nào được xem xét.
- **Giá trị** (value) mô tả cách tính năng phải được xử lý bởi engine. Mỗi thuộc tính có một tập hợp các giá trị hợp lệ, được định nghĩa bởi một ngữ pháp hình thức, cũng như ý nghĩa ngữ nghĩa, được thực hiện bởi browser engine.

## CSS declarations

Thiết lập các thuộc tính CSS thành các giá trị cụ thể là chức năng cốt lõi của ngôn ngữ CSS. Một cặp thuộc tính và giá trị được gọi là **declaration**, và bất kỳ CSS engine nào cũng tính toán xem declaration nào áp dụng cho từng phần tử đơn lẻ của một trang để bố cục và tạo kiểu cho nó phù hợp.

Cả thuộc tính và giá trị đều không phân biệt chữ hoa chữ thường theo mặc định trong CSS. Cặp được phân tách bằng dấu hai chấm, `:` (U+003A COLON), và khoảng trắng trước, giữa và sau thuộc tính và giá trị, nhưng không nhất thiết bên trong, sẽ bị bỏ qua.

![Một css declaration là một cặp thuộc tính-giá trị, với dấu hai chấm phân tách hai thực thể và dấu chấm phẩy đóng declaration.](css_syntax_-_declaration.png)

Có [hàng trăm thuộc tính khác nhau](/en-US/docs/Web/CSS/Reference) trong CSS và số lượng giá trị khác nhau gần như vô tận. Không phải tất cả các cặp thuộc tính và giá trị đều được cho phép và mỗi thuộc tính định nghĩa những giá trị nào là hợp lệ. Khi một giá trị không hợp lệ cho một thuộc tính nhất định, declaration được coi là _không hợp lệ_ và hoàn toàn bị bỏ qua bởi CSS engine.

## CSS declaration blocks

Các declaration được nhóm lại trong **block**, tức là một cấu trúc được phân định bởi một dấu ngoặc nhọn mở, `{` (U+007B LEFT CURLY BRACKET), và một dấu đóng, `}` (U+007D RIGHT CURLY BRACKET). Các block đôi khi có thể được lồng nhau, vì vậy các dấu ngoặc nhọn mở và đóng phải khớp nhau.

![Hai dấu ngoặc nhọn phân định điểm bắt đầu và kết thúc của một CSS block, với nội dung CSS hoặc không có nội dung giữa các dấu ngoặc nhọn.](css_syntax_-_block.png)

Các block như vậy được gọi tự nhiên là **declaration block** và các declaration bên trong chúng được phân tách bằng dấu chấm phẩy, `;` (U+003B SEMICOLON). Một declaration block có thể rỗng, tức là không chứa declaration nào. Khoảng trắng xung quanh các declaration bị bỏ qua. Declaration cuối cùng của một block không cần phải kết thúc bằng dấu chấm phẩy, mặc dù thường được coi là _phong cách tốt_ để làm như vậy vì nó ngăn quên thêm khi mở rộng block với một declaration khác.

Một CSS declaration block được hình dung trong sơ đồ dưới đây.

![Trong một CSS block, được bao quanh bởi các dấu ngoặc nhọn, dấu chấm phẩy phân tách các declaration, với dấu chấm phẩy cuối cùng là tùy chọn nhưng được khuyến nghị là thực hành tốt.](declaration-block.png)

> [!NOTE]
> Nội dung của một CSS declaration block, tức là danh sách các declaration được phân tách bằng dấu chấm phẩy, không có các dấu ngoặc nhọn ban đầu và đóng, có thể được đặt bên trong thuộc tính HTML [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style).

## CSS rulesets

Nếu các style sheet chỉ có thể áp dụng một declaration cho mỗi phần tử của trang Web, chúng sẽ khá vô dụng. Mục tiêu thực sự là áp dụng các declaration khác nhau cho các phần khác nhau của tài liệu.

CSS cho phép điều này bằng cách liên kết các điều kiện với các declaration block. Mỗi declaration block hợp lệ được đứng trước bởi một hoặc nhiều [**selector**](/en-US/docs/Web/CSS/Guides/Selectors) được phân tách bằng dấu phẩy, đây là các điều kiện chọn một số phần tử của trang. Một [danh sách selector](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list) và một declaration block liên quan, cùng với nhau, được gọi là **ruleset**, hoặc thường là **rule**.

Một CSS ruleset (hoặc rule) được hình dung trong sơ đồ dưới đây.

![Một nhóm các selector được phân tách bằng dấu phẩy đứng trước declaration block được phân định bởi dấu ngoặc nhọn, chứa nhiều declaration kết thúc bằng dấu chấm phẩy.](ruleset.png)

Vì một phần tử của trang có thể khớp với nhiều selector, và do đó bởi nhiều quy tắc có thể chứa một thuộc tính nhất định nhiều lần, với các giá trị khác nhau, tiêu chuẩn CSS định nghĩa cái nào có ưu tiên hơn cái kia và phải được áp dụng: đây được gọi là thuật toán cascade (xem [Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)).

> [!NOTE]
> Điều quan trọng cần lưu ý là mặc dù một ruleset được đặc trưng bởi một nhóm selector là một loại shorthand thay thế các ruleset với một selector đơn lẻ, điều này không áp dụng cho tính hợp lệ của chính ruleset đó.
>
> Điều này dẫn đến một hệ quả quan trọng: nếu một selector cơ bản đơn lẻ không hợp lệ, như khi sử dụng một pseudo-element hoặc pseudo-class không xác định, toàn bộ _selector_ không hợp lệ và do đó toàn bộ quy tắc bị bỏ qua (cũng là không hợp lệ).

## CSS statements

Các ruleset là các khối xây dựng chính của một style sheet, thường chỉ bao gồm một danh sách lớn của chúng. Nhưng có những thông tin khác mà một Web author muốn truyền đạt trong style sheet, như bộ ký tự, các external style sheet khác để import, mô tả font face hoặc list counter và nhiều hơn nữa. Nó sẽ sử dụng các loại câu lệnh khác và cụ thể để làm điều đó.

Một **statement** là một khối xây dựng bắt đầu bằng bất kỳ ký tự nào không phải khoảng trắng và kết thúc ở dấu ngoặc đóng đầu tiên hoặc dấu chấm phẩy (bên ngoài một chuỗi, không bị thoát và không được bao gồm trong một cặp `{}`, `()`, hoặc `[]` khác).

![Một sơ đồ Venn của các statement lưu ý rằng tất cả các ruleset đều là nested statement, trong khi một số at-rule là nested statement nhưng hầu hết không phải. Bất cứ điều gì không phải là at-rule hay nested đều không hợp lệ.](css_syntax_-_statements_venn_diag.png)

Có hai loại statement:

- **Ruleset** (hoặc _rule_) như đã thấy, liên kết một tập hợp các CSS declaration với một điều kiện được mô tả bởi một [selector](/en-US/docs/Web/CSS/Guides/Selectors).
- **At-rule** bắt đầu bằng ký hiệu at, `@` (U+0040 COMMERCIAL AT), theo sau là một định danh và sau đó tiếp tục đến cuối câu lệnh, tức là đến dấu chấm phẩy (;) tiếp theo bên ngoài một block, hoặc cuối block tiếp theo. Mỗi loại [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules), được định nghĩa bởi định danh, có thể có cú pháp nội bộ riêng của nó, và tất nhiên là ngữ nghĩa. Chúng được sử dụng để truyền đạt thông tin meta-data (như {{ cssxref("@layer") }} hoặc {{ cssxref("@import") }}), thông tin điều kiện (như {{ cssxref("@media") }} hoặc {{ cssxref("@document") }}), hoặc thông tin mô tả (như {{ cssxref("@font-face") }}).

Bất kỳ statement nào không phải là ruleset hoặc at-rule đều không hợp lệ và bị bỏ qua.

### Nested statements

Có một nhóm statement khác – **nested statement**. Đây là các statement có thể được sử dụng trong một tập hợp con cụ thể của at-rule – _conditional group rule_. Các statement này chỉ áp dụng nếu một điều kiện cụ thể được khớp: nội dung at-rule `@media` chỉ được áp dụng nếu thiết bị mà trình duyệt chạy trên đó khớp với điều kiện được biểu diễn; nội dung at-rule `@document` chỉ được áp dụng nếu trang hiện tại khớp với một số điều kiện, v.v. Trong CSS1 và CSS2.1, chỉ có _ruleset_ mới có thể được sử dụng bên trong conditional group rule. Điều đó rất hạn chế và hạn chế này đã được dỡ bỏ trong [_CSS Conditionals Level 3_](/en-US/docs/Web/CSS/Guides/Conditional_rules). Bây giờ, mặc dù vẫn còn thử nghiệm và không được hỗ trợ bởi mọi trình duyệt, các conditional group rule có thể chứa nhiều nội dung hơn: các ruleset nhưng cũng là một số, không phải tất cả, at-rule.

## Xem thêm

- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
- [Selectors and combinators](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
- [Selector structure](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure)
- [Error handling](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- [Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
- Values
  - [Initial values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
  - [Computed values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
  - [Used values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)
  - [Actual values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [Shorthand properties](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
