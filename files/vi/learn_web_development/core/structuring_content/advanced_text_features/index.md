---
title: Tính năng văn bản nâng cao
slug: Learn_web_development/Core/Structuring_content/Advanced_text_features
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/HTML_text_basics", "Learn_web_development/Core/Structuring_content/Test_your_skills/Advanced_HTML_text", "Learn_web_development/Core/Structuring_content")}}

Có nhiều phần tử khác trong HTML để định nghĩa ngữ nghĩa văn bản, mà chúng tôi chưa đề cập trong bài viết [Nhấn mạnh và tầm quan trọng](/en-US/docs/Learn_web_development/Core/Structuring_content/Emphasis_and_importance). Các phần tử được mô tả trong bài viết này ít được biết đến hơn, nhưng vẫn hữu ích để biết (và đây vẫn không phải là danh sách đầy đủ dưới bất kỳ hình thức nào). Tại đây bạn sẽ tìm hiểu về cách đánh dấu trích dẫn, mã máy tính và văn bản liên quan khác, chỉ số trên và chỉ số dưới, thông tin liên hệ, và nhiều hơn nữa.

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
          <li>Trích dẫn.</li>
          <li>Từ viết tắt và chữ viết tắt.</li>
          <li>Địa chỉ.</li>
          <li>Ngày giờ.</li>
          <li>Chỉ số trên và chỉ số dưới.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Trích dẫn

HTML chứa các tính năng có sẵn để đánh dấu trích dẫn; phần tử bạn sử dụng phụ thuộc vào việc bạn có đang đánh dấu trích dẫn khối hay trích dẫn nội tuyến.

### Trích dẫn khối

