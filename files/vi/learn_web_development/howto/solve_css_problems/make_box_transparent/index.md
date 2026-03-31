---
title: How to make a box semi-transparent
short-title: Make a box semi-transparent
slug: Learn_web_development/Howto/Solve_CSS_problems/Make_box_transparent
page-type: learn-faq
sidebar: learn-how-to
---

Hướng dẫn này sẽ giúp bạn hiểu các cách để làm cho một box trở nên bán trong suốt bằng CSS.

## Thay đổi độ mờ của box và nội dung

Nếu bạn muốn box và tất cả nội dung của box thay đổi độ mờ, thì thuộc tính CSS {{cssxref("opacity")}} là công cụ cần dùng. Opacity là ngược lại của transparency; do đó `opacity: 1` là hoàn toàn không trong suốt — bạn sẽ không nhìn xuyên qua box chút nào.

Sử dụng giá trị `0` sẽ làm cho box hoàn toàn trong suốt, và các giá trị giữa hai giá trị đó sẽ thay đổi độ mờ, với các giá trị cao hơn cho ít độ trong suốt hơn.

## Chỉ thay đổi độ mờ của màu nền

Trong nhiều trường hợp, bạn chỉ muốn làm cho chính màu nền trở nên bán trong suốt, giữ văn bản và các phần tử khác hoàn toàn không trong suốt. Để đạt được điều này, hãy sử dụng giá trị {{cssxref("&lt;color&gt;")}} có kênh alpha, chẳng hạn như `rgb()`. Giống như với `opacity`, giá trị `1` cho giá trị kênh alpha làm cho màu hoàn toàn không trong suốt. Do đó, `background-color: rgb(0 0 0 / 50%);` sẽ đặt màu nền ở độ mờ 50%.

Hãy thử thay đổi các giá trị opacity và kênh alpha trong các ví dụ dưới đây để xem nhiều hơn hoặc ít hơn hình ảnh nền phía sau box.

```html live-sample___opacity
<div class="wrapper">
  <div class="box box1">This box uses opacity</div>
  <div class="box box2">
    This box has a background color with an alpha channel
  </div>
</div>
```

```css hidden live-sample___opacity
body {
  font-family: sans-serif;
}

.wrapper {
  height: 200px;
  display: flex;
  gap: 20px;
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloon.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  padding: 20px;
}

.box {
  flex: 1;
  border: 5px solid black;
  border-radius: 0.5em;
  font-size: 140%;
  padding: 20px;
}
```

```css live-sample___opacity
.box1 {
  background-color: black;
  color: white;
  opacity: 0.5;
}

.box2 {
  background-color: rgb(0 0 0 / 0.5);
  color: white;
}
```

{{EmbedLiveSample("opacity", "", "280px")}}

> [!NOTE]
> Hãy cẩn thận để văn bản của bạn vẫn có đủ độ tương phản với nền trong các trường hợp bạn đang phủ lên một hình ảnh; nếu không, bạn có thể làm cho nội dung khó đọc.

## Xem thêm

- [Applying color to HTML elements using CSS.](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
