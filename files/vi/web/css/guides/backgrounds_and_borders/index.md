---
title: CSS backgrounds and borders
short-title: Backgrounds and borders
slug: Web/CSS/Guides/Backgrounds_and_borders
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-backgrounds/
  - https://drafts.csswg.org/css-backgrounds-4/
sidebar: cssref
---

Module **CSS backgrounds and borders** cung cấp các thuộc tính để thêm background, border, rounded corners và box shadow cho các phần tử.

Bạn có thể thêm nhiều loại border style khác nhau, bao gồm các border được tạo từ hình ảnh thuộc bất kỳ loại nào, từ raster images đến CSS gradients. Border có thể vuông hoặc bo tròn, và một bán kính khác nhau có thể được đặt cho mỗi góc. Các phần tử có thể được bo tròn dù có hay không có border hiển thị.

Box shadow bao gồm inset và outset shadow, single hoặc multiple shadows, và solid hoặc được phép mờ dần thành transparent. Outer box-shadow đổ bóng như thể border-box của phần tử là mờ đục. Inner box-shadow đổ bóng như thể mọi thứ bên ngoài padding edge là mờ đục. Bóng có thể solid hoặc bao gồm spread distance với màu bóng chuyển dần sang transparent.

Các thuộc tính trong module này cũng cho phép bạn xác định liệu các cell bên trong {{HTMLElement("table")}} có nên dùng border chung hay border riêng.

## Backgrounds, borders và box shadows thực tế

Mẫu border, background và box shadow này gồm các background image căn giữa được tạo từ linear và radial gradients. Một loạt box shadows khiến border trông như "nổi lên". Phần tử bên trái có border image được đặt. Phần tử bên phải có border chấm bo tròn.

```html hidden live-sample___backgrounds
<article>
  <div></div>
  <div></div>
</article>
```

```css hidden live-sample___backgrounds
article {
  display: flex;
  gap: 10px;
}
div {
  color: #58ade3;
  height: 320px;
  width: 240px;
  padding: 20px;
  margin: 10px;
  border: dotted 15px; /* defaults to `currentColor` */
  border-radius: 100px 0;
  background-image:
    radial-gradient(
      circle,
      transparent 60%,
      currentColor 60% 70%,
      transparent 70%
    ),
    linear-gradient(45deg, currentColor, white),
    linear-gradient(transparent, transparent);
  /* the third transparent background image was added to provide space for the background color to show through */
  background-color: currentColor;
  background-position: center;
  background-size:
    60px 60px,
    120px 120px;
  background-clip: content-box, content-box, padding-box;
  box-shadow:
    inset 5px 5px 5px rgb(0 0 0 / 0.4),
    inset -5px -5px 5px rgb(0 0 0 / 0.4),
    5px 5px 5px rgb(0 0 0 / 0.4),
    -5px -5px 5px rgb(0 0 0 / 0.4);
}
div:first-of-type {
  border-radius: 0;
  border-image-source: repeating-conic-gradient(
    from 3deg at 25% 25%,
    currentColor 0 3deg,
    transparent 3deg 6deg
  );
  border-image-slice: 30;
}
```

{{EmbedLiveSample("backgrounds", "", "450px")}}

Các background image được định nghĩa bằng {{cssxref("background-image")}}. Các hình ảnh được căn giữa bằng {{cssxref("background-position")}}. Các giá trị khác nhau của thuộc tính {{cssxref("background-clip")}} cho các background image nhiều lớp được dùng để giữ background images nằm trong content box. Background color được clipped đến padding box để ngăn background xuất hiện qua các phần trong suốt đối với {{cssxref("border-image")}} và {{cssxref("border-style", "dotted")}} {{cssxref("border")}}. Các góc bo tròn của phần tử bên phải được tạo bằng thuộc tính {{cssxref("border-radius")}}. Một khai báo {{cssxref("box-shadow")}} duy nhất được dùng để đặt tất cả các bóng, cả inset lẫn outset.

## Tham chiếu

### Thuộc tính

