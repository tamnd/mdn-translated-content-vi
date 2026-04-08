---
title: "@import"
slug: Web/CSS/Reference/At-rules/@import
page-type: css-at-rule
browser-compat: css.at-rules.import
sidebar: cssref
---

Quy tắc **`@import`** [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) được dùng để nhập các quy tắc kiểu dáng từ các stylesheet hợp lệ khác.
Quy tắc `@import` _bắt buộc_ phải được khai báo ở đầu stylesheet, trước mọi at-rule khác (ngoại trừ [@charset](/en-US/docs/Web/CSS/Reference/At-rules/@charset) và [@layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer)) và các khai báo kiểu dáng, nếu không nó sẽ bị bỏ qua.

## Cú pháp

```css
@import url;
@import url layer;
@import url layer(layer-name);
@import url layer(layer-name) supports(supports-condition);
@import url layer(layer-name) supports(supports-condition) list-of-media-queries;
@import url layer(layer-name) list-of-media-queries;
@import url supports(supports-condition);
@import url supports(supports-condition) list-of-media-queries;
@import url list-of-media-queries;
```

trong đó:

- _url_
  - : Là một {{CSSxRef("string")}} hoặc kiểu {{cssxref("url_value", "&lt;url&gt;")}} đại diện cho vị trí của tài nguyên cần nhập. URL có thể là tuyệt đối hoặc tương đối.
- _list-of-media-queries_
  - : Là danh sách các [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) phân cách bằng dấu phẩy, chỉ định các điều kiện phụ thuộc vào phương tiện để áp dụng các quy tắc CSS được định nghĩa trong URL được liên kết. Nếu trình duyệt không hỗ trợ bất kỳ query nào trong số này, nó sẽ không tải tài nguyên được liên kết.
- _layer-name_
  - : Là tên của một [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) mà nội dung của tài nguyên được liên kết sẽ được nhập vào. Xem [`layer()`](/en-US/docs/Web/CSS/Reference/At-rules/@import/layer_function) để biết thêm thông tin.
- _supports-condition_
  - : Chỉ định (các) tính năng mà trình duyệt phải hỗ trợ để stylesheet được nhập.
    Nếu trình duyệt không đáp ứng các điều kiện được chỉ định trong _supports-condition_, nó có thể không tải stylesheet được liên kết, và ngay cả khi được tải xuống theo một đường dẫn khác, cũng sẽ không tải nó.
    Cú pháp của `supports()` gần giống với cú pháp được mô tả trong {{CSSxRef("@supports")}}, và chủ đề đó có thể được dùng làm tài liệu tham khảo đầy đủ hơn.

Sử dụng `@import` cùng với từ khóa `layer` hoặc hàm `layer()` để nhập các stylesheet bên ngoài (từ framework, stylesheet widget, thư viện, v.v.) vào các layer.

## Mô tả

Các quy tắc được nhập phải xuất hiện trước tất cả các loại quy tắc khác, ngoại trừ các quy tắc {{CSSxRef("@charset")}} và câu lệnh tạo layer {{cssxref("@layer")}}.

```css example-bad
* {
  margin: 0;
  padding: 0;
}
/* more styles */
@import "my-imported-styles.css";
```

Vì at-rule `@import` được khai báo sau các kiểu dáng nên nó không hợp lệ và do đó bị bỏ qua.

```css example-good
@import "my-imported-styles.css";
* {
  margin: 0;
  padding: 0;
}
/* more styles */
```

