---
title: "HTML: Tạo nội dung"
short-title: Tạo nội dung
slug: Learn_web_development/Getting_started/Your_first_website/Creating_the_content
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/What_will_your_website_look_like", "Learn_web_development/Getting_started/Your_first_website/Styling_the_content", "Learn_web_development/Getting_started/Your_first_website")}}

HTML (**H**yper**T**ext **M**arkup **L**anguage — Ngôn ngữ đánh dấu siêu văn bản) là mã dùng để cấu trúc trang web và nội dung của nó. Bài viết này cung cấp hiểu biết cơ bản về HTML và các chức năng của nó, đồng thời hướng dẫn bạn cách tạo nội dung cơ bản cho trang web đầu tiên.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính của bạn, phần mềm cơ bản bạn sẽ dùng để xây dựng trang web và hệ thống tệp.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mục đích và chức năng của HTML.</li>
          <li>Các thành phần cơ bản của cú pháp HTML — thẻ mở và thẻ đóng, phần tử, thuộc tính, head, body.</li>
          <li>Các phần tử HTML phổ biến bao gồm đoạn văn, tiêu đề, hình ảnh, danh sách và liên kết.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Vậy HTML là gì?

HTML là một _ngôn ngữ đánh dấu_ (markup language) bao gồm một loạt các **{{Glossary("element", "phần tử")}}** (element) dùng để bọc (hoặc bao quanh) nội dung văn bản nhằm xác định cấu trúc và khiến nó hoạt động theo một cách nhất định.

Hãy xem một ví dụ — nội dung sau sẽ được hiển thị trên cùng một dòng khi được hiển thị trên trang web, vì nó chưa được cấu trúc theo bất kỳ cách nào:

```plain
Instructions for life:
Eat
Sleep
Repeat
```

Nếu chúng ta bọc nội dung này bằng các phần tử HTML sau, chúng ta có thể biến dòng đơn đó thành một đoạn văn ({{htmlelement("p")}}) và ba dấu đầu dòng ({{htmlelement("li")}}):

```html live-sample___basic-html
<p>Instructions for life:</p>

<ul>
  <li>Eat</li>
  <li>Sleep</li>
  <li>Repeat</li>
</ul>
```

HTML này sẽ được hiển thị như sau trong trình duyệt web:

{{EmbedLiveSample("basic-html", "100%", "140px")}}

Ngoài việc cấu trúc văn bản, HTML còn có nhiều công dụng khác — tạo liên kết văn bản hoặc hình ảnh đến các trang web khác, nhúng hình ảnh hoặc video, tạo bảng dữ liệu, và nhiều hơn nữa.

