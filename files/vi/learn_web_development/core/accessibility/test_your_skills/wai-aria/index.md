---
title: "Kiểm tra kỹ năng: WAI-ARIA"
short-title: "Kiểm tra: WAI-ARIA"
slug: Learn_web_development/Core/Accessibility/Test_your_skills/WAI-ARIA
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/WAI-ARIA_basics","Learn_web_development/Core/Accessibility/Multimedia", "Learn_web_development/Core/Accessibility")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá liệu bạn đã hiểu bài viết [Kiến thức cơ bản về WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics) của chúng ta chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng ta. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## WAI-ARIA 1

Nhiệm vụ ARIA đầu tiên của chúng ta bao gồm một phần đánh dấu không ngữ nghĩa, được trình bày trực quan như một danh sách. Giả sử bạn không thể thay đổi các phần tử được sử dụng, làm thế nào bạn có thể cho phép người dùng trình đọc màn hình hiểu nó là gì?

Để hoàn thành nhiệm vụ, thêm một số ngữ nghĩa WAI-ARIA để làm cho trình đọc màn hình nhận ra các phần tử `<div>` như một danh sách không có thứ tự.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("aria-1", "100%", 250) }}

Đây là code cơ bản cho điểm bắt đầu này:

<!-- Code shared across examples -->

```css hidden live-sample___aria-1 live-sample___aria-2 live-sample___aria-3
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

```html live-sample___aria-1
<p>My favorite animals:</p>

<div>
  <div>Pig</div>
  <div>Gazelle</div>
  <div>Llama</div>
  <div>Majestic moose</div>
  <div>Hedgehog</div>
</div>
```

```css live-sample___aria-1
div > div {
  padding-left: 20px;
  position: relative;
}

div > div::before {
  content: " ";
  width: 8px;
  height: 8px;
  background-color: black;
  border-radius: 50%;
  position: absolute;
  left: 0;
  top: 8px;
}
```

Chúng ta không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì nó trông giống như điểm bắt đầu.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<p>My favorite animals:</p>

<div role="list">
  <div role="listitem">Pig</div>
  <div role="listitem">Gazelle</div>
  <div role="listitem">Llama</div>
  <div role="listitem">Majestic moose</div>
  <div role="listitem">Hedgehog</div>
</div>
```

</details>

## WAI-ARIA 2

Trong nhiệm vụ WAI-ARIA thứ hai, chúng ta trình bày một form tìm kiếm cơ bản, và chúng ta muốn bạn thêm một vài tính năng WAI-ARIA để cải thiện khả năng tiếp cận của nó.

Để hoàn thành nhiệm vụ:

1. Thêm một thuộc tính để cho phép form tìm kiếm được gọi ra như một điểm mốc riêng biệt trên trang bởi trình đọc màn hình, để làm cho nó dễ tìm thấy.
2. Đặt cho đầu vào tìm kiếm một nhãn phù hợp, mà không cần thêm nhãn văn bản hiển thị rõ ràng vào DOM.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("aria-2", "100%", 100) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___aria-2
<form>
  <input type="search" name="search" />
</form>
```

Chúng ta không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì nó trông không khác biệt đáng kể so với trạng thái bắt đầu.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<form role="search">
  <input
    type="search"
    name="search"
    aria-label="Search for your favorite content on our site" />
</form>
```

</details>

## WAI-ARIA 3

Đối với nhiệm vụ WAI-ARIA cuối cùng này, chúng ta quay lại ví dụ mà chúng ta đã thấy trước đó trong [bài kiểm tra kỹ năng CSS và JavaScript](/en-US/docs/Learn_web_development/Core/Accessibility/Test_your_skills/CSS_and_JavaScript).
Như trước, chúng ta có một ứng dụng trình bày danh sách tên động vật. Nhấp vào một trong các tên động vật khiến mô tả thêm về động vật đó xuất hiện trong hộp bên dưới danh sách. Ở đây, chúng ta bắt đầu với phiên bản có thể tiếp cận bằng chuột và bàn phím.

Vấn đề chúng ta có bây giờ là khi DOM thay đổi để hiển thị mô tả mới, trình đọc màn hình không thể thấy những gì đã thay đổi. Bạn có thể cập nhật nó để các thay đổi mô tả được thông báo bởi trình đọc màn hình không?

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("aria-3", "100%", 400) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___aria-3
<section class="preview">
  <div class="animal-list">
    <h1>Animal summaries</h1>

    <p>
      The following list of animals can be clicked to display a description of
      that animal.
    </p>

    <ul>
      <li
        tabindex="0"
        data-description="A type of wild mountain goat, with large recurved horns, found in Eurasia, North Africa, and East Africa.">
        Ibex
      </li>
      <li
        tabindex="0"
        data-description="A medium-sized marine mammal, similar to a manatee, but with a Dolphin-like tail.">
        Dugong
      </li>
      <li
        tabindex="0"
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

```css hidden live-sample___aria-3
p {
  color: purple;
  margin: 0.5em 0;
}

* {
  box-sizing: border-box;
}

li {
  cursor: pointer;
}
```

```js hidden live-sample___aria-3
const listItems = document.querySelectorAll("li");
const descHeading = document.querySelector(".animal-description h2");
const descPara = document.querySelector(".animal-description p");

listItems.forEach((item) => {
  item.addEventListener("mouseup", handleSelection);
  item.addEventListener("keyup", (e) => {
    if (e.key === "Enter") {
      handleSelection(e);
    }
  });
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

Có hai cách để giải quyết vấn đề được nêu trong nhiệm vụ này:

- Thêm thuộc tính `aria-live=""` vào `<div>` animal-description để biến nó thành vùng trực tiếp, để khi nội dung thay đổi, nội dung đã cập nhật sẽ được trình đọc màn hình đọc ra. Giá trị tốt nhất có thể là `assertive`, làm cho trình đọc màn hình đọc ra nội dung đã cập nhật ngay khi nó thay đổi. `polite` có nghĩa là trình đọc màn hình sẽ chờ cho đến khi các mô tả khác kết thúc trước khi bắt đầu đọc nội dung đã thay đổi.
- Thêm thuộc tính `role="alert"` vào `<div>` animal-description, để làm cho nó có ngữ nghĩa hộp cảnh báo. Điều này có cùng hiệu ứng đối với trình đọc màn hình như việc đặt `aria-live="assertive"` trên nó.

</details>

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/WAI-ARIA_basics","Learn_web_development/Core/Accessibility/Multimedia", "Learn_web_development/Core/Accessibility")}}
