---
title: "ARIA: vai trò status"
short-title: status
slug: Web/Accessibility/ARIA/Reference/Roles/status_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#status
sidebar: accessibilitysidebar
---

Vai trò `status` xác định một [live region](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) chứa thông tin cảnh báo cho người dùng nhưng không đủ quan trọng để trở thành một [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role).

## Mô tả

`status` là một loại [live region](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) cung cấp thông tin cảnh báo không đủ quan trọng để cần một cảnh báo, vốn sẽ ngay lập tức ngắt thông báo hoạt động hiện tại của người dùng. Nó thường, nhưng không nhất thiết, được trình bày như một thanh trạng thái.

Không đặt focus vào status khi nội dung của nó cập nhật. Live region được dùng để thông báo cho người dùng về các cập nhật động đã xảy ra ở khu vực khác của trang hiện tại, nhưng không cần ngắt hoạt động hiện tại của người dùng bằng cách thay đổi ngữ cảnh. Nếu một tình huống đòi hỏi phải chuyển focus, thì dùng `status`, hoặc một live region khác, có lẽ là không phù hợp.

Các phần tử có vai trò status có giá trị ngầm định của [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) là `polite` và giá trị ngầm định của [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic) là `true`.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
  - : Xác định liệu công nghệ hỗ trợ nên trình bày toàn bộ hay chỉ một phần của vùng thay đổi. Các phần tử có vai trò `status` có giá trị ngầm định của `aria-atomic` là `true`.

- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
  - : Xác định thời điểm công nghệ hỗ trợ nên thông báo cho người dùng về các cập nhật nội dung. Các phần tử có vai trò `status` có giá trị ngầm định của `aria-live` là `polite`, nghĩa là trình đọc màn hình sẽ thông báo các thay đổi bên trong log khi người dùng đang rảnh.

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Một số trình đọc màn hình đọc tên của phần tử status trước khi đọc nội dung của nó. Nếu tên hiển thị, hãy tham chiếu nó bằng `aria-labelledby`. Việc thêm `aria-label` cung cấp một cách để đặt phần văn bản đứng trước nội dung hiển thị của phần tử status mà trình đọc màn hình đọc nhưng không hiển thị trên màn hình. Đặt tên cho status không bắt buộc, vì vậy nếu không có gì phù hợp thì có thể bỏ qua cả hai thuộc tính này.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- [ARIA: vai trò `log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role)
- [ARIA: vai trò `marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role)
- [ARIA: vai trò `timer`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role)
- [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
