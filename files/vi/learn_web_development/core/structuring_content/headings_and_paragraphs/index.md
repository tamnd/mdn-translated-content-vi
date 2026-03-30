---
title: Tiêu đề và đoạn văn
slug: Learn_web_development/Core/Structuring_content/Headings_and_paragraphs
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Webpage_metadata", "Learn_web_development/Core/Structuring_content/Emphasis_and_importance", "Learn_web_development/Core/Structuring_content")}}

Một trong những công việc chính của HTML là cung cấp cấu trúc văn bản để trình duyệt có thể hiển thị tài liệu HTML theo cách mà nhà phát triển mong muốn. Bài viết này giải thích cách {{glossary("HTML")}} có thể được sử dụng để cung cấp cấu trúc trang cơ bản bằng cách định nghĩa các tiêu đề và đoạn văn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Cách tạo cấu trúc tài liệu tốt với các tiêu đề và nội dung bên dưới các tiêu đề đó.</li>
          <li>Sử dụng HTML ngữ nghĩa thay vì HTML trình bày, và lý do tại sao điều này quan trọng.</li>
          <li>Sự cần thiết của việc sử dụng các cấp tiêu đề một cách logic, tức là không bỏ qua các cấp hoặc sử dụng chúng tùy tiện vì bạn muốn đạt được một kích thước phông chữ nhất định (đó là công việc của CSS).</li>
          <li>Lợi ích SEO: ví dụ, các từ khóa được tăng cường trong các tiêu đề.</li>
          <li>Lợi ích khả năng tiếp cận: Công nghệ hỗ trợ (AT) như trình đọc màn hình sử dụng tiêu đề (và các mốc khác) như các bảng chỉ dẫn để điều hướng nội dung. Các tài liệu HTML rất khó sử dụng cho người dùng AT nếu không có tiêu đề.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tiêu đề và đoạn văn

Hầu hết văn bản có cấu trúc bao gồm tiêu đề và đoạn văn, dù bạn đang đọc một câu chuyện, báo, sách giáo khoa đại học, tạp chí, v.v.

![Ví dụ về trang bìa báo, cho thấy việc sử dụng tiêu đề cấp cao nhất, tiêu đề phụ và đoạn văn.](newspaper_small.jpg)

Nội dung có cấu trúc làm cho trải nghiệm đọc dễ dàng và thú vị hơn.

Trong HTML, mỗi đoạn văn phải được bao bọc trong phần tử {{htmlelement("p")}}, như sau:

```html
<p>I am a paragraph, oh yes I am.</p>
```

Mỗi tiêu đề phải được bao bọc trong phần tử tiêu đề:

```html
<h1>I am the title of the story.</h1>
```

Có sáu phần tử tiêu đề: {{htmlelement("Heading_Elements", "h1")}}, {{htmlelement("Heading_Elements", "h2")}}, {{htmlelement("Heading_Elements", "h3")}}, {{htmlelement("Heading_Elements", "h4")}}, {{htmlelement("Heading_Elements", "h5")}}, và {{htmlelement("Heading_Elements", "h6")}}. Mỗi phần tử đại diện cho một cấp độ nội dung khác nhau trong tài liệu; `<h1>` đại diện cho tiêu đề chính, `<h2>` đại diện cho tiêu đề phụ, `<h3>` đại diện cho tiêu đề phụ của tiêu đề phụ, v.v.

## Triển khai cấu trúc phân cấp

Ví dụ, trong câu chuyện này, phần tử `<h1>` đại diện cho tiêu đề câu chuyện, các phần tử `<h2>` đại diện cho tiêu đề mỗi chương, và các phần tử `<h3>` đại diện cho các phần con của mỗi chương:

```html
<h1>The Crushing Bore</h1>

<p>By Chris Mills</p>

<h2>Chapter 1: The dark night</h2>

<p>
  It was a dark night. Somewhere, an owl hooted. The rain lashed down on the…
</p>

<h2>Chapter 2: The eternal silence</h2>

<p>Our protagonist could not so much as a whisper out of the shadowy figure…</p>

<h3>The specter speaks</h3>

<p>
  Several more hours had passed, when all of a sudden the specter sat bolt
  upright and exclaimed, "Please have mercy on my soul!"
</p>
```

