---
title: "XRSession: sự kiện squeezestart"
short-title: squeezestart
slug: Web/API/XRSession/squeezestart_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.squeezestart_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`squeezestart`** của [WebXR](/en-US/docs/Web/API/WebXR_Device_API) được gửi đến một {{domxref("XRSession")}} khi người dùng bắt đầu một [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action) trên một trong các nguồn đầu vào của nó.

Các hành động bóp chính là các hành động nhằm biểu thị việc nắm hoặc bóp bằng tay và có thể được mô phỏng bằng cò trên bộ điều khiển cầm tay.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("squeezestart", (event) => { })

onsqueezestart = (event) => { }
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

Được kích hoạt khi người dùng bắt đầu bóp bộ điều khiển, thực hiện cử chỉ tay mô phỏng việc nắm bắt thứ gì đó hoặc sử dụng (bóp) cò.

### Trường hợp sử dụng

Sự kiện `squeezestart` được gửi cho biết người dùng đã bắt đầu một hành động bóp.

Nếu hành động bóp chính kết thúc thành công, phiên được gửi một sự kiện {{domxref("XRSession.squeeze_event", "squeeze")}}.

Một sự kiện {{domxref("XRSession.squeezeend_event", "squeezeend")}} được gửi để cho biết rằng hành động bóp không còn diễn ra. Điều này được gửi bất kể hành động bóp có thành công hay không.

## Ví dụ

Ví dụ sau sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thiết lập trình xử lý cho các sự kiện bóp: `squeezestart`, {{domxref("XRSession.squeezeend_event", "squeezeend")}}, và {{domxref("XRSession.squeeze_event", "squeeze")}}. Đoạn mã này là cốt lõi của một trình xử lý sự kiện để cho phép người dùng nắm các đối tượng trong cảnh và di chuyển chúng xung quanh.

Trong trường hợp này, một hàm duy nhất được sử dụng để xử lý cả ba sự kiện, cho phép chúng chia sẻ mã nhất định giống nhau bất kể nhận được sự kiện nào trong ba sự kiện. Chỉ sau khi hoàn thành các tác vụ đó, hàm `onSqueezeEvent()` dưới đây mới phân phối hành động ra một hàm chuyên biệt để xử lý.

Sau khi kiểm tra để đảm bảo sự kiện nhận được là sự kiện `tracked-pointer` (loại duy nhất chúng ta xử lý ở đây), pose của tia mục tiêu được lấy bằng {{domxref("XRFrame.getPose", "getPose()")}}.

Nếu pose tia mục tiêu được lấy thành công, mã sau đó sử dụng giá trị của thuộc tính {{domxref("Event")}} {{domxref("Event.type", "type")}} để điều khiển đến một hàm phù hợp để xử lý sự kiện đã nhận:

- Đối với các sự kiện `squeezestart`, một hàm `myBeginTracking()` được gọi với {{domxref("XRRigidTransform.matrix", "matrix")}} của pose tia mục tiêu. Hàm `myBeginTracking()` có thể sẽ bắt đầu quá trình trình bày kéo đối tượng, sử dụng biến đổi để thực hiện kiểm tra va chạm, xác định đối tượng nào để nhặt. `myBeginTracking()` trả về một đối tượng biểu diễn đối tượng mà người dùng đã bắt đầu kéo.
- Khi nhận được sự kiện `squeeze`, hàm `myDropObject()` được gọi với đối tượng mục tiêu và biến đổi pose tia mục tiêu hiện tại làm đầu vào. Điều này đặt đối tượng vào vị trí mới trong thế giới và kích hoạt bất kỳ hiệu ứng nào có thể phát sinh, như lên lịch hoạt ảnh của tia nước nếu thả trong nước, v.v.
- Sự kiện `squeezeend` dẫn đến việc gọi một hàm `myStopTracking()` với đối tượng đang kéo và biến đổi pose tia mục tiêu cuối cùng.

```js
xrSession.addEventListener("squeezestart", onSqueezeEvent);
xrSession.addEventListener("squeeze", onSqueezeEvent);
xrSession.addEventListener("squeezeend", onSqueezeEvent);

function onSqueezeEvent(event) {
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
    case "squeezestart":
      targetObj = myBeginTracking(targetRayPose.matrix);
      break;
    case "squeeze":
      myDropObject(targetObj, targetRayPose.matrix);
      break;
    case "squeezeend":
      myStopTracking(targetObj, targetRayPose.matrix);
      break;
  }
}
```

Bạn cũng có thể thiết lập một trình xử lý cho các sự kiện này bằng cách thiết lập các thuộc tính trình xử lý sự kiện của đối tượng {{domxref("XRSession")}} thành một hàm xử lý sự kiện:

```js
xrSession.onsqueezestart = onSqueezeEvent;
xrSession.onsqueeze = onSqueezeEvent;
xrSession.onsqueezeend = onSqueezeEvent;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