> [!NOTE]
> [HTML tags](https://scrimba.com/frontend-path-c0j/~0g?via=mdn) của Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> là một bài học tương tác cung cấp bài tập về kiến thức cơ bản HTML, bao gồm các tiêu đề.

## Tạo tài liệu HTML đầu tiên

Hãy xem cách các phần tử riêng lẻ kết hợp với nhau để tạo thành một trang HTML. Trong phần này, bạn sẽ tạo một tệp HTML cơ bản và xem nó được tạo thành từ những gì.

1. Bên trong thư mục `web-projects` của bạn, tạo thêm một thư mục mới gọi là `first-website`.
2. Bên trong `first-website`, tạo một tệp mới gọi là `index.html`, và chèn đoạn mã sau vào tệp đúng như hiển thị:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>My test page</title>
  </head>
  <body>
    <img src="" alt="My test image" />
  </body>
</html>
```

Ở đây, chúng ta có những thành phần sau:

- `<!doctype html>`: [Doctype](/en-US/docs/Glossary/Doctype) là phần mở đầu bắt buộc. Trong thời kỳ đầu của HTML (khoảng năm 1991/92), doctype được dùng như các liên kết đến một bộ quy tắc mà trang HTML phải tuân theo để được coi là HTML tốt, bao gồm kiểm tra lỗi tự động và các tính năng hữu ích khác. Tuy nhiên, ngày nay chúng không làm được nhiều và về cơ bản chỉ cần thiết để đảm bảo tài liệu của bạn hoạt động chính xác. Đó là tất cả những gì bạn cần biết cho bây giờ.
- `<html></html>`: Phần tử {{htmlelement("html")}} bọc tất cả nội dung trên toàn bộ trang và đôi khi được gọi là **phần tử gốc** (root element). Nó cũng bao gồm thuộc tính (attribute) `lang`, đặt ngôn ngữ chính của tài liệu.
- `<head></head>`: Phần tử {{htmlelement("head")}} đóng vai trò là vùng chứa cho tất cả những thứ bạn muốn đưa vào trang HTML mà _không phải_ là nội dung bạn hiển thị cho người xem trang. Điều này bao gồm các thứ như {{Glossary("keyword", "từ khóa")}} và mô tả trang xuất hiện trong kết quả tìm kiếm, {{glossary("CSS")}} để tạo kiểu cho nội dung, khai báo bộ ký tự, v.v.
- `<meta charset="utf-8">`: Phần tử này đặt bộ ký tự mà tài liệu của bạn nên sử dụng thành [UTF-8](/en-US/docs/Glossary/UTF-8), bao gồm hầu hết các ký tự từ phần lớn các ngôn ngữ viết. Về cơ bản, nó có thể xử lý bất kỳ nội dung văn bản nào bạn có thể đặt vào. Không có lý do gì để không đặt điều này, và nó có thể giúp tránh một số vấn đề sau này.
- `<meta name="viewport" content="width=device-width">`: [Phần tử viewport](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts#mobile_viewports) này đảm bảo trang được hiển thị theo chiều rộng của viewport trình duyệt, ngăn trình duyệt di động hiển thị trang rộng hơn viewport rồi thu nhỏ lại.
- `<title></title>`: Phần tử {{htmlelement("title")}} đặt tiêu đề cho trang của bạn, là tiêu đề xuất hiện trong tab trình duyệt khi trang được tải. Nó cũng được dùng để mô tả trang khi bạn đánh dấu/yêu thích nó.
- `<body></body>`: Phần tử {{htmlelement("body")}} chứa _tất cả_ nội dung mà bạn muốn hiển thị cho người dùng web khi họ truy cập trang của bạn, dù đó là văn bản, hình ảnh, video, trò chơi, bản nhạc có thể phát, hay bất cứ thứ gì khác. Hiện tại nó chỉ chứa một phần tử `<img>` duy nhất, nhưng chúng ta sẽ thêm nhiều nội dung hơn sau.

> [!NOTE]
> Hầu hết các phần tử HTML bao gồm một **thẻ mở** (opening tag) (ví dụ: `<body>`), theo sau là nội dung của phần tử, theo sau là **thẻ đóng** (closing tag) (ví dụ: `</body>`). Một số phần tử HTML cũng có **thuộc tính** (attribute), chứa các cài đặt hoặc thông tin bổ sung về phần tử — xem ví dụ `charset`, `name` và `src` trong mẫu mã của chúng ta.

## Nhúng hình ảnh

Hãy chú ý đến phần tử {{htmlelement("img")}}:

```html
<img src="" alt="My test image" />
```

Phần tử này nhúng một hình ảnh vào trang tại vị trí nó xuất hiện. Nó thực hiện điều này thông qua thuộc tính `src` (source — nguồn), chứa đường dẫn đến tệp hình ảnh mà chúng ta muốn nhúng.

Chúng ta cũng đã thêm thuộc tính `alt` (alternative — thay thế). Trong [thuộc tính `alt`](/en-US/docs/Web/HTML/Reference/Elements/img#authoring_meaningful_alternate_descriptions), bạn chỉ định văn bản mô tả cho người dùng không thể nhìn thấy hình ảnh, có thể vì các lý do sau:

1. Họ bị khiếm thị. Người dùng bị khiếm thị nặng thường sử dụng các công cụ gọi là trình đọc màn hình (screen reader) để đọc to văn bản thay thế cho họ.
2. Có sự cố xảy ra, khiến hình ảnh không hiển thị. Nếu thuộc tính `src` không chứa đường dẫn hợp lệ đến hình ảnh, văn bản thay thế sẽ được hiển thị thay thế:

   ![Các chữ: my test image](alt-text-example.png)

Văn bản thay thế bạn viết phải cung cấp cho người đọc đủ thông tin để có ý tưởng tốt về những gì hình ảnh thể hiện. Trong ví dụ này, văn bản hiện tại của chúng ta là "My test image" không tốt vì nó không truyền đạt thông tin mô tả về hình ảnh. Một giải pháp thay thế tốt hơn nhiều cho logo Firefox của chúng ta sẽ là "The Firefox logo: a flaming fox surrounding the Earth" (Logo Firefox: một con cáo lửa bao quanh Trái Đất).

> [!NOTE]
> Các phần tử như `<img>` không có nội dung hoặc thẻ đóng, do đó được gọi là phần tử **rỗng** (empty) (hoặc **{{glossary("void element", "void")}}**). Chúng đôi khi được viết với một **dấu gạch chéo ở cuối** (trailing slash) ở cuối thẻ đơn của chúng (`<img />`), nhưng điều này là tùy chọn.

Hãy hiển thị hình ảnh của bạn ngay bây giờ.

1. Bên trong thư mục `first-website`, tạo một thư mục mới gọi là `images`, và đặt hình ảnh bạn đã chọn ở ví dụ trước vào thư mục này.
2. Bên trong giá trị thuộc tính `src` của thẻ `<img>`, nhập đường dẫn đến hình ảnh của bạn. Nó nằm trong một thư mục gọi là `images`, nằm trong cùng thư mục với tệp `index.html` của bạn, do đó đường dẫn sẽ là `images/` cộng với tên hình ảnh của bạn. Ví dụ: nếu hình ảnh của bạn có tên `firefox-icon.png`, thuộc tính `src` sẽ trông như thế này: `src="images/firefox-icon.png"`.
3. Thay thế giá trị thuộc tính `alt` — `My test image` — bằng một số văn bản mô tả hình ảnh của bạn tốt hơn.
4. Mở tệp `index.html` trong trình duyệt web. Bạn sẽ thấy hình ảnh được hiển thị. Nếu không, hãy kiểm tra phần tử `<img>` của bạn với mã của chúng tôi; đảm bảo rằng nó không thiếu bất kỳ cú pháp nào, chẳng hạn như dấu ngoặc kép. Đảm bảo tên tệp hình ảnh là chính xác.

Nếu hình ảnh thực sự lớn và do đó không vừa với màn hình, đừng lo lắng. Chúng ta sẽ khắc phục vấn đề này trong bài viết tiếp theo.

> [!NOTE]
> Tìm hiểu thêm về việc sử dụng thuộc tính `alt` cho hình ảnh trong các tình huống khác nhau trong [hướng dẫn đa phương tiện có thể truy cập](/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia) và [Cây quyết định Alt](https://www.w3.org/WAI/tutorials/images/decision-tree/).

## Đánh dấu văn bản

Phần này sẽ đề cập đến một số phần tử HTML thiết yếu bạn sẽ dùng để đánh dấu văn bản.

> [!NOTE]
> [The basics of semantic HTML](https://scrimba.com/the-frontend-developer-career-path-c0j/~0xid?via=mdn) của Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> là một bài học tương tác cung cấp mô tả hữu ích về HTML, đặc biệt nhấn mạnh lý do tại sao khía cạnh _ngữ nghĩa_ (semantic) của nó quan trọng.

### Tiêu đề

Các phần tử tiêu đề cho phép bạn chỉ định rằng một số phần nội dung là tiêu đề — hoặc tiêu đề con. Giống như một cuốn sách có tiêu đề chính, tiêu đề chương và tiêu đề phụ, tài liệu HTML cũng vậy. HTML chứa 6 cấp tiêu đề, {{htmlelement("Heading_Elements", "&lt;h1&gt;–&lt;h6&gt;")}}, mặc dù thông thường bạn chỉ dùng 3 đến 4 cấp tối đa:

```html
<!-- 4 heading levels: -->
<h1>My main title</h1>
<h2>My top level heading</h2>
<h3>My subheading</h3>
<h4>My sub-subheading</h4>
```

> [!NOTE]
> Bất cứ thứ gì trong HTML nằm giữa `<!--` và `-->` là **chú thích HTML** (HTML comment). Trình duyệt bỏ qua các chú thích khi hiển thị mã. Nói cách khác, chúng không hiển thị trên trang — chỉ hiện trong mã. Chú thích HTML là cách để bạn thêm ghi chú về mã hoặc logic của mình, có thể hữu ích cho người khác làm việc trên cùng mã đó, hoặc cho bạn, nếu bạn quay lại sau 6 tháng và không nhớ mình đã làm gì.

Thêm tiêu đề trang của bạn vào trang HTML ngay phía trên phần tử {{htmlelement("img")}} của bạn, được bao trong thẻ `<h1> ... </h1>`. Lưu tệp và xem trong trình duyệt để thấy hiệu ứng.

### Đoạn văn

Các phần tử đoạn văn {{htmlelement("p")}} dùng để chứa các đoạn văn bản; bạn sẽ dùng chúng thường xuyên khi đánh dấu nội dung văn bản thông thường:

```html
<p>This is a single paragraph</p>
```

Thêm văn bản mẫu của bạn từ bài viết trước vào một hoặc vài đoạn văn, đặt ngay bên dưới phần tử {{htmlelement("img")}} của bạn. Lưu và xem trang của bạn trong trình duyệt.

### Danh sách

Rất nhiều nội dung trên web là danh sách và HTML có các phần tử đặc biệt cho chúng. Đánh dấu danh sách luôn bao gồm ít nhất 2 phần tử. Các loại danh sách phổ biến nhất là danh sách có thứ tự và không có thứ tự:

1. **Danh sách không có thứ tự** (unordered list) dùng cho các danh sách mà thứ tự của các mục không quan trọng, chẳng hạn như danh sách mua sắm. Chúng được bọc trong phần tử {{htmlelement("ul")}}.
2. **Danh sách có thứ tự** (ordered list) dùng cho các danh sách mà thứ tự của các mục có quan trọng, chẳng hạn như danh sách các bước nấu ăn trong công thức. Chúng được bọc trong phần tử {{htmlelement("ol")}}.

Mỗi mục bên trong danh sách được đặt trong phần tử {{htmlelement("li")}} (list item — mục danh sách).

Ví dụ: nếu chúng ta muốn chuyển một phần của đoạn văn sau thành danh sách:

```html
<p>
  At Mozilla, we're a global community of technologists, thinkers, and builders
  working together…
</p>
```

Chúng ta có thể sửa đổi đánh dấu thành thế này:

```html
<p>At Mozilla, we're a global community of</p>

<ul>
  <li>technologists</li>
  <li>thinkers</li>
  <li>builders</li>
</ul>

<p>working together…</p>
```

Hãy thử thêm một danh sách có thứ tự hoặc không có thứ tự vào trang ví dụ của bạn, và xem kết quả trong trình duyệt.

## Tạo liên kết

Liên kết (link) rất quan trọng — chúng là thứ làm cho web trở thành web! Để thêm một liên kết, chúng ta cần sử dụng phần tử {{htmlelement("a")}}, trong đó "a" là viết tắt của "anchor" (neo). Để biến văn bản trong đoạn văn thành một liên kết, hãy làm theo các bước sau:

1. Chọn một số văn bản. Chúng tôi đã chọn văn bản "Mozilla Manifesto".
2. Bao văn bản trong phần tử {{htmlelement("a")}}, như được hiển thị bên dưới:

   ```html
   <a>Mozilla Manifesto</a>
   ```

3. Cấp cho phần tử {{htmlelement("a")}} một thuộc tính `href`, như được hiển thị bên dưới:

   ```html
   <a href="">Mozilla Manifesto</a>
   ```

4. Điền vào giá trị của thuộc tính này địa chỉ web mà bạn muốn liên kết trỏ đến:

   ```html
   <a href="https://www.mozilla.org/en-US/about/manifesto/">
     Mozilla Manifesto
   </a>
   ```

Bạn có thể nhận được kết quả không mong muốn nếu bỏ qua phần `https://` hoặc `http://`, được gọi là _giao thức_ (protocol), ở đầu địa chỉ web. Sau khi tạo một liên kết, hãy nhấp vào nó để đảm bảo nó đưa bạn đến nơi bạn muốn.

> [!NOTE]
> `href` ban đầu có thể trông như một lựa chọn khá khó hiểu cho tên thuộc tính. Nó là viết tắt của _**h**ypertext **ref**erence_ (tham chiếu siêu văn bản).

Thêm một liên kết vào trang của bạn ngay bây giờ, nếu bạn chưa làm.

## Kết luận

Nếu bạn đã làm theo tất cả các hướng dẫn trong bài viết này, bạn sẽ có một trang trông như trang bên dưới (bạn cũng có thể [xem nó ở đây](https://mdn.github.io/beginner-html-site/)):

![Ảnh chụp màn hình trang web hiển thị logo Firefox, tiêu đề có chữ Mozilla is cool, và hai đoạn văn chứa văn bản mẫu](finished-test-page-small.png)

Nếu bạn bị mắc kẹt, bạn luôn có thể so sánh công việc của mình với [mã ví dụ đã hoàn thành](https://github.com/mdn/beginner-html-site/blob/main/index.html) trên GitHub.

Ở đây, chúng ta mới chỉ tìm hiểu sơ lược về HTML. Bạn sẽ học được nhiều hơn trong mô-đun Core [Cấu trúc nội dung với HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) sau này trong khóa học.

## Xem thêm

- [Learn HTML and CSS](https://scrimba.com/learn-html-and-css-c0p?via=mdn), Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Learn HTML and CSS_ của [Scrimba](https://scrimba.com?via=mdn) dạy bạn HTML và CSS thông qua việc xây dựng và triển khai năm dự án tuyệt vời, với các bài học và thử thách tương tác thú vị được giảng dạy bởi các giáo viên am hiểu.

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/What_will_your_website_look_like", "Learn_web_development/Getting_started/Your_first_website/Styling_the_content", "Learn_web_development/Getting_started/Your_first_website")}}
