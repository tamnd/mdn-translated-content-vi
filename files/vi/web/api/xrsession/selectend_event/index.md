---
title: "XRSession: sự kiện selectend"
short-title: selectend
slug: Web/API/XRSession/selectend_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.selectend_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`selectend`** của WebXR được gửi đến một {{domxref("XRSession")}} khi một trong các nguồn đầu vào của nó kết thúc [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action) hoặc khi một nguồn đầu입 đang trong quá trình xử lý hành động chính đang diễn ra bị ngắt kết nối mà không hoàn thành thành công hành động.

{{domxref("Element.beforexrselect_event", "beforexrselect")} được kích hoạt trước sự kiện này và có thể ngăn sự kiện này được raised.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectend", (event) => { })

onselectend = (event) => { }
```

## Loại sự kiện

Một {{domxref("XRInputSourceEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("XRInputSourceEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("XRInputSourceEvent.frame", "frame")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRFrame")}} cung cấp thông tin cần thiết về khung hình sự kiện trong đó sự kiện xảy ra. Khung hình này có thể đã được kết xuất trong quá khứ thay vì là một khung hình hiện tại. Vì đây là khung hình _sự kiện_, không phải khung hình _hoạt ảnh_, bạn không thể gọi phương thức {{domxref("XRFrame")}} {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} trên nó; thay vào đó, sử dụng {{domxref("XRFrame.getPose", "getPose()")}}.
- {{domxref("XRInputSourceEvent.inputSource", "inputSource")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRInputSource")}} cho biết nguồn đầu vào nào đã tạo ra sự kiện đầu vào.

## Mô tả

### Kích hoạt

Được kích hoạt khi người dùng ngừng nhấn cò hoặc nút, chạm bàn di chuột, nói lệnh hoặc thực hiện một cử chỉ có thể nhận dạng khi sử dụng hệ thống theo dõi video hoặc bộ điều khiển cầm tay với gia tốc kế.

### Trường hợp sử dụng

Các sự kiện `selectend` và {{domxref("XRSession.selectstart_event", "selectstart")}} cho bạn biết khi nào bạn có thể muốn hiển thị điều gì đó cho người dùng cho biết hành động chính đang diễn ra. Điều này có thể là vẽ một bộ điều khiển với nút đã kích hoạt bằng màu mới, hoặc hiển thị đối tượng mục tiêu bị nắm và di chuyển xung quanh, bắt đầu khi `selectstart` đến và dừng khi nhận được `selectend`.

Sự kiện {{domxref("XRSession.select_event", "select")}} là sự kiện cho mã của bạn biết rằng người dùng đã hoàn thành hành động họ muốn hoàn thành. Điều này có thể đơn giản như ném một đối tượng hoặc kéo cò súng trong trò chơi, hoặc phức tạp như đặt một đối tượng đã kéo ở vị trí mới.

Nếu hành động chính của bạn là một hành động kích hoạt đơn giản và bạn không cần hoạt họa bất cứ thứ gì trong khi cò được kích hoạt, bạn có thể bỏ qua các sự kiện `selectstart` và `selectend` và hành động dựa trên sự kiện bắt đầu.

## Ví dụ

Xem sự kiện [`selectstart`](/en-US/docs/Web/API/XRSession/selectstart_event#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.select_event", "select")}} và {{domxref("XRSession.selectstart_event", "selectstart")}}
- {{domxref("Element.beforexrselect_event", "beforexrselect")}}
