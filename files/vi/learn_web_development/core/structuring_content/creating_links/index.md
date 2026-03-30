---
title: Tạo liên kết
slug: Learn_web_development/Core/Structuring_content/Creating_links
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Structuring_documents", "Learn_web_development/Core/Structuring_content/Test_your_skills/Links", "Learn_web_development/Core/Structuring_content")}}

Liên kết (còn được gọi là siêu liên kết) thực sự quan trọng — chúng là điều tạo nên Web _là một web_.
Bài viết này cho thấy cú pháp cần thiết để tạo liên kết và thảo luận về các thực hành tốt nhất về liên kết.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >. Ngữ nghĩa cấp văn bản như <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs"
          >tiêu đề và đoạn văn</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists"
          >danh sách</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu tại sao liên kết là tính năng cơ bản của web. Không có web mà không có liên kết.</li>
          <li>Thuộc tính <code>href</code>.</li>
          <li>Đường dẫn tuyệt đối và tương đối, và khi nào nên sử dụng chúng.</li>
          <li>Cú pháp đường dẫn chi tiết — dấu gạch chéo, dấu chấm đơn và dấu chấm đôi.</li>
          <li>Trạng thái liên kết và tại sao chúng quan trọng — <code>:hover</code>, <code>:focus</code>, <code>:visited</code> và <code>:active</code>.</li>
          <li>Liên kết nội tuyến và cấp khối.</li>
          <li>Hiểu lợi ích của việc viết văn bản liên kết tốt, chẳng hạn như khả năng tiếp cận tốt hơn cho người dùng trình đọc màn hình và hiệu ứng SEO tích cực tiềm năng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Siêu liên kết là gì?

Siêu liên kết là các tính năng của tài liệu HTML mà khi được nhấp hoặc kích hoạt theo cách khác, khiến trình duyệt điều hướng đến các tài liệu hoặc tài nguyên khác, đôi khi là các phần cụ thể của tài liệu.
Siêu liên kết là một trong những đổi mới thú vị nhất mà Web có thể cung cấp.
Chúng đã là một tính năng của Web từ đầu và là điều tạo nên Web _là một web._
Mỗi tài nguyên trên web có một địa chỉ, được gọi là {{glossary("URL")}} (Uniform Resource Locator), mà siêu liên kết trỏ đến.

> [!NOTE]
> URL có thể trỏ đến các tệp HTML, tệp văn bản, hình ảnh, tài liệu văn bản, tệp video và âm thanh, hoặc bất cứ thứ gì khác tồn tại trên Web.
> Nếu trình duyệt web không biết cách hiển thị hoặc xử lý tệp, nó sẽ hỏi bạn có muốn mở tệp không (trong trường hợp đó, nhiệm vụ mở hoặc xử lý tệp được chuyển giao cho ứng dụng gốc phù hợp trên thiết bị) hoặc tải xuống tệp (trong trường hợp đó bạn có thể cố gắng xử lý nó sau).

Ví dụ, trang chủ BBC chứa nhiều liên kết không chỉ trỏ đến nhiều câu chuyện tin tức, mà còn đến các khu vực khác nhau của trang web (chức năng điều hướng), trang đăng nhập/đăng ký (công cụ người dùng), v.v.

![trang chủ của bbc.co.uk, hiển thị nhiều mục tin tức và chức năng menu điều hướng](updated-bbc-website.png)

## Cấu trúc của một liên kết

Một liên kết cơ bản được tạo bằng cách bao bọc văn bản hoặc nội dung khác bên trong phần tử {{htmlelement("a")}} và sử dụng thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href), còn được gọi là **Tham chiếu Siêu văn bản**, hoặc **đích**, chứa địa chỉ web.

```html
<p>
  I'm creating a link to
  <a href="https://www.mozilla.org/en-US/">the Mozilla homepage</a>.
</p>
```

Điều này cho chúng ta kết quả sau:

Tôi đang tạo liên kết đến [trang chủ Mozilla](https://www.mozilla.org/en-US/).

> [!NOTE]
> Scrim [Anchor tags](https://scrimba.com/learn-html-and-css-c0p/~0a?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> của Scrimba cung cấp minh chứng tương tác về cách tạo liên kết bằng HTML, cộng với một thử thách để bạn tạo liên kết của riêng mình.

### Liên kết cấp khối

Như đã đề cập trước đó, hầu như bất kỳ nội dung nào cũng có thể được tạo thành liên kết, ngay cả {{Glossary("Block/CSS", "phần tử cấp khối")}}.
Nếu bạn muốn làm cho phần tử tiêu đề thành liên kết thì hãy bao bọc nó trong phần tử neo (`<a>`) như được hiển thị trong đoạn mã sau:

```html
<a href="https://developer.mozilla.org/en-US/">
  <h1>MDN Web Docs</h1>
</a>
<p>
  Documenting web technologies, including CSS, HTML, and JavaScript, since 2005.
</p>
```

Điều này biến tiêu đề thành liên kết:
{{EmbedLiveSample('Block level links', '100%', 150)}}

### Liên kết hình ảnh

Để biến hình ảnh thành liên kết, hãy bao bọc phần tử {{htmlelement("img")}} với phần tử {{htmlelement("a")}}. Ví dụ dưới đây sử dụng đường dẫn tương đối để tham chiếu đến tệp hình ảnh SVG được lưu trữ cục bộ.

```css hidden
img {
  height: 100px;
  width: 150px;
  border: 1px solid gray;
}
```

```html
<a href="https://developer.mozilla.org/en-US/">
  <img src="mdn_logo.svg" alt="MDN Web Docs" />
</a>
```

Điều này làm cho logo MDN trở thành liên kết:
{{EmbedLiveSample('Image links', '100%', 150)}}

> [!NOTE]
> Bạn sẽ tìm hiểu thêm về việc sử dụng hình ảnh trên Web trong một bài viết tương lai.

### Thêm thông tin hỗ trợ với thuộc tính title

Bạn cũng có thể muốn thêm thuộc tính `title` vào liên kết của mình.
Tiêu đề chứa thông tin bổ sung về liên kết, chẳng hạn như loại thông tin trang chứa, hoặc những điều cần lưu ý trên trang web.

```html
<p>
  I'm creating a link to
  <a
    href="https://www.mozilla.org/en-US/"
    title="The best place to find more information about Mozilla's mission and how to contribute">
    the Mozilla homepage</a
  >.
</p>
```

Điều này cho chúng ta kết quả sau và di chuột qua liên kết sẽ hiển thị tiêu đề dưới dạng tooltip:

{{EmbedLiveSample('Adding supporting information with the title attribute', '100%', 150)}}

> [!NOTE]
> Tiêu đề liên kết chỉ được tiết lộ khi di chuột qua, điều đó có nghĩa là những người dựa vào điều khiển bàn phím hoặc màn hình cảm ứng để điều hướng các trang web sẽ gặp khó khăn khi truy cập thông tin tiêu đề.
> Nếu thông tin của tiêu đề thực sự quan trọng đối với khả năng sử dụng của trang, thì bạn nên trình bày nó theo cách có thể tiếp cận được với tất cả người dùng, ví dụ như đặt nó trong văn bản thông thường.

### Tạo các liên kết ví dụ của riêng bạn

OK, bây giờ đến lượt bạn!

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground, hoặc tạo bản sao của [mẫu bắt đầu](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) của chúng tôi và sao chép mã bên dưới vào đó.
2. Liên kết văn bản "Red squirrel" và "Eastern gray squirrel" đến các trang Wikipedia mô tả các loài liên quan. Cung cấp cho mỗi liên kết thuộc tính `title` bằng tên khoa học của loài.
3. Liên kết văn bản "Wikipedia Squirrel page" đến trang Wikipedia chính về sóc.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___links-1
<h1>Squirrels</h1>

<p>
  Squirrels are commonly thought of as tree-dwelling mammals, but the squirrel
  family extends far beyond that to include ground-dwelling rodents such as
  chipmunks and prairie dogs, and flying squirrels.
</p>

<p>Two of the most common and best-known squirrel species are the:</p>

<ul>
  <li>Red squirrel</li>
  <li>Eastern gray squirrel</li>
</ul>

<p>
  For a good starting point on squirrel information, see the Wikipedia Squirrel
  page.
</p>
```

{{ EmbedLiveSample('links-1', "100%", 280) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<h1>Squirrels</h1>

<p>
  Squirrels are commonly thought of as tree-dwelling mammals, but the squirrel
  family extends far beyond that to include ground-dwelling rodents such as
  chipmunks and prairie dogs, and flying squirrels.
</p>

<p>Two of the most common and best-known squirrel species are the:</p>

<ul>
  <li>
    <a
      href="https://en.wikipedia.org/wiki/Red_squirrel"
      title="Sciurus vulgaris">
      Red squirrel
    </a>
  </li>
  <li>
    <a
      href="https://en.wikipedia.org/wiki/Eastern_gray_squirrel"
      title="Sciurus carolinensis">
      Eastern gray squirrel
    </a>
  </li>
</ul>

<p>
  For a good starting point on squirrel information, see the
  <a href="https://en.wikipedia.org/wiki/Squirrel">Wikipedia Squirrel page</a>.
</p>
```

</details>

## Giới thiệu nhanh về URL và đường dẫn

Đích liên kết là các URL. URL, hay Uniform Resource Locator, là một chuỗi văn bản xác định nơi một thứ gì đó nằm trên Web. Ví dụ, trang chủ tiếng Anh của Mozilla nằm tại `https://www.mozilla.org/en-US/`.

Một [máy chủ web](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server) nhận các yêu cầu cho các URL và phản hồi bằng tài nguyên phù hợp. Hầu hết các tài nguyên được lưu trữ dưới dạng tệp trên hệ thống tệp của máy chủ, vì vậy các URL cho các tài nguyên này thường giống như các đường dẫn tệp.

> [!NOTE]
> Đường dẫn tệp và URL không giống nhau, nhưng hiện tại, chúng tôi sẽ nói về chúng như thể chúng là như nhau để thuận tiện cho việc hiểu. Chúng tôi sẽ thảo luận thêm về sự khác biệt trong phần [URL dịch thành đường dẫn tệp như thế nào?](#how_do_urls_translate_into_file_paths).

Hãy xem một cấu trúc thư mục máy chủ ví dụ:

![Một cấu trúc thư mục đơn giản. Thư mục cha được gọi là creating-hyperlinks và chứa hai tệp được gọi là index.html và contacts.html, và hai thư mục được gọi là projects và pdfs, trong đó chứa tệp index.html và project-brief.pdf, tương ứng](simple-directory.png)

**Gốc** của cấu trúc thư mục này được gọi là `creating-hyperlinks`. Khi làm việc cục bộ với trang web, bạn sẽ có một thư mục chứa toàn bộ trang. Bên trong **gốc**, chúng ta có tệp `index.html` và `contacts.html`. Trong một trang web thực, `index.html` sẽ là trang chủ hoặc trang đích của chúng ta (một trang web đóng vai trò là điểm vào cho một trang web hoặc một phần cụ thể của trang web).

Cũng có hai thư mục bên trong gốc của chúng ta — `pdfs` và `projects`. Mỗi cái có một tệp đơn bên trong — PDF (`project-brief.pdf`) và tệp `index.html`, tương ứng. Lưu ý rằng bạn có thể có nhiều tệp `index.html` trong một dự án, miễn là chúng ở các vị trí hệ thống tệp khác nhau. `index.html` thứ hai có thể là trang đích chính cho thông tin liên quan đến dự án.

Hãy xem một số ví dụ về liên kết giữa một số tệp khác nhau trong cấu trúc thư mục này để minh chứng các loại đường dẫn khác nhau.

### Cùng thư mục

Nếu bạn muốn bao gồm siêu liên kết bên trong `index.html` cấp cao nhất trỏ đến `contacts.html`, bạn có thể chỉ định đường dẫn chỉ là tên tệp bạn muốn liên kết đến, vì nó ở trong cùng thư mục với tệp hiện tại. URL bạn sẽ sử dụng là `contacts.html`:

```html
<p>
  Want to contact a specific staff member? Find details on our
  <a href="contacts.html">contacts page</a>.
</p>
```

Bạn cũng có thể bắt đầu đường dẫn đến tệp trong cùng thư mục bằng cách sử dụng dấu chấm đơn theo sau dấu gạch chéo: `./`. Ví dụ sau tương đương với ví dụ trước, nhưng một số người thích bao gồm `./` vì họ cảm thấy nó cung cấp sự rõ ràng hơn:

```html
<p>
  Want to contact a specific staff member? Find details on our
  <a href="./contacts.html">contacts page</a>.
</p>
```

> [!NOTE]
> Có một số trường hợp trong đó việc bao gồm `./` trong đường dẫn của bạn sẽ tạo ra sự khác biệt, ví dụ khi chỉ định đường dẫn cho các lần nhập [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules), nhưng bạn không cần lo lắng về điều này cho các liên kết HTML và CSS tĩnh.

### Di chuyển xuống các thư mục con

Nếu bạn muốn bao gồm siêu liên kết bên trong `index.html` cấp cao nhất trỏ đến `projects/index.html`, bạn cần đi xuống thư mục `projects` trước khi chỉ định tệp bạn muốn liên kết đến. Điều này được thực hiện bằng cách chỉ định tên thư mục, sau đó dấu gạch chéo, sau đó tên tệp. URL bạn có thể sử dụng là `projects/index.html`:

```html
<p>Visit my <a href="projects/index.html">project homepage</a>.</p>
```

### Di chuyển lên các thư mục cha

Nếu bạn muốn bao gồm siêu liên kết bên trong `projects/index.html` trỏ đến `pdfs/project-brief.pdf`, bạn phải đi lên một cấp thư mục, sau đó trở lại thư mục `pdfs`. Để đi lên một thư mục, bạn sử dụng hai dấu chấm — `..` — vì vậy URL là `../pdfs/project-brief.pdf`:

```html
<p>A link to my <a href="../pdfs/project-brief.pdf">project brief</a>.</p>
```

> [!NOTE]
> Bạn có thể kết hợp nhiều phiên bản của các tính năng này thành các đường dẫn phức tạp, nếu cần, ví dụ: `../../../complex/path/to/my/file.html`.

### Liên kết tương đối với thư mục gốc

Các URL trên hoạt động, nhưng hãy lưu ý rằng nếu bạn di chuyển tệp liên kết hoặc tệp được liên kết đến vị trí khác, bạn sẽ phá vỡ liên kết.

Nếu bạn muốn tạo liên kết đến một vị trí cụ thể sẽ không bị phá vỡ nếu bạn di chuyển tệp liên kết, bạn có thể làm như vậy bằng cách đặt một dấu gạch chéo duy nhất ở đầu đường dẫn — điều này cho biết đường dẫn bắt đầu từ thư mục gốc của trang. Ví dụ, liên kết trước đó bên trong `projects/index.html` có thể được viết lại thành:

```html
<p>A link to my <a href="/pdfs/project-brief.pdf">project brief</a>.</p>
```

Bây giờ đường dẫn sẽ luôn bắt đầu từ thư mục gốc (`creating-hyperlinks`), đi đến thư mục `pdfs`, và tìm tệp `project-brief.pdf`. Điều này vẫn sẽ hoạt động nếu bạn di chuyển tệp liên kết đến vị trí khác, ví dụ `a/b/c/d/e/index.html`.

Nếu bạn di chuyển tệp `project-brief.pdf` được liên kết đến vị trí khác, bạn vẫn sẽ phá vỡ liên kết.

Hai thuật ngữ bạn sẽ gặp trên web là **đường dẫn tuyệt đối** và **đường dẫn tương đối**.

- Đường dẫn tuyệt đối: Trỏ đến một vị trí được xác định bởi vị trí tuyệt đối của nó trong trang web (hoặc nơi khác trên web). Ví dụ, bạn có thể tạo liên kết tuyệt đối luôn trỏ đến cùng một vị trí tương đối với thư mục gốc trang web bằng cách sử dụng dấu gạch chéo đơn ở đầu đường dẫn, như chúng ta đã thấy trước đó: `/pdfs/project-brief.pdf`.
- Đường dẫn tương đối: Trỏ đến một vị trí _tương đối_ với tệp bạn đang liên kết từ. Trong ví dụ trước của chúng ta, chúng ta đã sử dụng `projects/index.html` để tạo liên kết tương đối giữa tệp hiện tại và một tệp được gọi là `index.html` nằm trong thư mục con `projects`. Nếu bạn di chuyển tệp hiện tại đến vị trí khác, đường dẫn vẫn sẽ tương đối với tệp đó, nhưng nó sẽ trỏ đến vị trí tuyệt đối khác.

Các thuật ngữ này không phải lúc nào cũng được sử dụng nhất quán. Ví dụ, `/pdfs/project-brief.pdf` là tuyệt đối đối với vị trí tệp hiện tại, nhưng tương đối với [tên miền](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name). URL bao gồm tên miền đầy đủ, chẳng hạn như `https://example.com/pdfs/project-brief.pdf`, là tuyệt đối đối với toàn bộ web.

### Liên kết với URL đầy đủ

Bạn có thể chỉ định URL đầy đủ là đường dẫn, điều này sẽ luôn trỏ đến cùng một vị trí trên web, bất kể nó được sử dụng ở đâu. Ví dụ:

```html
<a href="https://www.example.com/projects/">projects</a>
```

Liên kết này sẽ luôn liên kết đến `https://www.example.com/projects/`, ngay cả khi trang web của bạn được chuyển đến tên miền khác.

### Liên kết nội bộ và bên ngoài

Khi liên kết trỏ đến tài nguyên trên _trang web của bạn_, nó được gọi là **liên kết nội bộ**. Khi liên kết trỏ đến tài nguyên trên _trang web khác_, nó được gọi là **liên kết bên ngoài**.

Khi chỉ định liên kết bên ngoài, bạn luôn phải bao gồm URL đầy đủ là đường dẫn, ví dụ:

```html
<a href="https://www.some-other-site.com">projects</a>
```

Bạn không thể tham chiếu đến vị trí trên trang web khác với đường dẫn như `/pdfs/project-brief.pdf` hoặc `projects/index.html`, vì chúng đều tương đối với vị trí trên trang web của riêng bạn, và trình duyệt cần tên miền của trang web để có thể tìm thấy nó.

Khi chỉ định liên kết nội bộ, bạn có thể sử dụng đường dẫn tương đối hoặc tuyệt đối, hoặc URL đầy đủ. Trong ví dụ của chúng ta, các liên kết này tương đương:

```html
<a href="https://www.example.com/projects/">projects</a>

<a href="projects">projects</a>
```

Chúng tôi khuyên nên sử dụng cái sau không có tên miền đầy đủ, vì tính di động. Như chúng tôi đã nói trước đó, nếu bạn chỉ định `https://www.example.com/projects/`, nó sẽ luôn liên kết đến `https://www.example.com/projects/`. Nếu sau đó bạn chuyển trang web của mình sang tên miền khác, ví dụ `another-example.com`, tất cả các liên kết URL đầy đủ của bạn sẽ cần phải thay đổi. Nếu bạn chỉ định các đường dẫn như `/projects`, chúng vẫn sẽ hoạt động, vì chúng vẫn tương đối với cấu trúc thư mục.

### Đoạn tài liệu

Có thể liên kết đến một phần cụ thể của tài liệu HTML, được gọi là **đoạn tài liệu**, thay vì chỉ đến đầu tài liệu.
Các phần tử có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) trong tài liệu tự động tạo ra một đoạn tài liệu có thể được liên kết đến.

Trường hợp sử dụng điển hình nhất là liên kết đến tiêu đề cụ thể, trông như thế này:

```html
<h2 id="mailing_address">Mailing address</h2>
```

Để liên kết đến `id` cụ thể đó, bạn bao gồm nó ở cuối đường dẫn, trước đó là ký hiệu hash/pound (`#`), ví dụ:

```html
<p>
  Want to write us a letter? Use our
  <a href="contacts.html#mailing_address">mailing address</a>.
</p>
```

Bạn thậm chí có thể sử dụng tham chiếu đoạn tài liệu một mình để liên kết đến _phần khác của tài liệu hiện tại_:

```html
<p>
  The <a href="#mailing_address">company mailing address</a> can be found at the
  bottom of this page.
</p>
```

### URL dịch thành đường dẫn tệp như thế nào?

Tất cả các đích liên kết chúng ta đã thấy cho đến nay đều là _URL_, được xử lý bởi máy chủ web để tìm tài nguyên liên quan.
**Không có nội dung web nào có thể trực tiếp nhìn thấy hệ thống tệp của máy chủ.**

Ví dụ máy chủ mà chúng ta đã xem xét cho đến nay tạo ra một [trang web tĩnh](/en-US/docs/Glossary/SSG).
Máy chủ chỉ lấy phần [pathname](/en-US/docs/Web/API/URL/pathname) của URL và trực tiếp tìm kiếm tệp tương ứng trong hệ thống tệp của nó.

> [!NOTE]
> Nhiều máy chủ tạo ra nội dung cho URL ngay lập tức thay vì lấy nó từ tệp tĩnh. Nếu bạn sử dụng [web framework](/en-US/docs/Learn_web_development/Core/Frameworks_libraries), thư mục mã nguồn của bạn cũng có thể rất khác với những gì được triển khai lên máy chủ. Khi làm việc với trang web của riêng bạn, bạn cần hiểu các công cụ xây dựng và thiết lập máy chủ để biết cách URL được ánh xạ đến các tệp nguồn của bạn.

Nếu chúng ta khởi động một máy chủ web (xem [Làm thế nào để thiết lập máy chủ kiểm tra cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server)) sử dụng thư mục trang web mẫu của chúng ta làm gốc, và {{glossary("domain name")}} của trang web được đặt thành `example.com`, tệp `pdfs/project-brief.pdf` của chúng ta sẽ có sẵn tại `https://www.example.com/pdfs/project-brief.pdf`.

Tất cả các liên kết được giải quyết tương đối với URL của tài liệu hiện tại, vì vậy:

- Đối với tất cả các trang trên miền `https://example.com`, một liên kết đến `/pdfs/project-brief.pdf` luôn tạo ra liên kết đến `https://www.example.com/pdfs/project-brief.pdf`, có tên đường dẫn là `/pdfs/project-brief.pdf`. Máy chủ tìm kiếm thư mục `pdfs` trong thư mục gốc, sau đó tìm kiếm tệp `project-brief.pdf` bên trong thư mục đó.
- Một liên kết đến `projects/index.html` sẽ tạo ra liên kết đến `https://www.example.com/projects/index.html`, nhưng chỉ khi được bao gồm trong một tệp bên trong thư mục gốc, chẳng hạn như tệp `index.html` cấp cao nhất, hoặc `contacts.html`. Nếu bạn bao gồm nó, ví dụ, bên trong tệp HTML tại `pdfs/index.html`, nó sẽ liên kết đến `https://www.example.com/pdfs/projects/index.html`, có tên đường dẫn là `/pdfs/projects/index.html`, không tồn tại, vì vậy bạn sẽ kết thúc với liên kết bị hỏng.

#### Trang `index.html` mặc định

Khi tham chiếu đến tệp `index.html`, bạn thường không cần bao gồm `index.html` trong URL/đường dẫn, vì các máy chủ web tìm kiếm trang đích mặc định được gọi là `index.html` khi tên tệp không được chỉ định.

Nhìn lại ví dụ đường dẫn `projects/index.html` của chúng ta, chúng ta có thể chỉ viết đường dẫn là `projects`, và điều này sẽ tạo ra liên kết đến `https://www.example.com/projects/index.html`. Khi điều hướng đến trang, chúng ta có thể viết URL là `https://www.example.com/projects/` và nó vẫn sẽ đưa chúng ta đến đúng nơi.

> [!NOTE]
> Dấu gạch chéo kéo dài (`/`) ở cuối URL rất quan trọng. Với nó, một liên kết tương đối đến `contacts.html` bên trong `projects/index.html` sẽ giải quyết thành `https://www.example.com/projects/contacts.html` (cùng thư mục). Nếu không có nó, URL sẽ được coi là tệp, và liên kết tương đối sẽ giải quyết thành `https://www.example.com/contacts.html` (một thư mục trên).
>
> [Các máy chủ web khác nhau xử lý URL như `https://www.example.com/projects` theo cách khác nhau](https://github.com/slorber/trailing-slash-guide) — một số tự động chuyển hướng đến URL có dấu gạch chéo kéo dài, trong khi một số phục vụ cùng `index.html` mà không chuyển hướng. Hành vi sau có thể phá vỡ các liên kết tương đối.

## Các thực hành tốt nhất về liên kết

Có một số thực hành tốt nhất cần làm theo khi viết liên kết. Hãy xem xét những điều này bây giờ.

### Sử dụng cách diễn đạt liên kết rõ ràng

Dễ dàng để ném các liên kết lên trang của bạn. Điều đó là chưa đủ. Chúng ta cần làm cho các liên kết của mình _có thể tiếp cận_ với tất cả người đọc, bất kể ngữ cảnh hiện tại và các công cụ họ ưa thích. Ví dụ:

- Người dùng trình đọc màn hình thích nhảy từ liên kết đến liên kết trên trang và đọc các liên kết ngoài ngữ cảnh.
- Các công cụ tìm kiếm sử dụng văn bản liên kết để lập chỉ mục các tệp đích, vì vậy bạn nên bao gồm các từ khóa trong văn bản liên kết để mô tả hiệu quả những gì đang được liên kết đến.
- Người đọc thị giác lướt qua trang thay vì đọc từng từ, và mắt của họ sẽ bị thu hút bởi các tính năng trang nổi bật, như liên kết. Họ sẽ thấy văn bản liên kết mô tả hữu ích.

Hãy xem một ví dụ cụ thể:

**Văn bản liên kết tốt**: [Download Firefox](https://www.firefox.com/en-US/?redirect_source=firefox-com)

```html example-good
<p><a href="https://www.firefox.com/en-US/">Download Firefox</a></p>
```

<!-- markdownlint-disable descriptive-link-text -->

**Văn bản liên kết xấu**: [Click here](https://www.firefox.com/en-US/) to download Firefox

```html example-bad
<p>
  <a href="https://www.firefox.com/en-US/">Click here</a> to download Firefox
</p>
```

<!-- markdownlint-enable descriptive-link-text -->

Các mẹo khác:

- Đừng lặp lại URL như một phần của văn bản liên kết — URL trông xấu và nghe còn xấu hơn khi trình đọc màn hình đọc chúng từng chữ cái.
- Đừng nói "link" hoặc "links to" trong văn bản liên kết — đó chỉ là tiếng ồn. Các trình đọc màn hình cho mọi người biết có liên kết.
  Người đọc thị giác cũng sẽ biết có liên kết, vì các liên kết thường được tạo kiểu bằng màu khác và gạch chân (quy ước này thường không nên bị phá vỡ, vì người dùng đã quen với nó).
- Giữ văn bản liên kết ngắn nhất có thể — điều này hữu ích vì trình đọc màn hình cần diễn giải toàn bộ văn bản liên kết.
- Giảm thiểu các trường hợp nhiều bản sao của cùng một văn bản được liên kết đến các nơi khác nhau.
  Điều này có thể gây vấn đề cho người dùng trình đọc màn hình, nếu có danh sách liên kết ngoài ngữ cảnh được gán nhãn "click here", "click here", "click here".

### Liên kết đến tài nguyên không phải HTML — để lại dấu hiệu rõ ràng

Khi liên kết đến tài nguyên sẽ không được mở trong trang hiện tại như "điều hướng bình thường", bạn nên thêm cách diễn đạt rõ ràng vào văn bản liên kết về những gì sẽ xảy ra. Ví dụ, nếu bạn đang tải xuống hoặc truyền phát tài nguyên, hoặc nếu liên kết sẽ mở một popup hoặc thực hiện một số hiệu ứng không mong muốn khác, điều này nên được nêu trong văn bản. Điều này quan trọng đối với người dùng có kết nối băng thông thấp, những người có thể muốn tránh tải xuống các tài sản nhiều megabyte. Nó cũng giúp thiết lập kỳ vọng cho người dùng trình đọc màn hình, những người có thể không biết điều gì đang xảy ra.

Hãy xem một số ví dụ để xem loại văn bản nào có thể được sử dụng ở đây:

```html
<p>
  <a href="/large-report.pdf" download>
    Download the sales report (PDF, 10MB)
  </a>
</p>

<p>
  <a href="https://www.example.com/video-stream/" target="_blank">
    Watch the video (stream opens in separate tab, HD quality)
  </a>
</p>
```

### Sử dụng thuộc tính download khi liên kết đến tải xuống

Khi bạn đang liên kết đến tài nguyên cần được tải xuống thay vì mở trong trình duyệt, bạn có thể sử dụng thuộc tính `download` để cung cấp tên tệp lưu mặc định. Đây là ví dụ với liên kết tải xuống phiên bản Windows mới nhất của Firefox:

```html
<a
  href="https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
  download="firefox-latest-64bit-installer.exe">
  Download Latest Firefox for Windows (64-bit) (English, US)
</a>
```

### Khi nào nên mở liên kết trong tab mới

Theo mặc định, các liên kết mở trong cùng tab với trang chúng đang ở, cho phép người dùng điều hướng lại trang trước bằng nút back của trình duyệt. Tuy nhiên, nhiều trang (bao gồm MDN) chọn mở một số liên kết nhất định, đặc biệt là các liên kết bên ngoài, trong tab mới. Điều này được thực hiện bằng cách đặt thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/a#target) thành `"_blank"`.

```html
Firefox is developed by the
<a href="https://www.mozilla.org/en-US/" target="_blank">Mozilla Foundation</a>.
```

Có hay không nên mở liên kết trong tab mới nên là quyết định có ý thức, dựa trên các cân nhắc thiết kế trải nghiệm người dùng. Đây là một số điều cần suy nghĩ:

- Mở liên kết trong tab mới hiển thị hai tài liệu cùng lúc, điều này hữu ích cho trải nghiệm điều hướng "song song". Mặt khác, các liên kết mở trong cùng tab giống như sự tiếp nối của trang hiện tại hơn.
- Mở liên kết trong tab mới có thể gây bối rối cho người dùng quen sử dụng nút back.
- Ngay cả khi các liên kết được mở trong cùng tab theo mặc định, người dùng vẫn có thể chọn mở chúng trong tab mới, sử dụng phím tắt hoặc tùy chọn menu ngữ cảnh. Mặt khác, các liên kết mở trong tab mới khó mở trong cùng tab.
- Người dùng trình đọc màn hình có thể bị nhầm lẫn bởi các liên kết mở trong tab mới, vì họ có thể không nhận ra rằng tab mới đã mở, và họ có thể mất ngữ cảnh về vị trí của họ trên trang.

Một cách tiếp cận phổ biến là mở các liên kết bên ngoài trong tab mới và các liên kết nội bộ trong cùng tab.
Một số nhà thiết kế thích mở tất cả các liên kết trong cùng tab.
Nếu bạn mở các liên kết trong tab mới, thì nên cung cấp các dấu hiệu cho các liên kết này, chẳng hạn như biểu tượng bên cạnh văn bản liên kết.

## Tạo menu điều hướng

Đối với bài tập này, chúng tôi muốn bạn liên kết một số trang lại với nhau với menu điều hướng để tạo trang web nhiều trang. Đây là một cách phổ biến để trang web được tạo ra — cùng cấu trúc trang được sử dụng trên mỗi trang, bao gồm cùng menu điều hướng, vì vậy khi các liên kết được nhấp, nó tạo ra ấn tượng rằng bạn đang ở cùng một nơi, và nội dung khác nhau được hiển thị.

Bạn sẽ cần tạo bản sao cục bộ của bốn trang sau, tất cả trong cùng một thư mục. Để có danh sách tệp đầy đủ, xem thư mục [navigation-menu-start](https://github.com/mdn/learning-area/tree/main/html/introduction-to-html/navigation-menu-start):

- [index.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/navigation-menu-start/index.html)
- [projects.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/navigation-menu-start/projects.html)
- [pictures.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/navigation-menu-start/pictures.html)
- [social.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/navigation-menu-start/social.html)

Bạn nên:

1. Thêm danh sách không có thứ tự ở vị trí được chỉ định trên một trang bao gồm các tên trang cần liên kết đến.
   Menu điều hướng thường chỉ là danh sách các liên kết, vì vậy điều này ổn về mặt ngữ nghĩa.
2. Thay đổi mỗi tên trang thành liên kết đến trang đó.
3. Sao chép menu điều hướng sang mỗi trang.
4. Trên mỗi trang, chỉ xóa liên kết đến cùng trang đó — thật nhầm lẫn và không cần thiết khi trang bao gồm liên kết đến chính nó.
   Và, sự thiếu liên kết hoạt động như lời nhắc nhở thị giác tốt về trang bạn hiện đang ở.

Ví dụ hoàn chỉnh nên trông tương tự như trang sau:

![Một ví dụ về menu điều hướng HTML đơn giản, với các mục menu home, pictures, projects và social](navigation-example.png)

> [!NOTE]
> Nếu bạn bị kẹt hoặc không chắc chắn liệu bạn có hiểu đúng không, bạn có thể kiểm tra thư mục [navigation-menu-marked-up](https://github.com/mdn/learning-area/tree/main/html/introduction-to-html/navigation-menu-marked-up) để xem câu trả lời đúng.

## Liên kết email

Có thể tạo các liên kết hoặc nút mà khi được nhấp, mở cửa sổ email gửi đi mới thay vì liên kết đến tài nguyên hoặc trang.
Điều này được thực hiện bằng cách sử dụng phần tử {{HTMLElement("a")}} và sơ đồ URL `mailto:`.

Ở dạng cơ bản và thường được sử dụng nhất, liên kết `mailto:` biểu thị địa chỉ email của người nhận dự định. Ví dụ:

```html
<a href="mailto:nowhere@mozilla.org">Send email to nowhere</a>
```

Kết quả là một liên kết trông như thế này: [Send email to nowhere](mailto:nowhere@mozilla.org).

Thực ra, địa chỉ email là tùy chọn. Nếu bạn bỏ nó và [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) của bạn là "mailto:", cửa sổ email gửi đi mới sẽ được mở bởi ứng dụng email của người dùng mà không có địa chỉ đích.
Điều này thường hữu ích như các liên kết "Chia sẻ" mà người dùng có thể nhấp để gửi email đến địa chỉ họ chọn.

### Chỉ định chi tiết

Ngoài địa chỉ email, bạn có thể cung cấp thông tin khác. Thực ra, bất kỳ trường tiêu đề thư nào cũng có thể được thêm vào URL `mailto` bạn cung cấp.
Thường được sử dụng nhất trong số này là "subject", "cc" và "body" (không phải là trường tiêu đề thực sự, nhưng cho phép bạn chỉ định tin nhắn nội dung ngắn cho email mới).
Mỗi trường và giá trị của nó được chỉ định là một thuật ngữ truy vấn.

Đây là ví dụ bao gồm cc, bcc, subject và body:

```html
<a
  href="mailto:nowhere@mozilla.org?cc=name2@rapidtables.com&bcc=name3@rapidtables.com&subject=The%20subject%20of%20the%20email&body=The%20body%20of%20the%20email">
  Send mail with cc, bcc, subject and body
</a>
```

> [!NOTE]
> Các giá trị của mỗi trường phải được mã hóa URL với các ký tự không in được (ký tự vô hình như tab, ký tự xuống dòng và ngắt trang) và dấu cách {{Glossary("Percent-encoding", "được mã hóa phần trăm")}}.
> Cũng lưu ý việc sử dụng dấu hỏi (`?`) để phân tách URL chính khỏi các giá trị trường và ký hiệu và (&) để phân tách mỗi trường trong URL `mailto:`.
> Đây là ký hiệu truy vấn URL tiêu chuẩn.
> Đọc [Phương thức GET](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data#the_get_method) để hiểu ký hiệu truy vấn URL thường được sử dụng cho mục đích gì.

Dưới đây là một vài URL `mailto` mẫu khác:

- <mailto:>
- <mailto:nowhere@mozilla.org>
- <mailto:nowhere@mozilla.org,nobody@mozilla.org>
- <mailto:nowhere@mozilla.org?cc=nobody@mozilla.org>
- <mailto:nowhere@mozilla.org?cc=nobody@mozilla.org&subject=This%20is%20the%20subject>

## Tóm tắt

Đó là tất cả về liên kết, ít nhất là bây giờ! Bạn sẽ quay lại liên kết sau trong khóa học khi bạn bắt đầu xem xét cách tạo kiểu cho chúng. Tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn hiểu và ghi nhớ thông tin chúng tôi đã cung cấp về liên kết.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Structuring_documents", "Learn_web_development/Core/Structuring_content/Test_your_skills/Links", "Learn_web_development/Core/Structuring_content")}}
