---
title: "Thách thức: Đánh dấu một bức thư"
short-title: "Thách thức: Đánh dấu thư"
slug: Learn_web_development/Core/Structuring_content/Marking_up_a_letter
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Advanced_HTML_text", "Learn_web_development/Core/Structuring_content/Structuring_documents", "Learn_web_development/Core/Structuring_content")}}

Tất cả chúng ta đều học cách viết thư sớm hay muộn; đây cũng là ví dụ hữu ích để kiểm tra kỹ năng định dạng văn bản của chúng ta. Trong thách thức này, chúng ta cung cấp cho bạn một bức thư để đánh dấu như một bài kiểm tra về kỹ năng định dạng văn bản HTML và kiến thức về nội dung `<head>` HTML.

## Điểm xuất phát

Để bắt đầu, hãy nhấp vào nút **Play** trong bảng mã mẫu bên dưới để mở văn bản body được cung cấp trong MDN Playground. Bạn sẽ làm theo hướng dẫn trong các phần tiếp theo để đánh dấu văn bản một cách phù hợp.

```html-nolint live-sample___start
Dr. Eleanor Gaye
Awesome Science faculty
University of Awesome
Bobtown, CA 99999,
USA
Tel: 123-456-7890
Email: no_reply@example.com

20 January 2016

Miss Eileen Dover
4321 Cliff Top Edge
Dover, CT9 XXX
UK

Re: Eileen Dover university application

Dear Eileen,

Thank you for your recent application to join us at the University of
Awesome's science faculty to study as part of your
PhD (Doctor of Philosophy) next year. I will answer your
questions one by one, in the following sections.

Starting dates

We are happy to accommodate you starting your study with us at any time,
however it would suit us better if you could start at the beginning of a
semester; the start dates for each one are as follows:

First semester: 9 September 2016
Second semester: 15 January 2017
Third semester: 2 May 2017

Please let me know if this is ok, and if so which start date you would
prefer.

Subjects of study

At the Awesome Science Faculty, we have a pretty open-minded research
facility — as long as the subjects fall somewhere in the realm of science
and technology. You seem like an intelligent, dedicated researcher, and
just the kind of person we'd like to have on our team. Saying that, of the
ideas you submitted we were most intrigued by are as follows, in order of
priority:

Turning H2O into wine, and the health benefits of Resveratrol
(C14H12O3).
Measuring the effect on performance of funk bass players at temperatures
exceeding 30°C (86°F), when the audience size exponentially increases
(effect of 3 × 103 increasing to 3 × 104).
HTML, Hypertext Markup Language, and CSS,
Cascading Style Sheets, constructs for representing musical scores.

So please can you provide more information on each of these subjects,
including how long you'd expect the research to take, required staff and
other resources, and anything else you think we'd need to know? Thanks.

Exotic dance moves

Yes, you are right! As part of my post-doctorate work, I
did study exotic tribal dances. To answer your question, my
favorite dances are as follows, with definitions:

Polynesian chicken dance
    A little known but very influential dance dating back as far as
    300 BCE, a whole village would
    dance around in a circle like chickens, to encourage their livestock to
    be "fruitful".
Icelandic brownian shuffle
    Before the Icelanders developed fire as a means of getting warm, they
    used to practice this dance, which involved huddling close together in a
    circle on the floor, and shuffling their bodies around in imperceptibly
    tiny, very rapid movements. One of my fellow students used to say that
    he thought this dance inspired modern styles such as Twerking.
Arctic robot dance
    An interesting example of historic misinformation, English explorers in
    the 1960s believed to have discovered a new dance style characterized by
    "robotic", stilted movements, being practiced by inhabitants of Northern
    Alaska and Canada. Later on however it was discovered that they were
    just moving like this because they were really cold.

Yours sincerely,

Dr Eleanor Gaye

University of Awesome motto: Be awesome to each other. --
The memoirs of Bill S Preston, Esq.
```

{{embedlivesample("start", "100%", "200px")}}

## Tóm tắt dự án

Đối với dự án này, nhiệm vụ của bạn là đánh dấu một bức thư cần được lưu trữ trên mạng nội bộ đại học. Bức thư là phản hồi từ một nghiên cứu sinh cho một sinh viên tiến sĩ tiềm năng liên quan đến đơn xin vào trường đại học.

