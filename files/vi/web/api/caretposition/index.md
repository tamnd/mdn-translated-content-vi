---
title: CaretPosition
slug: Web/API/CaretPosition
page-type: web-api-interface
browser-compat: api.CaretPosition
---

{{APIRef("CSSOM view API")}}

Giao diện `CaretPosition` biểu diễn vị trí con trỏ soạn thảo, một chỉ báo cho điểm chèn văn bản.
Bạn có thể lấy một `CaretPosition` bằng phương thức {{domxref("Document.caretPositionFromPoint()")}}.

## Thuộc tính thể hiện

_Giao diện này không kế thừa thuộc tính nào._

- {{domxref("CaretPosition.offsetNode")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("Node")}} chứa nút được tìm thấy tại vị trí của con trỏ soạn thảo.
- {{domxref("CaretPosition.offset")}} {{ReadOnlyInline}}
  - : Trả về một `long` biểu thị độ lệch của vùng chọn trong nút tại vị trí con trỏ soạn thảo.
    Đây sẽ là độ lệch ký tự trong nút văn bản hoặc chỉ mục của nút con được chọn trong nút phần tử.

## Phương thức thể hiện

- {{domxref("CaretPosition.getClientRect")}}
  - : Trả về hình chữ nhật client cho phạm vi của con trỏ soạn thảo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.caretPositionFromPoint()")}}
- {{domxref("Range")}}
- {{domxref("Node")}}
