---
title: CSS media queries
short-title: Media queries
slug: Web/CSS/Guides/Media_queries
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/mediaqueries-3/
  - https://drafts.csswg.org/mediaqueries/
  - https://drafts.csswg.org/mediaqueries-5/
sidebar: cssref
---

Module **CSS media queries** cho phép kiểm tra và truy vấn các giá trị viewport cũng như các tính năng của trình duyệt hay thiết bị, để áp dụng có điều kiện các style CSS dựa trên môi trường người dùng hiện tại. Media query được sử dụng trong quy tắc CSS `@media` và các ngữ cảnh cũng như ngôn ngữ khác như HTML và JavaScript.

Media query là thành phần quan trọng của [responsive design](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design). Chúng cho phép thiết lập có điều kiện các style CSS tùy thuộc vào sự hiện diện hay giá trị của các đặc tính thiết bị. Thông thường người ta sử dụng media query dựa trên kích thước {{Glossary("viewport")}} để thiết lập bố cục phù hợp trên các thiết bị với kích thước màn hình khác nhau — ví dụ ba cột trên màn hình rộng hoặc một cột duy nhất trên màn hình hẹp.

Các ví dụ phổ biến khác bao gồm tăng kích thước font chữ và ẩn menu điều hướng khi in một trang, điều chỉnh khoảng cách giữa các đoạn văn khi trang được xem ở chế độ dọc hay ngang, hoặc tăng kích thước nút để cung cấp vùng nhấn lớn hơn trên màn hình cảm ứng.

Trong [CSS](/en-US/docs/Web/CSS), sử dụng {{cssxref("@media")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) để áp dụng có điều kiện một phần của style sheet dựa trên kết quả của media query. Để áp dụng có điều kiện một style sheet hoàn chỉnh, sử dụng {{cssxref("@import")}}.

Khi thiết kế các thành phần HTML có thể tái sử dụng, bạn cũng có thể sử dụng [container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries), cho phép bạn áp dụng style dựa trên kích thước của phần tử chứa thay vì viewport hay các đặc tính thiết bị khác.

## Tham chiếu

### At-rule và descriptor

- {{cssxref("@import")}}
- {{cssxref("@custom-media")}}
- {{cssxref("@media")}}
  - {{cssxref("@media/any-hover", "any-hover")}}
  - {{cssxref("@media/any-pointer", "any-pointer")}}
  - {{cssxref("@media/aspect-ratio", "aspect-ratio")}}
  - {{cssxref("@media/color", "color")}}
  - {{cssxref("@media/color-gamut", "color-gamut")}}
  - {{cssxref("@media/color-index", "color-index")}}
  - {{cssxref("@media/device-aspect-ratio", "device-aspect-ratio")}}
  - {{cssxref("@media/device-height", "device-height")}}
  - {{cssxref("@media/device-width", "device-width")}}
  - {{cssxref("@media/display-mode", "display-mode")}}
  - {{cssxref("@media/dynamic-range", "dynamic-range")}}
  - {{cssxref("@media/forced-colors", "forced-colors")}}
  - {{cssxref("@media/grid", "grid")}}
  - {{cssxref("@media/height", "height")}}
  - {{cssxref("@media/horizontal-viewport-segments", "horizontal-viewport-segments")}}
  - {{cssxref("@media/hover", "hover")}}
  - {{cssxref("@media/inverted-colors", "inverted-colors")}}
  - {{cssxref("@media/monochrome", "monochrome")}}
  - {{cssxref("@media/orientation", "orientation")}}
  - {{cssxref("@media/overflow-block", "overflow-block")}}
  - {{cssxref("@media/overflow-inline", "overflow-inline")}}
  - {{cssxref("@media/pointer", "pointer")}}
  - {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}
  - {{cssxref("@media/prefers-contrast", "prefers-contrast")}}
  - {{cssxref("@media/prefers-reduced-data", "prefers-reduced-data")}}
  - {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}}
  - {{cssxref("@media/prefers-reduced-transparency", "prefers-reduced-transparency")}}
  - {{cssxref("@media/resolution", "resolution")}}
  - {{cssxref("@media/scan", "scan")}}
  - {{cssxref("@media/scripting", "scripting")}}
  - {{cssxref("@media/update", "update")}}
  - {{cssxref("@media/vertical-viewport-segments", "vertical-viewport-segments")}}
  - {{cssxref("@media/video-dynamic-range", "video-dynamic-range")}}
  - {{cssxref("@media/width", "width")}}

