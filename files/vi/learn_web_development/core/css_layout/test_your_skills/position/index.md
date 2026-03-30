---
title: "Kiểm tra kỹ năng: Định vị"
short-title: "Kiểm tra: Định vị"
slug: Learn_web_development/Core/CSS_layout/Test_your_skills/Position
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Positioning", "Learn_web_development/Core/CSS_layout/Flexbox", "Learn_web_development/Core/CSS_layout")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [định vị trong CSS](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning) bằng cách sử dụng thuộc tính và giá trị CSS {{CSSxRef("position")}} không. Bạn sẽ làm qua hai tác vụ nhỏ sử dụng các phần tử khác nhau của tài liệu bạn vừa học.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills). Bạn cũng có thể liên hệ với chúng tôi bằng một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Định vị 1

Để hoàn thành tác vụ này, hãy định vị phần tử với class `target` ở góc trên cùng bên phải của vùng chứa có viền màu xám `5px`.

**Câu hỏi bonus:** Bạn có thể thay đổi target để nó hiển thị bên dưới văn bản không?

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("position1-start", "", "400px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___position1-start live-sample___position1-finish
<div class="container">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <div class="target">Target</div>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</div>
```

```css live-sample___position1-start live-sample___position1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

* {
  box-sizing: border-box;
}

.container {
  padding: 0.5em;
  border: 5px solid #cccccc;
}

.target {
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: #663398;
  padding: 1em;
  color: white;
}

.container {
  /* Add styles here */
}

.target {
  /* Add styles here */
}
```

Khi bạn hoàn thành tác vụ này, vị trí của target sẽ trông như thế này:

{{EmbedLiveSample("position1-finish", "", "250px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Điều này yêu cầu `position: relative` và `position: absolute` và hiểu cách chúng liên quan đến nhau về định vị tương đối tạo ngữ cảnh định vị mới.
Một vấn đề có thể xảy ra là bạn thêm `position: absolute` vào phần tử con mà không áp dụng `position: relative` cho vùng chứa. Trong trường hợp đó, target sẽ được định vị so với khung nhìn.

```css live-sample___position1-finish
.container {
  position: relative;
}

.target {
  position: absolute;
  top: 0;
  right: 0;
}
```

Đối với câu hỏi bonus, bạn cần thêm `z-index` âm vào target, ví dụ `z-index: -2`.

</details>

## Định vị 2

Ở trạng thái bắt đầu của tác vụ này, nếu bạn cuộn nội dung, thanh bên cuộn cùng với nội dung. Chúng ta muốn bạn cập nhật mã để thanh bên (`<div class="sidebar">`) ở lại chỗ và chỉ nội dung cuộn.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("position2-start", "", "400px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___position2-start live-sample___position2-finish
<div class="container">
  <div class="sidebar">
    <p>
      This is the sidebar. It should remain in position as the content scrolls.
    </p>
  </div>
  <div class="content">
    <p>
      Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh
      onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.
    </p>
    <p>
      Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
      tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
      Dandelion cucumber earthnut pea peanut soko zucchini.
    </p>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo
      shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea.
      Brussels sprout coriander water chestnut gourd swiss chard wakame kohlrabi
      beetroot carrot watercress. Corn amaranth salsify bunya nuts nori azuki
      bean chickweed potato bell pepper artichoke.
    </p>
  </div>
</div>
```

```css live-sample___position2-start live-sample___position2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

* {
  box-sizing: border-box;
}

.container {
  height: 400px;
  padding: 0.5em;
  border: 5px solid #cccccc;
  overflow: auto;
}

.sidebar {
  color: white;
  background-color: #663398;
  padding: 1em;
  float: left;
  width: 150px;
}

.content {
  padding: 1em;
  margin-left: 160px;
}

.sidebar {
  /* Add styles here */
}
```

Bố cục hoàn chỉnh sẽ hiển thị như thế này (cuộn để xem hành vi):

{{EmbedLiveSample("position2-finish", "", "400px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

CSS thanh bên hoàn chỉnh của bạn sẽ trông như thế này:

```css live-sample___position2-finish
.sidebar {
  position: fixed;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Positioning", "Learn_web_development/Core/CSS_layout/Flexbox", "Learn_web_development/Core/CSS_layout")}}