### Ngữ nghĩa khối/cấu trúc

- Thêm cấu trúc HTML phù hợp bao gồm doctype, và các phần tử {{htmlelement("html")}}, {{htmlelement("head")}} và {{htmlelement("body")}}.
- Nói chung, bức thư nên được đánh dấu như một tổ chức của tiêu đề và đoạn văn, ngoại trừ các địa chỉ được đề cập trong bullet tiếp theo. Có một tiêu đề cấp cao nhất (dòng "Re:") và ba tiêu đề cấp hai.
- Đặt hai địa chỉ bên trong các phần tử {{htmlelement("address")}}. Mỗi dòng của địa chỉ nên nằm trên một dòng mới, nhưng không trong một đoạn văn mới.
- Sử dụng loại danh sách phù hợp để đánh dấu ngày bắt đầu học kỳ, các môn học, và các điệu nhảy kỳ lạ.

### Ngữ nghĩa nội tuyến

- Tên của người gửi và người nhận (và _Tel_ và _Email_) nên được đánh dấu với tầm quan trọng mạnh.
- Bốn ngày trong tài liệu nên được bọc trong các phần tử phù hợp chứa ngày có thể đọc được bởi máy.
- Địa chỉ đầu tiên và ngày đầu tiên trong bức thư nên có giá trị thuộc tính `class` là `sender-column` được đặt trên chúng. CSS bạn sẽ thêm sau này sẽ khiến chúng được căn phải, như trong bố cục thư cổ điển.
- Đánh dấu năm từ viết tắt/rút gọn sau trong văn bản chính của bức thư — "PhD," "HTML," "CSS," "BCE," và "Esq." — để cung cấp phần mở rộng cho từng từ.
- Sáu chỉ số dưới/trên nên được đánh dấu phù hợp — trong các công thức hóa học, và các số 103 và 104 (chúng nên là 10 mũ 3 và 4 tương ứng).
- Đánh dấu ít nhất hai từ thích hợp khác trong văn bản với tầm quan trọng mạnh/nhấn mạnh.
- Đánh dấu trích dẫn phương châm của trường đại học và trích dẫn với các phần tử phù hợp.

### Phần head của tài liệu

- Bộ ký tự của tài liệu nên được đặt là `utf-8` bằng thẻ `<meta>` phù hợp.
- Tác giả của bức thư nên được chỉ định trong thẻ `<meta>` phù hợp.
- Bạn nên đặt ngôn ngữ của tài liệu là `en-US`.
- Bao gồm văn bản sau bên trong phần tử tiêu đề tài liệu: "Awesome science application correspondence".
- CSS sau nên được bao gồm bên trong một phần tử phù hợp bên trong head:

  ```css
  body {
    font: 1.2em / 1.5 system-ui;
  }

  .sender-column {
    text-align: right;
  }

  h1 {
    font-size: 1.5em;
  }

  h2 {
    font-size: 1.3em;
  }
  ```

## Gợi ý và mẹo

