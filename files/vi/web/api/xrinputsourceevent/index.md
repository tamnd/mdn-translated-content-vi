---
title: XRInputSourceEvent
slug: Web/API/XRInputSourceEvent
page-type: web-api-interface
browser-compat: api.XRInputSourceEvent
---

{{APIRef("WebXR Device API")}} {{SecureContext_Header}}

Giao diện **`XRInputSourceEvent`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) mô tả một sự kiện xảy ra trên thiết bị đầu vào người dùng WebXR như bộ điều khiển cầm tay, hệ thống theo dõi ánh mắt, hoặc hệ thống theo dõi chuyển động. Cụ thể hơn, chúng đại diện cho sự thay đổi trạng thái của {{domxref("XRInputSource")}}.

Để tìm hiểu thêm về việc xử lý đầu vào trong dự án WebXR, hãy xem bài viết [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("XRInputSourceEvent.XRInputSourceEvent", "XRInputSourceEvent()")}}
  - : Tạo và trả về đối tượng `XRInputSourceEvent` mới có các thuộc tính khớp với những thuộc tính được cung cấp trong từ điển `eventInitDict`.

## Thuộc tính phiên bản

- {{domxref("XRInputSourceEvent.frame", "frame")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRFrame")}} cung cấp thông tin cần thiết về khung sự kiện trong đó sự kiện xảy ra. Khung này có thể đã được render trong quá khứ thay vì là khung hiện tại. Vì đây là khung _sự kiện_, không phải khung _hoạt ảnh_, bạn không thể gọi phương thức {{domxref("XRFrame")}} {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} trên nó; thay vào đó, hãy sử dụng {{domxref("XRFrame.getPose", "getPose()")}}.
- {{domxref("XRInputSourceEvent.inputSource", "inputSource")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRInputSource")}} cho biết nguồn đầu vào nào đã tạo ra sự kiện đầu vào.

## Phương thức phiên bản

_Giao diện `XRInputSourceEvent` không định nghĩa bất kỳ phương thức nào; tuy nhiên, một số phương thức được kế thừa từ giao diện cha {{domxref("Event")}}._

## Loại sự kiện

- {{domxref("XRSession.select_event", "select")}}
  - : Được gửi đến {{domxref("XRSession")}} khi nguồn đầu vào gửi đã hoàn thành đầy đủ một [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action).
- {{domxref("XRSession.selectend_event", "selectend")}}
  - : Được gửi đến {{domxref("XRSession")}} khi một [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action) đang diễn ra kết thúc, hoặc khi nguồn đầu vào có hành động chính đang diễn ra đã bị ngắt kết nối khỏi hệ thống.
- {{domxref("XRSession.selectstart_event", "selectstart")}}
  - : Được gửi đến {{domxref("XRSession")}} khi nguồn đầu vào bắt đầu [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action), cho biết người dùng đã bắt đầu lệnh, chẳng hạn như nhấn cò hoặc nút, phát lệnh bằng giọng nói, chạm vào touchpad, v.v.
- {{domxref("XRSession.squeeze_event", "squeeze")}}
  - : Được gửi đến {{domxref("XRSession")}} khi nguồn đầu vào gửi đã hoàn thành đầy đủ một [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action).
- {{domxref("XRSession.squeezeend_event", "squeezeend")}}
  - : Được gửi đến {{domxref("XRSession")}} khi một [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action) đang diễn ra kết thúc hoặc khi nguồn đầu vào có hành động bóp chính đang diễn ra bị ngắt kết nối.
- {{domxref("XRSession.squeezestart_event", "squeezestart")}}
  - : Được gửi đến {{domxref("XRSession")}} khi nguồn đầu vào bắt đầu [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action), cho biết người dùng đã bắt đầu nắm, bóp hoặc cầm bộ điều khiển.

## Ví dụ

Mã bên dưới thiết lập các trình xử lý cho các sự kiện hành động chính để xác định khi nào người dùng nhấp vào (bắn/chạm vào/bất cứ điều gì) các đối tượng trong cảnh.

```js
xrSession.addEventListener("select", (event) => {
  let targetRayPose = event.frame.getPose(
    event.inputSource.targetRaySpace,
    myRefSpace,
  );

  if (targetRayPose) {
    let hit = myHitTest(targetRayPose.transform);
    if (hit) {
      /* handle the hit */
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
