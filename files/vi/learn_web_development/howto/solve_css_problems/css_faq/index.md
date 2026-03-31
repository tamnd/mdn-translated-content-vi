---
title: CSS FAQ
short-title: FAQ
slug: Learn_web_development/Howto/Solve_CSS_problems/CSS_FAQ
page-type: learn-faq
sidebar: learn-how-to
---

Trong bài viết này, bạn sẽ tìm thấy một số câu hỏi thường gặp (FAQ) về CSS, cùng với câu trả lời có thể giúp bạn trên con đường trở thành nhà phát triển web.

## Tại sao CSS hợp lệ của tôi lại không hiển thị đúng?

Các trình duyệt sử dụng khai báo `doctype` để chọn xem có hiển thị tài liệu bằng chế độ tương thích hơn với các tiêu chuẩn Web hay với các lỗi trình duyệt cũ. Sử dụng khai báo `doctype` chính xác và hiện đại ở đầu HTML của bạn sẽ cải thiện sự tuân thủ tiêu chuẩn trình duyệt.

Các trình duyệt hiện đại có hai chế độ hiển thị chính:

- _Quirks Mode_: còn được gọi là chế độ tương thích ngược, cho phép các trang web cũ được hiển thị như ý định của tác giả, tuân theo các quy tắc hiển thị không chuẩn được sử dụng bởi các trình duyệt cũ hơn. Các tài liệu có khai báo `doctype` không đầy đủ, không chính xác hoặc bị thiếu, hoặc khai báo `doctype` đã biết được sử dụng phổ biến trước năm 2001 sẽ được hiển thị ở chế độ Quirks Mode.
- _Standards Mode_: trình duyệt cố gắng tuân theo các tiêu chuẩn W3C một cách nghiêm ngặt. Các trang HTML mới được kỳ vọng được thiết kế cho các trình duyệt tuân thủ tiêu chuẩn, và kết quả là các trang có khai báo `doctype` hiện đại sẽ được hiển thị với Standards Mode.

