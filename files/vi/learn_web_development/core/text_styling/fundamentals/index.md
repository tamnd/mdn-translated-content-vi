---
title: Kiến thức cơ bản về tạo kiểu văn bản và phông chữ
short-title: Cơ bản về văn bản và phông chữ
slug: Learn_web_development/Core/Text_styling/Fundamentals
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Text_styling/Styling_lists", "Learn_web_development/Core/Text_styling")}}

Trong bài viết này, chúng ta sẽ bắt đầu hành trình làm chủ tạo kiểu văn bản với {{glossary("CSS")}}. Ở đây chúng ta sẽ đi qua tất cả các kiến thức cơ bản về tạo kiểu văn bản/phông chữ một cách chi tiết, bao gồm thiết lập độ đậm, họ phông, kiểu phông, cú pháp tắt phông chữ, căn chỉnh văn bản cùng các hiệu ứng khác, và khoảng cách dòng cùng khoảng cách chữ.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        > và
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu các khái niệm về họ phông, font stack, và phông chữ an toàn cho web.</li>
          <li>Thiết lập màu sắc, độ đậm, kích thước và kiểu phông chữ.</li>
          <li>Thiết lập căn chỉnh văn bản, biến đổi chữ và trang trí chữ.</li>
          <li>Thiết lập chiều cao dòng.</li>
          <li>Biết rằng có nhiều thuộc tính phông chữ và tạo kiểu văn bản khác, và được khuyến khích khám phá chúng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tạo kiểu văn bản trong CSS liên quan đến những gì?

