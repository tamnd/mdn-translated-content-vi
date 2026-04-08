---
title: CSS images
short-title: Images
slug: Web/CSS/Guides/Images
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-images/
  - https://drafts.csswg.org/css-images-4/
  - https://drafts.csswg.org/css-images-5/
sidebar: cssref
---

Module **CSS images** định nghĩa các loại image có thể được sử dụng (kiểu {{cssxref("image")}}, chứa URL, gradient và các loại image khác), cách thay đổi kích thước chúng và cách chúng, cùng với các replaced content khác, tương tác với các layout model khác nhau.

## Tham khảo

### Thuộc tính

- {{CSSxRef("image-orientation")}}
- {{CSSxRef("image-rendering")}}
- {{CSSxRef("object-fit")}}
- {{CSSxRef("object-position")}}
- {{cssxref("object-view-box")}}

Module CSS images cũng định nghĩa thuộc tính {{CSSxRef("image-resolution")}}. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

### Hàm

- {{CSSxRef("gradient/linear-gradient", "linear-gradient()")}}
- {{CSSxRef("gradient/radial-gradient", "radial-gradient()")}}
- {{CSSxRef("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}
- {{CSSxRef("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}
- {{CSSxRef("gradient/conic-gradient", "conic-gradient()")}}
- {{CSSxRef("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- {{cssxref("cross-fade()")}}
- {{cssxref("element()")}}
- {{CSSxRef("image/image-set", "image-set()")}}

Module CSS images cũng định nghĩa hàm {{CSSxRef("image/image", "image()")}}. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

### Kiểu dữ liệu

- {{cssxref("gradient")}}
- {{cssxref("image")}}

## Hướng dẫn

- [Sử dụng CSS gradient](/en-US/docs/Web/CSS/Guides/Images/Using_gradients)
  - : Trình bày một loại CSS image cụ thể, _gradient_, và cách tạo và sử dụng chúng.

- [Triển khai image sprite trong CSS](/en-US/docs/Web/CSS/Guides/Images/Implementing_image_sprites)
  - : Mô tả kỹ thuật phổ biến là nhóm nhiều image vào một tài liệu duy nhất để tiết kiệm các yêu cầu tải xuống và tăng tốc độ hiển thị trang.

- [Tạo kiểu cho replaced element](/en-US/docs/Web/CSS/Guides/Images/Replaced_element_properties)
  - : Giới thiệu các thuộc tính chỉ áp dụng cho _replaced element_.

- [Hiểu về aspect ratio](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
  - : Tìm hiểu về thuộc tính `aspect-ratio`, thảo luận về aspect ratio cho replaced và non-replaced element, và xem xét một số trường hợp sử dụng aspect ratio phổ biến.

- [Sử dụng thuộc tính CSS `object-view-box`](/en-US/docs/Web/CSS/Guides/Images/Using_object-view-box)
  - : Tìm hiểu thuộc tính CSS `object-view-box`, bao gồm cách phóng to, thu nhỏ và pan image.

## Khái niệm liên quan

- {{cssxref("url_value", "&lt;url&gt;")}}
- {{cssxref("url_function", "url()")}}
- [`<basic-shape-rect>`](/en-US/docs/Web/CSS/Reference/Values/basic-shape#syntax_for_rectangles_basic-shape-rect)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects)
- Module [CSS compositing and blending](/en-US/docs/Web/CSS/Guides/Compositing_and_blending)
- Module [CSS colors](/en-US/docs/Web/CSS/Guides/Colors)
- Module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)