Các trình duyệt dựa trên Gecko có chế độ [limited quirks mode](https://en.wikipedia.org/wiki/Quirks_mode#Limited_quirks_mode) thứ ba chỉ có một vài quirks nhỏ.

Khai báo `doctype` chuẩn sẽ kích hoạt standards mode là:

```html
<!doctype html>
```

Khi có thể, bạn chỉ nên sử dụng doctype trên. Có các doctype cũ hợp lệ khác sẽ kích hoạt chế độ Standards hoặc Almost Standards:

```html
<!doctype html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
```

```html
<!doctype html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
```

```html
<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```

```html
<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
```

## Tại sao CSS hợp lệ của tôi lại không hiển thị gì cả?

Đây là một số nguyên nhân có thể:

- Bạn đã nhập sai đường dẫn đến file CSS.
- Để được áp dụng, một stylesheet CSS phải được phục vụ với kiểu MIME `text/css`. Nếu máy chủ web không phục vụ nó với kiểu này, nó sẽ không được áp dụng.

## Sự khác biệt giữa `id` và `class` là gì?

Các phần tử HTML có thể có thuộc tính `id` và/hoặc `class`. Thuộc tính `id` gán một tên cho phần tử mà nó được áp dụng, và đối với markup hợp lệ, chỉ có thể có một phần tử với tên đó. Thuộc tính `class` gán một tên class cho phần tử, và tên đó có thể được sử dụng trên nhiều phần tử trong trang. CSS cho phép bạn áp dụng kiểu dáng cho các tên `id` và/hoặc `class` cụ thể.

- Sử dụng kiểu dáng theo class khi bạn muốn áp dụng các quy tắc kiểu dáng cho nhiều block và phần tử trong trang, hoặc khi hiện tại bạn chỉ có một phần tử cần định kiểu với kiểu dáng đó, nhưng bạn có thể muốn thêm nhiều hơn sau này.
- Sử dụng kiểu dáng theo id khi bạn cần giới hạn các quy tắc kiểu dáng được áp dụng cho một block hoặc phần tử cụ thể. Kiểu dáng này sẽ chỉ được sử dụng bởi phần tử có id cụ thể đó.

Nói chung, khuyến nghị sử dụng class càng nhiều càng tốt, và chỉ sử dụng id khi thực sự cần thiết cho các mục đích cụ thể (như kết nối label và form element hoặc định kiểu các phần tử phải là duy nhất về mặt ngữ nghĩa):

- Sử dụng class làm cho kiểu dáng của bạn có thể mở rộng — ngay cả khi bạn chỉ có một phần tử cần định kiểu với một ruleset cụ thể bây giờ, bạn có thể muốn thêm nhiều hơn sau này.
- Class cho phép bạn định kiểu nhiều phần tử, do đó chúng có thể dẫn đến stylesheet ngắn hơn, thay vì phải viết cùng thông tin kiểu dáng trong nhiều quy tắc sử dụng id selector. Stylesheet ngắn hơn có hiệu suất cao hơn.
- Class selector có [specificity](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#specificity) thấp hơn id selector, vì vậy dễ ghi đè hơn khi cần.

> [!NOTE]
> Xem [Selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) để biết thêm thông tin.

## Làm thế nào để khôi phục giá trị mặc định của một thuộc tính?

Ban đầu CSS không cung cấp từ khóa "default" và cách duy nhất để khôi phục giá trị mặc định của một thuộc tính là khai báo lại thuộc tính đó một cách rõ ràng. Ví dụ:

```css
/* Heading default color is black */
h1 {
  color: red;
}
h1 {
  color: black;
}
```

Điều này đã thay đổi với CSS 2; từ khóa {{cssxref("initial")}} hiện là một giá trị hợp lệ cho thuộc tính CSS. Nó đặt lại thuộc tính về giá trị mặc định của nó, được định nghĩa trong đặc tả CSS của thuộc tính đã cho.

```css
/* Heading default color is black */
h1 {
  color: red;
}
h1 {
  color: initial;
}
```

## Làm thế nào để kế thừa một kiểu dáng từ kiểu dáng khác?

CSS không cho phép một kiểu dáng được định nghĩa theo kiểu dáng khác. Tuy nhiên, việc gán nhiều class cho một phần tử duy nhất có thể cung cấp hiệu ứng tương tự, và [CSS Variables](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) hiện cung cấp một cách để định nghĩa thông tin kiểu dáng ở một nơi có thể được tái sử dụng ở nhiều nơi.

## Làm thế nào để gán nhiều class cho một phần tử?

Các phần tử HTML có thể được gán nhiều class bằng cách liệt kê các class trong thuộc tính `class`, với khoảng trắng để phân tách chúng.

```html
<style>
  .news {
    background: black;
    color: white;
  }
  .today {
    font-weight: bold;
  }
</style>

<div class="news today">Content of today's news goes here.</div>
```

Nếu cùng một thuộc tính được khai báo trong cả hai quy tắc, xung đột được giải quyết đầu tiên thông qua specificity, sau đó theo thứ tự của các khai báo CSS. Thứ tự của các class trong thuộc tính `class` không liên quan.

## Tại sao các quy tắc kiểu dáng của tôi không hoạt động đúng?

Các quy tắc kiểu dáng đúng về mặt cú pháp có thể không áp dụng trong một số tình huống nhất định. Bạn có thể sử dụng [Rules view](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_and_edit_css/index.html) của _CSS Pane_ trong Inspector để gỡ lỗi các vấn đề loại này, nhưng các trường hợp phổ biến nhất của các quy tắc kiểu dáng bị bỏ qua được liệt kê bên dưới.

### Cấu trúc phân cấp của các phần tử HTML

Cách các kiểu dáng CSS được áp dụng cho các phần tử HTML cũng phụ thuộc vào cấu trúc phân cấp của các phần tử. Điều quan trọng cần nhớ là một quy tắc áp dụng cho phần tử con sẽ ghi đè kiểu dáng của phần tử cha, bất kể specificity hay ưu tiên của các quy tắc CSS.

```css
.news {
  color: black;
}
.corpName {
  font-weight: bold;
  color: red;
}
```

```html
<!-- news item text is black, but corporate name is red and in bold -->
<div class="news">
  (Reuters) <span class="corpName">General Electric</span> (GE.NYS) announced on
  Thursday…
</div>
```

Trong trường hợp các cấu trúc phân cấp HTML phức tạp, nếu một quy tắc có vẻ bị bỏ qua, hãy kiểm tra xem phần tử có nằm bên trong một phần tử khác có kiểu dáng khác không.

### Quy tắc kiểu dáng được định nghĩa lại rõ ràng

Trong các stylesheet CSS, thứ tự **là** quan trọng. Nếu bạn định nghĩa một quy tắc và sau đó định nghĩa lại cùng quy tắc đó, định nghĩa cuối cùng sẽ được sử dụng.

```css
#stockTicker {
  font-weight: bold;
}
.stockSymbol {
  color: red;
}
/*  other rules             */
/*  other rules             */
/*  other rules             */
.stockSymbol {
  font-weight: normal;
}
```

```html
<!-- most text is in bold, except "GE", which is red and not bold -->
<div id="stockTicker">NYS: <span class="stockSymbol">GE</span> +1.0…</div>
```

Để tránh loại lỗi này, hãy cố gắng chỉ định nghĩa các quy tắc một lần cho một selector nhất định, và nhóm tất cả các quy tắc thuộc về selector đó lại.

### Sử dụng thuộc tính viết tắt (shorthand)

Sử dụng các thuộc tính viết tắt để định nghĩa các quy tắc kiểu dáng là tốt vì nó sử dụng cú pháp rất gọn. Sử dụng shorthand chỉ với một số thuộc tính là có thể và đúng, nhưng phải nhớ rằng các thuộc tính không được khai báo sẽ tự động được đặt lại về giá trị mặc định của chúng. Điều này có nghĩa là một quy tắc trước đó cho một thuộc tính duy nhất có thể bị ghi đè ngầm.

```css
#stockTicker {
  font-size: 12px;
  font-family: "Verdana";
  font-weight: bold;
}
.stockSymbol {
  font: 14px "Arial";
  color: red;
}
```

```html
<div id="stockTicker">NYS: <span class="stockSymbol">GE</span> +1.0…</div>
```

Trong ví dụ trước, vấn đề xảy ra trên các quy tắc thuộc về các phần tử khác nhau, nhưng nó cũng có thể xảy ra cho cùng một phần tử, vì thứ tự quy tắc **là** quan trọng.

```css
#stockTicker {
  font-weight: bold;
  font: 12px "Verdana"; /* font-weight is now set to normal */
}
```

### Sử dụng selector `*`

Wildcard selector `*` đề cập đến bất kỳ phần tử nào, và nó phải được sử dụng cẩn thận đặc biệt.

```css
body * {
  font-weight: normal;
}
#stockTicker {
  font: 12px "Verdana";
}
.corpName {
  font-weight: bold;
}
.stockUp {
  color: red;
}
```

```html
<div id="section">
  NYS: <span class="corpName"><span class="stockUp">GE</span></span> +1.0…
</div>
```

Trong ví dụ này, selector `body *` áp dụng quy tắc cho tất cả các phần tử bên trong body, ở bất kỳ cấp độ phân cấp nào, bao gồm cả class `.stockUp`. Vì vậy `font-weight: bold;` được áp dụng cho class `.corpName` bị ghi đè bởi `font-weight: normal;` được áp dụng cho tất cả các phần tử trong body.

Việc sử dụng selector \* nên được giảm thiểu vì nó là một selector chậm, đặc biệt khi không được sử dụng như phần tử đầu tiên của một selector. Việc sử dụng nó nên được tránh càng nhiều càng tốt.

### Specificity trong CSS

Khi nhiều quy tắc áp dụng cho một phần tử nhất định, quy tắc được chọn phụ thuộc vào [specificity](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#specificity) của kiểu dáng của nó. Kiểu dáng inline (trong thuộc tính `style` HTML) có specificity cao nhất và sẽ ghi đè bất kỳ selector nào, tiếp theo là ID selector, sau đó là class selector, và cuối cùng là element selector. Màu văn bản của {{htmlelement("div")}} bên dưới sẽ là màu đỏ.

```css
div {
  color: black;
}
#orange {
  color: orange;
}
.green {
  color: green;
}
```

```html
<div id="orange" class="green" style="color: red;">This is red</div>
```

Các quy tắc phức tạp hơn khi selector có nhiều phần. Giải thích chi tiết hơn về cách tính specificity của selector có thể được tìm thấy trong [CSS specificity documentation](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).

## Các thuộc tính -moz-\*, -ms-\*, -webkit-\*, -o-\* và -khtml-\* làm gì?

Các thuộc tính này, được gọi là _prefixed properties_, là các phần mở rộng của tiêu chuẩn CSS. Chúng từng được sử dụng để cho phép sử dụng các tính năng thử nghiệm và không chuẩn trong các trình duyệt mà không làm ô nhiễm namespace thông thường, ngăn chặn sự không tương thích trong tương lai khi tiêu chuẩn được mở rộng.

Việc sử dụng các thuộc tính như vậy trên các trang web sản xuất không được khuyến nghị — chúng đã tạo ra một mớ hỗn độn tương thích web rất lớn. Ví dụ, nhiều nhà phát triển chỉ sử dụng phiên bản có tiền tố `-webkit-` của một thuộc tính khi phiên bản không có tiền tố được hỗ trợ đầy đủ trên tất cả các trình duyệt. Điều này có nghĩa là một thiết kế dựa vào thuộc tính đó sẽ không hoạt động trong các trình duyệt không dựa trên webkit, khi nó có thể hoạt động được. Điều này trở thành vấn đề đủ lớn khiến các trình duyệt khác bị thúc đẩy để triển khai các alias có tiền tố `-webkit-` để cải thiện tương thích web, như được quy định trong [Compatibility Living Standard](https://compat.spec.whatwg.org/).

Các trình duyệt không còn sử dụng tiền tố CSS khi triển khai các tính năng thử nghiệm mới. Thay vào đó, họ kiểm tra các tính năng mới đằng sau các cờ thử nghiệm có thể cấu hình hoặc chỉ trên các phiên bản trình duyệt Nightly hoặc tương tự.

Nếu bạn cần sử dụng tiền tố trong công việc của mình, hãy viết các phiên bản có tiền tố trước, tiếp theo là phiên bản tiêu chuẩn không có tiền tố. Bằng cách này, phiên bản tiêu chuẩn sẽ tự động ghi đè các phiên bản có tiền tố khi được hỗ trợ. Ví dụ:

```css
-webkit-border-after-color: navy;
border-block-end-color: navy;
```

> [!NOTE]
> Xem [Mozilla CSS Extensions](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) và [WebKit CSS Extensions](/en-US/docs/Web/CSS/Reference/Webkit_extensions) để biết danh sách các thuộc tính CSS có tiền tố trình duyệt.

## z-index liên quan đến positioning như thế nào?

Thuộc tính `z-index` chỉ định thứ tự xếp chồng của các phần tử.

Một phần tử có z-index/stack order cao hơn luôn được hiển thị trước một phần tử có z-index/stack order thấp hơn trên màn hình. Z-index chỉ hoạt động trên các phần tử có position được chỉ định (`position:absolute`, `position:relative`, hoặc `position:fixed`).

> [!NOTE]
> Để biết thêm thông tin, xem bài học [Positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning) của chúng ta, và đặc biệt là phần [Introducing z-index](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning#introducing_z-index).