Module CSS media queries level 5 cũng giới thiệu các descriptor `@media` là `environment-blending`, `nav-controls` và `video-color-gamut`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

> [!NOTE]
> CSS media queries level 4 đã loại bỏ ba descriptor `@media`: {{cssxref("@media/device-aspect-ratio", "device-aspect-ratio")}}, {{cssxref("@media/device-height", "device-height")}}, và {{cssxref("@media/device-width", "device-width")}}.

### Kiểu dữ liệu và toán tử

- [`<media-types>`](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_types)
- [`<media-features>`](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features)
- {{cssxref("resolution")}}
- [Toán tử logic](/en-US/docs/Web/CSS/Reference/At-rules/@media#logical_operators)

### Thuật ngữ

- [media](/en-US/docs/Glossary/Media/CSS)
- [media query](/en-US/docs/Glossary/Media_query)

## Hướng dẫn

- [Sử dụng media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
  - : Giới thiệu media query, cú pháp của chúng, và các toán tử và media feature được sử dụng để xây dựng biểu thức media query.

- [Học: Cơ bản về media query](/en-US/docs/Learn_web_development/Core/CSS_layout/Media_queries)
  - : Giới thiệu về media query và các phương pháp sử dụng chúng để tạo responsive design.

- [Kiểm tra media query](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
  - : Mô tả cách sử dụng media query trong mã JavaScript của bạn để xác định trạng thái của một thiết bị và thiết lập các listener thông báo cho mã khi kết quả của media query thay đổi (chẳng hạn như khi người dùng xoay màn hình hoặc thay đổi kích thước trình duyệt).

- [Sử dụng media query cho khả năng truy cập](/en-US/docs/Web/CSS/Guides/Media_queries/Using_for_accessibility)
  - : Tìm hiểu cách media query có thể giúp người dùng hiểu trang web của bạn tốt hơn.

- [In ấn](/en-US/docs/Web/CSS/Guides/Media_queries/Printing)
  - : Mẹo và kỹ thuật giúp cải thiện đầu ra in của nội dung web.

- [Hình ảnh responsive](/en-US/docs/Web/HTML/Guides/Responsive_images)
  - : Tìm hiểu cách sử dụng media query với `sizes` để triển khai các giải pháp hình ảnh responsive trên trang web.

## Khái niệm liên quan

- Module [CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
  - At-rule {{cssxref("@container")}}
  - [Sử dụng container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
  - [Sử dụng size và style container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
  - At-rule {{cssxref("@supports")}}
  - [Sử dụng feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
- [CSS environment variables](/en-US/docs/Web/CSS/Guides/Environment_variables)
  - Hàm {{cssxref("env()")}}
- Module [CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media)
  - At-rule {{cssxref("@page")}}
- Module [CSS object model](/en-US/docs/Web/API/CSS_Object_Model)
  - Interface {{DOMxRef("MediaQueryList")}}
    - Thuộc tính {{DOMxRef("MediaQueryList.matches", "matches")}}
    - Thuộc tính {{DOMxRef("MediaQueryList.media", "media")}}
    - Sự kiện {{DOMxRef("MediaQueryList.change_event", "change")}}
  - Interface {{DOMxRef("MediaList")}}
    - Thuộc tính {{DOMxRef("MediaList.mediaText", "mediaText")}}
  - Đối tượng {{DOMxRef("MediaQueryListEvent")}}
- [Device Posture API](/en-US/docs/Web/API/Device_Posture_API)
  - Descriptor {{cssxref("@media/device-posture", "device-posture")}}
- HTML
  - Thuộc tính `sizes` cho [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes), [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link#sizes), và [`<source>`](/en-US/docs/Web/HTML/Reference/Elements/source#sizes) cho {{HTMLElement("picture")}}
  - Thuộc tính `media` cho [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link#media), [`<source>`](/en-US/docs/Web/HTML/Reference/Elements/source#media), và [`<style>`](/en-US/docs/Web/HTML/Reference/Elements/style#media) [HTML](/en-US/docs/Web/HTML)
  - [`<meta name="viewport">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport)
- Thuộc tính SVG [`media`](/en-US/docs/Web/SVG/Reference/Attribute/media)

## Đặc tả

{{Specifications}}

## Xem thêm

- [Container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Sử dụng các thuộc tính `srcset` và `sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#using_the_srcset_and_sizes_attributes)
- [CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media)
- Sử dụng {{cssxref("@supports")}} để áp dụng style phụ thuộc vào hỗ trợ trình duyệt cho các công nghệ CSS khác nhau.
