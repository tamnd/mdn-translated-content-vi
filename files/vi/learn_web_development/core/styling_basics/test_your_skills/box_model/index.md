---
title: "Kiểm tra kỹ năng: Mô hình hộp"
short-title: "Kiểm tra: Mô hình hộp"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Box_model
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Box_model", "Learn_web_development/Core/Styling_basics/Handling_conflicts", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [mô hình hộp CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Thử thách tương tác

Trước tiên, chúng tôi cung cấp cho bạn một thử thách tương tác thú vị liên quan đến cách viết tắt lề, được tạo bởi [đối tác học tập](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds) của chúng tôi, [Scrimba](https://scrimba.com/home).

Xem scrim được nhúng và hoàn thành các nhiệm vụ trên dòng thời gian (biểu tượng ma nhỏ) bằng cách làm theo hướng dẫn và chỉnh sửa code. Khi bạn hoàn thành, bạn có thể tiếp tục xem scrim để kiểm tra xem giải pháp của giáo viên có khớp với của bạn không.

<mdn-scrim-inline url="https://scrimba.com/learn-html-and-css-c0p/~01s" scrimtitle="Margin shorthand" survey="true"></scrim-inline>

## Mô hình hộp 1

Trong nhiệm vụ này, có hai hộp bên dưới, một hộp dùng mô hình hộp tiêu chuẩn, hộp kia dùng mô hình hộp thay thế. Chúng tôi muốn bạn thay đổi chiều rộng của hộp thứ hai bằng cách thêm các khai báo vào class `.alternate`, để nó khớp với chiều rộng trực quan của hộp đầu tiên.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("box-model1-start", "", "540px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___box-model1-start live-sample___box-model1-finish
<div class="box">I use the standard box model.</div>
<div class="box alternate">I use the alternate box model.</div>
```

```css live-sample___box-model1-start live-sample___box-model1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  border: 5px solid rebeccapurple;
  background-color: lightgray;
  padding: 40px;
  margin: 40px;
  width: 300px;
  height: 150px;
}

.alternate {
  box-sizing: border-box;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("box-model1-finish", "", "540px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn sẽ cần tăng chiều rộng của khối thứ hai để thêm kích thước của khoảng đệm và đường viền:

```css live-sample___box-model1-finish
.alternate {
  box-sizing: border-box;
  width: 390px;
}
```

</details>

## Mô hình hộp 2

Để hoàn thành nhiệm vụ này, hãy thêm các tính năng sau vào hộp được cung cấp:

- Đường viền đen dạng chấm `5px`.
- Lề trên `20px`.
- Lề phải `1em`.
- Lề dưới `40px`.
- Lề trái `2em`.
- Khoảng đệm ở tất cả các cạnh `1em`.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("box-model2-start", "100%", "100px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___box-model2-start live-sample___box-model2-finish
<div class="box">I use the standard box model.</div>
```

```css live-sample___box-model2-start live-sample___box-model2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

.box {
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("box-model2-finish", "100%", "140px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Nhiệm vụ này liên quan đến việc dùng các thuộc tính lề, đường viền và khoảng đệm đúng cách.
Bạn có thể chọn dùng các thuộc tính viết tay ({{cssxref("margin-top")}}, {{cssxref("margin-right")}}, v.v.); tuy nhiên, khi đặt lề và khoảng đệm cho tất cả các cạnh, cách viết tắt có lẽ là lựa chọn tốt hơn:

```css live-sample___box-model2-finish
.box {
  border: 5px dotted black;
  margin: 20px 1em 40px 2em;
  padding: 1em;
}
```

</details>

## Mô hình hộp 3

Trong nhiệm vụ này, phần tử nội tuyến có lề, khoảng đệm và đường viền. Tuy nhiên, các dòng trên và dưới đang chồng lên nó.

Để hoàn thành nhiệm vụ này, hãy cập nhật CSS để làm cho kích thước của lề, khoảng đệm và đường viền được các dòng khác tôn trọng, trong khi vẫn giữ phần tử ở dạng nội tuyến.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("box-model3-start", "100%", "220px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___box-model3-start live-sample___box-model3-finish
<div class="box">
  <p>
    Veggies es bonus vobis, <span>proinde vos postulo</span> essum magis
    kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean
    garlic.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</div>
```

```css live-sample___box-model3-start live-sample___box-model3-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

.box span {
  background-color: pink;
  border: 5px solid black;
  padding: 1em;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("box-model3-finish", "100%", "260px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Giải quyết nhiệm vụ này đòi hỏi bạn phải hiểu khi nào nên dùng các giá trị {{cssxref("display")}} khác nhau.
Sau khi thêm `display: inline-block`, lề, đường viền và khoảng đệm theo hướng khối sẽ làm cho các dòng khác bị đẩy ra xa khỏi phần tử:

```css live-sample___box-model3-finish
.box span {
  background-color: pink;
  border: 5px solid black;
  padding: 1em;
  display: inline-block;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Box_model", "Learn_web_development/Core/Styling_basics/Handling_conflicts", "Learn_web_development/Core/Styling_basics")}}
