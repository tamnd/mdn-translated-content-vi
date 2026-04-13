---
title: PresentationConnection
slug: Web/API/PresentationConnection
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PresentationConnection
---

{{SeeCompatTable}}{{securecontext_header}}{{APIRef("Presentation API")}}

Giao diện **`PresentationConnection`** của [Presentation API](/en-US/docs/Web/API/Presentation_API) cung cấp các phương thức và thuộc tính để quản lý một bản trình bày đơn lẻ. Mỗi [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) được đại diện bởi một đối tượng `PresentationConnection`. Cả [tác nhân người dùng điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) và [tác nhân người dùng nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-user-agent) đều _PHẢI_ triển khai `PresentationConnection`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PresentationConnection.binaryType")}} {{Experimental_Inline}}
  - : Trả về blob hoặc arrayBuffer. Khi một đối tượng `PresentationConnection` được tạo, thuộc tính IDL [`binaryType`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection-binarytype) _PHẢI_ được đặt thành chuỗi [`"arraybuffer"`](https://www.w3.org/TR/presentation-api/#dom-binarytype-arraybuffer).
- {{domxref("PresentationConnection.id")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Cung cấp định danh kết nối trình bày.
- {{domxref("PresentationConnection.state")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về trạng thái hiện tại của [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection).
- {{domxref("PresentationConnection.url")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về URL được dùng để tạo hoặc kết nối lại với bản trình bày.

## Phương thức phiên bản

- {{domxref("PresentationConnection.close()")}} {{Experimental_Inline}}
  - : Đóng kết nối hiện tại và gửi một {{domxref("PresentationConnectionCloseEvent")}} tới sự kiện {{DOMxRef("PresentationConnection/close", "close")}}.
- {{domxref("PresentationConnection.send()")}} {{Experimental_Inline}}
  - : Gửi dữ liệu nhị phân hoặc văn bản giữa ngữ cảnh duyệt web điều khiển và ngữ cảnh duyệt web đang trình bày.
- {{domxref("PresentationConnection.terminate()")}} {{Experimental_Inline}}
  - : Kết thúc kết nối hiện tại và kích hoạt sự kiện {{domxref("PresentationConnection/terminate_event", "terminate")}}.

## Sự kiện

- {{domxref("PresentationConnection/close_event", "close")}} {{Experimental_Inline}}
  - : Được kích hoạt khi có lời gọi đến {{DOMxRef("PresentationConnection.close", "PresentationConnection.close()")}}.
- {{domxref("PresentationConnection/connect_event", "connect")}} {{Experimental_Inline}}
  - : Được kích hoạt khi một kết nối trình bày được thiết lập.
- {{domxref("PresentationConnection/message_event", "message")}} {{Experimental_Inline}}
  - : Được kích hoạt khi có lời gọi đến {{DOMxRef("PresentationConnection.send", "PresentationConnection.send()")}}.
- {{domxref("PresentationConnection/terminate_event", "terminate")}} {{Experimental_Inline}}
  - : Được kích hoạt khi có lời gọi đến {{DOMxRef("PresentationConnection.terminate", "PresentationConnection.terminate()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
