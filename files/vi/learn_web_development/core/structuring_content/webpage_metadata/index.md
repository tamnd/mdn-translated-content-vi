---
title: Có gì trong phần head? Siêu dữ liệu trang web
short-title: Siêu dữ liệu trang web
slug: Learn_web_development/Core/Structuring_content/Webpage_metadata
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Basic_HTML_syntax", "Learn_web_development/Core/Structuring_content/Headings_and_paragraphs", "Learn_web_development/Core/Structuring_content")}}

Phần {{glossary("Head", "head")}} của một tài liệu HTML là phần không được hiển thị trong trình duyệt web khi trang được tải. Nó chứa thông tin siêu dữ liệu như {{htmlelement("title")}} của trang, liên kết đến {{glossary("CSS")}} (nếu bạn muốn tạo kiểu cho nội dung HTML với CSS), liên kết đến favicon tùy chỉnh và các siêu dữ liệu khác (dữ liệu về HTML, chẳng hạn như tác giả, và các từ khóa quan trọng mô tả tài liệu).

Các trình duyệt web sử dụng thông tin chứa trong {{glossary("Head", "head")}} để hiển thị tài liệu HTML đúng cách. Trong bài viết này, chúng tôi sẽ đề cập đến tất cả những điều trên và nhiều hơn nữa, để cung cấp cho bạn nền tảng tốt để làm việc với đánh dấu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong bài học trước.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Phần head của HTML, và mục đích của nó như một vùng chứa siêu dữ liệu cho tài liệu.</li>
          <li>Thiết lập mã hóa ký tự và tiêu đề tài liệu.</li>
          <li>Cung cấp siêu dữ liệu cho các công cụ tìm kiếm.</li>
          <li>Liên kết đến các biểu tượng để sử dụng trên trình duyệt và nền tảng di động.</li>
          <li>Liên kết đến các tệp stylesheet và script.</li>
          <li>Sự cần thiết của việc đặt ngôn ngữ của tài liệu sử dụng thuộc tính <code>lang</code> trong thẻ <code>&lt;html&gt;</code> mở.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Phần head HTML là gì?

