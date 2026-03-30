---
title: Cú pháp HTML cơ bản
slug: Learn_web_development/Core/Structuring_content/Basic_HTML_syntax
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Structuring_content/Webpage_metadata", "Learn_web_development/Core/Structuring_content")}}

Trong bài viết này, chúng tôi đề cập đến những kiến thức cơ bản của HTML, bao gồm thuật ngữ, cú pháp và cấu trúc. Trong quá trình đó, bạn sẽ hoàn thành một số thử thách tương tác để làm quen với việc viết HTML cơ bản.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software">Đã cài đặt phần mềm cơ bản</a>, và kiến thức cơ bản về <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files">làm việc với tệp</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Cấu trúc của một phần tử HTML — phần tử, thẻ mở, nội dung, thẻ đóng, thuộc tính.</li>
          <li>Phần body của HTML và mục đích của nó như một vùng chứa cho nội dung trang.</li>
          <li>Phần tử void là gì, và chúng khác với các phần tử khác như thế nào.</li>
          <li>Sự cần thiết của doctype ở đầu tài liệu HTML, bao gồm mục đích ban đầu dự định của nó, và thực tế là bây giờ nó là một tàn tích lịch sử.</li>
          <li>Hiểu rằng HTML cần được lồng vào nhau đúng cách.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## HTML là gì?

{{glossary("HTML")}} (HyperText Markup Language) là một _ngôn ngữ đánh dấu_ cho trình duyệt web biết cách cấu trúc các trang web bạn truy cập. HTML bao gồm một loạt các {{glossary("Element", "phần tử")}}, mà bạn sử dụng để bao bọc, gói, hoặc _đánh dấu_ các phần nội dung khác nhau để làm cho nó xuất hiện hoặc hoạt động theo một cách nhất định. Các {{glossary("Tag", "thẻ")}} bao bọc có thể tạo nội dung thành siêu liên kết để liên kết đến trang khác, in nghiêng các từ, v.v. Ví dụ, hãy xem xét dòng văn bản sau:

```plain
My cat is very grumpy
```

Chúng ta có thể chỉ định rằng văn bản này là một đoạn văn bằng cách bao bọc nó trong các thẻ đoạn văn ({{htmlelement("p")}}):

```html
<p>My cat is very grumpy</p>
```

Hoặc, chúng ta có thể chỉ định rằng văn bản này là tiêu đề cấp cao nhất bằng cách bao bọc nó trong các thẻ [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements):

```html
<h1>My cat is very grumpy</h1>
```

HTML tồn tại bên trong các tệp văn bản được gọi là **tài liệu HTML**, hoặc chỉ là **tài liệu**, với phần mở rộng tệp `.html`. Khi trước đây chúng ta đã nói về các trang web, một tài liệu HTML chứa nội dung của trang web và chỉ định cấu trúc của nó.

Tệp HTML phổ biến nhất mà bạn sẽ gặp là `index.html`, thường được sử dụng để chứa nội dung trang chủ của trang web. Cũng thường gặp các thư mục con chứa các tệp `index.html` riêng của chúng, vì vậy một trang web có thể có nhiều tệp index ở các nơi khác nhau.

> [!NOTE]
> Các thẻ trong HTML không phân biệt chữ hoa chữ thường. Điều này có nghĩa là chúng có thể được viết bằng chữ hoa hoặc chữ thường. Ví dụ, thẻ {{htmlelement("title")}} có thể được viết là `<title>`, `<TITLE>`, `<Title>`, `<TiTlE>`, v.v., và nó sẽ hoạt động. Tuy nhiên, thực hành tốt nhất là viết tất cả các thẻ bằng chữ thường để nhất quán và dễ đọc.

## Cấu trúc của một phần tử HTML

Hãy khám phá thêm về phần tử đoạn văn từ phần trước:

![Một đoạn mã mẫu minh họa cấu trúc của một phần tử html.<p> My cat is very grumpy </p>.](grumpy-cat-small.png)

Phần tử hoàn chỉnh của chúng ta bao gồm:

