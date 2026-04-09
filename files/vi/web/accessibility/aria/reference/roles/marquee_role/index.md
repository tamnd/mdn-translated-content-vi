---
title: "ARIA: vai trò marquee"
short-title: marquee
slug: Web/Accessibility/ARIA/Reference/Roles/marquee_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#marquee
sidebar: accessibilitysidebar
---

`marquee` là một kiểu [vùng sống](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) chứa thông tin không thiết yếu nhưng thay đổi thường xuyên.

## Mô tả

Vai trò `marquee` xác định một khu vực là một kiểu vùng sống trình bày thông tin không thiết yếu và thay đổi thường xuyên. Ví dụ về marquee gồm bảng giá cổ phiếu và banner quảng cáo; đây là thông tin người dùng không nhất thiết phải chủ động tìm kiếm và có thể được trình bày theo bất kỳ thứ tự nào. Khác biệt chính giữa `marquee` và [`log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role) là thông tin trong log được trình bày theo thứ tự có ý nghĩa, chẳng hạn theo ngày.

Các phần tử mang vai trò marquee có giá trị [aria-live](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) ngầm định là `off`.

Marquee phải có tên truy cập được. Hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có nhãn hiển thị, nếu không thì dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
  - : Xác định thời điểm công nghệ hỗ trợ nên thông báo cho người dùng về các cập nhật nội dung. Các phần tử mang vai trò `marquee` có giá trị `aria-live` ngầm định là `off`, nghĩa là trình đọc màn hình sẽ không thông báo các thay đổi bên trong marquee, ngay cả khi người dùng đang rảnh.

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Marquee bắt buộc phải có tên truy cập được. Hãy dùng `aria-labelledby` nếu có nhãn hiển thị, nếu không thì dùng `aria-label`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- [ARIA: vai trò `log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role)
- [ARIA: vai trò `status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)
- [ARIA: vai trò `timer`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role)
- [Vùng sống ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
