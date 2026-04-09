---
title: "CompositionEvent: thuộc tính data"
short-title: data
slug: Web/API/CompositionEvent/data
page-type: web-api-instance-property
browser-compat: api.CompositionEvent.data
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("CompositionEvent")}} trả về các ký tự do phương thức nhập đã tạo ra để phát sinh sự kiện; bản chất chính xác của giá trị này thay đổi tùy theo loại sự kiện đã tạo ra đối tượng `CompositionEvent`.

## Giá trị

Một chuỗi biểu diễn dữ liệu của sự kiện:

- Với sự kiện `compositionstart`, đây là văn bản hiện đang được chọn và sẽ bị thay thế bởi chuỗi đang được soạn. Giá trị này không thay đổi ngay cả khi nội dung làm thay đổi phạm vi chọn; thay vào đó, nó biểu thị chuỗi đã được chọn tại thời điểm composition bắt đầu.
- Với `compositionupdate`, đây là chuỗi ở trạng thái hiện tại trong khi quá trình chỉnh sửa vẫn đang diễn ra.
- Với sự kiện `compositionend`, đây là chuỗi đã được xác nhận vào trình soạn thảo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}
