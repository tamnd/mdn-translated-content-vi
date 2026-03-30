---
title: Transient activation
slug: Glossary/Transient_activation
page-type: glossary-definition
sidebar: glossarysidebar
---

**Kích hoạt tạm thời** (Transient activation, hay "kích hoạt người dùng tạm thời") là trạng thái của cửa sổ cho biết người dùng gần đây đã tương tác trực tiếp và có ý nghĩa với cửa sổ đó.

Trạng thái này được kích hoạt sau bất kỳ tương tác nào của người dùng, khi cửa sổ có tiêu điểm, dẫn đến việc trình duyệt tạo ra một hoặc nhiều sự kiện sau:

- Sự kiện `mousedown` hoặc `pointerdown` đối với chuột.
- Sự kiện `pointerup` đối với bất kỳ loại con trỏ nào khác.
- Sự kiện `touchend`.
- Sự kiện `keydown`, trừ các phím thoát hoặc phím tắt của trình duyệt.

Cửa sổ không được kích hoạt bởi người dùng thông qua các sự kiện không nhất thiết do tương tác có chủ ý với cửa sổ, chẳng hạn như sự kiện di chuyển chuột hoặc sự kiện `wheel`.

Kích hoạt tạm thời hết hạn sau một khoảng thời gian chờ (nếu không được gia hạn bởi tương tác tiếp theo), và cũng có thể bị tiêu thụ/hủy kích hoạt sau khi sử dụng một số tính năng bị kiểm soát (chẳng hạn như {{domxref("Window.open()")}}).

Kích hoạt tạm thời thường được sử dụng như một cơ chế đảm bảo rằng một Web API chỉ có thể hoạt động nếu được kích hoạt bởi tương tác người dùng. Ví dụ, các tập lệnh không thể tùy ý khởi chạy một popup yêu cầu _kích hoạt tạm thời_ — nó phải được kích hoạt từ trình xử lý sự kiện của phần tử giao diện. Xem [Các tính năng bị kiểm soát bởi kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation) để biết thông tin về các API yêu cầu _kích hoạt tạm thời_.

Thuộc tính {{domxref("UserActivation.isActive")}} có thể được sử dụng để kiểm tra theo chương trình trạng thái kích hoạt tạm thời của cửa sổ hiện tại.

## Xem thêm

- [So sánh giữa kích hoạt tạm thời và kích hoạt cố định](/en-US/docs/Web/Security/Defenses/User_activation#comparison_between_transient_and_sticky_activation) trong _Các tính năng bị kiểm soát bởi kích hoạt người dùng_
- Các thuật ngữ liên quan:
  - {{Glossary("Sticky activation")}}
- {{domxref("UserActivation.isActive")}}
- [HTML Living Standard > Transient activation](https://html.spec.whatwg.org/multipage/interaction.html#transient-activation)
