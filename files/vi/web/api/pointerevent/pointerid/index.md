---
title: "PointerEvent: pointerId property"
short-title: pointerId
slug: Web/API/PointerEvent/pointerId
page-type: web-api-instance-property
browser-compat: api.PointerEvent.pointerId
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`pointerId`** của giao diện {{domxref("PointerEvent")}} là một định danh được gán cho con trỏ đã kích hoạt sự kiện. Định danh này là duy nhất, khác với định danh của tất cả các sự kiện con trỏ đang hoạt động khác.

Giá trị `-1` cho biết rằng `PointerEvent` không được tạo ra bởi một thiết bị trỏ.
(Ví dụ: một sự kiện {{domxref("Element/click_event", "click")}} được kích hoạt trên một nút bằng bàn phím.) Ngoài ra, giá trị có thể được tạo ngẫu nhiên và không nên dựa vào nó để truyền đạt bất kỳ thông tin cụ thể nào về thiết bị. Giá trị chỉ được đảm bảo ổn định trong suốt thời gian của trang hoặc phiên.

> [!NOTE]
> Thuộc tính `pointerId` được triển khai không nhất quán giữa các trình duyệt và không phải lúc nào cũng tồn tại cho mỗi nét mực hoặc tương tác với màn hình. Để có cách đáng tin cậy hơn để xác định nhiều thiết bị trỏ trên màn hình cùng lúc, hãy xem {{domxref("PointerEvent.persistentDeviceId")}}.

## Giá trị

Một số.

## Ví dụ

Đoạn code sau so sánh `pointerId` đã lưu trước đó với `pointerId` của sự kiện {{domxref("Element/pointerdown_event", "pointerdown")}} vừa được kích hoạt.

```js
let id; // Let's assume that this is a previously saved pointerId

target.addEventListener("pointerdown", (event) => {
  // Compare previous event's ID that was cached
  // to current event's ID and handle accordingly
  if (id === event.pointerId) process_event(event);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
