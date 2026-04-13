---
title: "PresentationRequest: reconnect() method"
short-title: reconnect()
slug: Web/API/PresentationRequest/reconnect
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PresentationRequest.reconnect
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Khi phương thức `reconnect(presentationId)` được gọi trên một `PresentationRequest` _presentationRequest_, [user agent](https://www.w3.org/TR/presentation-api/#dfn-user-agents) _PHẢI_ thực hiện các bước sau để _kết nối lại với một bản trình chiếu_:

## Đầu vào

- _presentationRequest_, đối tượng [`PresentationRequest`](https://www.w3.org/TR/presentation-api/#idl-def-presentationrequest) mà [`reconnect()`](https://www.w3.org/TR/presentation-api/#dom-presentationrequest-reconnect) được gọi trên.
- _presentationId_, một [định danh trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-identifier) hợp lệ

## Đầu ra

_P_, một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise).

## Thuật toán

1. Sử dụng [đối tượng cài đặt](https://www.w3.org/TR/presentation-api/#dfn-settings-object) của tài liệu chạy [thuật toán cấm ngữ cảnh bảo mật hỗn hợp](https://www.w3.org/TR/presentation-api/#dfn-prohibits-mixed-security-contexts-algorithm).
2. Nếu kết quả của thuật toán là `"Prohibits Mixed Security Contexts"` và [URL yêu cầu trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-request-urls) của _presentationRequest_ là [URL chưa được xác thực a priori](https://www.w3.org/TR/presentation-api/#dfn-a-priori-unauthenticated-url), thì trả về một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise) bị từ chối với [`SecurityError`](https://www.w3.org/TR/presentation-api/#dfn-securityerror) và hủy bỏ các bước này.
3. Nếu [tập cờ sandbox hoạt động](https://www.w3.org/TR/presentation-api/#dfn-active-sandboxing-flag-set) của đối tượng tài liệu có cờ [ngữ cảnh duyệt web trình chiếu bị sandbox](https://www.w3.org/TR/presentation-api/#sandboxed-presentation-browsing-context-flag) được đặt, thì trả về một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise) bị từ chối với [`SecurityError`](https://www.w3.org/TR/presentation-api/#dfn-securityerror) và hủy bỏ các bước này.
4. Đặt _P_ là một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise) mới.
5. Trả về _P_ nhưng tiếp tục thực hiện các bước này song song.
6. Tìm kiếm [tập bản trình chiếu được kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-set-of-controlled-presentations) để tìm [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) đáp ứng các tiêu chí sau: [ngữ cảnh duyệt web điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-browsing-context) của nó là ngữ cảnh duyệt web hiện tại, [trạng thái kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection-state) của nó không phải là [`terminated`](https://www.w3.org/TR/presentation-api/#dom-presentationconnectionstate-terminated), [URL trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-url) của nó bằng một trong các [URL yêu cầu trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-request-urls) của _presentationRequest_ và [định danh trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-identifier) của nó bằng _presentationId_.
7. Nếu tồn tại [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) như vậy, thực hiện các bước sau:
   1. Đặt _S_ là [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) đó.
   2. [Giải quyết](https://www.w3.org/TR/presentation-api/#dfn-resolving-a-promise) _P_ với _S_.
   3. Nếu [trạng thái kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection-state) của _S_ là [`connecting`](https://www.w3.org/TR/presentation-api/#dom-presentationconnectionstate-connecting) hoặc [`connected`](https://www.w3.org/TR/presentation-api/#dom-presentationconnectionstate-connected), thì hủy bỏ tất cả các bước còn lại.
   4. Đặt [trạng thái kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection-state) của _S_ thành [`connecting`](https://www.w3.org/TR/presentation-api/#dom-presentationconnectionstate-connecting).
   5. [Thiết lập kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-establish-a-presentation-connection) với _S_.
   6. Hủy bỏ tất cả các bước còn lại.

8. Tìm kiếm [tập bản trình chiếu được kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-set-of-controlled-presentations) để tìm [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) đầu tiên đáp ứng các tiêu chí sau: [trạng thái kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection-state) của nó không phải là [`terminated`](https://www.w3.org/TR/presentation-api/#dom-presentationconnectionstate-terminated), [URL trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-url) của nó bằng một trong các [URL yêu cầu trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-request-urls) của _presentationRequest_, và [định danh trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-identifier) của nó bằng _presentationId_.
9. Nếu tồn tại [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) như vậy, đặt _E_ là [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) đó và thực hiện các bước sau:
   1. Tạo một [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) _S_ mới.
   2. Đặt [định danh trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-identifier) của _S_ thành _presentationId_.
   3. Đặt [URL trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-url) của _S_ thành [URL trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-url) của _E_.
   4. Đặt [trạng thái kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection-state) của _S_ thành [`connecting`](https://www.w3.org/TR/presentation-api/#dom-presentationconnectionstate-connecting).
   5. Thêm _S_ vào [tập bản trình chiếu được kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-set-of-controlled-presentations).
   6. [Giải quyết](https://www.w3.org/TR/presentation-api/#dfn-resolving-a-promise) _P_ với _S_.
   7. [Xếp hàng một tác vụ](https://www.w3.org/TR/presentation-api/#dfn-queue-a-task) để [kích hoạt](https://www.w3.org/TR/presentation-api/#dfn-firing-an-event) một [sự kiện đáng tin cậy](https://www.w3.org/TR/presentation-api/#dfn-trusted-event) với tên [`connectionavailable`](https://www.w3.org/TR/presentation-api/#dfn-connectionavailable) trên _presentationRequest_. Sự kiện không được lan truyền và có thể hủy nhưng không có hành động mặc định.
   8. [Thiết lập kết nối trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-establish-a-presentation-connection) với _S_.
   9. Hủy bỏ tất cả các bước còn lại.

10. [Từ chối](https://www.w3.org/TR/presentation-api/#dfn-rejecting-a-promise) _P_ với ngoại lệ [`NotFoundError`](https://www.w3.org/TR/presentation-api/#dfn-notfounderror).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
