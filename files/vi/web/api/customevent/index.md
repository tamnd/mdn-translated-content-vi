---
title: CustomEvent
slug: Web/API/CustomEvent
page-type: web-api-interface
browser-compat: api.CustomEvent
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`CustomEvent`** có thể được sử dụng để đính kèm dữ liệu tùy chỉnh vào một sự kiện do ứng dụng tạo ra.

Thay vì sử dụng `CustomEvent`, bạn có thể [tạo lớp con của giao diện `Event`](/en-US/docs/Web/API/Document_Object_Model/Events#adding_custom_data_–_subclassing_event) để thêm dữ liệu và hành vi tùy chỉnh.

> [!NOTE]
> Nếu được sử dụng để cố gắng giao tiếp giữa tập lệnh nội dung của tiện ích mở rộng web và tập lệnh của trang web, thuộc tính `detail` không phải kiểu chuỗi sẽ ném lỗi "Permission denied to access property" trong Firefox. Để tránh vấn đề này, hãy sao chép đối tượng. Xem [Chia sẻ đối tượng với tập lệnh trang](/en-US/docs/Mozilla/Add-ons/WebExtensions/Sharing_objects_with_page_scripts) để biết thêm thông tin.

{{InheritanceDiagram}}

## Constructor

- {{domxref("CustomEvent.CustomEvent", "CustomEvent()")}}
  - : Tạo một `CustomEvent` mới.

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ cha của nó, {{domxref("Event")}}._

- {{domxref("CustomEvent.detail")}} {{ReadOnlyInline}}
  - : Trả về bất kỳ dữ liệu nào được truyền khi khởi tạo sự kiện.

## Phương thức instance

_Giao diện này kế thừa các phương thức từ cha của nó, {{domxref("Event")}}._

- {{domxref("CustomEvent.initCustomEvent()")}} {{deprecated_inline}}
  - : Khởi tạo một đối tượng `CustomEvent`. Nếu sự kiện đã được dispatch, phương thức này không làm gì cả.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window.postMessage()")}}
- [Tạo và dispatch sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events)
