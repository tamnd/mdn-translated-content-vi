---
title: "XRSession: sự kiện squeeze"
short-title: squeeze
slug: Web/API/XRSession/squeeze_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.squeeze_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`squeeze`** của WebXR được gửi đến một {{domxref("XRSession")}} khi một trong các nguồn đầu vào của phiên đã hoàn thành một [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action). Ví dụ về các loại hành động chính phổ biến là người dùng nhấn cò hoặc nút, chạm bàn di chuột, nói lệnh hoặc thực hiện một cử chỉ có thể nhận dạng khi sử dụng hệ thống theo dõi video hoặc bộ điều khiển cầm tay với gia tốc kế.

Để biết chi tiết về cách các sự kiện {{domxref("XRSession.squeezestart_event", "squeezestart")}}, `squeeze` và {{domxref("XRSession.squeezeend_event", "squeezeend")}} hoạt động và cách bạn nên phản ứng với chúng, xem [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs#input_sources).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("squeeze", (event) => { })

onsqueeze = (event) => { }
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

Được kích hoạt khi người dùng bóp bộ điều khiển, thực hiện cử chỉ tay mô phỏng việc nắm bắt thứ gì đó hoặc sử dụng (bóp) cò.

### Trường hợp sử dụng

Sự kiện {{domxref("XRSession.squeezestart_event", "squeezestart")}} cho biết người dùng đã bắt đầu một hành động bóp.

Nếu hành động bóp chính kết thúc thành công, phiên được gửi một sự kiện `squeeze`.

Một sự kiện {{domxref("XRSession.squeezeend_event", "squeezeend")}} được gửi để cho biết rằng hành động bóp không còn diễn ra. Điều này được gửi bất kể hành động bóp có thành công hay không.

## Ví dụ

Ví dụ sau sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thiết lập một trình xử lý cho sự kiện `squeeze`. Trình xử lý lấy pose biểu diễn tia mục tiêu cho các đầu vào `tracked-pointer` và gửi biến đổi của pose đến một hàm gọi là `myHandleSqueezeWithRay()`.

Mã này coi việc bóp như một hành động tức thời không liên quan đến việc theo dõi một hoạt động đang diễn ra. Nếu bạn cần theo dõi một hành động bóp không tức thời, hãy lắng nghe các sự kiện {{domxref("XRSession.squeezestart_event", "squeezestart")}} và {{domxref("XRSession.squeezeend_event", "squeezeend")}} để cảm nhận khi hành động bóp bắt đầu và kết thúc.

```js
xrSession.addEventListener("squeeze", (event) => {
  if (event.inputSource.targetRayMode === "tracked-pointer") {
    let targetRayPose = event.frame.getPose(
      event.inputSource.targetRaySpace,
      myRefSpace,
    );
    if (targetRayPose) {
      myHandleSqueezeWithRay(targetRayPose.transform);
    }
  }
});
```

Bạn cũng có thể thiết lập một trình xử lý cho các sự kiện `squeeze` bằng cách thiết lập thuộc tính trình xử lý sự kiện `onsqueeze` của đối tượng {{domxref("XRSession")}} thành một hàm xử lý sự kiện:

```js
xrSession.onsqueeze = (event) => {
  if (event.inputSource.targetRayMode === "tracked-pointer") {
    let targetRayPose = event.frame.getPose(
      event.inputSource.targetRaySpace,
      myRefSpace,
    );
    if (targetRayPose) {
      myHandleSqueezeWithRay(targetRayPose.transform);
    }
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("XRSession.squeezestart_event", "squeezestart")}} và {{domxref("XRSession.squeezeend_event", "squeezeend")}}
