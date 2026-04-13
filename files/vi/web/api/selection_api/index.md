---
title: Selection API
slug: Web/API/Selection_API
page-type: web-api-overview
spec-urls: https://w3c.github.io/selection-api/#selection-interface
---

{{DefaultAPISidebar("Selection API")}}

> [!NOTE]
> API này _không khả dụng_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (không được hiển thị qua {{domxref("WorkerNavigator")}}).

**Selection API** cho phép các nhà phát triển truy cập và thao tác phần tài liệu được người dùng chọn.

Các phương thức {{domxref("Window/getSelection()", "Window.getSelection()")}} và {{domxref("Document/getSelection()", "Document.getSelection()")}} trả về đối tượng {{domxref("Selection")}} đại diện cho phần tài liệu được người dùng chọn. Đối tượng `Selection` cung cấp các phương thức để:

- truy cập các node hiện đang được chọn
- sửa đổi vùng chọn hiện tại, mở rộng hoặc thu hẹp nó hoặc chọn một phần hoàn toàn khác của tài liệu
- xóa các phần của vùng chọn hiện tại khỏi DOM.

Selection API cũng cung cấp hai sự kiện, cả hai đều kích hoạt trên {{domxref("Document")}}:

- sự kiện {{domxref("Node/selectstart_event", "selectstart")}} được kích hoạt khi người dùng bắt đầu thực hiện vùng chọn mới
- sự kiện {{domxref("Document/selectionchange_event", "selectionchange")}} được kích hoạt khi vùng chọn hiện tại thay đổi.

## Giao diện

- {{domxref("Selection")}}
  - : Giao diện đại diện cho phần tài liệu được người dùng chọn hoặc vị trí hiện tại của con trỏ.
- {{domxref("Document/getSelection()", "Document.getSelection()")}}
  - : Phương thức trả về đối tượng `Selection` đại diện cho vùng chọn hiện tại hoặc vị trí hiện tại của con trỏ.
- {{domxref("Window/getSelection()", "Window.getSelection()")}}
  - : Phương thức trả về đối tượng `Selection` đại diện cho vùng chọn hiện tại hoặc vị trí hiện tại của con trỏ.
- {{domxref("Document/selectionchange_event", "Document.selectionchange")}}
  - : Sự kiện được kích hoạt khi vùng chọn hiện tại thay đổi.
- {{domxref("Node/selectstart_event", "Node.selectstart")}}
  - : Sự kiện được kích hoạt khi người dùng bắt đầu vùng chọn mới.

## Thông số kỹ thuật

{{Specifications}}
