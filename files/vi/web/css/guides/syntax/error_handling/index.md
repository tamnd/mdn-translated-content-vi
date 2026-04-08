---
title: CSS error handling
short-title: Error handling
slug: Web/CSS/Guides/Syntax/Error_handling
page-type: guide
sidebar: cssref
---

Khi xảy ra lỗi trong CSS, chẳng hạn như giá trị không hợp lệ hoặc thiếu dấu chấm phẩy, thay vì [ném ra lỗi như trong JavaScript](/en-US/docs/Web/JavaScript/Reference/Errors), trình duyệt (hoặc user agent khác) sẽ xử lý một cách khéo léo. Trình duyệt không hiển thị cảnh báo liên quan đến CSS hay thông báo lỗi xảy ra trong các style. Chúng chỉ đơn giản bỏ qua nội dung không hợp lệ và tiếp tục phân tích các style hợp lệ tiếp theo. Đây là một tính năng của CSS, không phải lỗi.

Hướng dẫn này thảo luận về cách các {{glossary("parser", "parser")}} CSS loại bỏ CSS không hợp lệ.

## Lỗi CSS parser

Khi gặp lỗi CSS, {{glossary("parser")}} của trình duyệt bỏ qua dòng chứa lỗi, loại bỏ lượng mã CSS tối thiểu trước khi quay lại {{glossary("parse", "phân tích")}} CSS bình thường. "Khôi phục lỗi" chỉ đơn giản là bỏ qua hoặc bỏ qua nội dung không hợp lệ.

Việc trình duyệt bỏ qua mã không hợp lệ cho phép sử dụng các tính năng CSS mới mà không lo bất cứ điều gì bị hỏng trên các trình duyệt cũ hơn. Một trình duyệt có thể không nhận ra một tính năng mới, nhưng điều đó không sao. Việc loại bỏ nội dung không hợp lệ mà không ném lỗi cho phép cả cú pháp cũ và mới cùng tồn tại trong cùng một ruleset, mặc dù cần lưu ý rằng chúng nên được chỉ định theo thứ tự đó. Ví dụ:

```css
div {
  display: inline-flex;
  display: inline flex;
}
```

Thuộc tính {{cssxref("display")}} chấp nhận cả cú pháp giá trị đơn cũ và [cú pháp đa từ khóa](/en-US/docs/Web/CSS/Guides/Display/Multi-keyword_syntax). Trình duyệt sẽ hiển thị cú pháp cũ cho đến khi chúng nhận ra cú pháp mới là hợp lệ, lúc đó cú pháp mới sẽ ghi đè cú pháp cũ. Nếu người dùng có trình duyệt cũ, giá trị dự phòng hợp lệ sẽ không bị ghi đè bởi CSS mới, vì trình duyệt coi nó là không hợp lệ.

Loại và lượng CSS mà trình duyệt bỏ qua do lỗi phụ thuộc vào loại lỗi. Một số tình huống lỗi phổ biến được liệt kê dưới đây:

