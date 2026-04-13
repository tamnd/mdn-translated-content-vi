---
title: "CompositionEvent: thuộc tính data"
short-title: data
slug: Web/API/CompositionEvent/data
page-type: web-api-instance-property
browser-compat: api.CompositionEvent.data
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("CompositionEvent")}} trả về các ký tự được tạo bởi phương thức nhập đã kích hoạt sự kiện; bản chất chính xác của nó phụ thuộc vào loại sự kiện đã tạo ra đối tượng `CompositionEvent`.

## Giá trị

Một chuỗi biểu diễn dữ liệu sự kiện:

- Đối với sự kiện `compositionstart`, đây là văn bản hiện được chọn sẽ được thay thế bằng chuỗi đang được soạn thảo. Giá trị này không thay đổi ngay cả khi nội dung thay đổi phạm vi đã chọn; thay vào đó, nó cho biết chuỗi đã được chọn khi bắt đầu soạn thảo.
- Đối với `compositionupdate`, đây là chuỗi hiện tại khi đang chỉnh sửa.
- Đối với sự kiện `compositionend`, đây là chuỗi đã được xác nhận vào trình soạn thảo.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}
