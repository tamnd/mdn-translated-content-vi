---
title: image-resolution
slug: Web/CSS/Reference/Properties/image-resolution
page-type: css-property
status:
  - experimental
spec-urls: https://drafts.csswg.org/css-images-4/#the-image-resolution
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`image-resolution`** xác định độ phân giải nội tại của tất cả hình ảnh raster được dùng trong hoặc trên phần tử. Nó ảnh hưởng đến hình ảnh nội dung như các phần tử thay thế và nội dung được tạo ra, cũng như hình ảnh trang trí như hình ảnh `background-image`.

Độ phân giải hình ảnh được định nghĩa là số pixel hình ảnh trên mỗi đơn vị chiều dài, ví dụ pixel trên inch. Theo mặc định, CSS giả định độ phân giải một pixel hình ảnh trên mỗi đơn vị CSS px; tuy nhiên, thuộc tính `image-resolution` cho phép chỉ định một độ phân giải khác.

## Cú pháp

```css
image-resolution: from-image;
image-resolution: 300dpi;
image-resolution: from-image 300dpi;
image-resolution: 300dpi snap;

/* Giá trị toàn cục */
image-resolution: inherit;
image-resolution: initial;
image-resolution: revert;
image-resolution: revert-layer;
image-resolution: unset;
```

### Giá trị

- {{cssxref("resolution")}}
  - : Xác định độ phân giải nội tại một cách tường minh.
- `from-image`
  - : Sử dụng độ phân giải nội tại được chỉ định bởi định dạng hình ảnh. Nếu hình ảnh không chỉ định độ phân giải của chính nó, độ phân giải được chỉ định tường minh sẽ được dùng (nếu có), ngược lại mặc định là `1dppx` (1 pixel hình ảnh trên mỗi đơn vị CSS px).
- `snap`
  - : Nếu từ khóa `snap` được cung cấp, độ phân giải tính toán là độ phân giải được chỉ định làm tròn đến giá trị gần nhất sẽ ánh xạ một pixel hình ảnh sang một số nguyên {{glossary("device pixel", "pixel thiết bị")}}. Nếu độ phân giải lấy từ hình ảnh, thì độ phân giải nội tại được dùng là độ phân giải gốc của hình ảnh được điều chỉnh tương tự.

> [!NOTE]
> Vì các định dạng vector như SVG không có độ phân giải nội tại, thuộc tính này không có hiệu lực đối với hình ảnh vector.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt dpi cao cho in ấn

Khi in tài liệu, hãy dùng độ phân giải cao hơn.

```css
@media print {
  .my-image {
    image-resolution: 300dpi;
  }
}
```

### Dùng độ phân giải hình ảnh với dự phòng

Sử dụng độ phân giải từ hình ảnh. Nếu hình ảnh không có độ phân giải, dùng 300dpi thay vì mặc định 1dppx.

```css
.my-image {
  image-resolution: from-image 300dpi;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- Các thuộc tính CSS liên quan đến hình ảnh khác: {{cssxref("object-fit")}}, {{cssxref("object-position")}}, {{cssxref("image-orientation")}}, {{cssxref("image-rendering")}}.
- [Lỗi Chromium: 1086473](https://crbug.com/1086473).