Văn bản bên trong một phần tử được bố trí bên trong [hộp nội dung](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử đó. Nó bắt đầu từ góc trên bên trái của vùng nội dung (hoặc góc trên bên phải, trong trường hợp nội dung ngôn ngữ RTL), và chảy về phía cuối dòng. Khi đến cuối, nó xuống dòng tiếp theo và tiếp tục chảy đến cuối. Mô hình này lặp lại cho đến khi tất cả nội dung được đặt vào hộp. Nội dung văn bản hoạt động hiệu quả như một chuỗi các phần tử inline, được bố trí trên các dòng liền kề nhau, và không tạo ra xuống dòng cho đến khi đến cuối dòng, trừ khi bạn buộc xuống dòng thủ công bằng phần tử {{htmlelement("br")}}.

> [!NOTE]
> Nếu đoạn trên khiến bạn cảm thấy khó hiểu, thì không sao — hãy quay lại và xem lại bài viết [Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) của chúng ta để ôn tập lý thuyết về mô hình hộp trước khi tiếp tục.

Các thuộc tính CSS dùng để tạo kiểu văn bản thường thuộc hai loại, chúng ta sẽ xem xét riêng trong bài viết này:

- **Kiểu phông chữ**: Các thuộc tính ảnh hưởng đến phông chữ của văn bản, ví dụ: phông chữ nào được áp dụng, kích thước của nó, và liệu nó có đậm, nghiêng, v.v. không.
- **Kiểu bố cục văn bản**: Các thuộc tính ảnh hưởng đến khoảng cách và các tính năng bố cục khác của văn bản, cho phép thao tác, ví dụ: khoảng cách giữa các dòng và chữ, và cách văn bản được căn chỉnh trong hộp nội dung.

> [!NOTE]
> Hãy nhớ rằng văn bản bên trong một phần tử đều bị ảnh hưởng như một thực thể duy nhất. Bạn không thể chọn và tạo kiểu cho các phần nhỏ của văn bản trừ khi bạn bọc chúng trong một phần tử phù hợp (như {{htmlelement("span")}} hoặc {{htmlelement("strong")}}), hoặc sử dụng phần tử giả dành riêng cho văn bản như {{cssxref("::first-letter")}} (chọn chữ cái đầu tiên của văn bản trong phần tử), {{cssxref("::first-line")}} (chọn dòng đầu tiên của văn bản trong phần tử), hoặc {{cssxref("::selection")}} (chọn văn bản hiện đang được tô sáng bởi con trỏ).

## Phông chữ

Hãy đi thẳng vào xem xét các thuộc tính để tạo kiểu phông chữ. Trong ví dụ này, chúng ta sẽ áp dụng một số thuộc tính CSS cho đoạn HTML mẫu sau:

```html live-sample___0unstyled live-sample___1color live-sample___2fonts live-sample___3font-style live-sample___4shadows live-sample___5text-align live-sample___6line-height live-sample___7letter-word-spacing
<h1>Tommy the cat</h1>

<p>Well I remember it as though it were a meal ago…</p>

<p>
  Said Tommy the Cat as he reeled back to clear whatever foreign matter may have
  nestled its way into his mighty throat. Many a fat alley rat had met its
  demise while staring point blank down the cavernous barrel of this awesome
  prowling machine. Truly a wonder of nature this urban predator — Tommy the cat
  had many a story to tell. But it was a rare occasion such as this that he did.
</p>
```

### Màu sắc

Thuộc tính {{cssxref("color")}} thiết lập màu sắc của nội dung phía trước của các phần tử được chọn, thường là văn bản, nhưng cũng có thể bao gồm một vài thứ khác, chẳng hạn như đường gạch chân hoặc đường gạch trên văn bản được đặt bằng thuộc tính {{cssxref("text-decoration")}}.

`color` có thể nhận bất kỳ [đơn vị màu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#color) nào, ví dụ:

```css live-sample___1color live-sample___2fonts live-sample___3font-style live-sample___4shadows live-sample___5text-align live-sample___6line-height live-sample___7letter-word-spacing
p {
  color: red;
}
```

Điều này sẽ làm cho các đoạn văn trở thành màu đỏ, thay vì màu đen mặc định của trình duyệt, như sau:

{{ EmbedLiveSample('1color', '100%', 230) }}

### Họ phông chữ

Để thiết lập phông chữ khác cho văn bản của bạn, bạn sử dụng thuộc tính {{cssxref("font-family")}} — điều này cho phép bạn chỉ định một phông chữ (hoặc danh sách phông chữ) để trình duyệt áp dụng cho các phần tử được chọn. Trình duyệt chỉ áp dụng phông chữ nếu nó có sẵn trên máy đang truy cập trang web; nếu không, nó sẽ chỉ sử dụng [phông chữ mặc định](#default_fonts) của trình duyệt. Một ví dụ đơn giản trông như sau:

```css
p {
  font-family: "Arial";
}
```

Điều này sẽ làm cho tất cả các đoạn văn trên trang sử dụng phông chữ Arial, vốn có sẵn trên bất kỳ máy tính nào.

> [!NOTE]
> Scrimba có bài học [Web-safe fonts](https://scrimba.com/learn-html-and-css-c0p/~01r?via=mdn) <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp hướng dẫn tương tác về lý do tại sao phông chữ quan trọng, phông chữ an toàn cho web, và cách chỉ định phông chữ trong CSS — cùng với một thử thách để kiểm tra kiến thức của bạn.

#### Phông chữ an toàn cho web

Nói về tính khả dụng của phông chữ, chỉ có một số lượng nhất định các phông chữ thường có sẵn trên tất cả các hệ thống và do đó có thể được sử dụng mà không cần lo lắng nhiều. Đây là những phông chữ được gọi là **phông chữ an toàn cho web**.

Hầu hết thời gian, với tư cách là các nhà phát triển web, chúng ta muốn có quyền kiểm soát cụ thể hơn về các phông chữ được sử dụng để hiển thị nội dung văn bản của chúng ta. Vấn đề là tìm cách biết phông chữ nào có sẵn trên máy tính được dùng để xem các trang web của chúng ta. Không có cách nào để biết điều này trong mọi trường hợp, nhưng các phông chữ an toàn cho web được biết là có sẵn trên hầu hết các phiên bản của các hệ điều hành phổ biến nhất (Windows, macOS, các bản phân phối Linux phổ biến nhất, Android và iOS).

Danh sách các phông chữ an toàn cho web thực tế sẽ thay đổi khi các hệ điều hành phát triển, nhưng có thể coi các phông chữ sau là an toàn cho web, ít nhất là hiện tại (nhiều phông chữ trong số chúng đã được phổ biến nhờ sáng kiến _[Core fonts for the Web](https://en.wikipedia.org/wiki/Core_fonts_for_the_Web)_ của Microsoft vào cuối những năm 90 và đầu những năm 2000):

<table class="standard-table no-markdown">
  <thead>
    <tr>
      <th scope="col">Tên</th>
      <th scope="col">Loại chung</th>
      <th scope="col">Ghi chú</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Arial</td>
      <td>sans-serif</td>
      <td>
        Thường được coi là thực hành tốt nhất khi thêm <em>Helvetica</em> làm
        lựa chọn thay thế ưu tiên cho <em>Arial</em> vì, mặc dù mặt phông của chúng
        gần như giống hệt nhau, <em>Helvetica</em> được coi là có hình dạng đẹp hơn,
        ngay cả khi <em>Arial</em> phổ biến hơn.
      </td>
    </tr>
    <tr>
      <td>Courier New</td>
      <td>monospace</td>
      <td>
        Một số hệ điều hành có phiên bản thay thế (có thể cũ hơn) của
        phông chữ <em>Courier New</em> được gọi là <em>Courier</em>. Thực hành tốt nhất
        là sử dụng cả hai với <em>Courier New</em> làm lựa chọn ưu tiên.
      </td>
    </tr>
    <tr>
      <td>Georgia</td>
      <td>serif</td>
      <td></td>
    </tr>
    <tr>
      <td>Times New Roman</td>
      <td>serif</td>
      <td>
        Một số hệ điều hành có phiên bản thay thế (có thể cũ hơn) của
        phông chữ <em>Times New Roman</em> được gọi là <em>Times</em>. Thực hành tốt nhất
        là sử dụng cả hai với <em>Times New Roman</em> làm lựa chọn ưu tiên.
      </td>
    </tr>
    <tr>
      <td>Trebuchet MS</td>
      <td>sans-serif</td>
      <td>
        Bạn nên cẩn thận khi sử dụng phông chữ này — nó không phổ biến rộng rãi
        trên các hệ điều hành di động.
      </td>
    </tr>
    <tr>
      <td>Verdana</td>
      <td>sans-serif</td>
      <td></td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Trong số nhiều tài nguyên khác nhau, trang web [cssfontstack.com](https://www.cssfontstack.com/) duy trì danh sách các phông chữ an toàn cho web có sẵn trên các hệ điều hành Windows và macOS, có thể giúp bạn quyết định những gì bạn cho là an toàn để sử dụng.

> [!NOTE]
> Có một cách để tải xuống phông chữ tùy chỉnh cùng với một trang web, để bạn có thể tùy chỉnh việc sử dụng phông chữ theo bất kỳ cách nào bạn muốn: **phông chữ web**. Điều này phức tạp hơn một chút, và chúng ta sẽ thảo luận về nó trong một [bài viết riêng](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts) ở phần sau trong mô-đun.

#### Phông chữ mặc định

CSS định nghĩa năm tên chung cho phông chữ: `serif`, `sans-serif`, `monospace`, `cursive`, và `fantasy`. Đây là những tên rất chung chung và mặt phông thực sự được sử dụng từ những tên chung này có thể khác nhau giữa mỗi trình duyệt và mỗi hệ điều hành mà chúng được hiển thị. Nó đại diện cho _tình huống xấu nhất_ khi trình duyệt sẽ cố gắng hết sức để cung cấp một phông chữ trông phù hợp. `serif`, `sans-serif`, và `monospace` khá dự đoán được và nên cung cấp một kết quả hợp lý. Mặt khác, `cursive` và `fantasy` ít dự đoán hơn và chúng tôi khuyến nghị sử dụng chúng rất cẩn thận, kiểm tra khi bạn sử dụng.

Năm tên được định nghĩa như sau:

<table class="standard-table no-markdown">
  <thead>
    <tr>
      <th scope="col">Thuật ngữ</th>
      <th scope="col">Định nghĩa</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>serif</code></td>
      <td>
        Phông chữ có chân (những đường nét trang trí và chi tiết nhỏ khác bạn thấy
        ở cuối các nét trong một số kiểu chữ).
      </td>
      <td id="serif-example">
        <pre class="brush: html hidden">My big red elephant</pre>
        <pre class="brush: css hidden">
body {
  font-family: serif;
}</pre
        >
        {{EmbedLiveSample("serif-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td><code>sans-serif</code></td>
      <td>Phông chữ không có chân.</td>
      <td id="sans-serif-example">
        <pre class="brush: html hidden">My big red elephant</pre>
        <pre class="brush: css hidden">
body {
  font-family: sans-serif;
}</pre
        >
        {{EmbedLiveSample("sans-serif-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td><code>monospace</code></td>
      <td>
        Phông chữ mà mỗi ký tự có cùng chiều rộng, thường được dùng trong
        các danh sách mã.
      </td>
      <td id="monospace-example">
        <pre class="brush: html hidden">My big red elephant</pre>
        <pre class="brush: css hidden">
body {
  font-family: monospace;
}</pre
        >
        {{EmbedLiveSample("monospace-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td><code>cursive</code></td>
      <td>
        Phông chữ được thiết kế để mô phỏng nét chữ tay, với các nét chảy liên kết.
      </td>
      <td id="cursive-example">
        <pre class="brush: html hidden">My big red elephant</pre>
        <pre class="brush: css hidden">
body {
  font-family: cursive;
}</pre
        >
        {{EmbedLiveSample("cursive-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td><code>fantasy</code></td>
      <td>Phông chữ được thiết kế để trang trí.</td>
      <td id="fantasy-example">
        <pre class="brush: html hidden">My big red elephant</pre>
        <pre class="brush: css hidden">
body {
  font-family: fantasy;
}</pre
        >
        {{EmbedLiveSample("fantasy-example", 100, 60)}}
      </td>
    </tr>
  </tbody>
</table>

#### Font stack

Vì bạn không thể đảm bảo tính khả dụng của các phông chữ bạn muốn sử dụng trên các trang web của mình (ngay cả phông chữ web _có thể_ thất bại vì một lý do nào đó), bạn có thể cung cấp một **font stack** để trình duyệt có nhiều phông chữ để lựa chọn. Điều này bao gồm một giá trị `font-family` gồm nhiều tên phông chữ được phân cách bằng dấu phẩy, ví dụ:

```css
p {
  font-family: "Trebuchet MS", "Verdana", sans-serif;
}
```

Trong trường hợp như vậy, trình duyệt bắt đầu từ đầu danh sách và kiểm tra xem phông chữ đó có sẵn trên máy không. Nếu có, nó áp dụng phông chữ đó cho các phần tử được chọn. Nếu không, nó chuyển sang phông chữ tiếp theo, và cứ tiếp tục như vậy.

Đây là ý tưởng hay khi cung cấp một tên phông chữ chung phù hợp ở cuối stack để nếu không có phông chữ nào trong danh sách khả dụng, trình duyệt ít nhất có thể cung cấp thứ gì đó tương đương. Để nhấn mạnh điều này, các đoạn văn sẽ được cung cấp phông chữ serif mặc định của trình duyệt nếu không có tùy chọn nào khác — thường là Times New Roman — điều này không phù hợp với phông chữ sans-serif!

> [!NOTE]
> Mặc dù bạn có thể sử dụng tên họ phông chứa khoảng trắng, chẳng hạn như `Trebuchet MS`, mà không cần trích dẫn, nhưng để tránh lỗi trong việc escape, nên trích dẫn các tên họ phông có chứa khoảng trắng, chữ số, hoặc ký tự dấu câu khác ngoài gạch ngang.

> [!WARNING]
> Bất kỳ tên họ phông nào có thể bị hiểu nhầm là tên họ chung hoặc từ khóa toàn cục CSS phải được trích dẫn. Trong khi tên `font-family` có thể được bao gồm như một {{cssxref("custom-ident")}} hoặc một {{cssxref("string")}}, tên họ phông trùng với giá trị thuộc tính CSS toàn cục, như `initial` hoặc `inherit`, hoặc CSS có cùng tên với một trong các tên họ phông chung, như `sans-serif` hoặc `fantasy`, phải được bao gồm dưới dạng chuỗi trích dẫn. Nếu không, tên họ phông sẽ được hiểu là từ khóa CSS tương đương hoặc tên họ chung. Khi được dùng như các từ khóa, các tên họ phông chung — `serif`, `sans-serif`, `monospace`, `cursive`, và `fantasy` — và các từ khóa CSS toàn cục KHÔNG ĐƯỢC trích dẫn, vì chuỗi không được hiểu là từ khóa CSS.

#### Ví dụ về font-family

Hãy bổ sung vào ví dụ trước của chúng ta, cho các đoạn văn một phông chữ sans-serif:

```css live-sample___2fonts live-sample___3font-style live-sample___4shadows live-sample___5text-align live-sample___6line-height live-sample___7letter-word-spacing
p {
  color: red;
  font-family: "Helvetica", "Arial", sans-serif;
}
```

Điều này cho chúng ta kết quả sau:

{{ EmbedLiveSample('2fonts', '100%', 220) }}

### Kích thước phông chữ

Trong bài viết [Giá trị và đơn vị CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units) của mô-đun trước, chúng ta đã xem xét các đơn vị độ dài và kích thước. Kích thước phông chữ (được thiết lập bằng thuộc tính {{cssxref("font-size")}}) có thể nhận các giá trị được đo bằng hầu hết các đơn vị này (và các đơn vị khác, chẳng hạn như [tỷ lệ phần trăm](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#percentages)); tuy nhiên, các đơn vị phổ biến nhất bạn sẽ sử dụng để định cỡ văn bản là:

- `px` (pixel): Số lượng pixel chiều cao bạn muốn văn bản cao. Đây là đơn vị tuyệt đối — nó cho ra cùng giá trị cuối cùng đã tính toán cho phông chữ trên trang trong hầu hết mọi tình huống.
- `em`: 1 `em` bằng kích thước phông chữ được thiết lập trên phần tử cha của phần tử hiện tại chúng ta đang tạo kiểu (cụ thể hơn, chiều rộng của chữ hoa M chứa trong phần tử cha). Điều này có thể trở nên khó tính toán nếu bạn có nhiều phần tử lồng nhau với kích thước phông chữ khác nhau, nhưng có thể làm được, như bạn sẽ thấy bên dưới. Tại sao phải bận tâm? Nó khá tự nhiên khi bạn đã quen với nó, và bạn có thể dùng `em` để định cỡ mọi thứ, không chỉ văn bản. Bạn có thể có toàn bộ website được định cỡ bằng `em`, điều này giúp việc bảo trì trở nên dễ dàng.
- `rem`: Chúng hoạt động giống như `em`, ngoại trừ 1 `rem` bằng kích thước phông chữ được thiết lập trên phần tử gốc của tài liệu (tức là {{htmlelement("html")}}), không phải phần tử cha. Điều này giúp việc tính toán kích thước phông chữ trở nên dễ dàng hơn nhiều.

`font-size` của một phần tử được kế thừa từ phần tử cha của nó. Tất cả bắt đầu với phần tử gốc của toàn bộ tài liệu — {{htmlelement("html")}} — `font-size` tiêu chuẩn được thiết lập là `16px` trên các trình duyệt. Bất kỳ đoạn văn nào (hoặc một phần tử khác không có kích thước khác được thiết lập bởi trình duyệt) bên trong phần tử gốc sẽ có kích thước cuối cùng là `16px`. Các phần tử khác có thể có kích thước mặc định khác nhau. Ví dụ, một phần tử {{htmlelement("Heading_Elements", "h1")}} có kích thước `2em` được thiết lập theo mặc định, do đó nó sẽ có kích thước cuối cùng là `32px`.

Mọi thứ trở nên phức tạp hơn khi bạn bắt đầu thay đổi kích thước phông chữ của các phần tử lồng nhau. Ví dụ, nếu bạn có một phần tử {{htmlelement("article")}} trong trang và thiết lập `font-size` của nó là 1.5 `em` (sẽ tính toán ra kích thước cuối cùng là 24 `px`), và sau đó muốn các đoạn văn bên trong các phần tử `<article>` có kích thước phông chữ đã tính toán là 20 `px`, bạn sẽ dùng giá trị `em` nào?

```html
<!-- document base font-size is 16px -->
<article>
  <!-- If my font-size is 1.5em -->
  <p>My paragraph</p>
  <!-- How do I compute to 20px font-size? -->
</article>
```

Bạn sẽ cần thiết lập giá trị `em` của nó là 20/24, tức là 0.83333333 `em`. Phép tính có thể phức tạp, vì vậy bạn cần cẩn thận về cách bạn tạo kiểu mọi thứ. Tốt nhất là sử dụng `rem` khi có thể để giữ mọi thứ đơn giản, và tránh thiết lập `font-size` của các phần tử container khi có thể.

### Kiểu phông, độ đậm, biến đổi văn bản và trang trí văn bản

CSS cung cấp bốn thuộc tính phổ biến để thay đổi trọng lượng/nhấn mạnh trực quan của văn bản:

- {{cssxref("font-style")}}: Dùng để bật hoặc tắt chữ nghiêng. Các giá trị có thể như sau (bạn sẽ hiếm khi dùng thuộc tính này, trừ khi bạn muốn tắt một số kiểu nghiêng vì lý do nào đó):
  - `normal`: Thiết lập văn bản về phông chữ bình thường (tắt chữ nghiêng hiện có).
  - `italic`: Thiết lập văn bản để sử dụng phiên bản nghiêng của phông chữ, nếu có; nếu không, nó sẽ mô phỏng chữ nghiêng bằng oblique.
  - `oblique`: Thiết lập văn bản để sử dụng phiên bản mô phỏng của phông chữ nghiêng, được tạo bằng cách nghiêng phiên bản thông thường.

- {{cssxref("font-weight")}}: Thiết lập độ đậm của văn bản. Có nhiều giá trị khả dụng nếu bạn có nhiều biến thể phông chữ (như _-light_, _-normal_, _-bold_, _-extrabold_, _-black_, v.v.), nhưng thực tế bạn sẽ hiếm khi sử dụng bất kỳ trong số đó ngoài `normal` và `bold`:
  - `normal`, `bold`: Độ đậm phông chữ bình thường và đậm.
  - `lighter`, `bolder`: Thiết lập độ đậm của phần tử hiện tại nhẹ hơn hoặc đậm hơn một bậc so với độ đậm của phần tử cha.
  - `100` – `900`: Các giá trị độ đậm số học cung cấp kiểm soát chi tiết hơn so với các từ khóa trên, nếu cần.

- {{cssxref("text-transform")}}: Cho phép bạn thiết lập phông chữ để biến đổi. Các giá trị bao gồm:
  - `none`: Ngăn bất kỳ biến đổi nào.
  - `uppercase`: Biến đổi tất cả văn bản thành chữ hoa.
  - `lowercase`: Biến đổi tất cả văn bản thành chữ thường.
  - `capitalize`: Biến đổi tất cả các từ để có chữ cái đầu tiên viết hoa.
  - `full-width`: Biến đổi tất cả các ký tự để được viết bên trong một hình vuông có chiều rộng cố định, tương tự như phông chữ monospace, cho phép căn chỉnh, ví dụ: ký tự Latin cùng với ký tự ngôn ngữ châu Á (như Trung, Nhật, Hàn).

- {{cssxref("text-decoration")}}: Thiết lập/bỏ thiết lập trang trí văn bản trên phông chữ (bạn chủ yếu sẽ dùng điều này để bỏ gạch chân mặc định trên các liên kết khi tạo kiểu chúng). Các giá trị khả dụng là:
  - `none`: Bỏ thiết lập bất kỳ trang trí văn bản nào đang có.
  - `underline`: Gạch chân văn bản.
  - `overline`: Cho văn bản một đường gạch trên.
  - `line-through`: Đặt một đường gạch ngang qua văn bản.

  Bạn nên lưu ý rằng {{cssxref("text-decoration")}} có thể nhận nhiều giá trị cùng lúc nếu bạn muốn thêm nhiều trang trí đồng thời, ví dụ: `text-decoration: underline overline`. Cũng lưu ý rằng {{cssxref("text-decoration")}} là thuộc tính tắt cho {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-style")}}, và {{cssxref("text-decoration-color")}}. Bạn có thể kết hợp các giá trị thuộc tính này để tạo ra các hiệu ứng thú vị, ví dụ: `text-decoration: line-through red wavy`.

Hãy xem cách thêm một vài trong số các thuộc tính này vào ví dụ của chúng ta:

```css live-sample___3font-style live-sample___4shadows live-sample___5text-align live-sample___6line-height live-sample___7letter-word-spacing
html {
  font-size: 10px;
}

h1 {
  font-size: 5rem;
  text-transform: capitalize;
}

h1 + p {
  font-weight: bold;
}

p {
  font-size: 1.5rem;
  color: red;
  font-family: "Helvetica", "Arial", sans-serif;
}
```

Kết quả mới của chúng ta như sau:

{{ EmbedLiveSample('3font-style', '100%', 260) }}

### Đổ bóng văn bản

Bạn có thể áp dụng đổ bóng cho văn bản của mình bằng thuộc tính {{cssxref("text-shadow")}}. Thuộc tính này nhận tối đa bốn giá trị, như được hiển thị trong ví dụ bên dưới:

```css
text-shadow: 4px 4px 5px red;
```

Bốn thuộc tính như sau:

1. Độ lệch ngang của bóng so với văn bản gốc — điều này có thể nhận hầu hết các [đơn vị độ dài và kích thước](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#lengths) CSS khả dụng, nhưng bạn thường dùng `px`; giá trị dương dịch bóng sang phải, giá trị âm dịch sang trái. Giá trị này phải được bao gồm.
2. Độ lệch dọc của bóng so với văn bản gốc. Điều này hoạt động tương tự như độ lệch ngang, ngoại trừ nó dịch chuyển bóng lên/xuống, không phải trái/phải. Giá trị này phải được bao gồm.
3. Bán kính mờ: giá trị cao hơn có nghĩa là bóng được phân tán rộng hơn. Nếu giá trị này không được bao gồm, nó mặc định là 0, có nghĩa là không mờ. Điều này có thể nhận hầu hết các [đơn vị độ dài và kích thước](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#lengths) CSS khả dụng.
4. Màu cơ bản của bóng, có thể nhận bất kỳ [đơn vị màu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#color) nào. Nếu không được bao gồm, nó mặc định là [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword), tức là màu của bóng được lấy từ thuộc tính {{cssxref("color")}} của phần tử.

#### Nhiều bóng

Bạn có thể áp dụng nhiều bóng cho cùng một văn bản bằng cách bao gồm nhiều giá trị bóng được phân cách bằng dấu phẩy, ví dụ:

```css live-sample___4shadows live-sample___5text-align live-sample___6line-height live-sample___7letter-word-spacing
h1 {
  text-shadow:
    1px 1px 1px red,
    2px 2px 1px red;
}
```

Nếu chúng ta áp dụng điều này cho phần tử {{htmlelement("Heading_Elements", "&lt;h1>")}} trong ví dụ Tommy The Cat của chúng ta, chúng ta sẽ có kết quả sau:

{{ EmbedLiveSample('4shadows', '100%', 260) }}

> [!NOTE]
> Bạn có thể xem nhiều ví dụ thú vị hơn về cách sử dụng `text-shadow` trong bài viết của Sitepoint [Moonlighting with CSS text-shadow](https://www.sitepoint.com/moonlighting-css-text-shadow/).

## Bố cục văn bản

Sau khi đã đề cập đến các thuộc tính phông chữ cơ bản, hãy xem xét các thuộc tính chúng ta có thể sử dụng để ảnh hưởng đến bố cục văn bản.

### Căn chỉnh văn bản

Thuộc tính {{cssxref("text-align")}} được sử dụng để kiểm soát cách văn bản được căn chỉnh trong hộp nội dung chứa nó. Các giá trị khả dụng được liệt kê bên dưới. Chúng hoạt động gần giống như cách chúng hoạt động trong một ứng dụng xử lý văn bản thông thường:

- `left`: Căn trái văn bản.
- `right`: Căn phải văn bản.
- `center`: Căn giữa văn bản.
- `justify`: Làm cho văn bản trải rộng ra, thay đổi khoảng cách giữa các từ để tất cả các dòng văn bản có cùng chiều rộng. Bạn cần sử dụng điều này cẩn thận — nó có thể trông rất tệ, đặc biệt khi áp dụng cho một đoạn văn có nhiều từ dài. Nếu bạn sẽ sử dụng điều này, bạn cũng nên nghĩ đến việc sử dụng thứ gì đó khác cùng với nó, chẳng hạn như {{cssxref("hyphens")}}, để ngắt một số từ dài hơn qua các dòng.

Nếu chúng ta áp dụng `text-align: center;` cho {{htmlelement("Heading_Elements", "&lt;h1>")}} trong ví dụ của chúng ta, chúng ta sẽ có kết quả này:

```css hidden live-sample___5text-align live-sample___6line-height live-sample___7letter-word-spacing
h1 {
  text-align: center;
}
```

{{ EmbedLiveSample('5text-align', '100%', 260) }}

### Chiều cao dòng

Thuộc tính {{cssxref("line-height")}} thiết lập chiều cao của mỗi dòng văn bản. Thuộc tính này không chỉ có thể nhận hầu hết các [đơn vị độ dài và kích thước](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#lengths), mà còn có thể nhận giá trị không có đơn vị, hoạt động như một hệ số nhân và thường được coi là lựa chọn tốt nhất. Với giá trị không có đơn vị, {{cssxref("font-size")}} được nhân lên và cho ra `line-height`. Văn bản nội dung thường trông đẹp hơn và dễ đọc hơn khi các dòng cách nhau. Chiều cao dòng được khuyến nghị là khoảng 1.5 – 2 (giãn đôi). Để thiết lập các dòng văn bản của chúng ta là 1.6 lần chiều cao phông chữ, chúng ta sẽ sử dụng:

```css live-sample___6line-height live-sample___7letter-word-spacing
p {
  line-height: 1.6;
}
```

Áp dụng điều này cho các phần tử {{htmlelement("p")}} trong ví dụ của chúng ta sẽ cho chúng ta kết quả này:

{{ EmbedLiveSample('6line-height', '100%', 300) }}

### Khoảng cách chữ và khoảng cách từ

Các thuộc tính {{cssxref("letter-spacing")}} và {{cssxref("word-spacing")}} cho phép bạn thiết lập khoảng cách giữa các chữ cái và từ trong văn bản của mình. Bạn sẽ không sử dụng chúng thường xuyên, nhưng có thể tìm thấy cách dùng để đạt được một giao diện cụ thể, hoặc để cải thiện khả năng đọc của một phông chữ đặc biệt dày. Chúng có thể nhận hầu hết các [đơn vị độ dài](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#lengths).

Để minh họa, chúng ta có thể áp dụng một số khoảng cách từ và khoảng cách chữ cho dòng đầu tiên của mỗi phần tử {{htmlelement("p")}} trong mẫu HTML của chúng ta với:

```css live-sample___7letter-word-spacing
p::first-line {
  letter-spacing: 4px;
  word-spacing: 4px;
}
```

Điều này hiển thị HTML của chúng ta như sau:

{{ EmbedLiveSample('7letter-word-spacing', '100%', 330) }}

### Các thuộc tính khác đáng xem xét

Các thuộc tính trên cho bạn ý tưởng về cách bắt đầu tạo kiểu văn bản trên trang web, nhưng còn nhiều thuộc tính khác bạn có thể dùng. Chúng ta chỉ muốn đề cập đến những thuộc tính quan trọng nhất ở đây. Khi bạn đã quen với việc sử dụng các thuộc tính trên, bạn cũng nên khám phá những thuộc tính sau:

Kiểu phông chữ:

- {{cssxref("font-variant")}}: Chuyển đổi giữa chữ hoa nhỏ và các lựa chọn phông thông thường.
- {{cssxref("font-kerning")}}: Bật và tắt các tùy chọn kerning phông chữ.
- {{cssxref("font-feature-settings")}}: Bật và tắt các tính năng phông [OpenType](https://en.wikipedia.org/wiki/OpenType) khác nhau.
- {{cssxref("font-variant-alternates")}}: Kiểm soát việc sử dụng các ký tự thay thế cho một font-face nhất định.
- {{cssxref("font-variant-caps")}}: Kiểm soát việc sử dụng các ký tự hoa thay thế.
- {{cssxref("font-variant-east-asian")}}: Kiểm soát việc sử dụng các ký tự thay thế cho các chữ viết Đông Á, như tiếng Nhật và tiếng Trung.
- {{cssxref("font-variant-ligatures")}}: Kiểm soát các ligature và hình thức ngữ cảnh nào được sử dụng trong văn bản.
- {{cssxref("font-variant-numeric")}}: Kiểm soát việc sử dụng các ký tự thay thế cho số, phân số và dấu thứ tự.
- {{cssxref("font-variant-position")}}: Kiểm soát việc sử dụng các ký tự thay thế nhỏ hơn được định vị làm chỉ số trên hoặc chỉ số dưới.
- {{cssxref("font-size-adjust")}}: Điều chỉnh kích thước trực quan của phông chữ độc lập với kích thước phông thực tế.
- {{cssxref("font-stretch")}}: Chuyển đổi giữa các phiên bản kéo dãn thay thế có thể có của một phông chữ nhất định.
- {{cssxref("text-underline-position")}}: Chỉ định vị trí của gạch chân được thiết lập bằng giá trị `underline` của thuộc tính `text-decoration-line`.
- {{cssxref("text-rendering")}}: Thử thực hiện một số tối ưu hóa hiển thị văn bản.

Kiểu bố cục văn bản:

- {{cssxref("text-indent")}}: Chỉ định bao nhiêu không gian ngang nên được để trước khi bắt đầu dòng đầu tiên của nội dung văn bản.
- {{cssxref("text-overflow")}}: Định nghĩa cách nội dung bị tràn không được hiển thị được thông báo cho người dùng.
- {{cssxref("white-space")}}: Định nghĩa cách khoảng trắng và các dấu ngắt dòng liên quan bên trong phần tử được xử lý.
- {{cssxref("word-break")}}: Chỉ định có ngắt dòng trong các từ hay không.
- {{cssxref("direction")}}: Định nghĩa hướng văn bản. (Điều này phụ thuộc vào ngôn ngữ và thường tốt hơn là để HTML xử lý phần đó vì nó gắn liền với nội dung văn bản.)
- {{cssxref("hyphens")}}: Bật và tắt việc gạch nối cho các ngôn ngữ được hỗ trợ.
- {{cssxref("line-break")}}: Nới lỏng hoặc tăng cường ngắt dòng cho các ngôn ngữ châu Á.
- {{cssxref("text-align-last")}}: Định nghĩa cách dòng cuối cùng của khối hoặc một dòng, ngay trước khi ngắt dòng bắt buộc, được căn chỉnh.
- {{cssxref("text-orientation")}}: Định nghĩa hướng của văn bản trong một dòng.
- {{cssxref("overflow-wrap")}}: Chỉ định trình duyệt có thể ngắt dòng trong các từ để ngăn tràn hay không.
- {{cssxref("writing-mode")}}: Định nghĩa các dòng văn bản được bố trí theo chiều ngang hay dọc và hướng các dòng tiếp theo chảy theo.

## Cú pháp tắt phông chữ

Nhiều thuộc tính phông chữ cũng có thể được thiết lập thông qua thuộc tính tắt {{cssxref("font")}}. Chúng được viết theo thứ tự sau: {{cssxref("font-style")}}, {{cssxref("font-variant")}}, {{cssxref("font-weight")}}, {{cssxref("font-stretch")}}, {{cssxref("font-size")}}, {{cssxref("line-height")}}, và {{cssxref("font-family")}}.

Trong số tất cả các thuộc tính đó, chỉ `font-size` và `font-family` là bắt buộc khi sử dụng thuộc tính tắt `font`.

Phải có dấu gạch chéo giữa thuộc tính {{cssxref("font-size")}} và {{cssxref("line-height")}}.

Một ví dụ đầy đủ trông như thế này:

```css
font:
  italic normal bold normal 3em/1.5 "Helvetica",
  "Arial",
  sans-serif;
```

## Thực hành tạo kiểu văn bản

Được rồi, đến lượt bạn. Với nhiệm vụ này, chúng ta không có bài tập cụ thể nào để bạn làm. Chúng ta chỉ muốn bạn thực hành với một số thuộc tính bố cục phông chữ/văn bản. Hãy xem bạn có thể tạo ra gì!

1. Nhấp vào **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Thêm một số khai báo vào quy tắc `p { }` trống được cung cấp để thay đổi kiểu của văn bản được cung cấp. Hãy sáng tạo theo cách bạn muốn.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Tham khảo các phần trước trong bài viết để tìm thêm thông tin về các kiểu phông và văn bản bạn có thể thiết lập.

```html live-sample___fonts_text
<p>Some sample text for your delight</p>
```

```css-nolint live-sample___fonts_text
p {

}
```

{{ EmbedLiveSample('fonts_text', "100%", 60) }}

## Tóm tắt

Hy vọng bạn đã thích thực hành với văn bản trong bài viết này! Bài viết tiếp theo sẽ cung cấp cho bạn tất cả những gì bạn cần biết về tạo kiểu danh sách HTML.

## Xem thêm

- [All about the CSS font-family property](https://explainers.dev/font-family/), explainers.dev
- [Web-safe fonts](https://scrimba.com/the-frontend-developer-career-path-c0j/~02b?via=mdn), Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>

{{NextMenu("Learn_web_development/Core/Text_styling/Styling_lists", "Learn_web_development/Core/Text_styling")}}
