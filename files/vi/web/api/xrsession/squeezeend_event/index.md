---
title: "XRSession: sự kiện squeezeend"
short-title: squeezeend
slug: Web/API/XRSession/squeezeend_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.squeezeend_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`squeezeend`** của WebXR được gửi đến một {{domxref("XRSession")}} khi một trong các nguồn đầu vào của nó kết thúc [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action) hoặc khi một nguồn đầu vào đang trong quá trình xử lý một hành động chính đang diễn ra bị ngắt kết nối mà không hoàn thành thành công hành động.

Các hành động bóp chính bao gồm những việc như người dùng nhấn cò hoặc nút, chạm bàn di chuột, nói lệnh hoặc thực hiện một cử chỉ có thể nhận dạng khi sử dụng hệ thống theo dõi video hoặc bộ điều khiển cầm tay với gia tốc kế.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("squeezeend", (event) => { })

onsqueezeend = (event) => { }
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

Được kích hoạt khi người dùng ngừng bóp bộ điều khiển, thực hiện cử chỉ tay mô phỏng việc nắm bắt thứ gì đó hoặc sử dụng (bóp) cò.

### Trường hợp sử dụng

Sự kiện {{domxref("XRSession.squeezestart_event", "squeezestart")}} được gửi cho biết người dùng đã bắt đầu một hành động bóp.

Nếu hành động bóp chính kết thúc thành công, phiên được gửi một sự kiện {{domxref("XRSession.squeeze_event", "squeeze")}}.

Một sự kiện `squeezeend` được gửi để cho biết rằng hành động bóp không còn diễn ra. Điều này được gửi bất kể hành động bóp có thành công hay không.

## Ví dụ

Xem sự kiện [`squeezestart`](/en-US/docs/Web/API/XRSession/squeezestart_event#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
