---
title: "XRSession: thuộc tính domOverlayState"
short-title: domOverlayState
slug: Web/API/XRSession/domOverlayState
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.domOverlayState
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`domOverlayState`** của một {{DOMxRef("XRSession")}} `immersive-ar` cung cấp thông tin về lớp phủ DOM, nếu tính năng được bật.

## Giá trị

Trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu tính năng lớp phủ DOM không được hỗ trợ hoặc không được bật, hoặc một đối tượng chứa thông tin về trạng thái lớp phủ DOM với các thuộc tính sau:

- `type`
  - : Một chuỗi cho biết cách lớp phủ DOM đang được hiển thị. Các giá trị có thể:
    - `screen`
      - : Lớp phủ được vẽ trên toàn bộ thiết bị dựa trên màn hình (đối với thiết bị AR cầm tay).
    - `head-locked`
      - : Lớp phủ được vẽ tại giao diện khóa đầu lấp đầy khung nhìn có thể kết xuất và di chuyển theo chuyển động đầu của người dùng.
    - `floating`
      - : Lớp phủ xuất hiện dưới dạng một hình chữ nhật lơ lửng trong không gian được giữ phía trước người dùng. Nó không nhất thiết lấp đầy toàn bộ không gian và/hoặc được khóa đầu chặt chẽ.

## Ví dụ

### Kiểm tra lớp phủ DOM nào đã được bật

```js
if (session.domOverlayState) {
  console.log(session.domOverlayState.type);
} else {
  console.log("DOM overlay not supported or enabled!");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.beforexrselect_event", "beforexrselect")}}