Thực sự là tùy bạn những phần tử tham gia đại diện cho gì, miễn là cấu trúc phân cấp có ý nghĩa. Bạn chỉ cần ghi nhớ một vài thực hành tốt nhất khi tạo các cấu trúc như vậy:

- Tốt nhất là bạn nên sử dụng một `<h1>` duy nhất mỗi trang — đây là tiêu đề cấp cao nhất, và tất cả các tiêu đề khác nằm bên dưới nó trong cấu trúc phân cấp.
- Hãy đảm bảo bạn sử dụng các tiêu đề theo đúng thứ tự trong cấu trúc phân cấp. Đừng sử dụng các phần tử `<h3>` để biểu diễn tiêu đề phụ, sau đó là các phần tử `<h2>` để biểu diễn tiêu đề phụ của tiêu đề phụ — điều đó không có ý nghĩa và sẽ dẫn đến kết quả kỳ lạ.
- Trong sáu cấp tiêu đề có sẵn, bạn nên đặt mục tiêu sử dụng không quá ba cấp mỗi trang, trừ khi bạn cảm thấy cần thiết. Các tài liệu có nhiều cấp (ví dụ, cấu trúc phân cấp tiêu đề sâu) trở nên cồng kềnh và khó điều hướng. Trong những trường hợp như vậy, nên phân phối nội dung trên nhiều trang nếu có thể.

## Tại sao chúng ta cần cấu trúc?

Để trả lời câu hỏi này, hãy xem [text-start.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/html-text-formatting/text-start.html) — một công thức hummus tuyệt vời. Phần thân của tài liệu này hiện tại chứa nhiều mảnh nội dung. Chúng không được đánh dấu theo bất kỳ cách nào, nhưng chúng được phân tách bởi các dấu ngắt dòng (nhấn Enter/Return để chuyển sang dòng tiếp theo).

Tuy nhiên, khi bạn mở tài liệu trong trình duyệt, bạn sẽ thấy văn bản xuất hiện như một khối lớn!

![Một trang web hiển thị một bức tường văn bản không được định dạng, vì không có phần tử nào trên trang để cấu trúc nó.](screen_shot_2017-03-29_at_09.20.35.png)

Điều này là do không có các phần tử để cung cấp cấu trúc cho nội dung, vì vậy trình duyệt không biết tiêu đề là gì và đoạn văn là gì. Hơn nữa:

