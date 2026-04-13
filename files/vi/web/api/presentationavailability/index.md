---
title: PresentationAvailability
slug: Web/API/PresentationAvailability
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PresentationAvailability
---

{{SeeCompatTable}}{{securecontext_header}}{{APIRef("Presentation API")}}

Một đối tượng **`PresentationAvailability`** liên kết với các [màn hình trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-display) có sẵn và đại diện cho _tính khả dụng của màn hình trình chiếu_ cho một yêu cầu trình chiếu. Nếu [tác nhân người dùng điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) có thể [giám sát danh sách màn hình trình chiếu có sẵn](https://www.w3.org/TR/presentation-api/#dfn-monitor-the-list-of-available-presentation-displays) ở chế độ nền (không có yêu cầu đang chờ đến `start()`), đối tượng `PresentationAvailability` _PHẢI_ được triển khai trong một [bối cảnh duyệt điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-browsing-context).

Thuộc tính `value` _PHẢI_ trả về giá trị cuối cùng mà nó được đặt. Giá trị được cập nhật bởi thuật toán [giám sát danh sách màn hình trình chiếu có sẵn](https://www.w3.org/TR/presentation-api/#dfn-monitor-the-list-of-available-presentation-displays).

Thuộc tính `onchange` là một [trình xử lý sự kiện](https://www.w3.org/TR/presentation-api/#dfn-event-handler) có [loại sự kiện của trình xử lý sự kiện](https://www.w3.org/TR/presentation-api/#dfn-event-handler-event-type) tương ứng là `change`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PresentationAvailability.value")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị boolean cho biết liệu màn hình trình chiếu đã cho có sẵn hay không. Thuộc tính `value` _PHẢI_ trả về giá trị cuối cùng mà nó được đặt.

### Sự kiện

- {{domxref("PresentationAvailability.change_event", "change")}} {{Experimental_Inline}}
  - : Cho biết tính khả dụng của màn hình trình chiếu đã thay đổi.

## Phương thức phiên bản

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
