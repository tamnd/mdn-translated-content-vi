---
title: Sticky activation
slug: Glossary/Sticky_activation
page-type: glossary-definition
sidebar: glossarysidebar
---

**Sticky activation** (kích hoạt dính, hay "sticky user activation") là trạng thái của cửa sổ cho biết người dùng đã tương tác có ý nghĩa và trực tiếp với cửa sổ kể từ khi tải trang. Một khi đã kích hoạt, trạng thái này kéo dài trong suốt phiên làm việc.

Trạng thái được kích hoạt sau bất kỳ tương tác nào của người dùng, khi cửa sổ có tiêu điểm, dẫn đến việc trình duyệt tạo ra một hoặc nhiều sự kiện sau:

- Sự kiện `mousedown` hoặc `pointerdown` đối với chuột.
- Sự kiện `pointerup` đối với bất kỳ loại con trỏ nào khác.
- Sự kiện `touchend`.
- Sự kiện `keydown`, ngoại trừ phím escape hoặc các phím tắt của trình duyệt.

Cửa sổ không được kích hoạt bởi người dùng thông qua các sự kiện không nhất thiết do tương tác có chủ ý với cửa sổ, chẳng hạn như sự kiện di chuyển chuột hoặc sự kiện `wheel`.

Sticky activation được dùng để kiểm soát quyền truy cập vào một số tính năng nhất định, chặn chúng nếu người dùng chưa tương tác với trang. Ví dụ, nó có thể được sử dụng để đảm bảo rằng các tính năng được kiểm soát trong các khung cross-origin không chạy mã khi tải trang. Xem [Các tính năng được kiểm soát bởi kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation) để biết thêm thông tin.

Thuộc tính {{domxref("UserActivation.hasBeenActive")}} có thể được sử dụng để kiểm tra theo chương trình trạng thái sticky activation của cửa sổ hiện tại.

## Xem thêm

- [So sánh giữa transient và sticky activation](/en-US/docs/Web/Security/Defenses/User_activation#comparison_between_transient_and_sticky_activation) trong _Các tính năng được kiểm soát bởi kích hoạt người dùng_
- Các thuật ngữ liên quan:
  - {{Glossary("Transient activation")}}
- {{domxref("UserActivation.hasBeenActive")}}
- [HTML Living Standard > Sticky activation](https://html.spec.whatwg.org/multipage/interaction.html#sticky-activation)