- Đối với [lỗi trong at-rule](#lỗi-at-rule), việc một dòng đơn hay toàn bộ at-rule bị bỏ qua (thất bại) phụ thuộc vào at-rule và loại lỗi.
- Nếu [lỗi là selector không hợp lệ](#lỗi-trong-danh-sách-selector), toàn bộ declaration block sẽ bị bỏ qua.
- [Lỗi do thiếu dấu chấm phẩy](#lỗi-trong-css-declaration-block) giữa các khai báo thuộc tính gây ra giá trị không hợp lệ, trong trường hợp đó nhiều khai báo property-value bị bỏ qua.
- Nếu [lỗi là tên thuộc tính hoặc giá trị](#lỗi-trong-css-declaration-block), chẳng hạn như tên thuộc tính không được nhận dạng hoặc kiểu dữ liệu không hợp lệ, khai báo property-value đó bị bỏ qua. Trong [giai đoạn lọc](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#filtering), các khai báo không hợp lệ về mặt cú pháp như vậy sẽ bị loại bỏ.
- Nếu [lỗi là do thiếu dấu ngoặc đóng](#lỗi-với-kết-thúc-tự-đóng), phạm vi bị bỏ qua phụ thuộc vào khả năng phân tích lỗi như CSS lồng nhau của trình duyệt.

Sau khi phân tích từng khai báo, quy tắc style, at-rule, v.v., trình duyệt kiểm tra nội dung đã phân tích với [ngữ pháp](#kiểm-tra-ngữ-pháp) dự kiến cho cấu trúc đó. Nếu nội dung không khớp với ngữ pháp dự kiến cho cấu trúc đó, trình duyệt coi nó là không hợp lệ và bỏ qua.

### Lỗi at-rule

Ký hiệu `@`, được gọi trong các đặc tả CSS là `<at-keyword-token>`, báo hiệu sự bắt đầu của một CSS [at-rule](/en-US/docs/Web/CSS/Reference/At-rules). Một khi at-rule bắt đầu bằng ký hiệu `@`, không có gì được coi là không hợp lệ từ góc độ của parser. Mọi thứ cho đến dấu chấm phẩy đầu tiên (`;`) hoặc dấu ngoặc nhọn mở (`{`) đều là phần prelude của at-rule. Nội dung của mỗi at-rule được diễn giải theo các quy tắc ngữ pháp cho at-rule cụ thể đó.

Các statement at-rule, chẳng hạn như khai báo {{cssxref("@import")}} và {{cssxref("@namespace")}}, chỉ chứa prelude. Dấu chấm phẩy kết thúc at-rule ngay lập tức đối với [statement at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules#statement_at-rules). Nếu nội dung của prelude không hợp lệ theo ngữ pháp của at-rule đó, at-rule bị bỏ qua, và trình duyệt tiếp tục phân tích CSS sau khi gặp dấu chấm phẩy tiếp theo. Ví dụ, nếu một at-rule `@import` xuất hiện sau bất kỳ khai báo CSS nào khác ngoài `@charset`, `@layer` hoặc các câu lệnh `@import` khác, khai báo `@import` đó bị bỏ qua.

```css
@import "assets/fonts.css" layer(fonts);
@namespace svg url("http://www.w3.org/2000/svg");
```

Nếu parser gặp dấu ngoặc nhọn (`{`) trước khi gặp dấu chấm phẩy, at-rule được phân tích như một block at-rule. [Block at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules#block_at-rules) như {{cssxref("@font-face")}} và {{cssxref("@keyframes")}}, chứa một khối khai báo bao quanh bởi dấu ngoặc nhọn (`{}`). Dấu ngoặc nhọn mở thông báo cho trình duyệt biết nơi prelude của at-rule kết thúc và phần body của at-rule bắt đầu. Parser tìm kiếm phía trước, tìm kiếm các khối phù hợp (nội dung bao quanh bởi `()`, `{}`, hoặc `[]`) cho đến khi tìm thấy dấu ngoặc nhọn đóng (`}`) không khớp với bất kỳ dấu ngoặc nhọn nào khác: điều này đóng body của at-rule.

Các at-rule khác nhau có các quy tắc ngữ pháp khác nhau, các descriptor khác nhau (hoặc không có), và các quy tắc khác nhau về những gì, nếu có, sẽ làm cho toàn bộ at-rule trở nên không hợp lệ. Ngữ pháp dự kiến cho [mỗi at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) và cách xử lý lỗi được ghi lại trên trang at-rule tương ứng. Việc xử lý nội dung không hợp lệ phụ thuộc vào lỗi.

Ví dụ, quy tắc `@font-face` yêu cầu cả descriptor [`font-family`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/font-family) và [`src`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/src). Nếu một trong hai bị bỏ qua hoặc không hợp lệ, toàn bộ quy tắc `@font-face` là không hợp lệ. Bao gồm một descriptor không liên quan, bất kỳ descriptor font hợp lệ nào khác với giá trị không hợp lệ, hoặc một khai báo thuộc tính style trong block lồng nhau `@font-face` sẽ không làm khai báo font trở nên không hợp lệ. Miễn là tên font và nguồn font được bao gồm và hợp lệ, bất kỳ CSS không hợp lệ nào trong at-rule đều bị bỏ qua, nhưng block `@font-face` vẫn được phân tích.

Mặc dù ngữ pháp của at-rule `@keyframes` rất khác với ngữ pháp quy tắc `@font-face`, loại lỗi vẫn ảnh hưởng đến những gì bị bỏ qua. Các khai báo quan trọng (được đánh dấu bằng flag {{cssxref("important")}}) và các thuộc tính không thể animate được bỏ qua trong các quy tắc keyframe, nhưng chúng không ảnh hưởng đến các style khác được khai báo trong cùng một khối [keyframe selector](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors). Bao gồm một keyframe selector không hợp lệ (chẳng hạn như giá trị phần trăm nhỏ hơn `0%` hoặc lớn hơn `100%`, hoặc một {{cssxref("number")}} bỏ qua `%`) làm cho danh sách keyframe selector không hợp lệ và do đó khối style bị bỏ qua. Một keyframe selector không hợp lệ chỉ làm cho khối style của selector không hợp lệ đó trở nên không hợp lệ; nó không làm cho toàn bộ khai báo `@keyframes` trở nên không hợp lệ. Bao gồm các style giữa hai khối keyframe selector, mặt khác, sẽ làm cho toàn bộ at-rule `@keyframes` trở nên không hợp lệ.

Một số at-rule hầu như luôn luôn hợp lệ. At-rule {{cssxref("@layer")}} có cả dạng thông thường và lồng nhau. Cú pháp `@layer` statement chỉ chứa prelude, kết thúc bằng dấu chấm phẩy. Ngoài ra, cú pháp lồng nhau có layer style lồng nhau giữa các dấu ngoặc nhọn đứng sau prelude. Bỏ qua dấu ngoặc nhọn đóng có thể là lỗi logic nhưng không phải là lỗi cú pháp. Trong trường hợp thiếu dấu ngoặc nhọn đóng trong `@layer`, bất kỳ style nào đến sau vị trí dấu ngoặc nhọn đóng lẽ ra phải xuất hiện đều được phân tích là nằm trong cascade layer được định nghĩa trong prelude của at-rule. CSS hợp lệ vì không có lỗi cú pháp; không có gì bị loại bỏ. Lỗi cú pháp có thể khiến layer có tên hoặc ẩn danh trở nên rỗng, nhưng layer vẫn được tạo.

### Lỗi trong danh sách selector

Có nhiều cách bạn có thể mắc lỗi khi viết selector, nhưng chỉ có các selector không hợp lệ mới khiến danh sách selector trở nên không hợp lệ (Xem [danh sách selector không hợp lệ](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#invalid_selector_list)).

Nếu bạn bao gồm một [class selector](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors), một [id_selectors](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors), hoặc một [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) cho một class, id, hoặc element (hoặc custom element) không tồn tại, đó có thể là lỗi logic nhưng không phải là lỗi cú pháp. Tuy nhiên, nếu bạn có lỗi đánh máy trong một pseudo-class hoặc pseudo-element, nó có thể tạo ra một selector không hợp lệ, đó là lỗi mà parser cần giải quyết.

Nếu một danh sách selector chứa bất kỳ selector không hợp lệ nào, toàn bộ khối style sẽ bị bỏ qua. Có các ngoại lệ: nếu selector không hợp lệ nằm trong một pseudo-class {{cssxref(":is")}} hoặc {{cssxref(":where")}} (chấp nhận [danh sách selector tha thứ](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list)) hoặc nếu selector không được biết đến là [pseudo-element có tiền tố `-webkit-`](#ngoại-lệ--webkit-), chỉ selector không được biết đến bị bỏ qua vì không khớp với bất cứ điều gì. Danh sách selector không bị làm vô hiệu.

Ngoài các ngoại lệ này, một selector không hợp lệ hoặc không được hỗ trợ trong danh sách selector sẽ làm cho toàn bộ quy tắc không hợp lệ và toàn bộ khối selector sẽ bị bỏ qua. Trình duyệt sau đó sẽ tìm dấu ngoặc nhọn đóng và tiếp tục phân tích từ điểm đó trở đi.

#### Ngoại lệ `-webkit-`

Do các vấn đề kế thừa từ việc lạm dụng tiền tố dành riêng cho trình duyệt trong các selector và [tên thuộc tính (và giá trị)](#tiền-tố-vendor), trình duyệt tránh vô hiệu hóa quá mức các danh sách selector bằng cách coi tất cả [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) bắt đầu bằng tiền tố `-webkit-` không phân biệt chữ hoa chữ thường và không kết thúc bằng `()` là hợp lệ.

Điều này có nghĩa là một pseudo-element như `::-webkit-works-only-in-samsung` sẽ không làm danh sách selector trở nên không hợp lệ, bất kể trình duyệt nào đang chạy mã. Trong những trường hợp như vậy, pseudo-element có thể không được nhận dạng hoặc hỗ trợ bởi trình duyệt, nhưng nó sẽ không khiến toàn bộ danh sách selector và khối style liên quan bị bỏ qua. Mặt khác, một selector có tiền tố không được biết đến với ký hiệu hàm `::-webkit-imaginary-function()` sẽ làm cho toàn bộ danh sách selector trở nên không hợp lệ, và trình duyệt sẽ bỏ qua toàn bộ khối selector.

### Lỗi trong CSS declaration block

Khi nói đến các thuộc tính và giá trị CSS trong declaration block, nếu thuộc tính hoặc giá trị không hợp lệ, cặp property-value đó bị bỏ qua và loại bỏ. Khi user agent phân tích hoặc diễn giải một danh sách khai báo, cú pháp không xác định tại bất kỳ điểm nào khiến parser của trình duyệt chỉ loại bỏ khai báo hiện tại. Sau đó nó tiếp tục phân tích CSS sau khi gặp dấu chấm phẩy tiếp theo hoặc dấu ngoặc nhọn đóng, tùy cái nào đến trước.

Ví dụ này chứa một lỗi. Parser bỏ qua lỗi (và các comment), tìm kiếm phía trước cho đến khi gặp dấu chấm phẩy, sau đó bắt đầu lại việc phân tích:

```css-nolint example-bad
p {
  /* Invalid syntax due to missing semi-colon */
  border-color: red
  background-color: green;

  /* Valid syntax but likely a logic error */
  border-width: 100vh;
}
```

Lý do khai báo đầu tiên trong khối selector này không hợp lệ là vì dấu chấm phẩy bị thiếu và khai báo không phải là khai báo cuối cùng trong khối selector. Thuộc tính thiếu dấu chấm phẩy bị bỏ qua, cũng như cặp property-value tiếp theo vì trình duyệt chỉ tiếp tục phân tích sau khi gặp dấu chấm phẩy hoặc dấu ngoặc nhọn đóng. Cụ thể, giá trị `border-color` được phân tích là `red background-color: green;` đây không phải là giá trị {{cssxref("&lt;color&gt;")}} hợp lệ.

Giá trị {{cssxref("border-width")}} là `100vh` có thể là một lỗi, nhưng không phải là lỗi. Vì nó hợp lệ về mặt cú pháp, nó sẽ được phân tích và áp dụng cho các phần tử khớp với selector.

#### Tiền tố vendor

Các tên thuộc tính và giá trị thuộc tính có tiền tố vendor, khi không được trình duyệt hiểu, được coi là không hợp lệ và bị bỏ qua. Chỉ các quy tắc riêng lẻ chứa thuộc tính hoặc giá trị không hợp lệ bị bỏ qua. Parser tìm dấu chấm phẩy hoặc dấu ngoặc nhọn đóng tiếp theo và sau đó tiếp tục phân tích từ đó.

Bạn có thể gặp CSS kế thừa trông như sau:

```css example-bad
/* Prefixed values */
.wrapper {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  display: block flex;
}
/* Prefixed properties */
.rounded {
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  -ms-border-radius: 50%;
  -o-border-radius: 50%;
  border-radius: 50%;
}
```

Trong ví dụ này, khai báo cuối cùng trong mỗi khối hợp lệ trong tất cả trình duyệt — `display: flex;` và `border-radius: 50%;`. Nhờ quy tắc [cascade](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#source_order) [thứ tự xuất hiện](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers), trình duyệt sẽ áp dụng bất kỳ khai báo có tiền tố nào chúng hiểu, và sau đó ghi đè các giá trị đó bằng phiên bản chuẩn không có tiền tố.

> [!NOTE]
> Tránh bao gồm các thuộc tính hoặc giá trị thuộc tính có tiền tố khi có thể. Nếu bạn phải sử dụng chúng, hãy khai báo các phiên bản có tiền tố trước phiên bản không có tiền tố như được hiển thị ở trên.

### Lỗi với kết thúc tự đóng

Nếu một stylesheet kết thúc trong khi một quy tắc, khai báo, hàm, chuỗi, hoặc comment vẫn còn mở, parser sẽ tự động đóng tất cả mọi thứ chưa được đóng.

> [!NOTE]
> Điều này đúng với các external style sheet, các khối selector trong một HTML {{HTMLElement("style")}} element, và các quy tắc inline trong thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style).

Nếu nội dung giữa dấu chấm phẩy cuối cùng và cuối stylesheet hợp lệ, dù không đầy đủ, CSS sẽ được phân tích bình thường. Ví dụ, nếu bạn quên đóng một khai báo `@keyframes` trước khi đóng {{htmlelement("style")}}, animation vẫn hợp lệ.

```html-nolint example-bad
<style>
@keyframes move {
  100% {
    transform: translateX(100vw)
</style>
```

Ở đây animation `move` hợp lệ. Không đóng đúng các câu lệnh CSS không nhất thiết làm cho các câu lệnh trở nên không hợp lệ. Điều đó nói rằng, đừng lợi dụng tính tha thứ của CSS. Luôn luôn đóng tất cả các câu lệnh và khối style của bạn. Điều này làm cho CSS của bạn dễ đọc và bảo trì hơn, đồng thời đảm bảo rằng trình duyệt phân tích CSS như bạn dự định.

#### Comment chưa đóng

Các comment chưa đóng là lỗi logic, không phải lỗi cú pháp. Nếu một comment bắt đầu bằng `/*` nhưng không được đóng, tất cả mã CSS cho đến dấu phân cách đóng (`*/`) trong một comment tiếp theo hoặc cuối stylesheet, tùy cái nào đến trước, đều là một phần của comment. Mặc dù comment chưa đóng không làm CSS của bạn trở nên không hợp lệ, nó khiến CSS theo sau dấu phân cách mở (`/*`) bị bỏ qua.

```html example-bad
<style>
  /* this comment is not closed
  @keyframes move {
    0% {transform: translateX(0);}
    100% {transform: translateX(100vw);}
  }
</style>
<p style="/* another unclosed comment">Parsed as HTML.</p>
```

Trong ví dụ này, hai CSS comment không được đóng, nhưng thẻ đóng `</style>` đóng comment đầu tiên và dấu ngoặc kép đóng của thuộc tính `style` đóng comment thứ hai.

## Kiểm tra ngữ pháp

Sau khi phân tích từng khai báo, quy tắc style, at-rule, v.v., user agent kiểm tra xem ngữ pháp có tuân theo các quy tắc cho khai báo đó không. Ví dụ, nếu giá trị thuộc tính thuộc kiểu dữ liệu sai hoặc descriptor không hợp lệ cho at-rule đang được mô tả, nội dung không khớp với ngữ pháp dự kiến được coi là không hợp lệ và bị bỏ qua.

Mỗi thuộc tính CSS chấp nhận các kiểu dữ liệu cụ thể. Ví dụ, thuộc tính {{cssxref("background-color")}} chấp nhận hoặc là {{cssxref("&lt;color&gt;")}} hợp lệ hoặc một CSS global keyword. Khi giá trị được gán cho một thuộc tính thuộc kiểu sai, chẳng hạn như `background-color: 45deg`, khai báo đó không hợp lệ và do đó bị bỏ qua.

### Thuộc tính tùy chỉnh không hợp lệ

Các thuộc tính tùy chỉnh thường được coi là hợp lệ khi được khai báo, nhưng có thể tạo ra CSS không hợp lệ khi được truy cập, tức là chúng có thể được sử dụng như một giá trị (qua hàm {{cssxref("var")}}) cho một thuộc tính không chấp nhận kiểu giá trị đó. Trình duyệt phân tích từng thuộc tính tùy chỉnh khi gặp mà không quan tâm đến nơi thuộc tính đó được sử dụng.

Thông thường, khi giá trị thuộc tính không hợp lệ, khai báo bị bỏ qua và thuộc tính rơi về giá trị hợp lệ cuối cùng. Tuy nhiên, các giá trị thuộc tính tùy chỉnh được tính toán không hợp lệ hoạt động hơi khác một chút.

Khi thay thế `var()` không hợp lệ, khai báo không bị bỏ qua và giá trị [initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) hoặc [inherited](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance) của thuộc tính được sử dụng thay thế. Thuộc tính được đặt thành giá trị mới, nhưng có thể không phải là giá trị mong đợi.

Hãy xem một ví dụ để minh họa hành vi này:

```css example-bad
:root {
  --theme-color: 45deg;
}
body {
  background-color: var(--theme-color);
}
```

Trong đoạn code trên, khai báo thuộc tính tùy chỉnh hợp lệ. Khai báo `background-color` cũng hợp lệ tại thời điểm tính toán. Tuy nhiên, khi trình duyệt thay thế thuộc tính tùy chỉnh trong `var(--theme-color)` bằng `45deg` như một giá trị của thuộc tính `background-color`, ngữ pháp không hợp lệ. Một {{cssxref("angle")}} không phải là giá trị `background-color` hợp lệ. Trong trường hợp này, khai báo không bị bỏ qua là không hợp lệ. Thay vào đó, khi thuộc tính tùy chỉnh thuộc kiểu sai, nếu thuộc tính có thể được kế thừa, giá trị được kế thừa từ cha của nó. Nếu thuộc tính không thể kế thừa, giá trị initial mặc định được sử dụng. Trong trường hợp `background-color`, giá trị thuộc tính không phải là giá trị kế thừa, vì vậy giá trị initial là `transparent` được sử dụng.

Để kiểm soát tốt hơn cách thuộc tính tùy chỉnh rơi về, hãy sử dụng at-rule {{cssxref("@property")}} để định nghĩa giá trị initial của thuộc tính:

```css example-good
@property --theme-color {
  syntax: "<color>";
  inherits: false;
  initial-value: rebeccapurple;
}
```

## Xem thêm

- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
- Hướng dẫn [Syntax](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
