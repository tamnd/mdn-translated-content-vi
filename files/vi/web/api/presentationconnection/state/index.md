---
title: "PresentationConnection: state property"
short-title: state
slug: Web/API/PresentationConnection/state
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PresentationConnection.state
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính **`state`** phản ánh trạng thái hiện tại của [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection). Tùy thuộc vào [`PresentationConnectionState`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnectionstate) hiện tại, thuộc tính `state` có thể chứa một trong các giá trị sau.

- **`connecting`**: Tác nhân người dùng đang cố gắng [thiết lập kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-establish-a-presentation-connection) với [ngữ cảnh duyệt web đích](https://www.w3.org/TR/presentation-api/#dfn-destination-browsing-context). Đây là trạng thái ban đầu khi một đối tượng [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) được tạo.
- **`connected`**: [Kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) đã được thiết lập và giao tiếp là có thể.
- **`closed`**: [Kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) đã bị đóng hoặc không thể mở. Kết nối có thể được mở lại bằng cách gọi [`reconnect()`](https://www.w3.org/TR/presentation-api/#dom-presentationrequest-reconnect). Không thể giao tiếp trong trạng thái này.
- **`terminated`**: [Ngữ cảnh duyệt web nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-browsing-context) đã kết thúc. Bất kỳ [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) nào đến [bản trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation) đó cũng đã kết thúc và không thể mở lại. Không thể giao tiếp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
