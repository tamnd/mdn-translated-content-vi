---
title: "Kiểm tra kỹ năng: Flexbox"
short-title: "Kiểm tra: Flexbox"
slug: Learn_web_development/Core/CSS_layout/Test_your_skills/Flexbox
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Flexbox", "Learn_web_development/Core/CSS_layout/Grids", "Learn_web_development/Core/CSS_layout")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách [flexbox và các mục flex](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox) hoạt động không. Dưới đây là bốn bộ vấn đề thiết kế bạn có thể giải quyết bằng flexbox. Nhiệm vụ của bạn là sửa các vấn đề.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills). Bạn cũng có thể liên hệ với chúng tôi bằng một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Thử thách tương tác

Trước tiên, chúng ta cung cấp cho bạn thử thách flexbox tương tác thú vị được tạo bởi [đối tác học tập](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds) của chúng ta, [Scrimba](https://scrimba.com/home).

Xem scrim được nhúng và hoàn thành tất cả các tác vụ trên timeline (các biểu tượng ma nhỏ) bằng cách làm theo hướng dẫn và chỉnh sửa mã. Khi bạn hoàn thành, bạn có thể tiếp tục xem scrim để kiểm tra xem giải pháp của giáo viên có khớp với của bạn không.

<mdn-scrim-inline url="https://scrimba.com/frontend-path-c0j/~03a" scrimtitle="Flexbox alignment challenges" survey="true"></scrim-inline>

## Flexbox 1

Trong tác vụ này, chúng ta sử dụng một số mục danh sách để tạo điều hướng cho trang web. Để hoàn thành tác vụ, hãy sử dụng flexbox để bố cục các mục danh sách như một hàng, với lượng không gian bằng nhau giữa mỗi mục.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("flexbox1-start", "", "240px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___flexbox1-start live-sample___flexbox1-finish
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/about">About Us</a></li>
    <li><a href="/products">Our Products</a></li>
    <li><a href="/contact">Contact Us</a></li>
  </ul>
</nav>
```

```css live-sample___flexbox1-start live-sample___flexbox1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
nav ul {
  max-width: 750px;
  list-style: none;
  padding: 0;
  margin: 0;
}
nav a:link,
nav a:visited {
  background-color: #4d7298;
  border: 2px solid #77a6b6;
  border-radius: 0.5em;
  color: white;
  padding: 0.5em;
  display: inline-block;
  text-decoration: none;
}

nav ul {
  /* Add styles here */
}
```

Khi tác vụ hoàn thành, các mục sẽ trông như thế này:

{{EmbedLiveSample("flexbox1-finish", "", "100px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn có thể áp dụng `display: flex` và kiểm soát khoảng cách bằng thuộc tính `justify-content`:

```css live-sample___flexbox1-finish
nav ul {
  display: flex;
  justify-content: space-between;
}
```

</details>

## Flexbox 2

Trong tác vụ này, các mục danh sách đều có kích thước khác nhau, nhưng chúng ta muốn chúng được hiển thị như ba cột có kích thước bằng nhau, bất kể nội dung trong mỗi mục.

**Câu hỏi bonus:** Bây giờ bạn có thể làm cho mục đầu tiên có kích thước gấp đôi các mục khác không?

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("flexbox2-start", "", "240px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___flexbox2-start live-sample___flexbox2-finish
<ul>
  <li>I am small</li>
  <li>I have more content than the very small item.</li>
  <li>
    I have lots of content. So much content that I don't know where it is all
    going to go. I'm glad that CSS is pretty good at dealing with situations
    where we end up with more words than expected!
  </li>
</ul>
```

```css live-sample___flexbox2-start live-sample___flexbox2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
ul {
  max-width: 750px;
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  background-color: #4d7298;
  border: 2px solid #77a6b6;
  border-radius: 0.5em;
  color: white;
  padding: 0.5em;
}

ul {
  /* Add styles here */
}

li {
  /* Add styles here */
}
```

Khi tác vụ hoàn thành, các mục sẽ trông như thế này:

{{EmbedLiveSample("flexbox2-finish", "", "380px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Tốt nhất là sử dụng viết tắt, vì vậy trong trường hợp này `flex: 1` có lẽ là câu trả lời tốt nhất, và do đó kết quả tối ưu nhất sẽ là:

```css live-sample___flexbox2-finish
ul {
  display: flex;
}

li {
  flex: 1;
}
```

Đối với câu hỏi bonus, hãy thêm selector nhắm vào phần tử đầu tiên và đặt `flex: 2;` (hoặc `flex: 2 0 0;` hoặc `flex-grow: 2`):

```css live-sample___flexbox2-finish
li:first-child {
  flex: 2;
}
```

</details>

## Flexbox 3

Trong tác vụ này, chúng ta muốn bạn sắp xếp các mục danh sách thành các hàng.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("flexbox3-start", "", "260px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___flexbox3-start live-sample___flexbox3-finish
<ul>
  <li>Turnip</li>
  <li>greens</li>
  <li>yarrow</li>
  <li>ricebean</li>
  <li>rutabaga</li>
  <li>endive</li>
  <li>cauliflower</li>
  <li>sea lettuce</li>
  <li>kohlrabi</li>
  <li>amaranth</li>
</ul>
```

```css live-sample___flexbox3-start live-sample___flexbox3-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
ul {
  width: 450px;
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  background-color: #4d7298;
  border: 2px solid #77a6b6;
  border-radius: 0.5em;
  color: white;
  padding: 0.5em;
  margin: 0.5em;
}

ul {
  /* Add styles here */
}

li {
  /* Add styles here */
}
```

Khi tác vụ hoàn thành, các mục sẽ trông như thế này:

{{EmbedLiveSample("flexbox3-finish", "", "260px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Tác vụ này yêu cầu hiểu về thuộc tính `flex-wrap` để bao bọc các dòng flex. Ngoài ra, để đảm bảo kết quả trông giống như ví dụ, bạn cần đặt `flex: auto` trên phần tử con (hoặc `flex: 1 1 auto;`).

```css live-sample___flexbox3-finish
ul {
  display: flex;
  flex-wrap: wrap;
}

li {
  flex: auto;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Flexbox", "Learn_web_development/Core/CSS_layout/Grids", "Learn_web_development/Core/CSS_layout")}}
