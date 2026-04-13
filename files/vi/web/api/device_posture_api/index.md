---
title: Device Posture API
slug: Web/API/Device_Posture_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.DevicePosture
---

{{DefaultAPISidebar("Device Posture API")}}{{seecompattable}}

**Device Posture API** cho phép nhà phát triển tạo giao diện người dùng thích nghi với tư thế của thiết bị gập và phản hồi với các thay đổi tư thế.

## Khái niệm và cách dùng

Các thiết bị gập đặt ra những thách thức thiết kế đặc biệt cho nhà phát triển — chúng có thể được sử dụng như màn hình phẳng thông thường hoặc như một cuốn sách. Ngoài ra, một số thiết bị có màn hình đơn gập lại, và một số có hai màn hình với khớp nối ở giữa.

Device Posture API xác định các **tư thế**, cho biết trạng thái gập vật lý hiện tại của thiết bị. Các tư thế hiện có:

- `continuous`: Cho biết trạng thái màn hình phẳng. Các thiết bị gập là `continuous` khi chúng ở trạng thái phẳng; hoàn toàn mở hoặc hoàn toàn đóng. Các thiết bị không gập được coi là phẳng và do đó luôn là `continuous`.
- `folded`: Cho biết trạng thái màn hình gập. Các thiết bị gập là `folded` khi được sử dụng ở tư thế sách hoặc laptop.

Device Posture API bao gồm các tính năng cho phép bạn chạy script và thay đổi bố cục tùy thuộc vào tư thế thiết bị hiện tại và các thay đổi tư thế.

## Tính năng CSS

- {{cssxref("@media/device-posture", "device-posture")}} tính năng `@media`
  - : Phát hiện tư thế hiện tại của thiết bị.

## Giao diện

- {{domxref("DevicePosture")}}
  - : Đại diện cho tư thế của thiết bị, cung cấp quyền truy cập vào `type` tư thế hiện tại và sự kiện `change` kích hoạt khi tư thế thay đổi.

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.devicePosture")}}
  - : Điểm vào của Device Posture API — trả về đối tượng `DevicePosture` của trình duyệt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API)