- {{cssxref("background-attachment")}}
- {{cssxref("background-clip")}}
- {{cssxref("background-color")}}
- {{cssxref("background-image")}}
- {{cssxref("background-origin")}}
- {{cssxref("background-position")}}
- {{cssxref("background-repeat-x")}}
- {{cssxref("background-repeat-y")}}
- {{cssxref("background-repeat")}} shorthand
- {{cssxref("background-size")}}
- {{cssxref("background")}} shorthand
- {{cssxref("background-position-x")}}
- {{cssxref("background-position-y")}}
- {{cssxref("border-bottom-color")}}
- {{cssxref("border-bottom-style")}}
- {{cssxref("border-bottom-width")}}
- {{cssxref("border-bottom")}} shorthand
- {{cssxref("border-left-color")}}
- {{cssxref("border-left-style")}}
- {{cssxref("border-left-width")}}
- {{cssxref("border-left")}} shorthand
- {{cssxref("border-right-color")}}
- {{cssxref("border-right-style")}}
- {{cssxref("border-right-width")}}
- {{cssxref("border-right")}} shorthand
- {{cssxref("border-top-color")}}
- {{cssxref("border-top-style")}}
- {{cssxref("border-top-width")}}
- {{cssxref("border-top")}} shorthand
- {{cssxref("border-color")}} shorthand
- {{cssxref("border-style")}} shorthand
- {{cssxref("border-width")}} shorthand
- {{cssxref("border")}} shorthand
- {{cssxref("border-bottom-left-radius")}}
- {{cssxref("border-bottom-right-radius")}}
- {{cssxref("border-top-left-radius")}}
- {{cssxref("border-top-right-radius")}}
- {{cssxref("border-radius")}} shorthand
- {{cssxref("border-image-outset")}}
- {{cssxref("border-image-repeat")}}
- {{cssxref("border-image-slice")}}
- {{cssxref("border-image-source")}}
- {{cssxref("border-image-width")}}
- {{cssxref("border-image")}} shorthand
- {{cssxref("box-shadow")}}

Module CSS backgrounds level 4 cũng giới thiệu các thuộc tính `background-position-block`, `background-position-inline`, `background-repeat-block`, `background-repeat-inline` và `background-tbd`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

### Kiểu dữ liệu

- Kiểu liệt kê {{cssxref("line-style")}}

## Hướng dẫn

- [Sử dụng nhiều background](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
  - : Đặt một hoặc nhiều background trên một phần tử.
- [Thay đổi kích thước background images](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Resizing_background_images)
  - : Thay đổi kích thước và hành vi lặp của background images.
- [Scaling SVG backgrounds](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Scaling_SVG_backgrounds)
  - : Cách SVG aspect ratio, giá trị kích thước SVG và thuộc tính CSS `background-size` ảnh hưởng đến việc scale SVG background images.
- [Sử dụng CSS gradients](/en-US/docs/Web/CSS/Guides/Images/Using_gradients)
  - : Tạo CSS gradients và sử dụng chúng làm background images.
- [Học CSS: background và borders](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
  - : Học cách triển khai hình ảnh trang trí bằng CSS background images.
- [Học CSS: box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model)
  - : Học cách borders và các thuộc tính box model khác ảnh hưởng đến CSS box model.

## Khái niệm liên quan

- {{cssxref("border-block-end-color")}}
- {{cssxref("border-block-start-color")}}
- {{cssxref("border-inline-end-color")}}
- {{cssxref("border-inline-start-color")}}
- {{cssxref("border-block-end-style")}}
- {{cssxref("border-block-start-style")}}
- {{cssxref("border-inline-end-style")}}
- {{cssxref("border-inline-start-style")}}
- {{cssxref("border-block-end-width")}}
- {{cssxref("border-block-start-width")}}
- {{cssxref("border-inline-end-width")}}
- {{cssxref("border-inline-start-width")}}
- {{cssxref("border-start-start-radius")}}
- {{cssxref("border-start-end-radius")}}
- {{cssxref("border-end-start-radius")}}
- {{cssxref("border-end-end-radius")}}
- {{cssxref("box-sizing")}}
- {{cssxref("box-decoration-break")}}
- {{cssxref("text-shadow")}}
- {{cssxref("url_value", "&lt;url&gt;")}} data type
- {{cssxref("url")}} data type
- {{cssxref("image")}} data type
- {{cssxref("position")}} data type
- Từ khóa [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{cssxref("filter")}}
- {{cssxref("backdrop-filter")}}
- Hàm filter [`drop-shadow()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/drop-shadow)
- [Áp dụng màu cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
- Công cụ:
  - [Border-image generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-image_generator)
  - [Border-radius generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator)
  - [Box-shadow generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Box-shadow_generator)
