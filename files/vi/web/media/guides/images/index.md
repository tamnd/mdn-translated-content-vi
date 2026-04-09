---
title: Sử dụng hình ảnh trong HTML
slug: Web/Media/Guides/Images
page-type: guide
sidebar: mediasidebar
---

Phần tử {{Glossary("HTML")}} {{HTMLElement("img")}} cho phép bạn nhúng hình ảnh vào tài liệu HTML, trong khi phần tử {{HTMLElement("picture")}} hỗ trợ [hình ảnh responsive](/en-US/docs/Web/HTML/Guides/Responsive_images). Trong hướng dẫn này, bạn sẽ tìm thấy các liên kết đến những tài nguyên liên quan đến việc thêm hình ảnh vào website.
Các bài viết này cung cấp hướng dẫn về việc chọn và cấu hình các loại hình ảnh.

- [Hướng dẫn về loại tệp và định dạng hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)
  - : Hướng dẫn về nhiều loại tệp hình ảnh khác nhau thường được trình duyệt web hỗ trợ, bao gồm chi tiết về từng trường hợp sử dụng, khả năng và các yếu tố tương thích của chúng. Ngoài ra, bài viết này còn cung cấp hướng dẫn chọn loại tệp hình ảnh tốt nhất cho một tình huống nhất định.
- [Việc thêm thuộc tính `width` và `height` giúp tránh giật khựng](/en-US/docs/Learn_web_development/Extensions/Performance/Multimedia#rendering_strategy_preventing_jank_when_loading_images)
  - : Điều này thay đổi cách trình duyệt tải hình ảnh để {{glossary("aspect ratio", "tỷ lệ khung hình")}} của chúng được trình duyệt tính toán sớm và sau đó có thể được dùng để dành trước kích thước hiển thị của hình ảnh trước khi nó được tải xong.

## Tài liệu tham khảo

Các bài viết này đề cập đến một số phần tử HTML và thuộc tính CSS được dùng để kiểm soát cách hình ảnh được hiển thị trên web.

### HTML

- {{HTMLElement("img")}}
  - : **Phần tử HTML `<img>`** được dùng để nhúng một hình ảnh vào trang web. Nó hỗ trợ nhiều thuộc tính để kiểm soát cách hình ảnh hoạt động và cho phép bạn thêm thông tin quan trọng như văn bản [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) cho những người không nhìn thấy hình ảnh.
- {{HTMLElement("picture")}}
  - : **Phần tử HTML `<picture>`** chứa không hoặc nhiều phần tử {{HTMLElement("source")}} và một phần tử {{HTMLElement("img")}} cung cấp các phiên bản hình ảnh cho những tình huống hiển thị/thiết bị khác nhau. Trình duyệt sẽ xem xét từng phần tử con `<source>` và chọn phương án khớp tốt nhất trong số đó.

### CSS

- {{cssxref("object-fit")}}
  - : Thuộc tính [CSS](/en-US/docs/Web/CSS) **`object-fit`** đặt cách nội dung của một {{ glossary("replaced elements", "phần tử thay thế") }}, chẳng hạn như [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img) hoặc [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video), được thay đổi kích thước để vừa với vùng chứa của nó.
- {{cssxref("object-position")}}
  - : Thuộc tính [CSS](/en-US/docs/Web/CSS) **`object-position`** chỉ định căn chỉnh nội dung của {{ glossary("replaced elements", "phần tử thay thế") }} đã chọn trong hộp của phần tử. Những vùng của hộp không được đối tượng của phần tử thay thế che phủ sẽ hiển thị nền của phần tử.
- {{cssxref("background-image")}}
  - : Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-image`** đặt một hoặc nhiều hình nền cho một phần tử.

## Xem thêm

- [Hình ảnh responsive](/en-US/docs/Web/HTML/Guides/Responsive_images)
  - : Trong bài viết này, chúng ta sẽ tìm hiểu khái niệm hình ảnh responsive, tức các hình ảnh hoạt động tốt trên những thiết bị có kích thước màn hình, độ phân giải và các đặc điểm khác rất khác nhau, đồng thời xem HTML cung cấp những công cụ nào để giúp triển khai chúng.
