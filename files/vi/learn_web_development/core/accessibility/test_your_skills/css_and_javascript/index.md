---
title: "Kiểm tra kỹ năng: Khả năng tiếp cận CSS và JavaScript"
short-title: "Kiểm tra: Khả năng tiếp cận CSS/JS"
slug: Learn_web_development/Core/Accessibility/Test_your_skills/CSS_and_JavaScript
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/CSS_and_JavaScript","Learn_web_development/Core/Accessibility/WAI-ARIA_basics", "Learn_web_development/Core/Accessibility")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá liệu bạn đã hiểu bài viết [Thực hành tốt nhất về khả năng tiếp cận với CSS và JavaScript](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript) của chúng ta chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng ta. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Khả năng tiếp cận CSS 1

Trong nhiệm vụ đầu tiên, bạn được trình bày một danh sách liên kết. Tuy nhiên, khả năng tiếp cận của chúng khá tệ — không có cách nào thực sự biết chúng là liên kết, hoặc biết liên kết nào người dùng đang tập trung vào. Chúng ta muốn bạn giả định rằng bộ quy tắc hiện có với bộ chọn `a` được cung cấp bởi một số CMS, và bạn không thể thay đổi nó.

Để hoàn thành nhiệm vụ, tạo các quy tắc mới để làm cho các liên kết trông và hoạt động như liên kết, và để người dùng có thể biết liên kết nào họ đang tập trung vào trong danh sách.

<!-- Code shared across examples -->

```css hidden live-sample___css-js-ally-1 live-sample___css-js-ally-2 live-sample___css-js-ally-3 live-sample___css-js-ally-1-finish live-sample___css-js-ally-2-finish
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

* {
  box-sizing: border-box;
}
```

<!-- Example-specific code -->

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("css-js-ally-1", "100%", 200) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___css-js-ally-1 live-sample___css-js-ally-1-finish
<ul>
  <li><a href="">Animals</a></li>
  <li><a href="">Computers</a></li>
  <li><a href="">Diversity and inclusion</a></li>
  <li><a href="">Food</a></li>
  <li><a href="">Medicine</a></li>
  <li><a href="">Music</a></li>
</ul>
```

```css live-sample___css-js-ally-1
a {
  text-decoration: none;
  color: #666666;
  outline: none;
}

/* Don't edit the above code! */

/* Add your code here */
```

Khi nhiệm vụ hoàn thành, các liên kết sẽ trông như thế này:

{{ EmbedLiveSample("css-js-ally-1-finish", "100%", 200) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

CSS hoàn chỉnh của bạn có thể trông như thế này:

```css
/* ... */
/* Don't edit the above code! */

li a {
  text-decoration: underline;
  color: rgb(150 0 0);
}

li a:hover,
li a:focus {
  text-decoration: none;
  color: red;
}
```

```css hidden live-sample___css-js-ally-1-finish
a {
  text-decoration: none;
  color: #666666;
  outline: none;
}

li a {
  text-decoration: underline;
  color: rgb(150 0 0);
}

li a:hover,
li a:focus {
  text-decoration: none;
  color: red;
}
```

</details>

## Khả năng tiếp cận CSS 2

Trong nhiệm vụ tiếp theo, bạn được trình bày một đoạn nội dung đơn giản — chỉ có tiêu đề và đoạn văn. Có các vấn đề về khả năng tiếp cận với màu sắc và kích thước của văn bản, và chúng ta muốn bạn sửa chúng.

Để hoàn thành nhiệm vụ:

1. Nghĩ về các vấn đề là gì, và các hướng dẫn nào quy định các giá trị chấp nhận được cho màu sắc và kích thước.
2. Cập nhật CSS với các giá trị mới cho màu sắc và font-size để sửa vấn đề.
3. Kiểm tra code để đảm bảo vấn đề đã được sửa. Giải thích các công cụ hoặc phương pháp bạn đã sử dụng để chọn các giá trị mới và kiểm tra code.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("css-js-ally-2", "100%", 240) }}

Đây là code cơ bản cho điểm bắt đầu này:

<!-- spellchecker: disable -->

```html live-sample___css-js-ally-2 live-sample___css-js-ally-2-finish
<main>
  <h1>I am the eggman</h1>

  <p>
    Prow scuttle parrel provost Sail ho shrouds spirits boom mizzenmast yardarm.
    Pinnace holystone mizzenmast quarter crow's nest nipperkin grog yardarm
    hempen halter furl.
  </p>

  <h2>They are the eggman</h2>

  <p>
    Swab barque interloper chantey doubloon starboard grog black jack gangway
    rutters.
  </p>

  <h2>I am the walrus</h2>

  <p>
    Deadlights jack lad schooner scallywag dance the hempen jig carouser
    broadside cable strike colors.
  </p>
</main>
```

<!-- spellchecker: enable -->

```css live-sample___css-js-ally-2
/* Edit the CSS to fix the a11y problems */

main {
  padding: 20px;
  background-color: red;
}

h1,
h2,
p {
  color: #999999;
}

h1 {
  font-size: 2vw;
}

h2 {
  font-size: 1.5vw;
}

