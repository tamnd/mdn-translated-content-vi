---
title: device-cmyk()
slug: Web/CSS/Reference/Values/color_value/device-cmyk
page-type: css-function
spec-urls: https://drafts.csswg.org/css-color-5/#device-cmyk
sidebar: cssref
---

Ký hiệu hàm **`device-cmyk()`** được dùng để biểu diễn màu CMYK theo cách phụ thuộc vào thiết bị, chỉ định các thành phần cyan, magenta, yellow và black.

Cách tiếp cận màu sắc này hữu ích khi tạo tài liệu để in ra máy in cụ thể, khi kết quả đầu ra cho các tổ hợp mực cụ thể đã biết. Các bộ xử lý CSS có thể cố gắng xấp xỉ màu cho các phương tiện khác; tuy nhiên, kết quả cuối cùng có thể khác với kết quả in mà không biết đặc tính đầu ra màu chính xác. Khai báo {{cssxref("@color-profile")}} cho `device-cmyk` có thể chỉ định hồ sơ màu chính xác để chuyển đổi.

## Cú pháp

```css
device-cmyk(0 81% 81% 30%);
device-cmyk(none 0.81 0.81 0.3);
device-cmyk(0 81% 81% 30% / .5);
```

### Giá trị

Ký hiệu hàm: `device-cmyk(C M Y K[ / A])`

- `C`, `M`, `Y`, `K`
  - : Mỗi giá trị là một {{CSSXref("number")}} từ `0` đến `1`, một {{CSSXref("percentage")}} từ `0%` đến `100%`, hoặc từ khóa `none` cung cấp các thành phần cyan, magenta, yellow và black của màu CMYK.
    > [!NOTE]
    > Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha.

## Cú pháp chính thức

{{CSSSyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- {{cssxref("@page")}}
