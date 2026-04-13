---
title: MediaStream
slug: Web/API/MediaStream
page-type: web-api-interface
browser-compat: api.MediaStream
---

{{APIRef("Media Capture and Streams")}}

Giao diện **`MediaStream`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} đại diện cho một luồng nội dung phương tiện. Một luồng bao gồm nhiều **track**, chẳng hạn như track video hoặc audio. Mỗi track được chỉ định dưới dạng một thực thể của {{domxref("MediaStreamTrack")}}.

Bạn có thể lấy đối tượng `MediaStream` bằng cách sử dụng constructor hoặc bằng cách gọi các hàm như {{domxref("MediaDevices.getUserMedia()")}}, {{domxref("MediaDevices.getDisplayMedia()")}}, hoặc {{domxref("HTMLCanvasElement.captureStream()")}} và {{domxref("HTMLMediaElement.captureStream()")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("MediaStream.MediaStream", "MediaStream()")}}
  - : Tạo và trả về một đối tượng `MediaStream` mới. Bạn có thể tạo một luồng rỗng, một luồng dựa trên một luồng hiện có, hoặc một luồng chứa danh sách các track được chỉ định (được chỉ định dưới dạng mảng các đối tượng {{domxref("MediaStreamTrack")}}).

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ phần tử cha của nó, {{domxref("EventTarget")}}._

- {{domxref("MediaStream.active")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean trả về `true` nếu `MediaStream` đang hoạt động, hoặc `false` nếu ngược lại.
- {{domxref("MediaStream.id")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa một định danh duy nhất phổ quát ({{Glossary("UUID")}}) gồm 36 ký tự cho đối tượng.

## Phương thức instance

_Giao diện này kế thừa các phương thức từ phần tử cha của nó, {{domxref("EventTarget")}}._

- {{domxref("MediaStream.addTrack()")}}
  - : Lưu trữ bản sao của {{domxref("MediaStreamTrack")}} được truyền làm tham số. Nếu track đã được thêm vào đối tượng `MediaStream`, không có gì xảy ra.
- {{domxref("MediaStream.clone()")}}
  - : Trả về một bản sao của đối tượng `MediaStream`. Tuy nhiên, bản sao sẽ có một giá trị duy nhất cho {{domxref("MediaStream.id", "id")}}.
- {{domxref("MediaStream.getAudioTracks()")}}
  - : Trả về danh sách các đối tượng {{domxref("MediaStreamTrack")}} được lưu trữ trong đối tượng `MediaStream` có thuộc tính `kind` được đặt thành `audio`. Thứ tự không được xác định, và có thể thay đổi không chỉ từ trình duyệt này sang trình duyệt khác, mà còn từ lần gọi này sang lần gọi khác.
- {{domxref("MediaStream.getTrackById()")}}
  - : Trả về track có ID tương ứng với ID được truyền trong tham số `trackId`. Nếu không có tham số nào được truyền, hoặc nếu không có track nào có ID đó tồn tại, nó trả về `null`. Nếu nhiều track có cùng ID, nó trả về track đầu tiên.
- {{domxref("MediaStream.getTracks()")}}
  - : Trả về danh sách tất cả các đối tượng {{domxref("MediaStreamTrack")}} được lưu trữ trong đối tượng `MediaStream`, bất kể giá trị của thuộc tính `kind`. Thứ tự không được xác định, và có thể thay đổi không chỉ từ trình duyệt này sang trình duyệt khác, mà còn từ lần gọi này sang lần gọi khác.
- {{domxref("MediaStream.getVideoTracks()")}}
  - : Trả về danh sách các đối tượng {{domxref("MediaStreamTrack")}} được lưu trữ trong đối tượng `MediaStream` có thuộc tính `kind` được đặt thành `"video"`. Thứ tự không được xác định, và có thể thay đổi không chỉ từ trình duyệt này sang trình duyệt khác, mà còn từ lần gọi này sang lần gọi khác.
- {{domxref("MediaStream.removeTrack()")}}
  - : Xóa {{domxref("MediaStreamTrack")}} được truyền làm tham số. Nếu track không phải là một phần của đối tượng `MediaStream`, không có gì xảy ra.

## Sự kiện

- {{domxref("MediaStream/addtrack_event", "addtrack")}}
  - : Được kích hoạt khi một đối tượng {{domxref("MediaStreamTrack")}} mới được thêm vào.
- {{domxref("MediaStream/removetrack_event", "removetrack")}}
  - : Được kích hoạt khi một đối tượng {{domxref("MediaStreamTrack")}} đã bị xóa.
- {{domxref("MediaStream/active_event", "active")}} {{Non-standard_Inline}}
  - : Được kích hoạt khi MediaStream được kích hoạt.
- {{domxref("MediaStream/inactive_event", "inactive")}} {{Non-standard_Inline}}
  - : Được kích hoạt khi MediaStream bị vô hiệu hóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- {{domxref("MediaStreamTrack")}}
