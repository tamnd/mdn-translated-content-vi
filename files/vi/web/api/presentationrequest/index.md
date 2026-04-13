---
title: PresentationRequest
slug: Web/API/PresentationRequest
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PresentationRequest
---

{{SeeCompatTable}}{{securecontext_header}}{{APIRef("Presentation API")}}

Đối tượng `PresentationRequest` được sử dụng để khởi tạo hoặc kết nối lại với một bản trình chiếu được tạo bởi một [ngữ cảnh duyệt web điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-browsing-context). Đối tượng `PresentationRequest` _PHẢI_ được triển khai trong một [ngữ cảnh duyệt web điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-browsing-context) được cung cấp bởi một [user agent điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent).

Khi một `PresentationRequest` được khởi tạo, các `urls` đã cho _PHẢI_ được sử dụng làm danh sách _URL yêu cầu trình chiếu_, mỗi URL là một [URL trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-url) có thể dùng cho phiên bản `PresentationRequest`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PresentationRequest.PresentationRequest","PresentationRequest()")}} {{Experimental_Inline}}
  - : Tạo một `PresentationRequest`.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref("PresentationRequest.start()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết với {{DOMxRef("PresentationConnection")}} sau khi user agent nhắc người dùng chọn màn hình và cấp quyền sử dụng màn hình đó.
- {{domxref("PresentationRequest.reconnect()")}} {{Experimental_Inline}}
  - : Khi phương thức `reconnect(presentationId)` được gọi trên một `PresentationRequest` _presentationRequest_, [user agent](https://www.w3.org/TR/presentation-api/#dfn-user-agents) _PHẢI_ thực hiện các bước sau để _kết nối lại với một bản trình chiếu_.
- {{domxref("PresentationRequest.getAvailability()")}} {{Experimental_Inline}}
  - : Khi phương thức `getAvailability()` được gọi, user agent _PHẢI_ thực hiện các bước được mô tả trong liên kết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
