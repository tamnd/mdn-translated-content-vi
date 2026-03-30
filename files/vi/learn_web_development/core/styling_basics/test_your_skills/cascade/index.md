---
title: "Kiểm tra kỹ năng: Tầng tầng"
short-title: "Kiểm tra: Tầng tầng"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Cascade
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Handling_conflicts", "Learn_web_development/Core/Styling_basics/Fixing_blog_styles", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu các giá trị thuộc tính phổ quát để [kiểm soát kế thừa trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Tầng tầng 1

Trong nhiệm vụ này, chúng tôi muốn bạn dùng một trong các giá trị đặc biệt chúng tôi đã xem xét trong phần [kiểm soát kế thừa](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#controlling_inheritance).

Để hoàn thành nhiệm vụ, hãy viết một khai báo trong một quy tắc mới để đặt lại màu nền về màu trắng, mà không dùng giá trị màu thực tế.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("cascade1-start", "100%", "110px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___cascade1-start live-sample___cascade1-finish
<div class="container" id="outer">
  <div class="container" id="inner">
    <ul>
      <li class="nav"><a href="#">One</a></li>
      <li class="nav"><a href="#">Two</a></li>
    </ul>
  </div>
</div>
```

```css live-sample___cascade1-start live-sample___cascade1-finish
#outer div ul .nav a {
  background-color: powderblue;
  padding: 5px;
  display: inline-block;
  margin-bottom: 10px;
}

div div li a {
  color: rebeccapurple;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("cascade1-finish", "100%", "110px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Một giải pháp có thể như sau:

```css live-sample___cascade1-finish
#outer #inner a {
  background-color: inherit;
}
```

Có hai điều bạn cần làm trong nhiệm vụ này. Đầu tiên, viết một bộ chọn cho phần tử `a` có độ đặc hiệu cao hơn bộ chọn dùng để làm nền màu xanh bột. Trong giải pháp này, điều này đạt được bằng cách dùng bộ chọn `id`, có độ đặc hiệu rất cao.

Sau đó bạn cần nhớ rằng có các giá trị từ khóa đặc biệt cho tất cả các thuộc tính. Trong trường hợp này, dùng `inherit` sẽ đặt màu nền trở lại giống với phần tử cha của nó.

</details>

## Tầng tầng 2

Để hoàn thành nhiệm vụ này, hãy thao tác thứ tự tầng tầng để tô màu các liên kết thành `rebeccapurple`. Đừng chỉnh sửa khai báo `lightgreen`!

Nhiệm vụ này là mục tiêu nâng cao — nó đòi hỏi kiến thức về các tầng tầng, mà chúng tôi không đề cập trong bài [Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts). Bạn có thể tìm thấy thông tin bạn cần để thử nhiệm vụ này tại [Các tầng tầng > Xác định mức ưu tiên dựa trên thứ tự các tầng](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers#determining_the_precedence_based_on_the_order_of_layers).

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("cascade2-start", "100%", "110px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___cascade2-start live-sample___cascade2-finish
<div class="container" id="outer">
  <div class="container" id="inner">
    <ul>
      <li class="nav"><a href="#">One</a></li>
      <li class="nav"><a href="#">Two</a></li>
    </ul>
  </div>
</div>
```

```css live-sample___cascade2-start
@layer yellow, purple, green;

@layer yellow {
  #outer div ul .nav a {
    padding: 5px;
    display: inline-block;
    margin-bottom: 10px;
  }
}
@layer purple {
  div div li a {
    color: rebeccapurple;
  }
}
@layer green {
  a {
    color: lightgreen;
  }
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("cascade2-finish", "100%", "110px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Một giải pháp có thể như sau:

```css live-sample___cascade2-finish
@layer yellow, green, purple;
```

```css hidden live-sample___cascade2-finish
@layer yellow {
  #outer div ul .nav a {
    padding: 5px;
    display: inline-block;
    margin-bottom: 10px;
  }
}
@layer purple {
  div div li a {
    color: rebeccapurple;
  }
}
@layer green {
  a {
    color: lightgreen;
  }
}
```

Có một điều bạn cần làm trong nhiệm vụ này: thay đổi thứ tự ưu tiên để khai báo cho màu mong muốn nằm trong tầng được khai báo cuối cùng, đó là điều giải pháp này thể hiện.

Bạn cần nhớ rằng các kiểu thông thường không có tầng được ưu tiên hơn các kiểu thông thường có tầng. Nhưng nếu tất cả các kiểu đều nằm trong các tầng — như trong trường hợp của nhiệm vụ này — các kiểu trong các tầng được khai báo sau sẽ được ưu tiên hơn các kiểu được khai báo trong các tầng trước. Di chuyển tầng purple lên cuối có nghĩa là nó được ưu tiên hơn các tầng green và yellow.

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Handling_conflicts", "Learn_web_development/Core/Styling_basics/Fixing_blog_styles", "Learn_web_development/Core/Styling_basics")}}
