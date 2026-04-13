---
title: "PointerEvent: isPrimary property"
short-title: isPrimary
slug: Web/API/PointerEvent/isPrimary
page-type: web-api-instance-property
browser-compat: api.PointerEvent.isPrimary
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`isPrimary`** của giao diện {{domxref("PointerEvent")}} cho biết liệu thiết bị con trỏ đã tạo ra sự kiện có phải là con trỏ _chính_ hay không. Nó trả về `true` nếu con trỏ gây ra sự kiện là con trỏ chính, và trả về `false` trong trường hợp ngược lại.

Trong kịch bản đa con trỏ (như màn hình cảm ứng hỗ trợ nhiều điểm chạm), thuộc tính này được dùng để xác định _con trỏ chính_ trong tập các con trỏ đang hoạt động cho mỗi loại con trỏ. Chỉ có con trỏ chính mới tạo ra _sự kiện chuột tương thích_. Những tác giả chỉ muốn tương tác đơn con trỏ có thể thực hiện điều đó bằng cách bỏ qua các con trỏ không phải chính.

Một con trỏ được coi là chính nếu nó đại diện cho thiết bị chuột. Một con trỏ đại diện cho đầu vào bút được coi là bút chính nếu sự kiện {{domxref("Element/pointerdown_event", "pointerdown")}} của nó được gửi khi không có con trỏ đang hoạt động nào khác đại diện cho đầu vào bút. Một con trỏ đại diện cho đầu vào cảm ứng được coi là cảm ứng chính nếu sự kiện {{domxref("Element/pointerdown_event", "pointerdown")}} của nó được gửi khi không có con trỏ đang hoạt động nào khác đại diện cho đầu vào cảm ứng.

Khi hai hoặc nhiều loại thiết bị con trỏ được sử dụng đồng thời, nhiều con trỏ (một cho mỗi {{domxref("PointerEvent.pointerType", "pointerType")}}) đều được coi là chính. Ví dụ: một điểm chạm và con trỏ chuột di chuyển đồng thời sẽ tạo ra các con trỏ đều được coi là chính. Nếu có nhiều con trỏ chính, tất cả các con trỏ đó đều sẽ tạo ra _sự kiện chuột tương thích_ (xem [Pointer events](/en-US/docs/Web/API/Pointer_events) để biết thêm thông tin về tương tác con trỏ, chuột và cảm ứng).

## Giá trị

Một boolean, `true` nếu con trỏ của sự kiện này là con trỏ chính, và `false` trong trường hợp ngược lại.

## Ví dụ

Ví dụ này minh họa cách sử dụng giá trị của `isPrimary` để gọi hàm xử lý phù hợp.

```js
target.addEventListener("pointerdown", (event) => {
  if (event.isPrimary) {
    process_primary_pointer(event);
  } else {
    process_secondary_pointer(event);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