Nếu một phần nội dung cấp khối (dù là một đoạn văn, nhiều đoạn văn, một danh sách, v.v.) được trích dẫn từ nơi khác, bạn nên bao bọc nó bên trong phần tử {{htmlelement("blockquote")}} để biểu thị điều này, và bao gồm URL trỏ đến nguồn của trích dẫn bên trong thuộc tính [`cite`](/en-US/docs/Web/HTML/Reference/Elements/blockquote#cite). Ví dụ, đoạn đánh dấu sau được lấy từ trang phần tử `<blockquote>` của MDN:

```html
<p>
  The <strong>HTML <code>&lt;blockquote&gt;</code> Element</strong> (or
  <em>HTML Block Quotation Element</em>) indicates that the enclosed text is an
  extended quotation.
</p>
```

Để biến nó thành trích dẫn khối, chúng ta chỉ cần làm điều này:

```html
<p>Here is a blockquote:</p>
<blockquote
  cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/blockquote">
  <p>
    The <strong>HTML <code>&lt;blockquote&gt;</code> Element</strong> (or
    <em>HTML Block Quotation Element</em>) indicates that the enclosed text is
    an extended quotation.
  </p>
</blockquote>
```

Kiểu mặc định của trình duyệt sẽ hiển thị điều này như một đoạn văn được thụt lề, như là dấu hiệu cho thấy đây là trích dẫn; đoạn văn phía trên trích dẫn ở đó để minh chứng điều đó.

{{EmbedLiveSample('Blockquotes', '100%', '200px')}}

### Trích dẫn nội tuyến

Trích dẫn nội tuyến hoạt động hoàn toàn theo cùng một cách, ngoại trừ chúng sử dụng phần tử {{htmlelement("q")}}. Ví dụ, đoạn đánh dấu dưới đây chứa một trích dẫn từ trang `<q>` của MDN:

```html
<p>
  The quote element — <code>&lt;q&gt;</code> — is
  <q
    cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/q">
    intended for short quotations that don't require paragraph breaks.
  </q>
</p>
```

Kiểu mặc định của trình duyệt sẽ hiển thị điều này như văn bản bình thường được đặt trong dấu nháy để biểu thị trích dẫn, như sau:

{{EmbedLiveSample('Inline_quotations', '100%', '78px')}}

### Trích nguồn

Nội dung của thuộc tính [`cite`](/en-US/docs/Web/HTML/Reference/Elements/blockquote#cite) nghe có vẻ hữu ích, nhưng tiếc là các trình duyệt, trình đọc màn hình, v.v. thực sự không làm nhiều với nó. Không có cách nào để trình duyệt hiển thị nội dung của `cite` mà không cần viết giải pháp của riêng bạn bằng JavaScript hoặc CSS. Nếu bạn muốn làm cho nguồn của trích dẫn có sẵn trên trang, bạn cần làm cho nó có sẵn trong văn bản thông qua liên kết hoặc cách phù hợp khác.

Có phần tử {{htmlelement("cite")}}, nhưng phần tử này có nghĩa là để chứa tiêu đề của tài nguyên được trích dẫn, ví dụ: tên của cuốn sách. Tuy nhiên, không có lý do gì bạn không thể liên kết văn bản bên trong `<cite>` đến nguồn trích dẫn theo một cách nào đó:

```html-nolint
<p>
  According to the
  <a href="/en-US/docs/Web/HTML/Reference/Elements/blockquote">
    <cite>MDN blockquote page</cite></a>:
</p>

<blockquote
  cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/blockquote">
  <p>
    The <strong>HTML <code>&lt;blockquote&gt;</code> Element</strong> (or
    <em>HTML Block Quotation Element</em>) indicates that the enclosed text is
    an extended quotation.
  </p>
</blockquote>

<p>
  The quote element — <code>&lt;q&gt;</code> — is
  <q cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/q">
    intended for short quotations that don't require paragraph breaks.
  </q>
  — <a href="/en-US/docs/Web/HTML/Reference/Elements/q"><cite>MDN q page</cite></a>.
</p>
```

Các trích nguồn được tạo kiểu bằng phông chữ nghiêng theo mặc định.

{{EmbedLiveSample('Citations', '100%', '179px')}}

### Ai đã nói điều đó? Thực hành blockquote

Đến lúc thực hiện nhiệm vụ khác! Trong ví dụ này, chúng tôi muốn bạn:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Biến đoạn văn giữa thành blockquote, bao gồm thuộc tính `cite`.
3. Biến "The Need To Eliminate Negative Self Talk" trong đoạn văn thứ ba thành trích dẫn nội tuyến, và bao gồm thuộc tính `cite`.
4. Bao bọc tiêu đề của mỗi nguồn trong thẻ `<cite>` và biến từng cái thành liên kết đến nguồn đó.

Các nguồn trích dẫn bạn cần là:

- `http://www.brainyquote.com/quotes/authors/c/confucius.html` cho trích dẫn Khổng Tử
- `http://example.com/affirmationsforpositivethinking` cho "The Need To Eliminate Negative Self Talk".

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___advanced-text-1
<p>Hello and welcome to my motivation page. As Confucius' quotes site says:</p>
<p>It does not matter how slowly you go as long as you do not stop.</p>
<p>
  I also love the concept of positive thinking, and The Need To Eliminate
  Negative Self Talk (as mentioned in Affirmations for Positive Thinking.)
</p>
```

{{ EmbedLiveSample('advanced-text-1', "100%", 200) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<p>
  Hello and welcome to my motivation page. As
  <a href="http://www.brainyquote.com/quotes/authors/c/confucius.html"
    ><cite>Confucius' quotes site</cite></a
  >
  says:
</p>

<blockquote cite="http://www.brainyquote.com/quotes/authors/c/confucius.html">
  <p>It does not matter how slowly you go as long as you do not stop.</p>
</blockquote>

<p>
  I also love the concept of positive thinking, and
  <q cite="http://example.com/affirmationsforpositivethinking"
    >The Need To Eliminate Negative Self Talk</q
  >
  (as mentioned in
  <a href="http://example.com/affirmationsforpositivethinking"
    ><cite>Affirmations for Positive Thinking</cite></a
  >.)
</p>
```

</details>

## Từ viết tắt

Một phần tử khá phổ biến khác mà bạn sẽ gặp khi nhìn xung quanh Web là {{htmlelement("abbr")}} — phần tử này được sử dụng để bao bọc xung quanh một từ viết tắt hoặc chữ viết tắt. Khi bao gồm bất kỳ cái nào, hãy cung cấp phần mở rộng đầy đủ của thuật ngữ bằng văn bản thuần túy khi sử dụng lần đầu, cùng với `<abbr>` để đánh dấu từ viết tắt. Điều này cung cấp gợi ý cho các tác nhân người dùng về cách thông báo/hiển thị nội dung trong khi thông báo cho tất cả người dùng ý nghĩa của từ viết tắt.

Nếu việc cung cấp phần mở rộng ngoài từ viết tắt không có nhiều ý nghĩa, và từ viết tắt hoặc chữ viết tắt là một thuật ngữ khá ngắn gọn, hãy cung cấp phần mở rộng đầy đủ của thuật ngữ là giá trị của thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title):

### Ví dụ từ viết tắt

Hãy xem một ví dụ.

```html
<p>
  We use <abbr>HTML</abbr>, Hypertext Markup Language, to structure our web
  documents.
</p>

<p>
  I think <abbr title="Reverend">Rev.</abbr> Green did it in the kitchen with
  the chainsaw.
</p>
```

Chúng được hiển thị như sau:

{{EmbedLiveSample('Abbreviation_example', '100%', '90')}}

> [!NOTE]
> Các phiên bản HTML cũ hơn cũng bao gồm hỗ trợ cho phần tử {{htmlelement("acronym")}}, nhưng nó đã bị xóa khỏi đặc tả HTML để thay thế bằng cách sử dụng `<abbr>` để biểu diễn cả từ viết tắt và chữ viết tắt. `<acronym>` không nên được sử dụng.

### Hãy đánh dấu một từ viết tắt

Đối với nhiệm vụ học tập này, chúng tôi muốn bạn đánh dấu một từ viết tắt.

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Đánh dấu các từ viết tắt được bao gồm bằng HTML phù hợp. Hãy tự do thay thế bằng từ của riêng bạn và thử đánh dấu điều đó.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html-nolint live-sample___advanced-text-2
<p>NASA sure does some exciting work.</p>

<p>The new user interface design LGTM!</p>
```

{{ EmbedLiveSample('advanced-text-2', "100%", 90) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như đoạn mã sau:

```html
<p>
  <abbr>NASA</abbr> (the National Aeronautics and Space Administration) sure
  does some exciting work.
</p>

<p>The new user interface design <abbr title="Looks good to me">LGTM</abbr>!</p>
```

- Có thể nói rằng NASA nên được mở rộng trong văn bản khi được đề cập lần đầu tiên, vì đây là thông tin hữu ích cho mọi người để có trong văn bản.
- Các chữ viết tắt như "LGTM", mặt khác, được viết thuần túy để tiết kiệm không gian và thời gian nên việc viết nó ra cũng không có ý nghĩa, do đó đặt phần mở rộng vào thuộc tính `title`. Trong ứng dụng thực, bạn có lẽ sẽ không làm điều này bằng tay — bạn sẽ nhận được một số loại script để thêm nó tự động cho các thuật ngữ đã biết.

</details>

## Đánh dấu thông tin liên hệ

HTML có phần tử để đánh dấu thông tin liên hệ — {{htmlelement("address")}}. Phần tử này bao bọc xung quanh thông tin liên hệ của bạn, ví dụ:

```html
<address>Chris Mills, Manchester, The Grim North, UK</address>
```

Nó cũng có thể bao gồm đánh dấu phức tạp hơn và các hình thức thông tin liên hệ khác, ví dụ:

```html
<address>
  <p>
    Chris Mills<br />
    Manchester<br />
    The Grim North<br />
    UK
  </p>

  <ul>
    <li>Tel: 01234 567 890</li>
    <li>Email: me@grim-north.co.uk</li>
  </ul>
</address>
```

Lưu ý rằng điều gì đó như thế này cũng sẽ ổn, nếu trang được liên kết chứa thông tin liên hệ:

```html
<address>
  Page written by <a href="../authors/chris-mills/">Chris Mills</a>.
</address>
```

> [!NOTE]
> Phần tử {{htmlelement("address")}} chỉ nên được sử dụng để cung cấp thông tin liên hệ cho tài liệu được chứa bởi phần tử {{htmlelement("article")}} hoặc {{htmlelement("body")}} gần nhất. Sẽ là đúng khi sử dụng nó trong phần footer của trang web để bao gồm thông tin liên hệ của toàn bộ trang, hoặc bên trong bài viết cho thông tin liên hệ của tác giả, nhưng không đánh dấu danh sách các địa chỉ không liên quan đến nội dung của trang đó.

## Chỉ số trên và chỉ số dưới

Đôi khi bạn sẽ cần sử dụng chỉ số trên và chỉ số dưới khi đánh dấu các mục như ngày tháng, công thức hóa học và phương trình toán học để chúng có ý nghĩa đúng. Các phần tử {{htmlelement("sup")}} và {{htmlelement("sub")}} xử lý công việc này. Ví dụ:

```html
<p>My birthday is on the 25<sup>th</sup> of May 2001.</p>
<p>
  Caffeine's chemical formula is
  C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>.
</p>
<p>If x<sup>2</sup> is 9, x must equal 3 or -3.</p>
```

Đầu ra của mã này trông như sau:

{{ EmbedLiveSample('Superscript_and_subscript', '100%', 160) }}

## Biểu diễn mã máy tính

Có một số phần tử có sẵn để đánh dấu mã máy tính bằng HTML:

- {{htmlelement("code")}}: Để đánh dấu các phần mã máy tính chung.
- {{htmlelement("pre")}}: Để giữ lại khoảng trắng (thường là các khối mã) — nếu bạn sử dụng thụt lề hoặc khoảng trắng dư thừa trong văn bản, các trình duyệt sẽ bỏ qua nó và bạn sẽ không thấy nó trên trang được hiển thị. Nếu bạn bao bọc văn bản trong các thẻ `<pre></pre>` tuy nhiên, khoảng trắng của bạn sẽ được hiển thị giống như cách bạn thấy trong trình soạn thảo văn bản.
- {{htmlelement("var")}}: Để đánh dấu cụ thể các tên biến.
- {{htmlelement("kbd")}}: Để đánh dấu đầu vào bàn phím (và các loại khác) được nhập vào máy tính.
- {{htmlelement("samp")}}: Để đánh dấu đầu ra của chương trình máy tính.

Hãy xem ví dụ về các phần tử này và cách chúng được sử dụng để biểu diễn mã máy tính.
Nếu bạn muốn xem tệp đầy đủ, hãy xem tệp mẫu [other-semantics.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/advanced-text-formatting/other-semantics.html).
Bạn có thể tải xuống tệp và mở nó trong trình duyệt để tự xem, nhưng đây là một đoạn mã:

```html
<pre><code>const para = document.querySelector('p');

para.onclick = function() {
  alert('Owww, stop poking me!');
}</code></pre>

<p>
  You shouldn't use presentational elements like <code>&lt;font&gt;</code> and
  <code>&lt;center&gt;</code>.
</p>

<p>
  In the above JavaScript example, <var>para</var> represents a paragraph
  element.
</p>

<p>Select all the text with <kbd>Ctrl</kbd>/<kbd>Cmd</kbd> + <kbd>A</kbd>.</p>

<pre>$ <kbd>ping mozilla.org</kbd>
<samp>PING mozilla.org (63.245.215.20): 56 data bytes
64 bytes from 63.245.215.20: icmp_seq=0 ttl=40 time=158.233 ms</samp></pre>
```

Mã trên sẽ trông như sau:

{{ EmbedLiveSample('Representing_computer_code','100%',350) }}

## Đánh dấu ngày giờ

HTML cũng cung cấp phần tử {{htmlelement("time")}} để đánh dấu ngày giờ ở định dạng có thể đọc được bằng máy. Ví dụ:

```html
<time datetime="2016-01-20">20 January 2016</time>
```

Tại sao điều này hữu ích? Có nhiều cách khác nhau mà con người viết ngày tháng. Ngày trên có thể được viết như:

<!-- markdownlint-disable MD033 -->

- 20 January 2016
- 20th January 2016
- Jan 20 2016
- 20/01/16
- 01/20/16
- The 20th of next month
- <span lang="fr">20e Janvier 2016</span>
- <span lang="ja">2016 年 1 月 20 日</span>
- Và nhiều cách khác.

<!-- markdownlint-enable MD033 -->

Nhưng các hình thức khác nhau này không thể dễ dàng được nhận dạng bởi máy tính — điều gì sẽ xảy ra nếu bạn muốn tự động lấy ngày của tất cả các sự kiện trong một trang và đưa chúng vào lịch? Phần tử {{htmlelement("time")}} cho phép bạn đính kèm ngày/giờ không mơ hồ, có thể đọc được bằng máy cho mục đích này.

Ví dụ cơ bản ở trên chỉ cung cấp ngày có thể đọc được bằng máy đơn giản, nhưng có nhiều tùy chọn khác có thể có, ví dụ:

```html
<!-- Standard simple date -->
<time datetime="2016-01-20">20 January 2016</time>
<!-- Just year and month -->
<time datetime="2016-01">January 2016</time>
<!-- Just month and day -->
<time datetime="01-20">20 January</time>
<!-- Just time, hours and minutes -->
<time datetime="19:30">19:30</time>
<!-- You can do seconds and milliseconds too! -->
<time datetime="19:30:01.856">19:30:01.856</time>
<!-- Date and time -->
<time datetime="2016-01-20T19:30">7.30pm, 20 January 2016</time>
<!-- Date and time with timezone offset -->
<time datetime="2016-01-20T19:30+01:00">
  7.30pm, 20 January 2016 is 8.30pm in France
</time>
<!-- Calling out a specific week number -->
<time datetime="2016-W04">The fourth week of 2016</time>
```

## Tóm tắt

Điều đó đánh dấu kết thúc nghiên cứu của chúng ta về ngữ nghĩa văn bản HTML ít phổ biến hơn. Những gì bạn đã thấy trong khóa học này không phải là danh sách đầy đủ các phần tử văn bản HTML — chúng tôi muốn cố gắng bao gồm những điều cơ bản, và một số trong số những cái phổ biến hơn mà bạn sẽ thấy ngoài thực tế.

Tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn hiểu và ghi nhớ thông tin chúng tôi đã cung cấp về các tính năng văn bản HTML ít phổ biến hơn.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/HTML_text_basics", "Learn_web_development/Core/Structuring_content/Test_your_skills/Advanced_HTML_text", "Learn_web_development/Core/Structuring_content")}}
