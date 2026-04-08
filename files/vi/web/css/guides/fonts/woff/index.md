---
title: Web Open Font Format (WOFF)
short-title: WOFF
slug: Web/CSS/Guides/Fonts/WOFF
page-type: guide
browser-compat:
  - css.at-rules.font-face.WOFF
  - css.at-rules.font-face.WOFF_2
sidebar: cssref
---

**WOFF** (the **Web Open Font Format**) là định dạng web font được phát triển bởi Mozilla cùng với Type Supply, LettError, và các tổ chức khác. Nó sử dụng phiên bản nén của cùng cấu trúc `sfnt` dựa trên bảng được sử dụng bởi TrueType, OpenType, và Open Font Format, nhưng thêm metadata và cấu trúc dữ liệu sử dụng riêng, bao gồm các trường được xác định trước cho phép các xưởng đúc chữ và nhà cung cấp cung cấp thông tin giấy phép nếu muốn.

Có ba lợi ích chính khi sử dụng WOFF:

1. Dữ liệu font được nén, vì vậy các trang web sử dụng WOFF sẽ sử dụng ít băng thông hơn và tải nhanh hơn so với nếu họ sử dụng các tệp TrueType hoặc OpenType tương đương không nén.
2. Nhiều nhà cung cấp font không muốn cấp phép các tệp font TrueType hoặc OpenType của họ để sử dụng trên web sẽ cấp phép các tệp font WOFF. Điều này cải thiện sự sẵn có của các font cho các nhà thiết kế trang web.
3. Cả các nhà cung cấp trình duyệt độc quyền và phần mềm miễn phí đều thích định dạng WOFF, vì vậy nó có tiềm năng trở thành định dạng font thực sự toàn cầu, có thể tương tác cho web, không giống như các định dạng font hiện tại khác.

Có hai phiên bản WOFF: WOFF và WOFF2. Chúng chủ yếu khác nhau về thuật toán nén được sử dụng. Trong {{cssxref("@font-face")}} chúng được xác định bởi format descriptor `'woff'` và `'woff2'` tương ứng.

## Sử dụng WOFF

Bạn có thể sử dụng thuộc tính CSS {{cssxref("@font-face")}} để sử dụng font WOFF cho văn bản trong nội dung web. Nó hoạt động chính xác như các font định dạng OpenType và TrueType, ngoại trừ nó có thể cho phép nội dung của bạn tải xuống hiệu quả hơn do việc thêm nén.

## Công cụ làm việc với font WOFF

- [Công cụ làm việc với font WOFF](https://github.com/odemiral/woff2sfnt-sfnt2woff) có sẵn. `sfnt2woff` và `woff2sfnt` chuyển đổi giữa WOFF và OpenType.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face")}}