p {
  font-size: 1.2vw;
}
```

Nội dung đã cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("css-js-ally-2-finish", "100%", 600) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

1. Các vấn đề là:
   - Độ tương phản màu sắc không chấp nhận được, theo tiêu chí WCAG [1.4.3 (AA)](https://w3c.github.io/wcag/guidelines/22/#contrast-minimum) và [1.4.6 (AAA)](https://w3c.github.io/wcag/guidelines/22/#contrast-enhanced).
   - Văn bản được định kích thước bằng đơn vị `vw`, có nghĩa là nó không thể thu phóng trong hầu hết các trình duyệt. [WCAG 1.4.4 (AA)](https://w3c.github.io/wcag/guidelines/22/#resize-text) nêu rằng văn bản phải có thể thay đổi kích thước.
2. Để sửa code, bạn cần:
   - Chọn bộ màu nền và màu chữ tương phản tốt hơn.
   - Sử dụng một số đơn vị khác để định kích thước văn bản (như `rem` hoặc thậm chí `px`), hoặc thậm chí triển khai thứ gì đó sử dụng kết hợp `vw` và các đơn vị khác, nếu bạn muốn nó có thể thay đổi kích thước nhưng vẫn tương đối với kích thước viewport.
3. Để kiểm tra:
   - Bạn có thể kiểm tra độ tương phản màu sắc bằng công cụ như [aXe](https://www.deque.com/axe/), [Firefox Accessibility Inspector](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/), hoặc thậm chí một công cụ trang web độc lập đơn giản như [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/).
   - Để thay đổi kích thước văn bản, bạn cần tải ví dụ trong trình duyệt và thử thay đổi kích thước nó. Thay đổi kích thước văn bản có đơn vị `vw` hoạt động trong Safari, nhưng không hoạt động trong Firefox hoặc các trình duyệt dựa trên Chromium.

Đối với code đã cập nhật, điều gì đó như thế này sẽ sửa độ tương phản màu sắc:

```css live-sample___css-js-ally-2-finish
main {
  padding: 20px;
  background-color: red;
}

h1,
h2,
p {
  color: black;
}
```

Và điều gì đó như thế này sẽ hoạt động cho kích thước font:

```css live-sample___css-js-ally-2-finish
h1 {
  font-size: 2.5rem;
}

h2 {
  font-size: 2rem;
}

p {
  font-size: 1.2rem;
}
```

Hoặc điều này, nếu bạn muốn làm điều gì đó thông minh hơn một chút cho văn bản tương đối viewport có thể thay đổi kích thước:

```css
h1 {
  font-size: calc(1.5vw + 1rem);
}

h2 {
  font-size: calc(1.2vw + 0.7rem);
}

p {
  font-size: calc(1vw + 0.4rem);
}
```

</details>

## Khả năng tiếp cận JavaScript 1

Trong nhiệm vụ khả năng tiếp cận cuối cùng, bạn có một số JavaScript cần thực hiện. Chúng ta có một ứng dụng trình bày danh sách tên động vật. Nhấp vào một trong các tên động vật khiến mô tả thêm về động vật đó xuất hiện trong hộp bên dưới danh sách.

Nhưng nó không dễ tiếp cận lắm — ở trạng thái hiện tại, bạn chỉ có thể vận hành nó bằng chuột. Chúng ta muốn bạn thêm một số HTML và JavaScript để làm cho nó có thể điều hướng bằng bàn phím.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("css-js-ally-3", "100%", 400) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___css-js-ally-3
<section class="preview">
  <div class="animal-list">
    <h1>Animal summaries</h1>

    <p>
      The following list of animals can be clicked to display a description of
      that animal.
    </p>

    <ul>
      <li
        data-description="A type of wild mountain goat, with large recurved horns, found in Eurasia, North Africa, and East Africa.">
        Ibex
      </li>
      <li
        data-description="A medium-sized marine mammal, similar to a manatee, but with a Dolphin-like tail.">
        Dugong
      </li>
      <li
        data-description="A rare marsupial, which looks rather like a tiny kangaroo, measuring around 50 to 75 centimeters.">
        Quokka
      </li>
    </ul>
  </div>

  <div class="animal-description">
    <h2></h2>

    <p></p>
  </div>
</section>
```

```css hidden live-sample___css-js-ally-3
p {
  color: purple;
  margin: 0.5em 0;
}

li {
  cursor: pointer;
}
```

```js live-sample___css-js-ally-3
const listItems = document.querySelectorAll("li");
const descHeading = document.querySelector(".animal-description h2");
const descPara = document.querySelector(".animal-description p");

listItems.forEach((item) => {
  item.addEventListener("mouseup", handleSelection);
});

function handleSelection(e) {
  const heading = e.target.textContent;
  const description = e.target.getAttribute("data-description");
  descHeading.textContent = heading;
  descPara.textContent = description;
}
```

Chúng ta không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì nó trông giống như điểm bắt đầu.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

1. Để bắt đầu, bạn cần thêm `tabindex="0"` vào các mục danh sách để làm cho chúng có thể tập trung qua bàn phím.
2. Sau đó bạn cần thêm một trình lắng nghe sự kiện khác bên trong vòng lặp `forEach()`, để làm cho code phản hồi khi các phím được nhấn trong khi các mục danh sách được chọn. Có thể là ý tưởng tốt để làm cho nó phản hồi với một phím cụ thể, chẳng hạn như "Enter", trong trường hợp đó, điều gì đó như sau có thể chấp nhận được:

```js
item.addEventListener("keyup", (e) => {
  if (e.key === "Enter") {
    handleSelection(e);
  }
});
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/CSS_and_JavaScript","Learn_web_development/Core/Accessibility/WAI-ARIA_basics", "Learn_web_development/Core/Accessibility")}}