Hãy xem lại [tài liệu HTML đơn giản mà chúng ta đã đề cập trong bài viết trước](/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax#anatomy_of_an_html_document):

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>My test page</title>
  </head>
  <body>
    <p>This is my page</p>
  </body>
</html>
```

Phần head HTML là nội dung của phần tử {{htmlelement("head")}}. Không giống như nội dung của phần tử {{htmlelement("body")}} (được hiển thị trên trang khi được tải trong trình duyệt), nội dung của phần head không được hiển thị trên trang. Thay vào đó, công việc của phần head là chứa {{glossary("Metadata", "siêu dữ liệu")}} về tài liệu. Trong ví dụ trên, phần head khá nhỏ:

```html
<head>
  <meta charset="utf-8" />
  <title>My test page</title>
</head>
```

Tuy nhiên, trong các trang lớn hơn, phần head có thể khá lớn. Hãy thử truy cập một số trang web yêu thích của bạn và sử dụng [công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) để xem nội dung phần head của chúng. Mục tiêu của chúng tôi ở đây không phải là chỉ cho bạn cách sử dụng mọi thứ có thể được đặt trong phần head, mà là dạy bạn cách sử dụng các phần tử chính mà bạn sẽ muốn đưa vào phần head, và giúp bạn làm quen với chúng. Hãy bắt đầu.

## Thêm tiêu đề

Chúng ta đã thấy phần tử {{htmlelement("title")}} hoạt động — điều này có thể được sử dụng để thêm tiêu đề vào tài liệu. Tuy nhiên điều này có thể bị nhầm lẫn với phần tử {{htmlelement("Heading_Elements", "h1")}}, được sử dụng để thêm tiêu đề cấp cao nhất vào nội dung thân của bạn — đây đôi khi còn được gọi là tiêu đề trang. Nhưng chúng là những thứ khác nhau!

- Phần tử {{htmlelement("Heading_Elements", "h1")}} xuất hiện trên trang khi được tải trong trình duyệt — nói chung nên sử dụng một lần mỗi trang, để đánh dấu tiêu đề nội dung trang của bạn (tiêu đề câu chuyện, hoặc tiêu đề tin tức, hoặc bất kỳ điều gì phù hợp với mục đích sử dụng của bạn.)
- Phần tử {{htmlelement("title")}} là siêu dữ liệu đại diện cho tiêu đề của toàn bộ tài liệu HTML (không phải nội dung của tài liệu.)

### Kiểm tra một ví dụ

1. Trong bài tập này, chúng tôi muốn bạn bắt đầu bằng cách truy cập kho GitHub của chúng tôi và tải xuống bản sao của [trang title-example.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/title-example.html). Để làm điều này, hãy:
   1. Sao chép và dán mã từ trang vào một tệp văn bản mới trong trình soạn thảo mã của bạn, rồi lưu nó ở nơi hợp lý.
   2. Nhấn nút "Raw" trên trang GitHub, làm cho mã thô xuất hiện (có thể trong một tab trình duyệt mới). Tiếp theo, chọn menu _Save Page As…_ của trình duyệt và chọn nơi hợp lý để lưu tệp.

2. Bây giờ hãy mở tệp trong trình duyệt của bạn. Bạn sẽ thấy điều gì đó như thế này:

   ![Một trang web với văn bản 'title' trong tab trang của trình duyệt và văn bản 'h1' như tiêu đề trang trong thân tài liệu.](title-example.png)

   Bây giờ nên hoàn toàn rõ ràng nơi nội dung `<h1>` xuất hiện và nơi nội dung `<title>` xuất hiện!

3. Bạn cũng nên thử mở mã trong trình soạn thảo mã của mình, chỉnh sửa nội dung của các phần tử này, sau đó làm mới trang trong trình duyệt của bạn. Hãy vui vẻ với nó.

Nội dung của phần tử `<title>` cũng được sử dụng theo các cách khác. Ví dụ, nếu bạn thử đánh dấu sao trang (_Bookmarks > Bookmark This Page_ hoặc biểu tượng ngôi sao trong thanh URL trong Firefox), bạn sẽ thấy nội dung `<title>` được điền vào là tên đánh dấu được đề xuất.

![Một trang web đang được đánh dấu trong Firefox. Tên đánh dấu đã được tự động điền với nội dung của phần tử 'title'](bookmark-example.png)

Nội dung `<title>` cũng được sử dụng trong kết quả tìm kiếm, như bạn sẽ thấy bên dưới.

## Siêu dữ liệu: phần tử `<meta>`

Siêu dữ liệu là dữ liệu mô tả dữ liệu, và HTML có cách "chính thức" để thêm siêu dữ liệu vào tài liệu — phần tử {{htmlelement("meta")}}. Tất nhiên, những thứ khác mà chúng ta đang nói đến trong bài viết này cũng có thể được coi là siêu dữ liệu. Có rất nhiều loại phần tử `<meta>` khác nhau có thể được đưa vào `<head>` của trang, nhưng chúng tôi sẽ không cố gắng giải thích tất cả chúng ở giai đoạn này, vì điều đó sẽ gây nhầm lẫn. Thay vào đó, chúng tôi sẽ giải thích một vài điều mà bạn có thể thường thấy, chỉ để cung cấp cho bạn ý tưởng.

### Chỉ định mã hóa ký tự của tài liệu

Trong ví dụ mà chúng ta thấy ở trên, dòng này đã được bao gồm:

```html
<meta charset="utf-8" />
```

Phần tử này chỉ định mã hóa ký tự của tài liệu — bộ ký tự mà tài liệu được phép sử dụng. `utf-8` là bộ ký tự toàn cầu bao gồm hầu như tất cả các ký tự từ bất kỳ ngôn ngữ người nào. Điều này có nghĩa là trang web của bạn sẽ có thể xử lý việc hiển thị bất kỳ ngôn ngữ nào; do đó đây là ý tưởng tốt để đặt điều này trên mọi trang web bạn tạo! Ví dụ, trang của bạn có thể xử lý tiếng Anh và tiếng Nhật tốt:

![Một trang web chứa ký tự tiếng Anh và tiếng Nhật, với mã hóa ký tự được đặt thành toàn cầu, hoặc utf-8. Cả hai ngôn ngữ đều hiển thị tốt.](correct-encoding.png)

Nếu bạn đặt mã hóa ký tự thành `ISO-8859-1`, ví dụ (bộ ký tự cho bảng chữ cái Latin), quá trình hiển thị trang của bạn có thể trông lộn xộn:

![Một trang web chứa ký tự tiếng Anh và tiếng Nhật, với mã hóa ký tự được đặt thành latin. Các ký tự tiếng Nhật không hiển thị đúng.](bad-encoding.png)

> [!NOTE]
> Một số trình duyệt (như Chrome) tự động sửa các mã hóa không chính xác, vì vậy tùy thuộc vào trình duyệt bạn sử dụng, bạn có thể không thấy vấn đề này. Bạn vẫn nên đặt mã hóa `utf-8` trên trang của mình để tránh bất kỳ vấn đề tiềm ẩn nào trong các trình duyệt khác.

### Thử nghiệm với mã hóa ký tự

Để thử điều này, hãy xem lại mẫu HTML đơn giản mà bạn đã có được trong phần trước về `<title>` (trang [title-example.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/title-example.html)), thử thay đổi giá trị charset meta thành `ISO-8859-1`, và thêm tiếng Nhật vào trang. Đây là mã chúng tôi đã sử dụng:

```html
<p>Japanese example: ご飯が熱い。</p>
```

### Thêm tác giả và mô tả

Nhiều phần tử `<meta>` bao gồm các thuộc tính `name` và `content`:

- `name` chỉ định loại phần tử meta; loại thông tin nào nó chứa.
- `content` chỉ định nội dung meta thực tế.

Hai phần tử meta như vậy hữu ích để đưa vào trang của bạn để định nghĩa tác giả của trang và cung cấp mô tả súc tích về trang. Hãy xem một ví dụ:

```html
<meta name="author" content="Chris Mills" />
<meta
  name="description"
  content="The MDN Web Docs Learning Area aims to provide
complete beginners to the Web with all they need to know to get
started with developing websites and applications." />
```

Chỉ định tác giả có lợi theo nhiều cách: hữu ích khi bạn muốn hiểu ai đã viết trang, nếu bạn có bất kỳ câu hỏi nào về nội dung và bạn muốn liên hệ với họ. Một số hệ thống quản lý nội dung có các cơ sở để tự động trích xuất thông tin tác giả trang và làm cho nó có sẵn cho các mục đích như vậy.

Chỉ định mô tả bao gồm các từ khóa liên quan đến nội dung của trang của bạn hữu ích vì nó có tiềm năng làm cho trang của bạn xuất hiện cao hơn trong các tìm kiếm liên quan được thực hiện trong các công cụ tìm kiếm (các hoạt động như vậy được gọi là [Tối ưu hóa Công cụ Tìm kiếm](/en-US/docs/Glossary/SEO), hoặc {{glossary("SEO")}}.)

### Khám phá việc sử dụng mô tả trong các công cụ tìm kiếm

Mô tả cũng được sử dụng trên các trang kết quả công cụ tìm kiếm. Hãy thực hiện một bài tập để khám phá điều này:

1. Truy cập [trang chủ của Mozilla Developer Network](/en-US/).
2. Xem nguồn của trang (nhấp chuột phải vào trang, chọn _View Page Source_ từ menu ngữ cảnh.)
3. Tìm thẻ meta mô tả. Nó sẽ trông giống như thế này (mặc dù nó có thể thay đổi theo thời gian):

   ```html
   <meta
     name="description"
     content="The MDN Web Docs site
     provides information about Open Web technologies
     including HTML, CSS, and APIs for both websites and
     progressive web apps." />
   ```

4. Bây giờ tìm kiếm "MDN Web Docs" trong công cụ tìm kiếm yêu thích của bạn (Chúng tôi đã sử dụng Google.) Bạn sẽ nhận thấy nội dung `<meta>` mô tả và phần tử `<title>` được sử dụng trong kết quả tìm kiếm — chắc chắn đáng để có!

   ![Kết quả tìm kiếm Yahoo cho "Mozilla Developer Network"](mdn-search-result.png)

> [!NOTE]
> Trong Google, bạn sẽ thấy một số trang phụ liên quan của MDN Web Docs được liệt kê bên dưới liên kết trang chủ chính — chúng được gọi là sitelinks, và có thể cấu hình trong [công cụ quản trị web của Google](https://search.google.com/search-console/about?hl=en) — một cách để làm cho kết quả tìm kiếm trang web của bạn tốt hơn trong công cụ tìm kiếm Google.

> [!NOTE]
> Nhiều tính năng `<meta>` không còn được sử dụng nữa. Ví dụ, phần tử `<meta>` từ khóa (`<meta name="keywords" content="fill, in, your, keywords, here">`) — được cho là cung cấp các từ khóa cho các công cụ tìm kiếm để xác định sự liên quan của trang đó với các thuật ngữ tìm kiếm khác nhau — bị các công cụ tìm kiếm bỏ qua, vì các spammer chỉ điền danh sách từ khóa với hàng trăm từ khóa, làm lệch kết quả.

### Các loại siêu dữ liệu khác

Khi bạn duyệt web, bạn sẽ tìm thấy các loại siêu dữ liệu khác. Nhiều tính năng bạn sẽ thấy trên các trang web là các sáng tạo độc quyền được thiết kế để cung cấp cho các trang web nhất định (như các trang mạng xã hội) thông tin cụ thể mà họ có thể sử dụng.

Ví dụ, [Open Graph Data](https://ogp.me/) là một giao thức siêu dữ liệu mà Facebook đã phát minh để cung cấp siêu dữ liệu phong phú hơn cho các trang web. Trong mã nguồn MDN Web Docs, bạn sẽ tìm thấy điều này:

```html
<meta
  property="og:image"
  content="https://developer.mozilla.org/mdn-social-share.png" />
<meta
  property="og:description"
  content="The Mozilla Developer Network (MDN) provides
information about Open Web technologies including HTML, CSS, and APIs for both websites
and HTML Apps." />
<meta property="og:title" content="Mozilla Developer Network" />
```

Một tác dụng của điều này là khi bạn liên kết đến MDN Web Docs trên Facebook, liên kết xuất hiện cùng với hình ảnh và mô tả: trải nghiệm phong phú hơn cho người dùng.

![Dữ liệu giao thức open graph từ trang chủ MDN như được hiển thị trên facebook, hiển thị hình ảnh, tiêu đề và mô tả.](facebook-output.png)

## Thêm biểu tượng tùy chỉnh vào trang web của bạn

Để làm phong phú thêm thiết kế trang web của bạn, bạn có thể thêm các tham chiếu đến các biểu tượng tùy chỉnh trong siêu dữ liệu của mình, và chúng sẽ được hiển thị trong một số ngữ cảnh nhất định. Phổ biến nhất trong số này là **favicon** (viết tắt của "favorites icon", đề cập đến việc sử dụng trong danh sách "favorites" hoặc "bookmarks" trong trình duyệt).

Favicon khiêm tốn đã tồn tại nhiều năm. Đây là biểu tượng đầu tiên thuộc loại này: một biểu tượng vuông 16 pixel được sử dụng ở nhiều nơi. Bạn có thể thấy (tùy thuộc vào trình duyệt) favicon được hiển thị trong tab trình duyệt chứa mỗi trang đang mở, và bên cạnh các trang được đánh dấu trong bảng đánh dấu.

Một favicon có thể được thêm vào trang của bạn bằng cách:

1. Lưu nó ở định dạng được hỗ trợ như `.ico`, `.gif`, hoặc `.png` ở đâu đó bên trong cấu trúc thư mục trang web của bạn.
2. Thêm phần tử {{htmlelement("link")}} vào khối {{HTMLElement("head")}} của HTML, tham chiếu đến đường dẫn đến tệp favicon:

   ```html
   <link rel="icon" href="/favicon.ico" type="image/x-icon" />
   ```

> [!NOTE]
> Trong ví dụ này, đường dẫn đến tệp favicon bắt đầu bằng `/`, có nghĩa là "tìm tệp trong thư mục cấp cao nhất (hoặc _gốc_) của trang web của bạn". Điều này có thể ở một nơi khác trong mã nguồn, tùy thuộc vào hệ thống bạn đang sử dụng để tạo trang web: các framework web thường dành một thư mục đặc biệt cho các tệp trong gốc trang web, như `static` hoặc `public`.
>
> Đừng lo lắng quá nhiều về sự phức tạp của đường dẫn tệp cho bây giờ; bạn sẽ tìm hiểu thêm về chúng sau này (xem [Giới thiệu nhanh về URL và đường dẫn](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links#a_quick_primer_on_urls_and_paths) nếu bạn tò mò).
>
> Hầu hết các trình duyệt và ứng dụng phần mềm ngày nay tự động sử dụng tệp `favicon.ico` được tìm thấy ở gốc trang web như favicon, vì vậy nhiều trang web thậm chí không bận tâm đến việc bao gồm phần tử `<link>`. Một phần tử tường minh vẫn hữu ích trong trường hợp bạn muốn đặt tệp favicon của mình ở nơi khác.

Đây là ví dụ về favicon trong bảng đánh dấu:

![Bảng đánh dấu Firefox, hiển thị một ví dụ được đánh dấu với favicon được hiển thị bên cạnh nó.](bookmark-favicon.png)

Bạn cũng có thể muốn bao gồm các biểu tượng khác nhau cho các ngữ cảnh khác nhau. Ví dụ:

```html
<link rel="icon" href="/favicon-48x48.[some hex hash].png" />
<link rel="apple-touch-icon" href="/apple-touch-icon.[some hex hash].png" />
```

Đây là cách làm cho trang web hiển thị biểu tượng khi được lưu vào màn hình chính của thiết bị Apple. Bạn thậm chí có thể muốn cung cấp các biểu tượng khác nhau cho các thiết bị khác nhau, để đảm bảo rằng biểu tượng trông đẹp trên tất cả các thiết bị. Ví dụ:

```html
<!-- iPad Pro with high-resolution Retina display: -->
<link
  rel="apple-touch-icon"
  sizes="167x167"
  href="/apple-touch-icon-167x167.png" />
<!-- 3x resolution iPhone: -->
<link
  rel="apple-touch-icon"
  sizes="180x180"
  href="/apple-touch-icon-180x180.png" />
<!-- non-Retina iPad, iPad mini, etc.: -->
<link
  rel="apple-touch-icon"
  sizes="152x152"
  href="/apple-touch-icon-152x152.png" />
<!-- 2x resolution iPhone and other devices: -->
<link rel="apple-touch-icon" href="/apple-touch-icon-120x120.png" />
<!-- basic favicon -->
<link rel="icon" href="/favicon.ico" />
```

Các chú thích giải thích những gì mỗi biểu tượng được sử dụng cho — những phần tử này bao gồm những thứ như cung cấp biểu tượng độ phân giải cao để sử dụng khi trang web được lưu vào màn hình chính của iPad.

Đừng lo lắng quá nhiều về việc triển khai tất cả các loại biểu tượng này ngay bây giờ — đây là tính năng khá nâng cao, và bạn sẽ không được kỳ vọng có kiến thức về điều này để tiến bộ qua khóa học. Mục đích chính ở đây là để bạn biết những thứ đó là gì, trong trường hợp bạn gặp chúng khi duyệt mã nguồn của các trang web khác. Nếu bạn muốn tìm hiểu thêm về tất cả các giá trị này và cách chọn chúng, hãy đọc trang tham chiếu của phần tử {{HTMLElement("link")}}.

## Áp dụng CSS và JavaScript vào HTML

Hầu như tất cả các trang web bạn sẽ sử dụng trong thời hiện đại sẽ dùng {{glossary("CSS")}} để làm cho chúng trông đẹp, và {{glossary("JavaScript")}} để cung cấp chức năng tương tác, như trình phát video, bản đồ, trò chơi, v.v. Chúng thường được áp dụng vào trang web bằng cách sử dụng phần tử {{htmlelement("link")}} và phần tử {{htmlelement("script")}}, tương ứng.

- Phần tử {{htmlelement("link")}} luôn nên đặt trong phần head của tài liệu. Nó nhận hai thuộc tính, `rel="stylesheet"`, cho biết đây là stylesheet của tài liệu, và `href`, chứa đường dẫn đến tệp stylesheet:

  ```html
  <link rel="stylesheet" href="my-css-file.css" />
  ```

- Phần tử {{htmlelement("script")}} cũng nên đặt vào phần head, và nên bao gồm thuộc tính `src` chứa đường dẫn đến JavaScript bạn muốn tải, và `defer` (một [thuộc tính boolean](/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax#boolean_attributes)), cho hướng dẫn trình duyệt tải JavaScript sau khi trang đã phân tích xong HTML. Thuộc tính `defer` hữu ích vì nó đảm bảo HTML đã được tải đầy đủ trước khi JavaScript chạy để bạn không gặp lỗi do JavaScript cố gắng truy cập phần tử HTML chưa tồn tại trên trang. Có [một số cách](/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript#script_loading_strategies) để xử lý việc tải JavaScript trên trang của bạn, nhưng đây là cách đáng tin cậy nhất để sử dụng cho các trình duyệt hiện đại.

  ```html
  <script src="my-js-file.js" defer></script>
  ```

  > [!NOTE]
  > Phần tử `<script>` có thể trông giống như {{glossary("void element")}}, nhưng thực ra không phải, và vì vậy cần có thẻ đóng. Thay vì trỏ đến tệp script bên ngoài, bạn cũng có thể chọn đặt script của mình bên trong phần tử `<script>`.

### Đến lượt bạn: Áp dụng CSS và JavaScript vào trang

1. Để bắt đầu bài tập này, hãy lấy một bản sao của các tệp [meta-example.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/meta-example.html), [script.js](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/script.js) và [style.css](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/style.css), và lưu chúng trên máy tính cục bộ trong cùng một thư mục. Hãy đảm bảo chúng được lưu với tên và phần mở rộng tệp đúng.
2. Mở tệp HTML trong cả trình duyệt và trình soạn thảo văn bản của bạn.
3. Bằng cách làm theo thông tin được cung cấp ở trên, thêm các phần tử {{htmlelement("link")}} và {{htmlelement("script")}} vào HTML của bạn, để CSS và JavaScript của bạn được áp dụng vào HTML.

Nếu thực hiện đúng, khi bạn lưu HTML và làm mới trình duyệt, bạn có thể thấy rằng mọi thứ đã thay đổi:

![Ví dụ hiển thị một trang với CSS và JavaScript được áp dụng. CSS đã làm cho trang trở nên xanh lá cây, trong khi JavaScript đã thêm một danh sách động vào trang.](js-and-css.png)

- JavaScript đã thêm một danh sách rỗng vào trang. Bây giờ khi bạn nhấp vào bất kỳ đâu ngoài danh sách, một hộp thoại sẽ bật lên yêu cầu bạn nhập một số văn bản cho mục danh sách mới. Khi bạn nhấn nút OK, một mục danh sách mới sẽ được thêm vào danh sách chứa văn bản. Khi bạn nhấp vào một mục danh sách hiện có, một hộp thoại sẽ bật lên cho phép bạn thay đổi văn bản của mục.
- CSS đã làm cho nền trở nên xanh lá cây, và văn bản trở nên lớn hơn. Nó cũng đã tạo kiểu cho một số nội dung mà JavaScript đã thêm vào trang (thanh màu đỏ với viền đen là kiểu CSS đã thêm vào danh sách được tạo bởi JS.)

> [!NOTE]
> Nếu bạn bị kẹt trong bài tập này và không thể áp dụng CSS/JS, hãy thử xem trang ví dụ [css-and-js.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/css-and-js.html) của chúng tôi.

## Đặt ngôn ngữ chính của tài liệu

Cuối cùng, đáng đề cập rằng bạn có thể (và thực sự nên) đặt ngôn ngữ của trang. Điều này có thể được thực hiện bằng cách thêm [thuộc tính lang](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) vào thẻ HTML mở (như được thấy trong [meta-example.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/the-html-head/meta-example.html) và được hiển thị bên dưới.)

```html
<html lang="en-US">
  …
</html>
```

Điều này hữu ích theo nhiều cách. Tài liệu HTML của bạn sẽ được lập chỉ mục hiệu quả hơn bởi các công cụ tìm kiếm nếu ngôn ngữ của nó được đặt (cho phép nó xuất hiện đúng trong kết quả theo ngôn ngữ cụ thể, ví dụ), và nó hữu ích cho những người khiếm thị sử dụng trình đọc màn hình (ví dụ, từ "six" tồn tại trong cả tiếng Pháp và tiếng Anh, nhưng được phát âm khác nhau.)

Bạn cũng có thể đặt các phần của tài liệu để được nhận dạng là các ngôn ngữ khác nhau. Ví dụ, chúng ta có thể đặt phần ngôn ngữ tiếng Nhật để được nhận dạng là tiếng Nhật, như sau:

```html
<p>Japanese example: <span lang="ja">ご飯が熱い。</span>.</p>
```

Các mã này được định nghĩa bởi tiêu chuẩn [ISO 639-1](https://en.wikipedia.org/wiki/ISO_639-1). Bạn có thể tìm hiểu thêm về chúng trong [Language tags in HTML and XML](https://www.w3.org/International/articles/language-tags/).

## Tóm tắt

Điều đó đánh dấu kết thúc chuyến tham quan nhanh của chúng ta về phần head HTML — có nhiều thứ hơn bạn có thể làm ở đây, nhưng một chuyến tham quan toàn diện sẽ nhàm chán và gây nhầm lẫn ở giai đoạn này, và chúng tôi chỉ muốn cung cấp cho bạn ý tưởng về những thứ phổ biến nhất mà bạn sẽ tìm thấy ở đây hiện tại! Trong bài viết tiếp theo, chúng ta sẽ xem xét [Tiêu đề và đoạn văn trong HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs).

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Basic_HTML_syntax", "Learn_web_development/Core/Structuring_content/Headings_and_paragraphs", "Learn_web_development/Core/Structuring_content")}}
