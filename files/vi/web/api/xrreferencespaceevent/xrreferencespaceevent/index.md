---
title: "XRReferenceSpaceEvent: hàm khởi tạo XRReferenceSpaceEvent()"
short-title: XRReferenceSpaceEvent()
slug: Web/API/XRReferenceSpaceEvent/XRReferenceSpaceEvent
page-type: web-api-constructor
browser-compat: api.XRReferenceSpaceEvent.XRReferenceSpaceEvent
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Hàm khởi tạo **`XRReferenceSpaceEvent()`** được sử dụng để tạo một đối tượng {{domxref("XRReferenceSpaceEvent")}} mới, đại diện cho một sự kiện liên quan đến trạng thái của đối tượng không gian tham chiếu WebXR, {{domxref("XRReferenceSpace")}}.

## Cú pháp

```js-nolint
new XRReferenceSpaceEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `reset`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `referenceSpace`
      - : {{domxref("XRReferenceSpace")}} mà từ đó sự kiện xuất phát.
    - `transform`
      - : Một {{domxref("XRRigidTransform")}} ánh xạ hệ tọa độ cũ (từ trước các thay đổi được chỉ ra bởi sự kiện này) sang hệ tọa độ mới.

### Giá trị trả về

Một đối tượng `XRReferenceSpaceEvent` mới, được khởi tạo theo định nghĩa của các tham số đầu vào.

## Ví dụ

Đoạn mã đơn giản này gọi hàm khởi tạo để tạo một sự kiện không gian tham chiếu mới có loại {{domxref("XRReferenceSpace.reset_event", "reset")}}.

```js
let refSpaceEvent = new XRReferenceSpaceEvent("reset", {
  referenceSpace: myRefSpace,
  transform: myTransform,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