- **Thẻ mở:** Bao gồm tên của phần tử (trong ví dụ này, _p_ cho đoạn văn), được bao bọc trong các dấu ngoặc nhọn mở và đóng. Thẻ mở này đánh dấu nơi phần tử bắt đầu hoặc bắt đầu có hiệu lực. Trong ví dụ này, nó đứng trước phần đầu của văn bản đoạn văn.
- **Nội dung:** Đây là nội dung của phần tử. Trong ví dụ này, đó là văn bản đoạn văn — "My cat is very grumpy".
- **Thẻ đóng:** Giống như thẻ mở, ngoại trừ nó có dấu gạch chéo trước tên phần tử. Đây là dấu hiệu kết thúc phần tử. Không bao gồm thẻ đóng là lỗi phổ biến của người mới bắt đầu có thể gây ra kết quả kỳ lạ.

> [!NOTE]
> Hãy ghé thăm scrim [HTML tags](https://scrimba.com/learn-html-and-css-c0p/~02?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> của đối tác học tập Scrimba để có giải thích tương tác về các thẻ HTML.

### Tạo phần tử HTML đầu tiên của bạn

Hãy để bạn thực hành viết các phần tử HTML của riêng bạn:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Bao bọc dòng văn bản với các thẻ `<em>` và `</em>`. Để _mở phần tử_, đặt thẻ mở (`<em>`) ở đầu dòng. Để _đóng phần tử_, đặt thẻ đóng (`</em>`) ở cuối dòng. Làm điều này nên định dạng văn bản được hiển thị dưới dạng chữ nghiêng.
3. Nếu bạn cảm thấy táo bạo, hãy thử nghiên cứu một số [phần tử HTML khác](/en-US/docs/Web/HTML/Reference/Elements) và áp dụng chúng vào ví dụ văn bản.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___basic_html_1
This is my text.
```

{{ EmbedLiveSample('basic_html_1', "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Dòng HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<em>This is my text.</em>
```

</details>

### Lồng các phần tử

Các phần tử có thể được đặt bên trong các phần tử khác. Điều này được gọi là _lồng nhau_. Nếu chúng ta muốn nêu rằng con mèo của chúng ta **rất** cáu kỉnh, chúng ta có thể bao bọc từ _very_ trong phần tử {{htmlelement("strong")}}, phần tử này cho từ đó định dạng văn bản mạnh (hơn):

```html
<p>My cat is <strong>very</strong> grumpy.</p>
```

Trong khối mã này, văn bản "My cat is very grumpy." đều được định nghĩa là một đoạn văn. Từ "very" còn được định nghĩa là có tầm quan trọng mạnh.

Có cách đúng và cách sai để lồng nhau. Trong khối mã trên, chúng ta mở phần tử `<p>` trước, sau đó mở phần tử `<strong>`. Để lồng nhau đúng cách, chúng ta đóng phần tử `<strong>` trước, sau đó đóng `<p>`.

Sau đây là ví dụ về cách lồng nhau _sai_:

```html-nolint example-bad
<p>My cat is <strong>very grumpy.</p></strong>
```

**Các thẻ phải mở và đóng sao cho chúng nằm bên trong hoặc bên ngoài nhau**. Vì các phần tử chồng lên nhau trong khối mã trước, trình duyệt phải đoán ý định của bạn. Kiểu đoán này có thể dẫn đến kết quả không mong muốn.

### Phần tử void

Không phải tất cả các phần tử đều theo mẫu thẻ mở, nội dung, sau đó thẻ đóng. Một số phần tử bao gồm một thẻ duy nhất, thường được sử dụng để chèn/nhúng gì đó vào tài liệu. Các phần tử như vậy được gọi là {{glossary("void element", "phần tử void")}}, có nghĩa là "phần tử không thể chứa nội dung HTML khác".

Ví dụ, phần tử {{htmlelement("br")}} chèn một dấu ngắt dòng vào một dòng văn bản, khiến nó bị ngắt thành nhiều dòng:

```html live-sample___void-example
<p>
  This is a single paragraph, but we are going to <br />break it onto two lines.
</p>
```

Điều này hiển thị như sau:

{{ EmbedLiveSample('void-example', "100%", 100) }}

> [!NOTE]
> Trong một số ví dụ HTML, bạn sẽ thấy `/` được thêm vào cuối thẻ của phần tử void, ví dụ `<br />`. Đây là kiểu cú pháp đánh dấu khác, không sai, nhưng "dấu gạch chéo đóng" này là không cần thiết.

## Thuộc tính

Các phần tử cũng có thể có thuộc tính. Các thuộc tính trông như thế này:

![thẻ đoạn văn với thuộc tính 'class="editor-note"' được nhấn mạnh](grumpy-cat-attribute-small.png)

Các thuộc tính chứa thông tin bổ sung về phần tử không phải là một phần nội dung của nó. Thuộc tính **`class`** cung cấp một tên nhận dạng có thể được sử dụng để nhắm mục tiêu phần tử với các kiểu (CSS) hoặc thông tin kịch bản (JavaScript).

Một thuộc tính nên có:

- Một khoảng trắng giữa nó và tên phần tử. Khi một phần tử có nhiều hơn một thuộc tính, các thuộc tính cũng nên được ngăn cách bởi các khoảng trắng.
- Tên thuộc tính, theo sau là dấu bằng (`=`).
- Giá trị thuộc tính, được bao bọc với dấu nháy mở và đóng.

### Thêm thuộc tính vào một phần tử

Bây giờ đến lượt bạn thực hành. Trong phần này, bạn sẽ khám phá phần tử {{htmlelement("img")}}, được sử dụng để hiển thị hình ảnh trên trang. Phần tử `<img>` có thể nhận nhiều thuộc tính, bao gồm:

- `src`: Thuộc tính **bắt buộc** chỉ định {{glossary("URL")}} (địa chỉ web) của hình ảnh. Ví dụ: `src="https://mdn.github.io/shared-assets/images/examples/fx-nightly-512.png"`.
- `alt`: Chỉ định mô tả văn bản để mô tả hình ảnh cho những người không thể nhìn thấy nó. Ví dụ: `alt="The Firefox Nightly icon"`. Thuộc tính này không bắt buộc về mặt kỹ thuật, nhưng bạn thực sự nên cung cấp mô tả văn bản cho tất cả các hình ảnh truyền đạt ý nghĩa (trái ngược với việc thuần túy trang trí).
- `width`: Chỉ định chiều rộng của hình ảnh theo pixel. Ví dụ: `width="300"`.
- `height`: Chỉ định chiều cao của hình ảnh theo pixel. Ví dụ: `height="300"`.

Làm theo các bước dưới đây để hoàn thành nhiệm vụ:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Tìm hình ảnh yêu thích của bạn trực tuyến, nhấp chuột phải vào nó và nhấn _Sao chép Liên kết/Địa chỉ Hình ảnh_. Ngoài ra, hãy sao chép URL hình ảnh ở trên.
3. Quay lại MDN Playground, thêm thuộc tính `src` vào phần tử `<img>` và đặt giá trị của nó thành URL từ Bước 2.
4. Đặt thuộc tính `alt` thành mô tả phù hợp của hình ảnh.
5. Đặt thuộc tính `width` thành giá trị ví dụ như `300` để bạn có thể thấy hình ảnh tốt hơn một chút bên trong bảng đầu ra. Điều chỉnh giá trị nếu cần.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___basic_html_2
<img />
```

{{ EmbedLiveSample('basic_html_2', "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Phần tử HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<img
  src="https://mdn.github.io/shared-assets/images/examples/fx-nightly-512.png"
  alt="A description of the image"
  width="300" />
```

</details>

### Thuộc tính Boolean

Đôi khi bạn sẽ thấy các thuộc tính HTML được viết mà không có giá trị. Chúng được gọi là [Thuộc tính Boolean](/en-US/docs/Glossary/Boolean/HTML). Khi một thuộc tính boolean được thêm vào, giá trị của nó được đặt thành `true`, bất kể giá trị nào được gán cho nó (ngay cả khi không có giá trị). Nếu một thuộc tính không được đưa vào trong thẻ HTML, giá trị của nó được đặt thành `false`.

Ví dụ, hãy xem xét thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/input#disabled), mà bạn có thể gán cho các phần tử {{htmlelement("input")}} biểu mẫu để ngăn người dùng nhập dữ liệu vào chúng. Ví dụ:

```html live-sample___boolean-example
<label for="first-input">This input is disabled</label>
<input id="first-input" type="text" disabled="disabled" />
<br />
```

Viết tắt là, chấp nhận viết thuộc tính `disabled` mà không có giá trị:

```html live-sample___boolean-example
<label for="second-input">This input is also disabled</label>
<input id="second-input" type="text" disabled />
<br />
```

Để tham khảo, hãy cũng cung cấp một phần tử `<input>` không bị vô hiệu hóa để bạn có thể so sánh và đối chiếu (lưu ý cách các đầu vào `disabled` bị mờ đi một chút trong kết xuất bên dưới):

```html live-sample___boolean-example
<label for="third-input">This input isn't disabled; you can type into it</label>
<input id="third-input" type="text" />
```

Các đoạn HTML trên hiển thị như sau:

{{ EmbedLiveSample('boolean-example', "100%", 100) }}

> [!NOTE]
> Các phần tử {{htmlelement("label")}} được đưa vào trong mã trên cung cấp cách liên kết các nhãn mô tả với các phần tử biểu mẫu. Chúng tôi đưa chúng vào vì đây là thực hành tốt nhất, và để cung cấp sự phân tách giữa các đầu vào biểu mẫu.

### Bỏ dấu nháy xung quanh giá trị thuộc tính

Có thể bỏ dấu nháy xung quanh giá trị thuộc tính trong một số trường hợp nhất định. Nhưng vì điều này có thể phá vỡ đánh dấu của bạn trong các trường hợp khác, chúng tôi khuyên bạn **luôn** bao gồm dấu nháy. Hãy khám phá lý do tại sao.

Phần tử trong đoạn mã bên dưới, {{htmlelement("a")}}, được gọi là **neo**. Neo bao bọc văn bản và biến chúng thành liên kết. Thuộc tính `href` chỉ định URL mà liên kết trỏ đến. Bạn có thể bỏ dấu nháy xung quanh giá trị thuộc tính `href` hiển thị bên dưới mà không có hậu quả tiêu cực, vì nó không có khoảng trắng:

```html
<a href=https://www.mozilla.org/>favorite website</a>
```

Tuy nhiên, bạn sẽ gặp vấn đề khi bỏ dấu nháy khỏi các giá trị thuộc tính _có_ khoảng trắng. Hãy xem xét thuộc tính `title` hiển thị bên dưới, cung cấp mô tả về trang được liên kết ("The Mozilla homepage") sẽ xuất hiện như tooltip khi liên kết được di chuột qua.

```html-nolint example-bad live-sample___bad-no-quotes
<a href=https://www.mozilla.org/ title=The Mozilla homepage>favorite website</a>
```

Vì dấu nháy không được đưa vào xung quanh giá trị thuộc tính `title`, trình duyệt diễn giải nó là ba thuộc tính: thuộc tính `title` với giá trị `The`, và hai thuộc tính Boolean — `Mozilla` và `homepage`. Rõ ràng, đây không phải là ý định của chúng ta! Nếu bạn đang sử dụng thiết bị có con trỏ chuột, bạn có thể thử di chuột qua liên kết để xem tooltip tiêu đề (nó sẽ cho bạn "The" thay vì "The Mozilla homepage" dự định).

{{ EmbedLiveSample('bad-no-quotes', 700, 100) }}

Luôn bao gồm dấu nháy xung quanh giá trị thuộc tính. Nó tránh lỗi và hành vi không mong muốn, và dẫn đến mã dễ đọc hơn.

### Dấu nháy đơn hay dấu nháy đôi?

Trong bài viết này, chúng tôi đã bao bọc tất cả các giá trị thuộc tính trong dấu nháy đôi. Tuy nhiên, bạn có thể thấy dấu nháy đơn được sử dụng trong một số mã HTML. Đây là vấn đề về phong cách. Bạn có thể thoải mái chọn loại nào bạn thích. Cả hai dòng này đều tương đương nhau:

```html-nolint
<a href='https://www.example.com'>A link to my example.</a>

<a href="https://www.example.com">A link to my example.</a>
```

Đảm bảo bạn không trộn lẫn dấu nháy đơn và dấu nháy đôi. Ví dụ dưới đây trộn lẫn dấu nháy, điều này sẽ dẫn đến lỗi vì theo trình duyệt, giá trị thuộc tính `href` chưa kết thúc:

```html-nolint example-bad
<a href="https://www.example.com'>A link to my example.</a>
```

Nếu bạn sử dụng một loại dấu nháy, bạn có thể bao gồm loại dấu nháy kia _bên trong_ giá trị thuộc tính của mình. Điều này hoạt động tốt:

```html
<a href="https://www.example.com" title="Isn't this fun?">
  A link to my example.
</a>
```

Để sử dụng dấu nháy bên trong các dấu nháy khác cùng loại (dấu nháy đơn hoặc dấu nháy đôi), bạn có thể sử dụng [tham chiếu ký tự](#character_references_including_special_characters_in_html). Ví dụ, điều này sẽ bị lỗi:

```html-nolint example-bad
<a href="https://www.example.com" title="An "interesting" reference">A link to my example.</a>
```

Thay vào đó, bạn cần làm điều này:

```html-nolint
<a href="https://www.example.com" title="An &quot;interesting&quot; reference">A link to my example.</a>
```

## Cấu trúc của một tài liệu HTML

Các phần tử HTML riêng lẻ không hữu ích lắm khi đứng một mình. Tiếp theo, hãy kiểm tra cách các phần tử riêng lẻ kết hợp để tạo thành toàn bộ trang HTML.

Ví dụ sau là một trang web hoàn chỉnh rất đơn giản:

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

Các phần của ví dụ này như sau:

1. `<!doctype html>`: Doctype. Khi HTML còn non trẻ (1991-1992), các doctype được thiết kế để hoạt động như các liên kết đến một bộ quy tắc mà trang HTML phải tuân theo để được coi là HTML tốt. Các doctype từng trông như thế này:

   ```html
   <!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   ```

   Trong thời hiện đại, doctype là một tàn tích lịch sử cần được đưa vào để mọi thứ khác hoạt động đúng. `<!doctype html>` là chuỗi ký tự ngắn nhất có giá trị là doctype hợp lệ, và nó nên được đưa vào đầu của tất cả các trang web. Đó là tất cả những gì bạn cần biết!

2. `<html></html>`: Phần tử {{htmlelement("html")}}. Phần tử này bao bọc tất cả nội dung trên trang. Nó đôi khi được gọi là phần tử gốc.
3. `<head></head>`: Phần tử {{htmlelement("head")}}. Phần tử này hoạt động như một vùng chứa thông tin về trang mà _không_ phải là phần nội dung mà người dùng sẽ thấy. Điều này có thể bao gồm các từ khóa và mô tả trang để hiển thị trong kết quả tìm kiếm, CSS để tạo kiểu nội dung, khai báo bộ ký tự, v.v. Bạn sẽ tìm hiểu thêm về phần head của trang trong bài viết tiếp theo.
4. `<meta charset="utf-8">`: Phần tử {{htmlelement("meta")}}. Phần tử này biểu diễn siêu dữ liệu mô tả trang. Thuộc tính [`charset`](/en-US/docs/Web/HTML/Reference/Elements/meta#charset) chỉ định mã hóa ký tự mà tài liệu của bạn sẽ sử dụng. UTF-8 bao gồm hầu hết các ký tự từ đại đa số các ngôn ngữ viết của con người, điều này có nghĩa là trang sẽ có thể hiển thị các ngôn ngữ khác nhau thành công. Không có lý do gì để không đặt điều này, và nó có thể giúp tránh một số vấn đề sau này.
5. `<title></title>`: Phần tử {{htmlelement("title")}}. Điều này đặt tiêu đề của trang, là tiêu đề xuất hiện trong tab trình duyệt mà trang được tải vào. Tiêu đề trang cũng được sử dụng để mô tả trang khi nó được đánh dấu sao.
6. `<body></body>`: Phần tử {{htmlelement("body")}}. Phần tử này chứa _tất cả_ nội dung hiển thị trên trang, bao gồm văn bản, hình ảnh, video, trò chơi, bản nhạc có thể phát, v.v.

### Thêm một số tính năng vào tài liệu HTML

Tại thời điểm này, chúng tôi muốn bạn thực hành viết một số nội dung HTML đáng kể hơn một chút. Để làm điều này, bạn có một vài tùy chọn — bạn có thể tạo HTML trên máy tính cục bộ của mình, hoặc sử dụng MDN Playground như trong các ví dụ trước.

#### Thiết lập ví dụ

- Để thực hiện trên máy cục bộ của bạn:
  1. Sao chép ví dụ trang HTML được liệt kê trong phần trước và dán nó vào một tệp mới trong trình soạn thảo mã của bạn. Bạn cũng có thể tìm [mẫu HTML cơ bản](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) này trên kho GitHub của chúng tôi.
  2. Thực hiện các thay đổi cho trang được phác thảo trong [hướng dẫn](#example_instructions).
  3. Lưu tệp dưới dạng `index.html` rồi tải nó trong tab trình duyệt mới để xem kết quả.
- Để thực hiện trong MDN Playground, nhấp **"Play"** trong bảng đầu ra bên dưới để chỉnh sửa ví dụ, sau đó làm theo [hướng dẫn](#example_instructions). Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground.

```html hidden live-sample___basic_html_3
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

{{ EmbedLiveSample('basic_html_3', "100%", 60) }}

#### Hướng dẫn ví dụ

Đây là các hướng dẫn cần làm theo:

1. Ngay bên dưới thẻ mở của phần tử {{htmlelement("body")}}, thêm tiêu đề chính cho tài liệu. Nó nên được bao bọc bởi các thẻ mở và đóng `<h1></h1>`.
2. Chỉnh sửa nội dung đoạn văn để bao gồm văn bản về một chủ đề mà bạn thấy thú vị.
3. Làm cho các từ quan trọng nổi bật bằng chữ đậm bằng cách bao bọc chúng bên trong phần tử {{htmlelement("strong")}}.
4. Thêm hai liên kết vào đoạn văn của bạn. Điều này được thực hiện bằng cách sử dụng phần tử {{htmlelement("a")}}.
5. Thêm một hình ảnh vào tài liệu của bạn bên dưới đoạn văn như [đã giải thích trước đó](#adding_attributes_to_an_element). Nếu quá lớn để xem, hãy thêm thuộc tính `width` để thu nhỏ nó lại.

Nếu bạn thực sự bị kẹt, bạn có thể xem một giải pháp tiềm năng ở đây:

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Nội dung của phần thân phần tử HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<h1>Some music</h1>
<p>
  I really enjoy <strong>playing the drums</strong>. One of my favorite drummers
  is Neal Peart, who used to play in the band
  <a href="https://en.wikipedia.org/wiki/Rush_%28band%29">Rush</a>. My favorite
  Rush album is currently
  <a href="https://www.deezer.com/album/942295">Moving Pictures</a>.
</p>
<img
  src="https://www.cygnus-x1.net/links/rush/images/albums/sectors/sector2-movingpictures-cover-s.jpg"
  alt="Rush Moving Pictures album cover"
  width="300" />
```

</details>

## Khoảng trắng trong HTML

Trong các ví dụ trước, chúng tôi đã bao gồm nhiều khoảng trắng trong mã. Trong hầu hết các trường hợp, điều này hoàn toàn tùy chọn, và được đưa vào chủ yếu để làm cho mã dễ đọc hơn. Ví dụ, hai đoạn mã này tương đương:

```html-nolint live-sample___whitespace-example
<p id="noWhitespace">Dogs are silly.</p>

<p id="whitespace">Dogs
    are
        silly.</p>
```

Cả hai đều hiển thị hoàn toàn giống nhau:

{{ EmbedLiveSample('whitespace-example', 700, 100) }}

Trong hầu hết tất cả các phần tử (có ngoại lệ như {{htmlelement("pre")}}), bất kể bạn sử dụng bao nhiêu khoảng trắng bên trong nội dung phần tử HTML, trình phân tích cú pháp HTML giảm mỗi chuỗi khoảng trắng xuống một khoảng trắng duy nhất khi hiển thị mã.

Bạn có thể chọn kiểu định dạng mã ưa thích. Thông thường, người ta thường cung cấp cho mỗi phần tử lồng nhau thêm hai khoảng trắng so với phần tử nó nằm bên trong; đây là kiểu chúng tôi sử dụng trên MDN.

Ví dụ:

```html
<section>
  <div>
    <p>A paragraph of content.</p>
  </div>
</section>
```

## Tham chiếu ký tự: bao gồm các ký tự đặc biệt trong HTML

Trong HTML, các ký tự `<`, `>`, `"`, `'`, và `&` là các ký tự đặc biệt. Chúng là các phần của cú pháp HTML. Vậy làm thế nào để bạn bao gồm các ký tự đặc biệt này trong văn bản của mình? Ví dụ, làm thế nào bạn có thể sử dụng dấu và ký tự thực sự hoặc dấu nhỏ hơn trong nội dung của bạn mà không bị hiểu là mã?

Bạn làm điều này với {{glossary("character reference", "tham chiếu ký tự")}}. Đây là các mã đặc biệt đại diện cho các ký tự, để được sử dụng trong các trường hợp chính xác này. Mỗi tham chiếu ký tự bắt đầu bằng dấu và (&), và kết thúc bằng dấu chấm phẩy (;).

| Ký tự thực | Tham chiếu ký tự tương đương |
| ---------- | ---------------------------- |
| <          | `&lt;`                       |
| >          | `&gt;`                       |
| "          | `&quot;`                     |
| '          | `&apos;`                     |
| &          | `&amp;`                      |

Các tham chiếu ký tự khá dễ nhớ vì văn bản họ sử dụng là từ viết tắt của tên ký tự — ví dụ "lt" = "less than" (nhỏ hơn), "quot" = "quotation" (trích dẫn), và "amp" = "ampersand" (dấu và). Để tìm hiểu thêm về tham chiếu thực thể, xem [Danh sách tham chiếu thực thể ký tự XML và HTML](https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references) (Wikipedia).

Trong ví dụ bên dưới, có hai đoạn văn:

```html-nolint live-sample___entity-ref-example
<p>In HTML, you define a paragraph using the <p> element.</p>

<p>In HTML, you define a paragraph using the &lt;p&gt; element.</p>
```

Điều này hiển thị như sau:

{{ EmbedLiveSample('entity-ref-example', 700, 150) }}

Bạn có thể thấy đoạn văn đầu tiên bị lỗi, vì trình duyệt đã hiểu phiên bản thứ hai của `<p>` là bắt đầu một đoạn văn mới. Đoạn văn thứ hai hiển thị tốt vì các dấu ngoặc nhọn của nội dung "&lt;p&gt;" được biểu diễn bởi các tham chiếu ký tự.

> [!NOTE]
> Bạn không cần sử dụng tham chiếu thực thể cho bất kỳ ký hiệu nào khác, vì các trình duyệt hiện đại sẽ xử lý các ký hiệu thực tế tốt miễn là [mã hóa ký tự của HTML được đặt thành UTF-8](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#specifying_your_documents_character_encoding).

## Chú thích HTML

HTML có cơ chế để viết chú thích trong mã. Các trình duyệt bỏ qua chú thích, do đó chúng vô hình với người dùng. Mục đích của chú thích là để cho phép bạn bao gồm các ghi chú trong mã để giải thích cách nó hoạt động. Điều này rất hữu ích nếu bạn quay lại một cơ sở mã sau khi không xem xét nó đủ lâu đến mức bạn không nhớ nó, hoặc nếu ai đó khác bắt đầu làm việc với nó mà chưa từng thấy nó trước đây.

Để viết một chú thích HTML, hãy bao bọc nó trong các dấu đặc biệt `<!--` và `-->`, như được hiển thị bên dưới:

```html live-sample___comment-example
<p>I'm not inside a comment</p>

<!-- <p>I am!</p> -->
```

Mã này hiển thị như sau:

{{ EmbedLiveSample('comment-example', 700, 100) }}

Chỉ đoạn văn đầu tiên được hiển thị trong đầu ra trực tiếp; dòng thứ hai không được hiển thị vì đó là chú thích HTML.

## Tóm tắt

Bạn đã đến cuối bài viết! Chúng tôi hy vọng bạn thích chuyến tham quan của mình về những kiến thức cơ bản của HTML.

Tại thời điểm này, bạn nên hiểu HTML trông như thế nào và nó hoạt động ở mức độ cơ bản như thế nào. Bạn cũng nên có thể viết một vài phần tử và thuộc tính. Các bài viết tiếp theo của mô-đun này đi sâu hơn về một số chủ đề được giới thiệu ở đây, cũng như trình bày các chủ đề bổ sung.

> [!NOTE]
> Khi bạn bắt đầu tìm hiểu thêm về HTML, hãy cân nhắc học cả những kiến thức cơ bản về [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), ngôn ngữ được sử dụng để tạo kiểu cho các trang web (ví dụ: thay đổi màu sắc, phông chữ và khoảng cách). HTML và CSS được sử dụng cùng nhau trên hầu hết các trang web, và học chúng cùng một lúc có thể hiệu quả.

{{NextMenu("Learn_web_development/Core/Structuring_content/Webpage_metadata", "Learn_web_development/Core/Structuring_content")}}
