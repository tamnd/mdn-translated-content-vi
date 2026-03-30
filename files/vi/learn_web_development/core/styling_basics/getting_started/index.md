---
title: Bắt đầu với CSS
short-title: CSS bắt đầu
slug: Learn_web_development/Core/Styling_basics/Getting_started
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/What_is_CSS", "Learn_web_development/Core/Styling_basics/Styling_a_bio_page", "Learn_web_development/Core/Styling_basics")}}

Trong bài viết này, chúng ta sẽ lấy một tài liệu HTML đơn giản và áp dụng CSS vào đó, học một số chi tiết thực tế của ngôn ngữ trong quá trình thực hành. Chúng ta cũng sẽ xem lại một số tính năng cú pháp CSS bổ sung mà bạn chưa từng xem qua.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software">Phần mềm cơ bản đã được cài đặt</a>, kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files">làm việc với tệp</a>, và kiến thức cơ bản về HTML (hãy học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">Giới thiệu về HTML</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Áp dụng CSS vào tài liệu HTML.</li>
          <li>Kinh nghiệm thực tế khi viết CSS cơ bản.</li>
          <li>Kiến thức làm việc về các loại bộ chọn cơ bản và bộ kết hợp.</li>
          <li>Khái niệm trạng thái khi áp dụng cho CSS.</li>
          <li>Quen thuộc với các tính năng cú pháp CSS khác như at-rule, hàm, thuộc tính viết tắt và khoảng trắng.</li>
        <ul>
      </td>
    </tr>
  </tbody>
</table>

## Bắt đầu với một số HTML

Điểm xuất phát của chúng ta là một tài liệu HTML. Bạn có thể sao chép mã từ bên dưới nếu muốn làm việc trên máy tính của mình. Lưu mã bên dưới thành `index.html` trong một thư mục trên máy của bạn.

```html live-sample___unstyled
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Getting started with CSS</title>
  </head>

  <body>
    <h1>I am a level one heading</h1>

    <p>
      This is a paragraph of text. In the text is a
      <span>span element</span> and also a
      <a href="https://example.com">link</a>.
    </p>

    <p>
      This is the second paragraph. It contains an <em>emphasized</em> element.
    </p>

    <ul>
      <li>Item <span>one</span></li>
      <li>Item two</li>
      <li>Item <em>three</em></li>
    </ul>
  </body>
</html>
```

Kết quả hiển thị như sau:

{{EmbedLiveSample("unstyled", "", "240px")}}

> [!NOTE]
> Nếu bạn đang đọc bài này trên thiết bị hoặc môi trường mà bạn không thể dễ dàng tạo tệp, đừng lo lắng — nhấp vào nút "Play" trong ví dụ trực tiếp ở trên để mở nó trong MDN Playground. Ở đó, bạn có thể chỉnh sửa mã CSS & HTML theo hướng dẫn bên dưới và xem kết quả kết hợp trực tiếp.

## Thêm CSS vào tài liệu của chúng ta

Điều đầu tiên chúng ta cần làm là nói với tài liệu HTML rằng chúng ta có một số quy tắc CSS mà chúng ta muốn nó sử dụng. Có ba cách khác nhau để áp dụng CSS vào tài liệu HTML mà bạn thường gặp — bảng kiểu bên ngoài, bảng kiểu nội bộ và kiểu nội tuyến. Hãy xem xét các cách này bây giờ.

Nếu bạn đang thực hiện bài viết này bằng MDN Playground, bạn sẽ không thể thực hiện các bước được trình bày trong phần này theo cùng cách như những người viết mã trên máy tính cục bộ. Điều này vì MDN Playground xử lý việc thêm CSS vào HTML ngầm ẩn trong nền. Tuy nhiên, bạn vẫn nên đọc qua phần này để biết về nội dung.

### Bảng kiểu bên ngoài

Một bảng kiểu bên ngoài chứa CSS trong một tệp riêng biệt với phần mở rộng `.css`. Đây là phương pháp phổ biến và hữu ích nhất để đưa CSS vào tài liệu. Bạn có thể liên kết một tệp CSS với nhiều trang web, tạo kiểu tất cả chúng với cùng một bảng kiểu CSS.

Tạo một tệp trong cùng thư mục với tài liệu HTML của bạn và lưu nó thành `styles.css`.

Để liên kết `styles.css` với `index.html`, hãy thêm dòng sau ở đâu đó trong {{htmlelement("head")}} của tài liệu HTML:

```html
<link rel="stylesheet" href="styles.css" />
```

Phần tử {{htmlelement("link")}} này nói với trình duyệt rằng chúng ta có một bảng kiểu, sử dụng thuộc tính `rel`, và vị trí của bảng kiểu đó là giá trị của thuộc tính `href`. Bạn có thể kiểm tra rằng CSS hoạt động bằng cách thêm một quy tắc vào `styles.css`. Sử dụng trình chỉnh sửa mã của bạn, thêm nội dung sau vào tệp CSS của bạn:

```css
h1 {
  color: red;
}
```

Lưu các tệp HTML và CSS của bạn và tải lại trang trong trình duyệt web. Tiêu đề cấp một ở đầu tài liệu bây giờ phải có màu đỏ. Nếu điều đó xảy ra, xin chúc mừng — bạn đã áp dụng thành công CSS vào tài liệu HTML. Nếu điều đó không xảy ra, hãy kiểm tra cẩn thận rằng bạn đã gõ mọi thứ chính xác.

#### Xác định vị trí bảng kiểu ở các nơi khác nhau

Trong ví dụ trên, tệp CSS nằm trong cùng thư mục với tài liệu HTML, nhưng bạn có thể đặt nó ở nơi khác và điều chỉnh đường dẫn (theo cách tương tự như [hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images)). Đây là ba ví dụ:

```html
<!-- Trong một thư mục con có tên styles trong thư mục hiện tại -->
<link rel="stylesheet" href="styles/style.css" />

<!-- Trong một thư mục con có tên general, nằm trong một thư mục con có tên styles, trong thư mục hiện tại -->
<link rel="stylesheet" href="styles/general/style.css" />

<!-- Quay lại một cấp thư mục, sau đó vào một thư mục con có tên styles -->
<link rel="stylesheet" href="../styles/style.css" />
```

### Bảng kiểu nội bộ

Bảng kiểu nội bộ được chứa trong các phần tử {{htmlelement("style")}}, nằm trong phần tử {{htmlelement("head")}} HTML. Hãy tạo một cái bây giờ.

Trong tài liệu HTML của bạn, hãy thêm đoạn sau ở đâu đó giữa các thẻ `<head>` và `</head>`:

```html
<style>
  p {
    color: purple;
  }
</style>
```

Lưu và làm mới, và bạn sẽ thấy tất cả các đoạn văn bản chuyển sang màu tím.

Trong một số trường hợp, bảng kiểu nội bộ có thể hữu ích. Ví dụ, có thể bạn đang làm việc với hệ thống quản lý nội dung mà bạn không thể chỉnh sửa các tệp CSS bên ngoài.

Tuy nhiên, đối với các trang web có nhiều hơn một trang, bảng kiểu nội bộ kém hiệu quả hơn bảng kiểu bên ngoài. Để áp dụng kiểu CSS đồng nhất cho nhiều trang bằng bảng kiểu nội bộ, bạn phải lặp lại bảng kiểu nội bộ trên mỗi trang web. Hiệu suất kém cũng ảnh hưởng đến việc bảo trì trang web. Với CSS trong bảng kiểu nội bộ, có nguy cơ ngay cả một thay đổi kiểu đơn giản cũng có thể yêu cầu chỉnh sửa nhiều trang web.

Trước khi tiếp tục, hãy xóa phần tử `<style>` và nội dung của nó khỏi HTML ví dụ của bạn.

### Kiểu nội tuyến

Kiểu nội tuyến là các khai báo CSS ảnh hưởng đến một phần tử HTML duy nhất, được chứa trong thuộc tính `style`. Hãy thử triển khai một cái bây giờ.

Thêm thuộc tính `style` vào phần tử {{htmlelement("span")}} trong HTML của bạn, sao cho nó trông như sau:

```html
<span style="color: purple; font-weight: bold">span element</span>
```

Lưu và làm mới, và bạn sẽ thấy chỉ văn bản bên trong `<span>` chuyển sang màu tím và đậm. Hãy thử thêm một số khai báo khác vào trong thuộc tính `style` (ngăn cách bởi dấu chấm phẩy), hoặc một số thuộc tính `style` bổ sung cho các phần tử khác.

Khi bạn thực hành xong, hãy xóa tất cả các thuộc tính `style` của bạn.

**Tránh sử dụng CSS theo cách này nếu có thể.** Đó là thực hành không tốt. Thứ nhất, đây là cách triển khai CSS kém hiệu quả nhất để bảo trì. Một thay đổi kiểu có thể yêu cầu nhiều chỉnh sửa trong một trang web duy nhất. Thứ hai, CSS nội tuyến cũng trộn lẫn mã trình bày (CSS) với HTML và nội dung, làm cho mọi thứ khó đọc và hiểu hơn. Việc tách mã và nội dung giúp dễ bảo trì hơn cho tất cả những người làm việc trên trang web.

Bạn có thể phải dùng đến kiểu nội tuyến nếu môi trường làm việc của bạn rất hạn chế. Ví dụ, CMS của bạn chỉ cho phép bạn chỉnh sửa nội dung HTML. Bạn cũng có thể thấy rất nhiều kiểu nội tuyến trong HTML email để đạt được khả năng tương thích với càng nhiều ứng dụng email càng tốt. Ngoài ra, việc đặt kiểu nội tuyến khi áp dụng kiểu động bằng JavaScript cũng khá phổ biến.

## Sử dụng các bộ chọn phổ biến

Trong phần này, chúng ta sẽ thực hiện một chuyến tham quan ngắn qua một số loại bộ chọn phổ biến hơn mà bạn sẽ gặp.

### Chọn các phần tử HTML

Bằng cách làm cho tiêu đề của chúng ta màu đỏ, chúng ta đã chứng minh rằng chúng ta có thể nhắm mục tiêu và tạo kiểu cho một phần tử HTML. Chúng ta làm điều này bằng cách nhắm mục tiêu **bộ chọn phần tử** (còn được gọi là **bộ chọn theo loại**) — đây là bộ chọn khớp trực tiếp với tên phần tử HTML. Để nhắm mục tiêu tất cả các đoạn văn trong tài liệu, bạn sẽ sử dụng bộ chọn `p`. Để chuyển tất cả các đoạn sang màu xanh lá, bạn sẽ sử dụng:

```css
p {
  color: green;
}
```

Bạn có thể nhắm mục tiêu nhiều bộ chọn cùng một lúc bằng cách ngăn cách các bộ chọn bằng dấu phẩy. Nếu bạn muốn tất cả các đoạn và tất cả các mục danh sách đều màu xanh lá, quy tắc của bạn sẽ trông như sau:

```css
p,
li {
  color: green;
}
```

Hãy thử điều này trong ví dụ bên dưới (nhấp vào "Play") hoặc trong bản sao cục bộ của bạn:

```html hidden live-sample___started-types
<h1>I am a level one heading</h1>

<p>
  This is a paragraph of text. In the text is a <span>span element</span> and
  also a <a href="http://example.com">link</a>.
</p>

<p>This is the second paragraph. It contains an <em>emphasized</em> element.</p>

<ul>
  <li>Item one</li>
  <li>Item two</li>
  <li>Item <em>three</em></li>
</ul>
```

```css live-sample___started-types
h1 {
  color: red;
}

p,
li {
}
```

{{EmbedLiveSample("started-types", "", "240px")}}

Bài học tương tác sau dạy các khái niệm CSS cơ bản và cung cấp một số thực hành.

<mdn-scrim-inline url="https://scrimba.com/frontend-path-c0j/~015" scrimtitle="Write your first lines of CSS!"></scrim-inline>

### Thêm lớp

Cho đến nay, chúng ta đã tạo kiểu cho các phần tử dựa trên tên phần tử HTML của chúng. Điều này hoạt động miễn là bạn muốn tất cả các phần tử của loại đó trong tài liệu trông giống nhau. Để chọn một tập hợp con của các phần tử mà không thay đổi các phần tử khác, bạn có thể thêm một `class` vào phần tử HTML của mình và nhắm mục tiêu lớp đó trong CSS.

1. Trong tài liệu HTML của bạn, hãy thêm [thuộc tính class](/en-US/docs/Web/HTML/Reference/Global_attributes/class) vào mục danh sách thứ hai. Danh sách của bạn bây giờ sẽ trông như thế này:

   ```html
   <ul>
     <li>Item one</li>
     <li class="special">Item two</li>
     <li>Item <em>three</em></li>
   </ul>
   ```

2. Trong CSS của bạn, bạn có thể nhắm mục tiêu lớp `special` bằng cách tạo một bộ chọn bắt đầu bằng dấu chấm. Thêm nội dung sau vào tệp CSS của bạn:

   ```css
   .special {
     color: orange;
     font-weight: bold;
   }
   ```

3. Lưu và làm mới để xem kết quả là gì.

Bạn có thể áp dụng lớp `special` cho các phần tử khác trên trang của mình mà bạn muốn có giao diện giống như mục danh sách này. Thêm lớp `special` vào `<span>` bên trong đoạn, sau đó tải lại trang của bạn: Bây giờ nó cũng phải là màu cam và in đậm.

### Tạo kiểu cho mọi thứ dựa trên vị trí của chúng trong tài liệu

Đôi khi bạn muốn một cái gì đó trông khác dựa trên vị trí của nó trong tài liệu. Có một số bộ chọn có thể giúp bạn ở đây, nhưng hiện tại chúng ta sẽ chỉ xem xét một vài cái. Trong tài liệu của chúng ta, có hai phần tử `<em>` — một bên trong đoạn văn và một bên trong mục danh sách. Để chọn chỉ một `<em>` được lồng bên trong phần tử `<li>`, bạn có thể sử dụng bộ chọn gọi là **bộ kết hợp hậu duệ**, có dạng là khoảng cách giữa hai bộ chọn khác.

Thêm quy tắc sau vào bảng kiểu của bạn:

```css
li em {
  color: rebeccapurple;
}
```

Bộ chọn này sẽ chọn bất kỳ phần tử `<em>` nào là hậu duệ của `<li>`. Vì vậy trong tài liệu ví dụ của bạn, bạn sẽ thấy rằng `<em>` trong mục danh sách thứ ba bây giờ có màu tím, nhưng cái bên trong đoạn văn vẫn không thay đổi.

Một điều khác bạn có thể muốn thử là tạo kiểu cho đoạn văn khi nó đứng ngay sau tiêu đề ở cùng cấp bậc trong HTML. Để làm vậy, hãy đặt `+` (một **bộ kết hợp anh chị em tiếp theo**) giữa các bộ chọn.

Hãy thử thêm quy tắc này vào bảng kiểu của bạn:

```css
h1 + p {
  font-size: 200%;
}
```

Ví dụ trực tiếp bên dưới bao gồm hai quy tắc trên. Hãy thử thêm quy tắc để làm cho span màu đỏ nếu nó bên trong đoạn văn. Bạn sẽ biết nếu bạn làm đúng vì span trong đoạn đầu tiên sẽ là màu đỏ, nhưng cái trong mục danh sách đầu tiên sẽ không thay đổi màu.

```html hidden live-sample___started-combinators
<h1>I am a level one heading</h1>

<p>
  This is a paragraph of text. In the text is a <span>span element</span> and
  also a <a href="http://example.com">link</a>.
</p>

<p>This is the second paragraph. It contains an <em>emphasized</em> element.</p>

<ul>
  <li>Item <span>one</span></li>
  <li>Item two</li>
  <li>Item <em>three</em></li>
</ul>
```

```css live-sample___started-combinators
li em {
  color: rebeccapurple;
}

h1 + p {
  font-size: 200%;
}
```

{{EmbedLiveSample("started-combinators", "", "340px")}}

> [!NOTE]
> Như bạn có thể thấy, CSS cung cấp cho chúng ta một số cách để nhắm mục tiêu các phần tử, và chúng ta mới chỉ chạm đến bề mặt cho đến nay! Chúng ta sẽ xem xét kỹ lưỡng tất cả các bộ chọn này và nhiều bộ chọn khác sau này trong khóa học.

### Tạo kiểu cho mọi thứ dựa trên trạng thái

Loại tạo kiểu cuối cùng chúng ta sẽ xem xét trong hướng dẫn này là khả năng tạo kiểu cho mọi thứ dựa trên trạng thái của chúng. Một ví dụ đơn giản về điều này là khi tạo kiểu liên kết. Khi chúng ta tạo kiểu cho liên kết, chúng ta cần nhắm mục tiêu phần tử [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a) (neo). Phần tử này có các trạng thái khác nhau tùy thuộc vào việc nó chưa được truy cập, đã được truy cập, đang được di chuột qua, được tập trung qua bàn phím, hay đang được nhấp (kích hoạt). Bạn có thể sử dụng CSS để nhắm mục tiêu các trạng thái khác nhau này — CSS bên dưới tạo kiểu liên kết chưa được truy cập màu hồng và liên kết đã được truy cập màu xanh lá.

```css
a:link {
  color: pink;
}

a:visited {
  color: green;
}
```

Bạn có thể thay đổi cách liên kết trông khi người dùng di chuột qua nó, ví dụ bằng cách xóa gạch chân, được thực hiện bởi quy tắc tiếp theo:

```css
a:hover {
  text-decoration: none;
}
```

Trong ví dụ bên dưới, bạn có thể thử nghiệm với các giá trị khác nhau cho các trạng thái khác nhau của liên kết. Chúng ta đã thêm các quy tắc trên vào đó, và bây giờ nhận ra rằng màu hồng khá nhạt và khó đọc — tại sao không đổi sang màu tốt hơn? Bạn có thể làm cho các liên kết đậm không?

```html hidden live-sample___started-states
<h1>I am a level one heading</h1>

<p>
  This is a paragraph of text. In the text is a <span>span element</span> and
  also a <a href="http://example.com">link</a>.
</p>

<p>This is the second paragraph. It contains an <em>emphasized</em> element.</p>

<ul>
  <li>Item one</li>
  <li>Item two</li>
  <li>Item <em>three</em></li>
</ul>
```

```css live-sample___started-states
a:link {
  color: pink;
}

a:visited {
  color: green;
}

a:hover {
  text-decoration: none;
}
```

{{EmbedLiveSample("started-states", "", "240px")}}

Chúng ta đã xóa gạch chân khỏi liên kết khi di chuột qua. Bạn có thể xóa gạch chân khỏi tất cả các trạng thái của liên kết. Tuy nhiên, đáng nhớ là trong một trang web thực, bạn muốn đảm bảo rằng khách truy cập biết liên kết là một liên kết. Để lại gạch chân có thể là manh mối quan trọng để mọi người nhận ra rằng một số văn bản trong đoạn có thể được nhấp — đây là hành vi mà họ đã quen thuộc. Như với mọi thứ trong CSS, có khả năng làm cho tài liệu kém tiếp cận hơn với các thay đổi của bạn — chúng tôi sẽ cố gắng làm nổi bật các cạm bẫy tiềm năng ở các nơi thích hợp.

> [!NOTE]
> Bạn sẽ thường xuyên thấy đề cập đến [khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility) trong các bài học này và trên MDN. Khi chúng ta nói về khả năng tiếp cận, chúng ta đang đề cập đến yêu cầu cho các trang web của chúng ta phải dễ hiểu và có thể sử dụng được bởi mọi người, dù họ đang sử dụng máy tính với chuột hoặc bàn di chuột, điện thoại với màn hình cảm ứng, chỉ điều hướng bằng bàn phím hoặc thông qua trình đọc màn hình, đọc nội dung của tài liệu.

### Kết hợp bộ chọn và bộ kết hợp

Đáng lưu ý rằng bạn có thể kết hợp nhiều bộ chọn và bộ kết hợp lại với nhau. Ví dụ:

```css
/* chọn bất kỳ <span> nào bên trong <p>, bên trong <article>  */
article p span {
}

/* chọn bất kỳ <p> nào đứng ngay sau <ul>, đứng ngay sau <h1>  */
h1 + ul + p {
}
```

Bạn cũng có thể kết hợp nhiều loại lại với nhau. Hãy thử thêm nội dung sau vào mã của bạn:

```css
h1 + p .special {
  color: yellow;
  background-color: black;
  padding: 5px;
}
```

Điều này sẽ tạo kiểu cho bất kỳ phần tử nào có lớp `special`, bên trong `<p>`, đứng ngay sau `<h1>`. Điều này sẽ nhắm mục tiêu phần tử `<span class="special">span element</span>` trong mã của bạn.

Đừng lo lắng nếu điều này có vẻ phức tạp lúc này — bạn sẽ sớm bắt đầu quen với nó khi bạn viết nhiều CSS hơn.

## Các tính năng cú pháp CSS khác

Bây giờ chúng ta đã thử nghiệm một vài tính năng CSS, chúng ta sẽ cung cấp cho bạn một chuyến tham quan cấp cao về một số tính năng cú pháp CSS khác mà bạn sẽ gặp trong khóa học. Nếu bạn muốn tra cứu thêm chi tiết về bất kỳ tính năng nào trong số này, bạn có thể thử gõ tên tính năng vào trường tìm kiếm ở đầu trang này, hoặc duyệt [tham chiếu CSS](/en-US/docs/Web/CSS/Reference) của MDN.

Để thử nghiệm với các đoạn mã trong từng trường hợp, bạn có thể thêm HTML và CSS được cung cấp vào ví dụ cục bộ hoặc phiên bản MDN Playground mà bạn đã làm việc ở trên.

### Hàm

Trong khi hầu hết các giá trị là từ khóa đơn giản hoặc giá trị số, có một số giá trị có dạng hàm.

#### Hàm calc()

Một ví dụ sẽ là hàm `calc()`, có thể thực hiện phép tính đơn giản trong CSS:

```html
<div class="outer"><div class="box">The inner box is 90% - 30px.</div></div>
```

```css
.outer {
  border: 5px solid black;
}

.box {
  padding: 10px;
  width: calc(90% - 30px);
  background-color: rebeccapurple;
  color: white;
}
```

Điều này hiển thị như sau:

{{EmbedLiveSample('The_calc_function', '100%', 200)}}

Một hàm gồm tên hàm và dấu ngoặc đơn để bao quanh các giá trị cho hàm. Trong trường hợp ví dụ `calc()` ở trên, các giá trị xác định chiều rộng của hộp này là 90% chiều rộng của khối chứa, trừ 30 pixel.

#### Hàm transform

Một ví dụ khác sẽ là các giá trị khác nhau cho thuộc tính {{cssxref("transform")}}, chẳng hạn như `rotate()`.

```html
<div class="box"></div>
```

```css
.box {
  margin: 30px;
  width: 100px;
  height: 100px;
  background-color: rebeccapurple;
  transform: rotate(0.8turn);
}
```

Kết quả từ mã trên trông như sau:

{{EmbedLiveSample('Transform_functions', '100%', 200)}}

Hãy tra cứu các giá trị khác nhau của các thuộc tính được liệt kê bên dưới. Hãy thử viết các quy tắc CSS áp dụng kiểu cho các phần tử HTML khác nhau bằng cách sử dụng các hàm sau:

- {{cssxref("transform")}}
- {{cssxref("background-image")}}, đặc biệt là các giá trị gradient
- {{cssxref("color")}}, đặc biệt là các giá trị rgb và hsl

### @rule

CSS [@rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) (phát âm là "at-rule") cung cấp hướng dẫn về cách CSS nên hoạt động. Một @rule phổ biến mà bạn có thể gặp là `@media`, được sử dụng để tạo [truy vấn media](/en-US/docs/Web/CSS/Guides/Media_queries). Các truy vấn media sử dụng logic điều kiện để áp dụng tạo kiểu CSS.

Trong ví dụ bên dưới, bảng kiểu định nghĩa nền màu hồng mặc định cho phần tử `<body>`. Tuy nhiên, một truy vấn media tiếp theo đặt nền màu xanh lam trên phần tử `<body>` nếu viewport của trình duyệt rộng hơn `30em`.

```css
body {
  background-color: pink;
}

@media (width >= 30em) {
  body {
    background-color: blue;
  }
}
```

### Thuộc tính viết tắt

Một số thuộc tính như {{cssxref("font")}}, {{cssxref("background")}}, {{cssxref("padding")}}, {{cssxref("border")}}, và {{cssxref("margin")}} được gọi là **thuộc tính viết tắt**. Điều này vì các thuộc tính viết tắt đặt nhiều giá trị trong một dòng duy nhất.

Ví dụ, dòng mã này:

```css
/* Trong viết tắt 4 giá trị như padding và margin, các giá trị được áp dụng
   theo thứ tự trên, phải, dưới, trái (theo chiều kim đồng hồ từ trên). Cũng có các
   loại viết tắt khác, ví dụ viết tắt 2 giá trị, đặt padding/margin
   cho trên/dưới, sau đó trái/phải */
padding: 10px 15px 15px 5px;
```

tương đương với bốn dòng mã này:

```css
padding-top: 10px;
padding-right: 15px;
padding-bottom: 15px;
padding-left: 5px;
```

Dòng này:

```css
background: red url("bg-graphic.png") 10px 10px repeat-x fixed;
```

tương đương với năm dòng này:

```css
background-color: red;
background-image: url("bg-graphic.png");
background-position: 10px 10px;
background-repeat: repeat-x;
background-attachment: fixed;
```

Sau này trong khóa học, bạn sẽ gặp nhiều ví dụ về thuộc tính viết tắt khác. Hiện tại, hãy thử sử dụng các khai báo trên (hoặc các khai báo khác mà bạn có thể biết) trong mã của bạn để quen thuộc hơn với cách chúng hoạt động.

### Chú thích CSS

Cũng như với bất kỳ công việc lập trình nào, tốt nhất là viết chú thích trong CSS của bạn. Điều này giúp bạn nhớ cách mã hoạt động khi bạn quay lại sau này để sửa lỗi hoặc cải tiến. Nó cũng giúp người khác hiểu mã.

Chú thích CSS bắt đầu bằng `/*` và kết thúc bằng `*/`. Trong ví dụ bên dưới, chú thích đánh dấu bắt đầu của các phần mã khác nhau. Điều này giúp điều hướng codebase khi nó lớn hơn. Với loại chú thích như vậy, việc tìm kiếm chú thích trong trình chỉnh sửa mã của bạn trở thành cách hiệu quả để tìm một phần mã.

```css
/* Xử lý tạo kiểu phần tử cơ bản */
/* ---------------------------- */
body {
  font:
    1em/150% "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0 auto;
  max-width: 33em;
}

@media (width >= 70em) {
  /* Tăng cỡ chữ toàn cục trên màn hình hoặc cửa sổ lớn hơn
     để dễ đọc hơn */
  body {
    font-size: 130%;
  }
}

h1 {
  font-size: 1.5em;
}

/* Xử lý các phần tử cụ thể được lồng trong DOM */
div p,
#id::first-line {
  background-color: red;
  border-radius: 3px;
}

div p {
  margin: 0;
  padding: 1em;
}

div p + p {
  padding-top: 0;
}
```

"Chú thích mã" cũng hữu ích để tạm thời vô hiệu hóa các phần mã cho mục đích thử nghiệm. Trong ví dụ bên dưới, các quy tắc cho `.special` bị vô hiệu hóa bằng cách "chú thích mã".

```css
/* .special {
  color: red;
} */

p {
  color: blue;
}
```

Hãy thử thêm chú thích vào CSS của bạn.

### Khoảng trắng trong CSS

Khoảng trắng có nghĩa là các khoảng trống thực sự, tab và dòng mới. Cũng như trình duyệt bỏ qua khoảng trắng thêm trong HTML, trình duyệt bỏ qua khoảng trắng thêm bên trong CSS. Lợi ích của khoảng trắng là nó làm cho mã dễ đọc hơn.

Trong ví dụ bên dưới, mỗi khai báo (và phần bắt đầu/kết thúc quy tắc) có dòng riêng của nó. Đây có thể là cách viết CSS tốt. Nó làm cho việc duy trì và hiểu CSS dễ dàng hơn.

```css
body {
  font:
    1em/150% "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0 auto;
  max-width: 33em;
}

@media (width >= 70em) {
  body {
    font-size: 130%;
  }
}

h1 {
  font-size: 1.5em;
}
```

Ví dụ tiếp theo cho thấy cùng CSS ở định dạng nén hơn, với tất cả khoảng trắng thêm được loại bỏ. Mặc dù hai ví dụ hoạt động giống nhau, ví dụ bên dưới khó đọc hơn.

```css-nolint
body{font:1em/150% "Helvetica","Arial",sans-serif;padding:1em;margin:0 auto;max-width:33em;}
@media(width>=70em){body{font-size:130%;}}
h1{font-size:1.5em;}
```

Hãy nhớ rằng một số thay đổi khoảng trắng có thể gây ra lỗi. Tên thuộc tính không bao giờ chứa khoảng trắng, trong khi các giá trị thuộc tính mong đợi khoảng trắng giữa nhiều giá trị sẽ không hợp lệ nếu khoảng trắng đó bị loại bỏ. Ví dụ, các khai báo này là CSS hợp lệ:

```css
margin: 0 auto;
padding-left: 10px;
```

Nhưng các khai báo này không hợp lệ:

```css example-bad
margin: 0auto;
padding- left: 10px;
```

Bạn có thấy lỗi khoảng cách không? Thứ nhất, `0auto` không được nhận dạng là giá trị hợp lệ cho thuộc tính `margin`. Mục nhập `0auto` có nghĩa là hai giá trị riêng biệt: `0` và `auto`. Thứ hai, trình duyệt không nhận ra `padding-` là thuộc tính hợp lệ. Tên thuộc tính đúng (`padding-left`) không có khoảng cách trong đó.

Bạn phải luôn đảm bảo phân tách các giá trị riêng biệt với ít nhất một khoảng cách. Giữ tên thuộc tính và giá trị thuộc tính lại với nhau như các chuỗi không bị gián đoạn duy nhất.

Để tìm hiểu cách khoảng cách có thể phá vỡ CSS, hãy thử nghiệm với khoảng cách bên trong CSS thử nghiệm của bạn.

## Tóm tắt

Trong bài viết này, chúng ta đã xem xét một số cách trong đó bạn có thể tạo kiểu cho tài liệu bằng CSS. Chúng ta sẽ phát triển kiến thức này khi chúng ta tiến qua các bài học còn lại. Tuy nhiên, bây giờ bạn đã biết đủ để tạo kiểu văn bản và áp dụng CSS dựa trên các cách khác nhau để nhắm mục tiêu các phần tử trong tài liệu.

Tiếp theo, chúng ta sẽ đưa ra một thử thách để kiểm tra kiến thức mới của bạn.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/What_is_CSS", "Learn_web_development/Core/Styling_basics/Styling_a_bio_page", "Learn_web_development/Core/Styling_basics")}}