Quy tắc `@import` không phải là một [câu lệnh lồng nhau](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#nested_statements). Do đó, nó không thể được dùng bên trong [conditional group at-rules](/en-US/docs/Web/CSS/Guides/Conditional_rules#at-rules_and_descriptors).

Để {{glossary("user agent", "các tác nhân người dùng")}} có thể tránh lấy tài nguyên cho các loại phương tiện không được hỗ trợ, tác giả có thể chỉ định các điều kiện nhập phụ thuộc vào phương tiện. Các lần nhập có điều kiện này chỉ định các [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) phân cách bằng dấu phẩy sau URL. Trong trường hợp không có media query nào, lần nhập không có điều kiện về phương tiện được sử dụng. Chỉ định `all` cho `list-of-media-queries` có cùng hiệu quả.

Tương tự, tác nhân người dùng có thể sử dụng hàm `supports()` trong một at-rule `@import` để chỉ tải tài nguyên nếu một bộ tính năng cụ thể được (hoặc không được) hỗ trợ.
Điều này cho phép tác giả tận dụng các tính năng CSS mới được giới thiệu, trong khi cung cấp các phương án dự phòng duyên dáng cho các phiên bản trình duyệt cũ hơn.
Lưu ý rằng các điều kiện trong hàm `supports()` của at-rule `@import` có thể được lấy trong JavaScript bằng cách sử dụng {{domxref("CSSImportRule.supportsText")}}.

Quy tắc `@import` cũng có thể được dùng để tạo một [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) bằng cách nhập các quy tắc từ tài nguyên được liên kết. Các quy tắc cũng có thể được nhập vào một cascade layer hiện có. Từ khóa `layer` hoặc hàm `layer()` được dùng với `@import` cho mục đích này. Các khai báo trong quy tắc kiểu từ các stylesheet được nhập tương tác với cascade như thể chúng được viết trực tiếp vào stylesheet tại điểm nhập.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Nhập quy tắc CSS

```css
@import "custom.css";
@import url("chrome://communicator/skin/communicator.css");
```

Hai ví dụ trên cho thấy cách chỉ định _url_ dưới dạng `<string>` và dưới dạng hàm `url()`.

### Nhập quy tắc CSS có điều kiện theo media query

```css
@import "fine-print.css" print;
@import "bluish.css" print, screen;
@import "common.css" screen;
@import "landscape.css" screen and (orientation: landscape);
```

Các quy tắc `@import` trong các ví dụ trên hiển thị các điều kiện phụ thuộc vào phương tiện cần phải đúng trước khi các quy tắc CSS được liên kết được áp dụng. Vì vậy, chẳng hạn, quy tắc `@import` cuối cùng sẽ chỉ tải stylesheet `landscape.css` trên thiết bị màn hình ở chế độ ngang.

### Nhập quy tắc CSS có điều kiện theo hỗ trợ tính năng

```css
@import "grid.css" supports(display: grid) screen and (width <= 400px);
@import "flex.css" supports((not (display: grid)) and (display: flex)) screen
  and (width <= 400px);
```

Các quy tắc `@import` trên minh họa cách bạn có thể nhập bố cục sử dụng grid nếu `display: grid` được hỗ trợ, và nếu không thì nhập CSS sử dụng `display: flex`.
Mặc dù bạn chỉ có thể có một câu lệnh `supports()`, bạn có thể kết hợp bất kỳ số lượng kiểm tra tính năng nào với `not`, `and`, và `or`. Tuy nhiên, bạn phải sử dụng dấu ngoặc đơn để xác định mức độ ưu tiên khi kết hợp chúng, ví dụ `supports((..) or (..) and not (..))` không hợp lệ, nhưng `supports((..) or ((..) and (not (..))))` là hợp lệ.
Lưu ý rằng nếu bạn chỉ có một khai báo thì bạn không cần bọc nó trong dấu ngoặc đơn bổ sung: điều này được thể hiện trong ví dụ đầu tiên ở trên.

Các ví dụ trên cho thấy các điều kiện hỗ trợ sử dụng cú pháp khai báo cơ bản.
Bạn cũng có thể chỉ định các hàm CSS trong `supports()`, và nó sẽ được đánh giá là `true` nếu chúng được hỗ trợ và có thể được đánh giá trên tác nhân người dùng.
Ví dụ, đoạn code dưới đây hiển thị một `@import` có điều kiện trên cả [bộ chọn con](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator) (`selector()`) và hàm `font-tech()`:

```css
@import "whatever.css"
  supports((selector(h2 > p)) and (font-tech(color-COLRv1)));
```

### Nhập quy tắc CSS vào cascade layer

```css
@import "theme.css" layer(utilities);
```

Trong ví dụ trên, một cascade layer có tên `utilities` được tạo ra và nó sẽ bao gồm các quy tắc từ stylesheet được nhập `theme`.

```css
@import "headings.css" layer(default);
@import "links.css" layer(default);

@layer default {
  audio[controls] {
    display: block;
  }
}
```

Trong ví dụ trên, các quy tắc trong stylesheet `headings.css` và `links.css` cascade trong cùng một layer với quy tắc `audio[controls]`.

```css
@import "theme.css" layer();
@import "style.css" layer;
```

Đây là ví dụ tạo hai cascade layer vô danh riêng biệt và nhập các quy tắc được liên kết vào từng layer riêng biệt. Một cascade layer được khai báo mà không có tên là cascade layer vô danh. Các cascade layer vô danh được hoàn thiện khi được tạo: chúng không cung cấp bất kỳ phương tiện nào để sắp xếp lại hoặc thêm kiểu dáng và chúng không thể được tham chiếu từ bên ngoài.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("@media")}}
- {{CSSxRef("@supports")}}
- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- [CSS at-rule functions](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
