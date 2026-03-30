---
title: "Kiểm tra kỹ năng: Tràn nội dung"
short-title: "Kiểm tra: Tràn nội dung"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Overflow
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Overflow", "Learn_web_development/Core/Styling_basics/Size_decorate_content_panel", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [tràn nội dung trong CSS và cách quản lý nó](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Tràn nội dung 1

Trong nhiệm vụ này, nội dung đang tràn ra khỏi hộp vì hộp có chiều cao cố định.

Để hoàn thành nhiệm vụ:

1. Cập nhật CSS để chiều cao hộp được duy trì và thanh cuộn chỉ xuất hiện khi có đủ văn bản gây ra tràn nội dung.
2. Kiểm tra giải pháp của bạn bằng cách xóa một số văn bản trong HTML và kiểm tra rằng không có thanh cuộn xuất hiện khi chỉ có một lượng nhỏ văn bản.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("overflow1-start", "", "450px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___overflow1-start live-sample___overflow1-finish
<div class="box">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</div>
```

```css live-sample___overflow1-start live-sample___overflow1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

.box {
  border: 5px solid black;
  padding: 1em;
  height: 200px;
  width: 300px;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("overflow1-finish", "", "300px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn nên thêm `overflow: auto` để hộp chỉ có thanh cuộn khi nội dung quá lớn:

```css live-sample___overflow1-finish
.box {
  overflow: auto;
}
```

</details>

## Tràn nội dung 2

Trong nhiệm vụ này, có một hình ảnh trong hộp lớn hơn kích thước của hộp nên nó tràn ra ngoài một cách rõ ràng. Cập nhật CSS để bất kỳ hình ảnh nào nằm ngoài hộp đều bị ẩn.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("overflow2-start", "", "260px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___overflow2-start live-sample___overflow2-finish
<div class="box">
  <img
    alt="flowers"
    src="https://mdn.github.io/shared-assets/images/examples/flowers.jpg" />
</div>
```

```css live-sample___overflow2-start live-sample___overflow2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  border: 5px solid black;
  height: 200px;
  width: 300px;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("overflow2-finish", "", "260px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn nên thêm `overflow: hidden` vào bộ chọn `.box`:

```css live-sample___overflow2-finish
.box {
  overflow: hidden;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Overflow", "Learn_web_development/Core/Styling_basics/Size_decorate_content_panel", "Learn_web_development/Core/Styling_basics")}}
