---
title: "Kiểm tra kỹ năng: Hình ảnh HTML"
short-title: "Kiểm tra: Hình ảnh"
slug: Learn_web_development/Core/Structuring_content/Test_your_skills/Images
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_images", "Learn_web_development/Core/Structuring_content/HTML_video_and_audio", "Learn_web_development/Core/Structuring_content")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [hình ảnh và cách nhúng chúng vào HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images) hay không.

> [!NOTE]
> Để được trợ giúp, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Hình ảnh 1

Trong bài tập này, chúng tôi muốn bạn nhúng hình ảnh việt quất vào trang.

Để hoàn thành bài tập:

1. Thêm đường dẫn đến hình ảnh vào thuộc tính phù hợp để nhúng nó vào trang. Hình ảnh có tên `blueberries.jpg`, và có sẵn tại đường dẫn `https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/tasks/images/images/blueberries.jpg?raw=true`.
2. Thêm một số văn bản thay thế vào thuộc tính phù hợp để mô tả hình ảnh, cho những người không thể nhìn thấy nó.
3. Cung cấp cho phần tử `<img>` thuộc tính `width` là `400` và thuộc tính `height` phù hợp sao cho nó hiển thị đúng {{glossary("aspect ratio")}}, và không gây ra re-render khi tải. {{glossary("intrinsic size", "Kích thước nội tại")}} của hình ảnh là 615 x 419 pixel.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('images-1', "100%", 200) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___images-1
<h1>Basic image embed</h1>

<img />

<p>You should see a picture of some blueberries above.</p>
```

<!-- Shared/setup CSS code -->

```css hidden live-sample___images-1 live-sample___images-2 live-sample___images-3 live-sample___images-1-finished live-sample___images-2-finished live-sample___images-3-finished
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

img {
  border: 1px solid black;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('images-1-finished', "100%", 460) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html-nolint live-sample___images-1-finished
<h1>Basic image embed</h1>

<img src="https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/tasks/images/images/blueberries.jpg?raw=true"
     alt="blueberries" width="400" height="273" />

<p>You should see a picture of some blueberries above.</p>
```

Chúng tôi đã tính giá trị `height` đúng cần đặt bằng phép tính 400 x 419/615.

</details>

## Hình ảnh 2

Trong bài tập này, bạn đã có một hình ảnh đầy đủ tính năng, nhưng chúng tôi muốn bạn thêm tooltip xuất hiện khi di chuột qua hình ảnh. Bạn nên đặt một số thông tin phù hợp vào tooltip.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('images-2', "100%", 600) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___images-2
<h1>Basic image title</h1>

<img
  src="https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/tasks/images/larch.jpg?raw=true"
  alt="Several tall evergreen trees called larches" />
```

Chúng tôi không cung cấp nội dung hoàn chỉnh cho bài tập này, vì nó trông giống với điểm xuất phát.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html-nolint live-sample___images-2-finished
<h1>Basic image title</h1>

<img
  src="https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/tasks/images/larch.jpg?raw=true"
  alt="Several tall evergreen trees called larches"
  title="And now, Number 1, The Larch" />
```

</details>

## Hình ảnh 3

Trong bài tập này, bạn được cung cấp cả hình ảnh đầy đủ tính năng và một số văn bản chú thích. Những gì bạn cần làm ở đây là thêm các phần tử sẽ liên kết hình ảnh với chú thích.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('images-3', "100%", 600) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___images-3
<h1>Image and caption</h1>

<img
  src="https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/tasks/images/firefox.png?raw=true"
  alt="An abstract flaming fox wrapping around a blue sphere"
  width="446"
  height="460" />
The 2019 Firefox logo
```

```css hidden live-sample___images-3 live-sample___images-3-finished
figcaption {
  font-style: italic;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('images-3-finished', "100%", 640) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___images-3-finished
<h1>Image and caption</h1>

<figure>
  <img
    src="https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/tasks/images/firefox.png?raw=true"
    alt="An abstract flaming fox wrapping around a blue sphere"
    width="446"
    height="460" />
  <figcaption>The 2019 Firefox logo</figcaption>
</figure>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_images", "Learn_web_development/Core/Structuring_content/HTML_video_and_audio", "Learn_web_development/Core/Structuring_content")}}
