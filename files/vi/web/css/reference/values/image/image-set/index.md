---
title: image-set()
slug: Web/CSS/Reference/Values/image/image-set
page-type: css-function
browser-compat: css.types.image.image-set
sidebar: cssref
---

Ký hiệu hàm **`image-set()`** trong [CSS](/vi/docs/Web/CSS) là phương pháp cho phép trình duyệt chọn hình ảnh CSS phù hợp nhất từ một tập hợp cho trước, chủ yếu dành cho màn hình có mật độ điểm ảnh cao.

Độ phân giải và băng thông khác nhau tùy theo thiết bị và kết nối mạng. Hàm `image-set()` cung cấp độ phân giải hình ảnh phù hợp nhất cho thiết bị của người dùng, bằng cách đưa ra một tập hợp các tùy chọn hình ảnh — mỗi tùy chọn kèm theo khai báo độ phân giải — để trình duyệt chọn lựa phù hợp nhất với thiết bị và cài đặt của người dùng. Độ phân giải có thể được dùng làm đại diện cho kích thước file — một trình duyệt trên kết nối di động chậm với màn hình độ phân giải cao có thể ưu tiên nhận hình ảnh độ phân giải thấp hơn thay vì chờ tải hình ảnh độ phân giải cao.

`image-set()` cho phép tác giả cung cấp các lựa chọn thay vì phải xác định những gì mỗi người dùng cần.

## Cú pháp

```css-nolint
/* Chọn hình ảnh dựa trên độ phân giải */
image-set(
  "image1.jpg" 1x,
  "image2.jpg" 2x
);

image-set(
  url("image1.jpg") 1x,
  url("image2.jpg") 2x
);

/* Chọn gradient dựa trên độ phân giải */
image-set(
  linear-gradient(blue, white) 1x,
  linear-gradient(blue, green) 2x
);

/* Chọn hình ảnh dựa trên định dạng được hỗ trợ */
image-set(
  url("image1.avif") type("image/avif"),
  url("image2.jpg") type("image/jpeg")
);
```

### Giá trị

- `<image>`
  - : Giá trị {{cssxref("image")}} có thể là bất kỳ loại hình ảnh nào ngoại trừ image set. Hàm `image-set()` không thể lồng bên trong một hàm `image-set()` khác.
- `<string>`
  - : URL đến một hình ảnh.
- `<resolution>` {{optional_inline}}
  - : Các đơn vị {{cssxref("resolution")}} bao gồm `x` hoặc `dppx`, cho đơn vị chấm trên mỗi điểm ảnh, `dpi` cho chấm trên inch, và `dpcm` cho chấm trên centimét. Mỗi hình ảnh trong một `image-set()` phải có độ phân giải duy nhất.
- `type(<string>)` {{optional_inline}}
  - : Chuỗi MIME type hợp lệ, ví dụ "image/jpeg".

## Cú pháp chính thức

{{CSSSyntax}}

## Khả năng tiếp cận

Trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của hình ảnh và do đó không truyền đạt gì cho người dùng. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó một cách ngữ nghĩa trong tài liệu.

- [MDN Understanding WCAG, Guideline 1.1 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Ví dụ

### Sử dụng image-set() để cung cấp các tùy chọn background-image thay thế

Ví dụ này cho thấy cách sử dụng [`image-set()`](https://drafts.csswg.org/css-images-4/#funcdef-image-set) để cung cấp hai tùy chọn {{cssxref("background-image")}} thay thế, được chọn tùy theo độ phân giải cần thiết: phiên bản thông thường và phiên bản độ phân giải cao.

```html live-sample___image-set-example
<div class="box"></div>
```

```css live-sample___image-set-example
.box {
  width: 400px;
  height: 200px;
  background-repeat: no-repeat;
  background-size: cover;

  background-image: image-set(
    url("https://mdn.github.io/shared-assets/images/examples/balloons-small.jpg")
      1x,
    url("https://mdn.github.io/shared-assets/images/examples/balloons-landscape.jpg")
      2x
  );
}
```

{{EmbedLiveSample("image-set-example", "", "250px")}}

### Sử dụng image-set() để cung cấp các định dạng hình ảnh thay thế

Trong ví dụ tiếp theo, hàm `type()` được dùng để phục vụ hình ảnh ở định dạng AVIF và JPEG. Nếu trình duyệt hỗ trợ avif, nó sẽ chọn phiên bản đó. Nếu không, nó sẽ sử dụng phiên bản jpeg.

```html live-sample___image-set-type-example
<div class="box"></div>
```

```css live-sample___image-set-type-example
.box {
  width: 400px;
  height: 200px;
  background-repeat: no-repeat;
  background-size: cover;

  background-image: image-set(
    "https://mdn.github.io/shared-assets/images/examples/balloons-landscape.avif"
      type("image/avif"),
    "https://mdn.github.io/shared-assets/images/examples/balloons-landscape.jpg"
      type("image/jpeg")
  );
}
```

{{EmbedLiveSample("image-set-type-example", "", "250px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("image")}}
- {{cssxref("image/image", "image()")}}
- {{cssxref("element()")}}
- {{cssxref("url_value", "&lt;url&gt;")}}
- {{cssxref("gradient")}}
- {{cssxref("cross-fade()")}}
