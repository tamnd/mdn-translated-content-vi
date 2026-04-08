---
title: CSS viewport
short-title: Viewport
slug: Web/CSS/Guides/Viewport
page-type: css-module
spec-urls: https://drafts.csswg.org/css-viewport/
sidebar: cssref
---

Module **CSS viewport** cho phép chỉ định kích thước, hệ số thu phóng và hướng của khối chứa ban đầu của user-agent, hay còn gọi là _viewport_.

Nội dung được thiết kế cho viewport lớn có thể gặp nhiều lỗi khi xem trên viewport nhỏ hơn, bao gồm ngắt dòng không mong muốn, nội dung bị cắt xén, và các {{glossary("scroll container", "scroll container")}} có kích thước không chính xác. HTML cung cấp một [viewport meta tag](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport), `<meta name="viewport">`, để cung cấp gợi ý về kích thước ban đầu của viewport. Nếu trang web không được thiết kế để hoạt động tốt trên viewport nhỏ và thẻ này bị bỏ qua, một số trình duyệt di động sẽ hiển thị trang với chiều rộng khối chứa ban đầu cố định, thường là `980px`. Nội dung sau đó sẽ bị thu nhỏ, làm cho kích thước CSS pixel nhỏ hơn pixel thực tế. Trang kết quả vừa với không gian màn hình có sẵn nhưng không thể đọc được, yêu cầu người dùng phóng to và cuộn để xem nội dung.

Khối chứa ban đầu {{glossary("viewport")}} đối với phương tiện liên tục có kích thước của viewport. Vì viewport thường không lớn hơn màn hình hiển thị, các thiết bị có màn hình nhỏ hơn như điện thoại hoặc máy tính bảng thường có viewport nhỏ hơn so với các thiết bị lớn hơn như máy tính để bàn hoặc laptop.

## Tham chiếu

### Thuộc tính

- {{cssxref("zoom")}}

### Interface

- {{domxref("Window.Viewport")}}
- {{domxref("Viewport")}}
  - {{domxref("Viewport.segments")}}

### Thuật ngữ và định nghĩa

- {{glossary("Viewport")}}
- [Actual viewport](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts#actual_viewport)
- [Initial viewport](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts#initial_viewport)

## Hướng dẫn

- [Khái niệm về Viewport](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts)
  - : Khái niệm về viewport — viewport là gì, tác động của nó trong CSS, SVG và thiết bị di động — và sự khác biệt giữa visual viewport và layout viewport.

- [Sử dụng environment variable](/en-US/docs/Web/CSS/Guides/Environment_variables/Using)
  - : Tổng quan về environment variable là gì, các environment variable do trình duyệt định nghĩa, và cách sử dụng hàm `env()`.

- [Sử dụng Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API/Using)
  - : Tạo thiết kế đáp ứng được tối ưu hóa cho các kích thước và cách sắp xếp khác nhau của viewport segment bằng API và environment variable.

## Các khái niệm liên quan

- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
  - {{cssxref("@media")}}
  - Descriptor {{cssxref("@media/horizontal-viewport-segments", "horizontal-viewport-segments")}}
  - Descriptor {{cssxref("@media/vertical-viewport-segments", "vertical-viewport-segments")}}

- [CSS environment variable](/en-US/docs/Web/CSS/Guides/Environment_variables)
  - {{cssxref("env()")}}
  - [`<environment-variable-name>`](/en-US/docs/Web/CSS/Guides/Environment_variables/Using#browser-defined_environment_variables)

- [Device Posture API](/en-US/docs/Web/API/Device_Posture_API)

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view)
