---
title: "@color-profile"
slug: Web/CSS/Reference/At-rules/@color-profile
page-type: css-at-rule
spec-urls: https://www.w3.org/TR/css-color-5/#at-profile
sidebar: cssref
---

[Quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) **`@color-profile`** [CSS](/en-US/docs/Web/CSS) định nghĩa và đặt tên cho một hồ sơ màu (color profile), sau đó có thể được dùng trong hàm {{cssxref("color_value/color", "color()")}} để chỉ định màu sắc.

## Cú pháp

```css
@color-profile --swop5c {
  src: url("https://example.org/SWOP2006_Coated5v2.icc");
}
```

### Tham số

- tên hồ sơ
  - : Có thể là {{cssxref("&lt;dashed-ident&gt;")}} hoặc định danh `device-cmyk`.

### Mô tả (Descriptors)

- `src`
  - : Chỉ định URL để lấy thông tin hồ sơ màu.
- `rendering-intent`
  - : Nếu hồ sơ màu chứa nhiều hơn một rendering intent, mô tả này cho phép chọn một cái để dùng nhằm xác định cách ánh xạ màu sang {{glossary("gamut")}}s nhỏ hơn so với gamut được định nghĩa trong hồ sơ.

    Nếu được dùng, phải là một trong các từ khóa sau:
    - `relative-colorimetric`
      - : Colorimetric tương đối theo media yêu cầu giữ nguyên các màu nguồn nằm trong gamut của thiết bị đích, tương đối với điểm trắng của media tương ứng. Các màu nguồn nằm ngoài gamut của thiết bị đích được ánh xạ tới các màu trên biên gamut bằng nhiều phương pháp khác nhau.
    - `absolute-colorimetric`
      - : Colorimetric tuyệt đối ICC yêu cầu giữ nguyên các màu nguồn nằm trong gamut của thiết bị đích, tương đối với điểm trắng được chấp nhận (bộ phản xạ hoàn hảo). Các màu nguồn nằm ngoài gamut của thiết bị đích được ánh xạ tới các màu trên biên gamut bằng nhiều phương pháp khác nhau.
    - `perceptual`
      - : Phương pháp này thường được ưu tiên cho hình ảnh, đặc biệt khi có sự khác biệt đáng kể giữa nguồn và đích (chẳng hạn như hình ảnh hiển thị trên màn hình được tái hiện trên bản in phản chiếu). Nó lấy các màu của ảnh nguồn và tối ưu lại giao diện cho thiết bị đích bằng các phương pháp độc quyền.
    - `saturation`
      - : Tùy chọn này được tạo ra để bảo toàn độ bão hòa tương đối (chroma) của bản gốc, và giữ các màu đặc thuần túy. Tuy nhiên, nó gặp vấn đề tương tác giống như perceptual intent.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Ví dụ này mô tả cách dùng in offset theo ISO 12647-2:2004 sử dụng dữ liệu đặc trưng CGATS/SWOP TR005 2007 trên giấy hạng 5 với giới hạn mực 300% Tổng Diện Tích Phủ, và thay thế thành phần xám trung bình (GCR). Ví dụ này lấy từ thông số kỹ thuật.

Mô tả `src` chỉ định URL để lấy thông tin hồ sơ màu.

```css
@color-profile --swop5c {
  src: url("https://example.org/SWOP2006_Coated5v2.icc");
}
.header {
  background-color: color(--swop5c 0% 70% 20% 0%);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- [Màu sắc CSS](/en-US/docs/Web/CSS/Guides/Colors) module
