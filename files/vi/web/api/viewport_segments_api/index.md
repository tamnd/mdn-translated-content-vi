---
title: API Phân đoạn khung nhìn
slug: Web/API/Viewport_segments_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Viewport.segments
---

{{DefaultAPISidebar("Viewport Segments API")}}{{seecompattable}}

**API Phân đoạn khung nhìn** cho phép các nhà phát triển truy cập vị trí và kích thước của các phân đoạn khung nhìn tách biệt về mặt logic bằng CSS và JavaScript. _Phân đoạn khung nhìn_ được tạo ra khi khung nhìn bị chia cắt bởi một hoặc nhiều tính năng phần cứng như nếp gấp hoặc bản lề giữa các màn hình riêng biệt. Với API Phân đoạn khung nhìn, các nhà phát triển có thể tạo ra các thiết kế đáp ứng được tối ưu hóa cho các kích thước và cách bố trí phân đoạn khung nhìn khác nhau.

## Khái niệm và cách sử dụng

Các thiết bị có nhiều màn hình được thiết kế để hoạt động như các phân đoạn khác nhau của cùng một bề mặt hiển thị (chẳng hạn điện thoại thông minh có màn hình gập hoặc bản lề) đặt ra một số thách thức thiết kế độc đáo cho các nhà phát triển. Bạn có thể tối ưu hóa bố cục cho màn hình như một thực thể duy nhất, nhưng làm thế nào để đảm bảo rằng các phần tử thiết kế khớp gọn gàng trên các phân đoạn khác nhau và không bị cắt làm đôi? Và làm thế nào để ngăn nội dung bị ẩn bởi nếp gấp/nối vật lý?

Điều quan trọng là biết liệu màn hình thiết bị của người dùng có nếp gấp hoặc nối hay không, các phân đoạn khác nhau có kích thước bao nhiêu, liệu chúng có cùng kích thước không, và hướng của các phân đoạn (liệu chúng xếp cạnh nhau hay trên-dưới). API Phân đoạn khung nhìn cho phép truy cập thông tin thiết bị phân đoạn của người dùng với các tính năng CSS và JavaScript cung cấp quyền truy cập vào vị trí và kích thước của mỗi phân đoạn khung nhìn trong một màn hình, bao gồm các tính năng {{cssxref("@media")}} để phát hiện các bố cục vùng nằm ngang và dọc khác nhau.

Để biết giải thích về cách API hoạt động, xem [Sử dụng API Phân đoạn khung nhìn](/en-US/docs/Web/API/Viewport_segments_API/Using).

## Giao diện

- {{domxref("Viewport")}}
  - : Đại diện cho khung nhìn của thiết bị. Cung cấp quyền truy cập thuộc tính {{domxref("Viewport.segments")}}, trả về mảng các đối tượng {{domxref("DOMRect")}} đại diện cho vị trí và kích thước của mỗi phân đoạn khung nhìn trong màn hình phân đoạn.

### Mở rộng các giao diện khác

- {{domxref("Window.viewport")}}
  - : Trả về một phiên bản đối tượng `Viewport`, cung cấp thông tin về trạng thái hiện tại của khung nhìn thiết bị.

## Tính năng CSS

- Tính năng `@media` {{cssxref("@media/horizontal-viewport-segments", "horizontal-viewport-segments")}}
  - : Phát hiện xem thiết bị có số lượng phân đoạn khung nhìn được bố trí theo chiều ngang hay không.
- Tính năng `@media` {{cssxref("@media/vertical-viewport-segments", "vertical-viewport-segments")}}
  - : Phát hiện xem thiết bị có số lượng phân đoạn khung nhìn được bố trí theo chiều dọc hay không.
- [Biến môi trường phân đoạn khung nhìn](/en-US/docs/Web/CSS/Reference/Values/env#viewport-segment-width)
  - : Các [biến môi trường](/en-US/docs/Web/CSS/Guides/Environment_variables/Using) này cung cấp quyền truy cập vào tọa độ cạnh và kích thước của mỗi phân đoạn khung nhìn.

## Ví dụ

Bạn có thể tìm thấy một ví dụ hoàn chỉnh trình bày cách sử dụng các tính năng trên trong [bản demo API Phân đoạn khung nhìn](https://mdn.github.io/dom-examples/viewport-segments-api/).

Nếu có thể, bạn nên xem bản demo trên thiết bị gập được. Công cụ phát triển trình duyệt hiện tại cho phép giả lập thiết bị gập được, nhưng không bao gồm giả lập các phân đoạn vật lý khác nhau.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng API Phân đoạn khung nhìn](/en-US/docs/Web/API/Viewport_segments_API/Using)
- [API CSSOM view](/en-US/docs/Web/API/CSSOM_view_API)
- [API Tư thế thiết bị](/en-US/docs/Web/API/Device_Posture_API)
- Mô-đun [biến môi trường CSS](/en-US/docs/Web/CSS/Guides/Environment_variables)
- [Origin trial for Foldable APIs](https://developer.chrome.com/blog/foldable-apis-ot) via developer.chrome.com (2024)
