---
title: "ARIA: vai trò log"
short-title: log
slug: Web/Accessibility/ARIA/Reference/Roles/log_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#log
sidebar: accessibilitysidebar
---

Vai trò `log` được dùng để xác định một phần tử tạo ra một [vùng sống](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) trong đó thông tin mới được thêm theo một thứ tự có ý nghĩa và thông tin cũ có thể biến mất.

## Mô tả

Log là một kiểu vùng sống, trong đó thông tin mới được thêm theo thứ tự có ý nghĩa và thông tin cũ có thể biến mất. Ví dụ gồm nhật ký trò chuyện, lịch sử nhắn tin, nhật ký trò chơi hoặc nhật ký lỗi. Khác với các vùng sống khác, ở vai trò này có mối liên hệ giữa thời điểm mục mới xuất hiện trong log và thứ tự đọc. Log chứa một chuỗi có ý nghĩa, và thông tin mới chỉ được thêm vào cuối log, không phải ở các vị trí tùy ý.

Khác với các kiểu vùng sống khác, log được sắp xếp tuần tự và thông tin mới chỉ được thêm vào cuối log. Khi vai trò này được gán cho một phần tử, trình duyệt sẽ gửi một sự kiện log có thể truy cập tới các sản phẩm công nghệ hỗ trợ, từ đó chúng có thể thông báo cho người dùng.

Theo mặc định, các cập nhật chỉ chứa phần thay đổi của vùng sống và chúng được thông báo khi người dùng đang rảnh. Các phần tử mang vai trò `log` có giá trị `aria-live` ngầm định là `polite`. Khi người dùng cần nghe toàn bộ vùng sống sau một thay đổi, nên đặt `aria-atomic="true"`. Nếu muốn thông báo càng sớm càng tốt và có thể làm gián đoạn người dùng, có thể đặt `aria-live="assertive"` cho các cập nhật mạnh hơn.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
  - : Xác định liệu công nghệ hỗ trợ có nên đọc toàn bộ hay chỉ một phần của vùng đã thay đổi. Các phần tử mang vai trò `log` có giá trị `aria-atomic` ngầm định là `false`.

- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
  - : Xác định thời điểm công nghệ hỗ trợ nên thông báo cho người dùng về các cập nhật nội dung. Các phần tử mang vai trò `log` có giá trị `aria-live` ngầm định là `polite`, nghĩa là trình đọc màn hình sẽ đọc các thay đổi bên trong log khi người dùng đang rảnh.

- `aria-label` và `aria-labelledby`
  - : `log` bắt buộc phải có tên truy cập được. Hãy dùng `aria-labelledby` nếu có nhãn hiển thị, nếu không thì dùng `aria-label`.

## Thực hành tốt nhất

Với một vùng có văn bản cuộn như bảng giá cổ phiếu, nên dùng vai trò [`marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role) thay vào đó.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- [ARIA: vai trò `marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role)
- [ARIA: vai trò `status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)
- [ARIA: vai trò `timer`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role)
- [Vùng sống ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
