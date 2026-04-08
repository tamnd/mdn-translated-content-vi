---
title: font-display
slug: Web/CSS/Reference/At-rules/@font-face/font-display
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-display
sidebar: cssref
---

Descriptor **`font-display`** cho at-rule {{cssxref("@font-face")}} xác định cách một font face được hiển thị dựa trên việc nó có được tải xuống hay chưa và khi nào nó sẵn sàng sử dụng.

## Cú pháp

```css
/* Giá trị từ khóa */
font-display: auto;
font-display: block;
font-display: swap;
font-display: fallback;
font-display: optional;
```

### Giá trị

- `auto`
  - : Chiến lược hiển thị font được xác định bởi user agent.
- `block`
  - : Cho font face một khoảng thời gian block ngắn và một khoảng thời gian swap vô hạn.
- `swap`
  - : Cho font face một khoảng thời gian block cực nhỏ và một khoảng thời gian swap vô hạn.
- `fallback`
  - : Cho font face một khoảng thời gian block cực nhỏ và một khoảng thời gian swap ngắn.
- `optional`
  - : Cho font face một khoảng thời gian block cực nhỏ và không có khoảng thời gian swap.

> [!NOTE]
> Trong Firefox, tùy chọn `gfx.downloadable_fonts.fallback_delay`
> và `gfx.downloadable_fonts.fallback_delay_short` cung cấp thời lượng
> của các khoảng thời gian "ngắn" và "cực nhỏ" tương ứng.

## Mô tả

Dòng thời gian hiển thị font dựa trên một bộ đếm thời gian bắt đầu vào thời điểm user agent cố gắng sử dụng một font face đã tải xuống nhất định. Dòng thời gian được chia thành ba giai đoạn dưới đây, quyết định hành vi kết xuất của bất kỳ phần tử nào sử dụng font face:

- Giai đoạn block font: Nếu font face chưa được tải, bất kỳ phần tử nào cố gắng sử dụng nó phải kết xuất một font face dự phòng _vô hình_. Nếu font face tải thành công trong giai đoạn này, nó được sử dụng bình thường.
- Giai đoạn swap font: Nếu font face chưa được tải, bất kỳ phần tử nào cố gắng sử dụng nó phải kết xuất một font face dự phòng. Nếu font face tải thành công trong giai đoạn này, nó được sử dụng bình thường.
- Giai đoạn failure font: Nếu font face chưa được tải, user agent xử lý nó như một tải thất bại gây ra font dự phòng thông thường.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định font-display dự phòng

```css
@font-face {
  font-family: "ExampleFont";
  src:
    url("/path/to/fonts/example-font.woff") format("woff"),
    url("/path/to/fonts/example-font.eot") format("embedded-opentype");
  font-weight: normal;
  font-style: normal;
  font-display: fallback;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}}