- Sử dụng [trình xác thực HTML W3C](https://validator.w3.org/) để xác thực HTML của bạn. Thưởng thêm điểm nếu nó xác thực thành công.
- Bạn không cần biết bất kỳ CSS nào để thực hiện bài tập này. Bạn chỉ cần đặt CSS được cung cấp bên trong một phần tử HTML.

## Ví dụ

Ví dụ trực tiếp sau đây cho thấy bức thư trông như thế nào sau khi được đánh dấu. Nếu bạn bị kẹt về cách đạt được một số điều này, hãy xem giải pháp bên dưới ví dụ trực tiếp.

{{embedlivesample("finish", "100%", "500px")}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___finish
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="author" content="Dr. Eleanor Gaye" />
    <title>Awesome science application correspondence</title>
    <style>
      body {
        font: 1.2em / 1.5 system-ui;
      }

      .sender-column {
        text-align: right;
      }

      h1 {
        font-size: 1.5em;
      }

      h2 {
        font-size: 1.3em;
      }
    </style>
  </head>
  <body>
    <address class="sender-column">
      <strong>Dr. Eleanor Gaye</strong><br />
      Awesome Science faculty<br />
      University of Awesome<br />
      Bobtown, CA 99999,<br />
      USA<br />
      <strong>Tel</strong>: 123-456-7890<br />
      <strong>Email</strong>: no_reply@example.com
    </address>

    <p class="sender-column">
      <time datetime="2016-01-20">20 January 2016</time>
    </p>

    <address>
      <strong>Miss Eileen Dover</strong><br />
      4321 Cliff Top Edge<br />
      Dover, CT9 XXX<br />
      UK
    </address>

    <h1>Re: Eileen Dover university application</h1>

    <p>Dear Eileen,</p>

    <p>
      Thank you for your recent application to join us at the University of
      Awesome's science faculty to study as part of your
      <abbr>PhD</abbr> (Doctor of Philosophy) next year. I will answer your
      questions one by one, in the following sections.
    </p>

    <h2>Starting dates</h2>

    <p>
      We are happy to accommodate you starting your study with us at any time,
      however it would suit us better if you could start at the beginning of a
      semester; the start dates for each one are as follows:
    </p>

    <ul>
      <li>
        First semester: <time datetime="2016-09-09">9 September 2016</time>
      </li>
      <li>
        Second semester: <time datetime="2017-01-15">15 January 2017</time>
      </li>
      <li>Third semester: <time datetime="2017-05-02">2 May 2017</time></li>
    </ul>

    <p>
      Please let me know if this is ok, and if so which start date you would
      prefer.
    </p>

    <h2>Subjects of study</h2>

    <p>
      At the Awesome Science Faculty, we have a pretty open-minded research
      facility — as long as the subjects fall somewhere in the realm of science
      and technology. You seem like an intelligent, dedicated researcher, and
      just the kind of person we'd like to have on our team. Saying that, of the
      ideas you submitted we were most intrigued by are as follows, in order of
      priority:
    </p>

    <ol>
      <li>
        Turning H<sub>2</sub>O into wine, and the health benefits of Resveratrol
        (C<sub>14</sub>H<sub>12</sub>O<sub>3</sub>).
      </li>
      <li>
        Measuring the effect on performance of funk bass players at temperatures
        exceeding 30°C (86°F), when the audience size exponentially increases
        (effect of 3 × 10<sup>3</sup> increasing to 3 × 10<sup>4</sup>).
      </li>
      <li>
        <abbr>HTML</abbr>, Hypertext Markup Language, and <abbr>CSS</abbr>,
        Cascading Style Sheets, constructs for representing musical scores.
      </li>
    </ol>

    <p>
      So please can you provide more information on each of these subjects,
      including how long you'd expect the research to take, required staff and
      other resources, and anything else you think we'd need to know? Thanks.
    </p>

    <h2>Exotic dance moves</h2>

    <p>
      Yes, you are right! As part of my post-doctorate work, I
      <em>did</em> study exotic tribal dances. To answer your question, my
      favorite dances are as follows, with definitions:
    </p>

    <dl>
      <dt>Polynesian chicken dance</dt>
      <dd>
        A little known but <em>very</em> influential dance dating back as far as
        300 <abbr title="Before Common Era">BCE</abbr>, a whole village would
        dance around in a circle like chickens, to encourage their livestock to
        be "fruitful".
      </dd>
      <dt>Icelandic brownian shuffle</dt>
      <dd>
        Before the Icelanders developed fire as a means of getting warm, they
        used to practice this dance, which involved huddling close together in a
        circle on the floor, and shuffling their bodies around in imperceptibly
        tiny, very rapid movements. One of my fellow students used to say that
        he thought this dance inspired modern styles such as Twerking.
      </dd>
      <dt>Arctic robot dance</dt>
      <dd>
        An interesting example of historic misinformation, English explorers in
        the 1960s believed to have discovered a new dance style characterized by
        "robotic", stilted movements, being practiced by inhabitants of Northern
        Alaska and Canada. Later on however it was discovered that they were
        just moving like this because they were really cold.
      </dd>
    </dl>

    <p>Yours sincerely,</p>

    <p>Dr Eleanor Gaye</p>

    <p>
      University of Awesome motto: <q>Be awesome to each other.</q> --
      <cite
        >The memoirs of Bill S Preston, <abbr title="Esquire">Esq.</abbr></cite
      >
    </p>
  </body>
</html>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Advanced_HTML_text", "Learn_web_development/Core/Structuring_content/Structuring_documents", "Learn_web_development/Core/Structuring_content")}}
