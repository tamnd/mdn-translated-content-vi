---
title: "Kiểm tra kỹ năng: Floats"
short-title: "Kiểm tra: Floats"
slug: Learn_web_development/Core/CSS_layout/Test_your_skills/Floats
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Floats", "Learn_web_development/Core/CSS_layout/Positioning", "Learn_web_development/Core/CSS_layout")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [floats trong CSS](/en-US/docs/Learn_web_development/Core/CSS_layout/Floats) bằng cách sử dụng các thuộc tính và giá trị {{CSSxRef("float")}} và {{CSSxRef("clear")}} cũng như các phương pháp khác để clearing floats. Bạn sẽ làm qua ba tác vụ nhỏ sử dụng các phần tử khác nhau của tài liệu bạn vừa học.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills). Bạn cũng có thể liên hệ với chúng tôi bằng một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Floats 1

Để hoàn thành tác vụ này, hãy float hai phần tử với các class `float1` và `float2` sang trái và phải tương ứng. Văn bản sau đó sẽ xuất hiện giữa hai phần tử.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("float1-start", "", "440px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___float1-start live-sample___float1-finish
<div class="box">
  <div class="float float1">One</div>
  <div class="float float2">Two</div>
  <p>The two boxes should float to either side of this text.</p>
</div>
```

```css live-sample___float1-start live-sample___float1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

* {
  box-sizing: border-box;
}

.box {
  padding: 0.5em;
}

.float {
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rebeccapurple;
  color: white;
  padding: 1em;
}

.float1 {
  /* Add styles here */
}

.float2 {
  /* Add styles here */
}
```

Bố cục sẽ trông như thế này khi tác vụ hoàn thành:

{{EmbedLiveSample("float1-finish", "", "210px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn có thể sử dụng `float` cho cả hai hộp:

```css live-sample___float1-finish
.float1 {
  float: left;
}

.float2 {
  float: right;
}
```

</details>

## Floats 2

Để hoàn thành tác vụ này:

1. Float phần tử với class `float` sang trái.
2. Cập nhật mã để dòng văn bản đầu tiên hiển thị cạnh phần tử đó, nhưng dòng văn bản tiếp theo (có class `below`) hiển thị bên dưới nó.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("float2-start", "", "300px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___float2-start live-sample___float2-finish
<div class="box">
  <div class="float">Float</div>
  <p>This sentence appears next to the float.</p>
  <p class="below">Make this sentence appear below the float.</p>
</div>
```

```css live-sample___float2-start live-sample___float2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

* {
  box-sizing: border-box;
}

.box {
  padding: 0.5em;
}

.float {
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rebeccapurple;
  color: white;
  padding: 1em;
}

.float {
  /* Add styles here */
}

.below {
  /* Add styles here */
}
```

Bố cục hoàn chỉnh sẽ trông như thế này:

{{EmbedLiveSample("float2-finish", "", "300px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn cần float mục sang trái, sau đó thêm `clear: left` vào class cho đoạn thứ hai:

```css live-sample___float2-finish
.float {
  float: left;
}

.below {
  clear: left;
}
```

</details>

## Floats 3

Trong tác vụ này, chúng ta có một phần tử float. Hộp nền bao quanh float và văn bản hiện không mở rộng bên dưới phần tử float.

Để hoàn thành tác vụ này, hãy sử dụng phương pháp cập nhật nhất để đảm bảo hộp nền chứa phần tử float và mở rộng bên dưới nó.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("float3-start", "", "220px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___float3-start live-sample___float3-finish
<div class="box">
  <div class="float">Float</div>
  <p>This sentence appears next to the float.</p>
</div>
```

```css live-sample___float3-start live-sample___float3-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

* {
  box-sizing: border-box;
}

.box {
  padding: 0.5em;
}

.float {
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
  color: white;
}

.box {
  background-color: rebeccapurple;
  padding: 10px;
  color: white;
}

.float {
  float: right;
}

.box {
  /* Add styles here */
}
```

Khi bạn hoàn thành tác vụ, hộp nền và phần tử float sẽ trông như thế này:

{{EmbedLiveSample("float3-finish", "", "220px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Xóa hộp bên dưới mục float bằng cách thêm `display: flow-root` vào class cho `.box`.
Các phương pháp khác có thể là sử dụng `overflow` hoặc hack clearfix, tuy nhiên tài liệu học tập mô tả phương pháp `flow-root` là cách hiện đại để đạt được điều này.

```css live-sample___float3-finish
.box {
  display: flow-root;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Floats", "Learn_web_development/Core/CSS_layout/Positioning", "Learn_web_development/Core/CSS_layout")}}