- Người dùng xem trang web có xu hướng quét nhanh để tìm nội dung liên quan, thường chỉ đọc các tiêu đề, để bắt đầu. (Chúng ta thường [dành rất ít thời gian trên một trang web](https://www.nngroup.com/articles/how-long-do-users-stay-on-web-pages/).) Nếu họ không thể thấy bất cứ điều gì hữu ích trong vài giây, họ có thể bực bội và chuyển sang nơi khác.
- Các công cụ tìm kiếm lập chỉ mục trang của bạn xem nội dung của các tiêu đề là các từ khóa quan trọng để ảnh hưởng đến thứ hạng tìm kiếm của trang. Nếu không có tiêu đề, trang của bạn sẽ hoạt động kém về mặt {{glossary("SEO")}} (Tối ưu hóa Công cụ Tìm kiếm).
- Những người khiếm thị nghiêm trọng thường không đọc trang web; họ lắng nghe thay thế. Điều này được thực hiện với phần mềm gọi là [trình đọc màn hình](https://en.wikipedia.org/wiki/Screen_reader). Phần mềm này cung cấp các cách để truy cập nhanh vào nội dung văn bản nhất định. Trong số các kỹ thuật khác nhau được sử dụng, chúng cung cấp phác thảo tài liệu bằng cách đọc các tiêu đề, cho phép người dùng tìm thấy thông tin họ cần một cách nhanh chóng. Nếu tiêu đề không có sẵn, họ sẽ bị buộc phải nghe toàn bộ tài liệu được đọc to.
- Để tạo kiểu nội dung với {{glossary("CSS")}}, hoặc làm cho nó thực hiện những điều thú vị với {{glossary("JavaScript")}}, bạn cần có các phần tử bao bọc nội dung liên quan, để CSS/JavaScript có thể nhắm mục tiêu hiệu quả.

Do đó, chúng ta cần cung cấp đánh dấu cấu trúc cho nội dung.

## Cung cấp cấu trúc cho nội dung

Hãy bắt đầu ngay và để bạn giải quyết một thử thách mã nhỏ để thực hành với các tiêu đề và đoạn văn HTML:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Bao bọc văn bản thích hợp ở đầu nội dung bên trong phần tử `<h1>` để biến nó thành tiêu đề chính.
3. Có hai cặp từ cần được bao bọc bên trong các phần tử `<h2>` để biến chúng thành tiêu đề cấp hai.
4. Bao bọc các câu còn lại trong các phần tử `<p>` để biến chúng thành đoạn văn. Mỗi phần tử `<p>` nên nằm dưới mỗi phần tử `<h2>`.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___headings_paragraphs
Favorite body parts The brain Lovely shape and color. Also does thinkin' stuff.
The feet Knobbly and ugly, but useful for getting about.
```

{{ EmbedLiveSample('headings_paragraphs', "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Phần tử HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<h1>Favorite body parts</h1>

<h2>The brain</h2>

<p>Lovely shape and color. Also does thinkin' stuff.</p>

<h2>The feet</h2>

<p>Knobbly and ugly, but useful for getting about.</p>
```

</details>

## Tại sao chúng ta cần ngữ nghĩa?

Ngữ nghĩa được dựa vào khắp nơi xung quanh chúng ta — chúng ta dựa vào kinh nghiệm trước đây để cho chúng ta biết chức năng của một đối tượng hàng ngày là gì; khi chúng ta thấy điều gì đó, chúng ta biết chức năng của nó sẽ là gì. Vì vậy, ví dụ, chúng ta kỳ vọng đèn giao thông đỏ có nghĩa là "dừng lại," và đèn giao thông xanh có nghĩa là "đi." Mọi thứ có thể trở nên phức tạp rất nhanh nếu ngữ nghĩa sai được áp dụng. (Có quốc gia nào sử dụng màu đỏ để có nghĩa là "đi" không? Chúng tôi hy vọng là không.)

Theo cách tương tự, chúng ta cần đảm bảo chúng ta đang sử dụng các phần tử đúng, cung cấp cho nội dung của chúng ta ý nghĩa, chức năng hoặc diện mạo đúng. Trong bối cảnh này, phần tử `{{htmlelement("Heading_Elements", "&lt;h1>")}}` cũng là một phần tử ngữ nghĩa, cung cấp cho văn bản nó bao bọc vai trò (hoặc ý nghĩa) của "một tiêu đề cấp cao nhất trên trang của bạn."

```html
<h1>This is a top level heading</h1>
```

Theo mặc định, trình duyệt sẽ cung cấp cho nó một kích thước phông chữ lớn để làm cho nó trông như tiêu đề (mặc dù bạn có thể tạo kiểu để trông như bất kỳ điều gì bạn muốn bằng cách sử dụng CSS). Quan trọng hơn, giá trị ngữ nghĩa của nó sẽ được sử dụng theo nhiều cách, ví dụ bởi các công cụ tìm kiếm và trình đọc màn hình (như đã đề cập ở trên).

Mặt khác, bạn có thể làm cho bất kỳ phần tử nào _trông_ như tiêu đề cấp cao nhất. Hãy xem xét những điều sau:

```html
<span style="font-size: 32px; margin: 21px 0; display: block;">
  Is this a top level heading?
</span>
```

Đây là phần tử {{htmlelement("span")}}. Nó không có ngữ nghĩa. Bạn sử dụng nó để bao bọc nội dung khi bạn muốn áp dụng CSS cho nó (hoặc làm gì đó với nó bằng JavaScript) mà không cho nó bất kỳ ý nghĩa bổ sung nào. (Bạn sẽ tìm hiểu thêm về những điều này sau trong khóa học.) Chúng tôi đã áp dụng một số CSS cho nó để làm cho nó trông như tiêu đề cấp cao nhất, nhưng vì nó không có giá trị ngữ nghĩa, nó sẽ không nhận được bất kỳ lợi ích bổ sung nào như đã mô tả ở trên. Sử dụng phần tử HTML liên quan cho công việc là ý tưởng tốt.

## Tóm tắt

Đây là kết thúc nghiên cứu về tiêu đề và đoạn văn HTML của chúng ta. Tiếp theo, chúng ta sẽ xem xét thêm các khía cạnh của HTML ngữ nghĩa: cung cấp sự nhấn mạnh cho các từ.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Webpage_metadata", "Learn_web_development/Core/Structuring_content/Emphasis_and_importance", "Learn_web_development/Core/Structuring_content")}}
