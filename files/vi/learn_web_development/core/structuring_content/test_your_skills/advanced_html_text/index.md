---
title: "Kiểm tra kỹ năng: Văn bản HTML nâng cao"
short-title: "Kiểm tra: Văn bản HTML nâng cao"
slug: Learn_web_development/Core/Structuring_content/Test_your_skills/Advanced_HTML_text
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Advanced_text_features", "Learn_web_development/Core/Structuring_content/Marking_up_a_letter", "Learn_web_development/Core/Structuring_content")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách sử dụng [các phần tử HTML ít được biết đến để đánh dấu các tính năng ngữ nghĩa nâng cao](/en-US/docs/Learn_web_development/Core/Structuring_content/Advanced_text_features) hay không.

> [!NOTE]
> Để được trợ giúp, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Văn bản nâng cao 1

Trong bài tập này, chúng tôi muốn bạn thêm một số ngữ nghĩa vào HTML được cung cấp.

Để hoàn thành bài tập này:

1. Chuyển đoạn văn thứ hai thành trích dẫn khối, và chỉ ra về mặt ngữ nghĩa rằng trích dẫn được lấy từ [Accessibility](/en-US/docs/Learn_web_development/Core/Accessibility).
2. Đánh dấu "HTML" và "CSS" như các từ viết tắt về mặt ngữ nghĩa, cung cấp phần mở rộng dưới dạng tooltip.
3. Sử dụng chỉ số dưới và chỉ số trên để cung cấp ngữ nghĩa chính xác cho các công thức hóa học và ngày tháng, và hiển thị chúng đúng cách.
4. Liên kết về mặt ngữ nghĩa các ngày tháng có thể đọc được bởi máy với các ngày tháng trong văn bản.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('advanced-text', "100%", 260) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___advanced-text
<h1>Advanced text semantics</h1>

<p>Let's start with a quote:</p>

<p>
  HTML, Hypertext Markup Language is by default accessible, if used correctly.
</p>

<p>CSS can also be used to make web pages more, or less, accessible.</p>

<p>Chemical Formulae: H2O (Water), C2H6O (Ethanol).</p>

<p>
  Dates: December 25th 2019 (Christmas Day), November 2nd 2019 (Día de los
  Muertos).
</p>
```

```css hidden live-sample___advanced-text live-sample___advanced-text-solution
body {
  background-color: white;
  color: #333333;
  font:
    1em / 1.4 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0;
}

h1 {
  font-size: 2rem;
  margin: 0;
  color: purple;
}

p {
  margin: 0.5em 0;
}

abbr,
time {
  color: green;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{EmbedLiveSample('advanced-text-solution', "", 260)}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___advanced-text-solution
<h1>Advanced text semantics</h1>

<p>Let's start with a quote:</p>

<blockquote cite="https://developer.mozilla.org/en-US/docs/Learn/Accessibility">
  <p>
    <abbr title="HyperText Markup Language">HTML</abbr>, Hypertext Markup
    Language is by default accessible, if used correctly.
  </p>
</blockquote>

<p>
  <abbr title="Cascading Style Sheets">CSS</abbr>, Cascading Style Sheets, can
  also be used to make web pages more, or less, accessible.
</p>

<p>
  Chemical Formulae: H<sub>2</sub>O (Water), C<sub>2</sub>H<sub>6</sub>O
  (Ethanol).
</p>

<p>
  Dates:
  <time datetime="2019-12-25">December 25<sup>th</sup> 2019</time>
  (Christmas Day),
  <time datetime="2019-11-02">November 2<sup>nd</sup> 2019</time> (Día de los
  Muertos).
</p>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Advanced_text_features", "Learn_web_development/Core/Structuring_content/Marking_up_a_letter", "Learn_web_development/Core/Structuring_content")}}
