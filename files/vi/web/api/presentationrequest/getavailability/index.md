---
title: "PresentationRequest: getAvailability() method"
short-title: getAvailability()
slug: Web/API/PresentationRequest/getAvailability
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PresentationRequest.getAvailability
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Khi phương thức `getAvailability()` được gọi, user agent _PHẢI_ thực hiện các bước sau:

- Đầu vào
  - : _presentationUrls_, một danh sách [URL yêu cầu trình chiếu](https://www.w3.org/TR/presentation-api/#dfn-presentation-request-urls)
- Đầu ra
  - : _P_, một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise)

1. Nếu một trong các điều kiện sau là đúng:
   - Kết quả của việc chạy [thuật toán cấm ngữ cảnh bảo mật hỗn hợp](https://www.w3.org/TR/presentation-api/#dfn-prohibits-mixed-security-contexts-algorithm) trên [đối tượng cài đặt](https://www.w3.org/TR/presentation-api/#dfn-settings-object) của tài liệu là `"Prohibits Mixed Security Contexts"` và _presentationUrl_ là [URL chưa được xác thực a priori](https://www.w3.org/TR/presentation-api/#dfn-a-priori-unauthenticated-url).
   - [Tập cờ sandbox hoạt động](https://www.w3.org/TR/presentation-api/#dfn-active-sandboxing-flag-set) của đối tượng tài liệu có cờ [ngữ cảnh duyệt web trình chiếu bị sandbox](https://www.w3.org/TR/presentation-api/#sandboxed-presentation-browsing-context-flag) được đặt.

   Thực hiện các bước con sau:
   1. Trả về một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise) bị từ chối với `SecurityError` {{domxref("DOMException")}}.
   2. Hủy bỏ các bước này.

2. Đặt _P_ là một [Promise](https://www.w3.org/TR/presentation-api/#dfn-promise) mới.
3. Trả về _P_, nhưng tiếp tục thực hiện các bước này [song song](https://www.w3.org/TR/presentation-api/#dfn-in-parallel).
4. Nếu user agent không thể [theo dõi danh sách màn hình trình chiếu có sẵn](https://www.w3.org/TR/presentation-api/#dfn-monitor-the-list-of-available-presentation-displays) trong toàn bộ thời gian của [ngữ cảnh duyệt web điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controlling-browsing-context) (ví dụ: vì người dùng đã tắt tính năng này), thì:
   1. [Giải quyết](https://www.w3.org/TR/presentation-api/#dfn-resolving-a-promise) _P_ với một đối tượng `PresentationAvailability` mới có thuộc tính `value` được đặt thành `false`.
   2. Hủy bỏ tất cả các bước còn lại.

5. Nếu user agent không thể liên tục [theo dõi danh sách màn hình trình chiếu có sẵn](https://www.w3.org/TR/presentation-api/#dfn-monitor-the-list-of-available-presentation-displays) nhưng có thể tìm màn hình trình chiếu để bắt đầu kết nối, thì:
   1. [Từ chối](https://www.w3.org/TR/presentation-api/#dfn-rejecting-a-promise) _P_ với `NotSupportedError` {{domxref("DOMException")}}.
   2. Hủy bỏ tất cả các bước còn lại.

6. Nếu tồn tại một tuple (_A_, _presentationUrls_) trong [tập đối tượng khả dụng](https://www.w3.org/TR/presentation-api/#dfn-set-of-availability-objects), thì:
   1. [Giải quyết](https://www.w3.org/TR/presentation-api/#dfn-resolving-a-promise) _P_ với _A_.
   2. Hủy bỏ tất cả các bước còn lại.

7. Đặt _A_ là một đối tượng `PresentationAvailability` mới với thuộc tính `value` được đặt như sau:
   1. `false` nếu [danh sách màn hình trình chiếu có sẵn](https://www.w3.org/TR/presentation-api/#dfn-list-of-available-presentation-displays) rỗng.
   2. `true` nếu có ít nhất một [màn hình trình chiếu tương thích](https://www.w3.org/TR/presentation-api/#dfn-compatible-presentation-display) cho một thành viên nào đó của _presentationUrls_.
   3. `false` nếu không.

8. Tạo một tuple (_A_, _presentationUrls_) và thêm nó vào [tập đối tượng khả dụng](https://www.w3.org/TR/presentation-api/#dfn-set-of-availability-objects).
9. Chạy thuật toán để [theo dõi danh sách màn hình trình chiếu có sẵn](https://www.w3.org/TR/presentation-api/#dfn-monitor-the-list-of-available-presentation-displays).
10. [Giải quyết](https://www.w3.org/TR/presentation-api/#dfn-resolving-a-promise) _P_ với _A_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
