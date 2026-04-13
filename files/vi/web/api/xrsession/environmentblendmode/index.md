---
title: "XRSession: thuộc tính environmentBlendMode"
short-title: environmentBlendMode
slug: Web/API/XRSession/environmentBlendMode
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.environmentBlendMode
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`environmentBlendMode`** của giao diện {{domxref("XRSession")}} xác định liệu và ở mức độ nào, hình ảnh do máy tính tạo ra được phủ lên trên thế giới thực.

Điều này được sử dụng để phân biệt giữa các phiên VR nhập vai hoàn toàn và các phiên AR kết xuất trên hình ảnh xuyên thấu của thế giới thực, có thể trong suốt một phần.

## Giá trị

Một chuỗi xác định liệu và cách nội dung được kết xuất ảo được phủ lên trên hình ảnh của thế giới thực.

Các giá trị có thể là:

- `opaque`
  - : Hình ảnh được kết xuất được vẽ mà không cho phép bất kỳ hình ảnh xuyên thấu nào. Chủ yếu được sử dụng bởi kính VR nhập vai hoàn toàn, che khuất hoàn toàn môi trường xung quanh, không hiển thị chút nào của thế giới thực cho người dùng. Các giá trị alpha được chỉ định trong trường `baseLayer` của thuộc tính {{domxref("XRSession.renderState", "renderState")}} của {{domxref("XRSession")}} bị bỏ qua vì các giá trị alpha cho hình ảnh được kết xuất đều được coi là 1.0 (hoàn toàn mờ).
- `additive`
  - : Chủ yếu được sử dụng bởi các thiết bị AR với ống kính trong suốt trực tiếp cho phép thực tế xuyên thấu đến mắt người dùng, chế độ hòa trộn `additive` được thiết kế để sử dụng trong tình huống thiết bị không kiểm soát được nền và độ sáng của nó, vì điều đó không được kiểm soát kỹ thuật số. Tất cả những gì thiết bị có thể làm là thêm nhiều ánh sáng hơn vào hình ảnh; nó không thể làm mọi thứ tối đi. Do đó, màu đen được kết xuất dưới dạng hoàn toàn trong suốt và không có cách nào để làm cho một pixel hoàn toàn mờ. Như với cài đặt `opaque`, các giá trị alpha được chỉ định bị bỏ qua và được coi như thể chúng là 1.0.
- `alpha-blend`
  - : Được sử dụng bởi kính hoặc kính bảo hộ sử dụng camera để chụp thế giới thực và hiển thị kỹ thuật số trên màn hình được sử dụng để kết xuất nội dung cho người dùng xem, đây cung cấp một cách để tạo bản trình bày AR bằng thiết bị VR. Hòa trộn alpha cũng có thể được sử dụng bởi các thiết bị không đeo cung cấp chế độ AR, chẳng hạn như điện thoại hoặc máy tính bảng sử dụng camera để chụp thế giới thực để sử dụng trong ứng dụng AR. Vì thế giới thực được trình bày kỹ thuật số, độ sáng của mỗi pixel có thể được kiểm soát, cho dù đó là thực tế hay hình ảnh XR được kết xuất, môi trường của người dùng có thể được hòa trộn với môi trường ảo với mỗi pixel có màu và độ sáng được kiểm soát chính xác.
    Trong chế độ này, thuộc tính `renderState.baseLayer` của `XRSession` cung cấp trọng số tương đối của lớp nhân tạo trong quá trình tổng hợp. Các pixel có giá trị alpha là 1.0 được kết xuất hoàn toàn mờ, che khuất hoàn toàn thế giới thực, trong khi các pixel có alpha là 0.0 hoàn toàn trong suốt, để môi trường xung quanh xuyên qua.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
