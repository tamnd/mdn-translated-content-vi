---
title: "XRSession: sự kiện select"
short-title: select
slug: Web/API/XRSession/select_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.select_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`select`** của WebXR được gửi đến một {{domxref("XRSession")}} khi một trong các nguồn đầu vào của phiên đã hoàn thành một [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action).

{{domxref("Element.beforexrselect_event", "beforexrselect")} được kích hoạt trước sự kiện này và có thể ngăn sự kiện này được raised.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("select", (event) => { })

onselect = (event) => { }
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

Các sự kiện {{domxref("XRSession.selectstart_event", "selectstart")}} và {{domxref("XRSession.selectend_event", "selectend")}} cho bạn biết khi nào bạn có thể muốn hiển thị điều gì đó cho người dùng cho biết hành động chính đang diễn ra. Điều này có thể là vẽ một bộ điều khiển với nút đã kích hoạt bằng màu mới, hoặc hiển thị đối tượng mục tiêu bị nắm và di chuyển xung quanh, bắt đầu khi `selectstart` đến và dừng khi nhận được `selectend`.

Sự kiện `select` cho mã của bạn biết rằng người dùng đã hoàn thành một hành động. Điều này có thể đơn giản như ném một đối tượng hoặc kéo cò súng trong trò chơi, hoặc phức tạp như đặt một đối tượng đã kéo tại vị trí mới.

Nếu hành động chính của bạn là một hành động kích hoạt đơn giản và bạn không cần hoạt họa bất cứ thứ gì trong khi cò được kích hoạt, bạn có thể bỏ qua các sự kiện `selectstart` và `selectend` và hành động dựa trên sự kiện bắt đầu.

## Ví dụ

Ví dụ sau sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thiết lập một trình xử lý cho sự kiện `select`. Trình xử lý lấy pose biểu diễn tia mục tiêu cho các đầu vào `tracked-pointer` và gửi biến đổi của pose đến một hàm gọi là `myHandleSelectWithRay()`.

```js
xrSession.addEventListener("select", (event) => {
  if (event.inputSource.targetRayMode === "tracked-pointer") {
    let targetRayPose = event.frame.getPose(
      event.inputSource.targetRaySpace,
      myRefSpace,
    );
    if (targetRayPose) {
      myHandleSelectWithRay(targetRayPose.transform);
    }
  }
});
```

Bạn cũng có thể thiết lập một trình xử lý cho các sự kiện `select` bằng cách thiết lập thuộc tính trình xử lý sự kiện `onselect` của đối tượng {{domxref("XRSession")}} thành một hàm xử lý sự kiện:

```js
xrSession.onselect = (event) => {
  if (event.inputSource.targetRayMode === "tracked-pointer") {
    let targetRayPose = event.frame.getPose(
      event.inputSource.targetRaySpace,
      myRefSpace,
    );
    if (targetRayPose) {
      myHandleSelectWithRay(targetRayPose.transform);
    }
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.selectstart_event", "selectstart")}} và {{domxref("XRSession.selectend_event", "selectend")}}
- {{domxref("Element.beforexrselect_event", "beforexrselect")}}
