---
title: "XRSession: sự kiện selectstart"
short-title: selectstart
slug: Web/API/XRSession/selectstart_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.selectstart_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`selectstart`** của [WebXR](/en-US/docs/Web/API/WebXR_Device_API) được gửi đến một {{domxref("XRSession")}} khi người dùng bắt đầu một [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action) trên một trong các nguồn đầu vào của nó.

{{domxref("Element.beforexrselect_event", "beforexrselect")} được kích hoạt trước sự kiện này và có thể ngăn sự kiện này được raised.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectstart", (event) => { })

onselectstart = (event) => { }
```

## Loại sự kiện

Một {{domxref("XRInputSourceEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("XRInputSourceEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("XRInputSourceEvent.frame", "frame")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRFrame")}} cung cấp thông tin cần thiết về khung hình sự kiện trong đó sự kiện xảy ra. Khung hình này có thể đã được kết xuất trong quá khứ thay vì là một khung hình hiện tại. Vì đây là khung hình _sự kiện_, không phải khung hình _hoạt ảnh_, bạn không thể gọi {{domxref("XRFrame.getViewerPose", "XRFrame.getViewerPose()")}} trên nó; thay vào đó, sử dụng {{domxref("XRFrame.getPose", "getPose()")}}.
- {{domxref("XRInputSourceEvent.inputSource", "inputSource")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRInputSource")}} cho biết nguồn đầu vào nào đã tạo ra sự kiện đầu vào.

## Mô tả

### Kích hoạt

Được kích hoạt khi người dùng nhấn cò hoặc nút, chạm bàn di chuột, nói lệnh hoặc thực hiện một cử chỉ có thể nhận dạng khi sử dụng hệ thống theo dõi video hoặc bộ điều khiển cầm tay với gia tốc kế.

### Trường hợp sử dụng

Các sự kiện `selectstart` và {{domxref("XRSession.selectend_event", "selectend")}} cho bạn biết khi nào bạn có thể muốn hiển thị điều gì đó cho người dùng cho biết hành động chính đang diễn ra. Điều này có thể là vẽ một bộ điều khiển với nút đã kích hoạt bằng màu mới, hoặc hiển thị đối tượng mục tiêu bị nắm và di chuyển xung quanh, bắt đầu khi `selectstart` đến và dừng khi nhận được `selectend`.

Sự kiện {{domxref("XRSession.select_event", "select")}} cho mã của bạn biết rằng người dùng đã hoàn thành hành động họ muốn hoàn thành. Điều này có thể đơn giản như ném một đối tượng hoặc kéo cò súng trong trò chơi, hoặc phức tạp như đặt một đối tượng đã kéo ở vị trí mới.

Nếu hành động chính của bạn là một hành động kích hoạt đơn giản và bạn không cần hoạt họa bất cứ thứ gì trong khi cò được kích hoạt, bạn có thể bỏ qua các sự kiện `selectstart` và `selectend` và hành động dựa trên sự kiện bắt đầu.

## Ví dụ

Ví dụ sau sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thiết lập trình xử lý cho các sự kiện chọn: `selectstart`, {{domxref("XRSession.selectend_event", "selectend")}}, và {{domxref("XRSession.select_event", "select")}}. Đoạn mã này là cốt lõi của một trình xử lý sự kiện để cho phép người dùng nắm các đối tượng trong cảnh và di chuyển chúng xung quanh.

Trong trường hợp này, một hàm duy nhất được sử dụng để xử lý cả ba sự kiện, cho phép chúng chia sẻ mã nhất định giống nhau bất kể nhận được sự kiện nào trong ba sự kiện. Chỉ sau khi hoàn thành các tác vụ đó, hàm `onSelectionEvent()` dưới đây mới phân phối hành động ra một hàm chuyên biệt để xử lý.

Sau khi kiểm tra để đảm bảo sự kiện nhận được là sự kiện `tracked-pointer` (loại duy nhất chúng ta xử lý ở đây), pose của tia mục tiêu được lấy bằng {{domxref("XRFrame.getPose", "getPose()")}}.

Nếu pose tia mục tiêu được lấy thành công, mã sau đó sử dụng giá trị của thuộc tính {{domxref("Event")}} {{domxref("Event.type", "type")}} để điều khiển đến một hàm phù hợp để xử lý sự kiện đã nhận:

- Đối với các sự kiện `selectstart`, một hàm `myBeginTracking()` được gọi với {{domxref("XRRigidTransform.matrix", "matrix")}} của pose tia mục tiêu. Hàm `myBeginTracking()` có thể sẽ bắt đầu quá trình trình bày kéo đối tượng, sử dụng biến đổi để thực hiện kiểm tra va chạm, xác định đối tượng nào để nhặt. `myBeginTracking()` trả về một đối tượng biểu diễn đối tượng mà người dùng đã bắt đầu kéo.
- Khi nhận được sự kiện `select`, hàm `myDropObject()` được gọi với đối tượng mục tiêu và biến đổi pose tia mục tiêu hiện tại làm đầu vào. Điều này đặt đối tượng vào vị trí mới trong thế giới và kích hoạt bất kỳ hiệu ứng nào có thể phát sinh, như lên lịch hoạt ảnh của tia nước nếu thả trong nước, v.v.
- Sự kiện `selectend` dẫn đến việc gọi một hàm `myStopTracking()` với đối tượng đang kéo và biến đổi pose tia mục tiêu cuối cùng.

```js
xrSession.addEventListener("selectstart", onSelectionEvent);
xrSession.addEventListener("select", onSelectionEvent);
xrSession.addEventListener("selectend", onSelectionEvent);

function onSelectionEvent(event) {
  let source = event.inputSource;
  let targetObj = null;

  if (source.targetRayMode !== "tracked-pointer") {
    return;
  }

  let targetRayPose = event.frame.getPose(source.targetRaySpace, myRefSpace);
  if (!targetRayPose) {
    return;
  }

  switch (event.type) {
    case "selectstart":
      targetObj = myBeginTracking(targetRayPose.matrix);
      break;
    case "select":
      myDropObject(targetObj, targetRayPose.matrix);
      break;
    case "selectend":
      myStopTracking(targetObj, targetRayPose.matrix);
      break;
  }
}
```

Bạn cũng có thể thiết lập một trình xử lý cho các sự kiện `selectend` bằng cách thiết lập thuộc tính trình xử lý sự kiện `onselectend` của đối tượng {{domxref("XRSession")}} thành một hàm xử lý sự kiện:

```js
xrSession.onselectstart = onSelectionEvent;
xrSession.onselect = onSelectionEvent;
xrSession.onselectend = onSelectionEvent;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.select_event", "select")}} và {{domxref("XRSession.selectend_event", "selectend")}}
- {{domxref("Element.beforexrselect_event", "beforexrselect")}}
