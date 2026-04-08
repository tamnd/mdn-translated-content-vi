---
title: Textual data types
slug: Web/CSS/Guides/Values_and_units/Textual_data_types
page-type: guide
sidebar: cssref
---

Mỗi khai báo CSS bao gồm một cặp thuộc tính/giá trị. Giá trị có thể bao gồm các kiểu dữ liệu khác nhau tùy thuộc vào thuộc tính, chẳng hạn như một từ khóa đơn, số nguyên, hàm hoặc kết hợp của nhiều kiểu khác nhau; một số giá trị có đơn vị, trong khi các giá trị khác thì không. Hướng dẫn này cung cấp tổng quan về các kiểu dữ liệu văn bản. Tham khảo trang cho từng kiểu giá trị để biết thêm thông tin chi tiết.

Các kiểu dữ liệu văn bản có thể là {{cssxref("&lt;string&gt;")}}, một chuỗi ký tự được trích dẫn, một {{cssxref("&lt;ident&gt;")}}, là "CSS Identifier" — chuỗi không được trích dẫn, hoặc một {{cssxref("url_value", "&lt;url&gt;")}} có hoặc không có dấu ngoặc. Một `<string>` được trích dẫn bằng dấu ngoặc đơn hoặc dấu ngoặc kép. Các CSS identifiers, được liệt kê trong đặc tả là `<ident>` hoặc {{cssxref("&lt;custom-ident&gt;")}}, phải không được trích dẫn.

Trong các đặc tả CSS, các giá trị có thể được định nghĩa bởi nhà phát triển web — chẳng hạn như tên keyframe animation, tên font-family hoặc các vùng grid — được liệt kê là {{cssxref("&lt;custom-ident&gt;")}}, {{cssxref("&lt;string&gt;")}} hoặc cả hai.

Khi cả giá trị văn bản do người dùng định nghĩa có trích dẫn và không có trích dẫn đều được phép, đặc tả sẽ liệt kê `<custom-ident> | <string>`, có nghĩa là dấu ngoặc là tùy chọn, chẳng hạn như trường hợp [tên keyframe animation]:

```css
@keyframes validIdent {
  /* keyframes go here */
}
@keyframes 'validString' {
  /* keyframes go here */
}
```

Một số giá trị văn bản không hợp lệ khi được đặt trong dấu ngoặc. Ví dụ, giá trị của {{cssxref("grid-area")}} có thể là một `<custom-ident>`, vì vậy nếu chúng ta có một vùng grid có tên `content` chúng ta sẽ sử dụng nó mà không có dấu ngoặc:

```css
.item {
  grid-area: content;
}
```

Ngược lại, một kiểu dữ liệu là {{cssxref("&lt;string&gt;")}}, chẳng hạn như giá trị chuỗi của thuộc tính {{cssxref("content")}}, phải được trích dẫn:

```css
.item::after {
  content: "This is my content.";
}
```

Mặc dù bạn thường có thể tạo bất kỳ tên nào bạn muốn, bao gồm cả emoji, identifier không thể là `none`, `unset`, `initial` hoặc `inherit`, không được bắt đầu bằng chữ số hoặc hai dấu gạch ngang, và thông thường bạn không muốn nó là bất kỳ từ khóa CSS đã được định nghĩa sẵn nào khác. Xem trang tham khảo {{cssxref("&lt;custom-ident&gt;")}} và {{cssxref("&lt;string&gt;")}} để biết thêm chi tiết.

## Giá trị từ khóa được định nghĩa sẵn

Các từ khóa được định nghĩa sẵn là các giá trị văn bản được xác định bởi đặc tả cho thuộc tính đó. Các từ khóa này cũng là CSS identifiers và do đó được sử dụng không có dấu ngoặc.

Khi xem cú pháp giá trị thuộc tính CSS trong một đặc tả CSS hoặc trang thuộc tính MDN, các từ khóa được phép sẽ được liệt kê theo dạng sau. Các giá trị {{glossary("enumerated")}} sau đây là các giá trị từ khóa được định nghĩa sẵn được phép cho {{cssxref("float")}}.

```plain
left | right | none | inline-start | inline-end
```

Những giá trị như vậy được sử dụng không có dấu ngoặc:

```css
.box {
  float: left;
}
```

## Từ khóa toàn CSS

Ngoài các từ khóa được định nghĩa sẵn là một phần của đặc tả cho một thuộc tính, tất cả các thuộc tính CSS đều chấp nhận các giá trị thuộc tính toàn CSS hay "global" gồm {{cssxref("initial")}}, {{cssxref("inherit")}}, {{cssxref("unset")}}, {{cssxref("revert")}} và {{cssxref("revert-layer")}}, vốn chỉ định rõ ràng các hành vi mặc định.

- {{cssxref("initial")}}
  - : Đại diện cho giá trị được chỉ định là giá trị ban đầu của thuộc tính.
- {{cssxref("inherit")}}
  - : Đại diện cho giá trị được tính toán của thuộc tính trên phần tử cha, miễn là nó được kế thừa.
- {{cssxref("unset")}}
  - : Hoạt động như `inherit` hoặc `initial`, tùy thuộc vào thuộc tính đó có được kế thừa hay không.
- {{cssxref("revert")}}
  - : Đặt lại thuộc tính về giá trị kế thừa nếu nó kế thừa từ cha của nó hoặc về giá trị mặc định được thiết lập bởi stylesheet của user agent (hoặc theo kiểu người dùng nếu có tồn tại).
- {{cssxref("revert-layer")}}
  - : Quay lại giá trị của một thuộc tính trong một [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) về giá trị của thuộc tính trong một quy tắc CSS khớp với phần tử trong một cascade layer trước đó. Giá trị của thuộc tính với từ khóa này được tính lại như thể không có quy tắc nào được chỉ định trên phần tử mục tiêu trong cascade layer hiện tại.

## URLs

Một kiểu {{cssxref("url_value", "&lt;url&gt;")}} sử dụng ký hiệu hàm, chấp nhận một `<string>` là URL. Đây có thể là URL tuyệt đối hoặc tương đối. Ví dụ, nếu bạn muốn bao gồm một hình ảnh nền, bạn có thể sử dụng một trong hai cách sau:

```css
.box {
  background-image: url("images/my-background.png");
}

.box {
  background-image: url("https://www.exammple.com/images/my-background.png");
}
```

Tham số cho `url()` có thể có hoặc không có trích dẫn. Nếu không có trích dẫn, nó được phân tích như một `<url-token>`, có thêm các yêu cầu bao gồm thoát một số ký tự nhất định. Xem {{cssxref("url_value", "&lt;url&gt;")}} để biết thêm thông tin.

## Xem thêm

- [Kiểu dữ liệu số](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types)
- [Kiểu dữ liệu CSS](/en-US/docs/Web/CSS/Reference/Values/Data_types)
- Module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)
- [Học: Values and units](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
- Module [CSS cascade and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
