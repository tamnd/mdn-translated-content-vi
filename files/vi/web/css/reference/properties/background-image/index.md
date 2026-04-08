---
title: background-image
slug: Web/CSS/Reference/Properties/background-image
page-type: css-property
browser-compat: css.properties.background-image
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-image`** đặt một hoặc nhiều ảnh nền cho một phần tử.

{{InteractiveExample("CSS Demo: background-image")}}

```css interactive-example-choice
background-image: url("/shared-assets/images/examples/lizard.png");
```

```css interactive-example-choice
background-image:
  url("/shared-assets/images/examples/lizard.png"),
  url("/shared-assets/images/examples/star.png");
```

```css interactive-example-choice
background-image:
  url("/shared-assets/images/examples/star.png"),
  url("/shared-assets/images/examples/lizard.png");
```

```css interactive-example-choice
background-image:
  linear-gradient(rgb(0 0 255 / 0.5), rgb(255 255 0 / 0.5)),
  url("/shared-assets/images/examples/lizard.png");
```

```html interactive-example
<section id="default-example">
  <div id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  min-width: 100%;
  min-height: 100%;
  padding: 10%;
}
```

## Cú pháp

```css
/* ảnh đơn */
background-image: linear-gradient(black, white);
background-image: url("cat-front.png");

/* nhiều ảnh */
background-image:
  radial-gradient(circle, transparent 45%, black 48%),
  radial-gradient(ellipse farthest-corner, #fc1c14 20%, #cf15cf 80%);

/* Giá trị toàn cục */
background-image: inherit;
background-image: initial;
background-image: revert;
background-image: revert-layer;
background-image: unset;
```

Mỗi ảnh nền được chỉ định bằng từ khóa `none` hoặc một giá trị {{cssxref("image")}}.

Để chỉ định nhiều ảnh nền, cung cấp nhiều giá trị, phân cách bằng dấu phẩy.

### Giá trị

- `none`
  - : Là từ khóa biểu thị sự vắng mặt của ảnh.
- `<image>`
  - : Là một {{cssxref("image")}} biểu thị ảnh cần hiển thị. Có thể có nhiều ảnh, phân cách bằng dấu phẩy, vì [nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds) được hỗ trợ.

## Mô tả

Các ảnh nền được vẽ trên các lớp ngữ cảnh xếp chồng lên nhau. Lớp đầu tiên được chỉ định được vẽ như thể gần người dùng nhất.

Các [viền](/en-US/docs/Web/CSS/Reference/Properties/border) của phần tử sau đó được vẽ lên trên chúng, và {{cssxref("background-color")}} được vẽ bên dưới chúng. Cách các ảnh được vẽ so với hộp và viền của nó được xác định bởi các thuộc tính CSS {{cssxref("background-clip")}} và {{cssxref("background-origin")}}.

Nếu một ảnh được chỉ định không thể vẽ (ví dụ, khi tệp được biểu thị bởi URI được chỉ định không thể tải), các trình duyệt xử lý nó như thể đó là giá trị `none`.

> [!NOTE]
> Dù ảnh không trong suốt và màu sắc thường sẽ không được hiển thị, các nhà phát triển web nên luôn chỉ định {{cssxref("background-color")}}. Nếu ảnh không thể tải được — chẳng hạn khi mạng bị ngắt — màu nền sẽ được dùng làm dự phòng.

## Khả năng tiếp cận

Các trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt gì đến người dùng của nó. Nếu ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó theo ngữ nghĩa trong tài liệu.

- [MDN Understanding WCAG, Guideline 1.1 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

Ngoài ra, điều quan trọng là đảm bảo tỷ lệ tương phản giữa ảnh nền và văn bản nền trước đủ cao để những người có thị lực kém có thể đọc được nội dung trang.

Tỷ lệ tương phản màu sắc được xác định bằng cách so sánh độ sáng của giá trị màu văn bản và màu nền. Để đáp ứng [Hướng dẫn Tiếp cận Nội dung Web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/), tỷ lệ 4.5:1 là bắt buộc cho nội dung văn bản thân bài và 3:1 cho văn bản lớn hơn như tiêu đề. Văn bản lớn được định nghĩa là 24px trở lên, hoặc [in đậm](/en-US/docs/Web/CSS/Reference/Properties/font-weight) 18.66px trở lên.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [Understanding WCAG, Guideline 1.4 explanation](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html), W3C (2023)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xếp lớp ảnh nền

Lưu ý rằng ảnh ngôi sao có một phần trong suốt và được xếp lên trên ảnh mèo.

#### HTML

```html
<div>
  <p class="cats-and-stars">This paragraph is full of cats<br />and stars.</p>
  <p>This paragraph is not.</p>
  <p class="cats-and-stars">Here are more cats for you.<br />Look at them!</p>
  <p>And no more.</p>
</div>
```

#### CSS

```css
p {
  font-weight: bold;
  font-size: 1.5em;
  color: white;
  text-shadow: 0.07em 0.07em 0.05em black;
  background-image: none;
  background-color: transparent;
}

div {
  background-image: url("mdn_logo_only_color.png");
}

.cats-and-stars {
  background-image: url("star-transparent.gif"), url("cat-front.png");
  background-color: transparent;
}
```

#### Kết quả

{{EmbedLiveSample('Layering_background_images')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("img")}}
- Các hàm liên quan đến ảnh:
  - {{cssxref("gradient/linear-gradient", "linear-gradient()")}}
  - {{cssxref("gradient/radial-gradient", "radial-gradient()")}}
  - {{cssxref("gradient/conic-gradient", "conic-gradient()")}}
  - {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}
  - {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}
  - {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
  - {{cssxref("url_value", "&lt;url&gt;")}}
- [Sử dụng gradient CSS](/en-US/docs/Web/CSS/Guides/Images/Using_gradients)
- [Triển khai sprite ảnh trong CSS](/en-US/docs/Web/CSS/Guides/Images/Implementing_image_sprites)
- [Mô-đun ảnh CSS](/en-US/docs/Web/CSS/Guides/Images)

- Các thuộc tính liên quan đến nền
  - {{cssxref("background-attachment")}}
  - {{cssxref("background-clip")}}
  - {{cssxref("background-color")}}
  - {{cssxref("background-origin")}}
  - {{cssxref("background-position")}}
  - {{cssxref("background-repeat")}}
  - {{cssxref("background-size")}}
  - Viết tắt {{cssxref("background")}}
- [Học: Nền và viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- [Thay đổi kích thước ảnh nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Resizing_background_images)
- [Mô-đun nền và viền CSS](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
