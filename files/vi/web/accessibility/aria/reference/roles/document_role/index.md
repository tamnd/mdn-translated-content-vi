---
title: "ARIA: vai trò document"
short-title: document
slug: Web/Accessibility/ARIA/Reference/Roles/document_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#document
sidebar: accessibilitysidebar
---

Vai trò `document` dành cho nội dung có thể nhận tiêu điểm nằm trong các [widget](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/widget_role) tổ hợp phức tạp hoặc [application](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role), để công nghệ hỗ trợ có thể chuyển ngữ cảnh đọc trở lại chế độ đọc.

## Mô tả

Vai trò `document` dùng cho vùng chứa chính chứa nội dung mà người dùng công nghệ hỗ trợ có thể muốn duyệt ở chế độ đọc. Chỉ hữu ích trên các phần có thể nhận tiêu điểm bên trong các [widget](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/widget_role) tổ hợp phức tạp hoặc [application](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role), vai trò `document` báo cho công nghệ hỗ trợ chuyển ngữ cảnh đọc trở lại chế độ đọc: Vai trò `document` yêu cầu công nghệ hỗ trợ có chế độ đọc hoặc duyệt dùng chế độ tài liệu để đọc nội dung bên trong phần tử này.

```html
<div role="dialog">
  …
  <div id="InfoText" role="document" tabindex="0">
    <p>Một đoạn thông tin sẽ nằm ở đây.</p>
  </div>
  …
  <button>Đóng</button>
</div>
```

Ví dụ này cho thấy một [dialog](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role), một vai trò widget tổ hợp phức tạp, có một số điều khiển và một phần chứa đoạn văn bản thông tin mà người dùng công nghệ hỗ trợ có thể đi vào chế độ đọc khi tab tới.

Theo mặc định, các trang web được coi là tài liệu; công nghệ hỗ trợ (AT) sẽ vào chế độ duyệt hoặc chế độ đọc khi đi vào một trang web mới. Chế độ này có thể bị thay đổi thông qua nhiều vai trò khác nhau, bao gồm vai trò widget và application. Vai trò `document` đưa AT trở lại chế độ duyệt hoặc đọc.

Thông thường được đặt bên trong vai trò application hoặc một vai trò widget tương tác khác, vai trò `document` được dùng để chỉ ra một phần của widget tổ hợp phức tạp mà người dùng công nghệ hỗ trợ nên đọc bằng chế độ duyệt hoặc chế độ đọc ảo của nó, nếu có.

Vì các AT có chế độ đọc sẽ mặc định ở chế độ đó cho mọi phần tử trừ những phần tử có vai trò widget hoặc application, vai trò document chỉ hữu ích cho các phần tử có thể nhận tiêu điểm bên trong widget hoặc application và nên được đọc như văn bản tĩnh giàu định dạng. Thêm `role="document"` và `tabindex="0"` vào phần tử chứa văn bản bên trong widget sẽ cho phép người dùng trình đọc màn hình nhấn phím Tab để đặt tiêu điểm vào phần tử tài liệu và đọc văn bản bằng con trỏ đọc của trình đọc màn hình.

Các công nghệ hỗ trợ nên chuyển ngữ cảnh trở lại chế độ tài liệu, có thể bằng cách chặn các điều khiển được nối lại cho ngữ cảnh động của phần tử cha, rồi kích hoạt lại các sự kiện nhập chuẩn, như sự kiện bàn phím phím mũi tên Lên hoặc Xuống, để điều khiển con trỏ đọc.

Khác với vai trò [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role), vai trò `document` không có quan hệ nào với các phần tử khác có vai trò document, nó chỉ có quan hệ với widget tổ hợp chứa nó. Một article có thể có các article liên quan.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Bao gồm với giá trị `true` hoặc `false` nếu phần tử document có thể thu gọn, để cho biết tài liệu hiện đang được mở rộng hay thu gọn. Các giá trị khác gồm `undefined` mặc định, nghĩa là tài liệu không thể thu gọn.

- tabindex="0"
  - : Dùng để làm cho nó có thể nhận tiêu điểm để người dùng công nghệ hỗ trợ có thể tab tới và bắt đầu đọc ngay.

### Tương tác bàn phím

Phần tử nên được làm cho có thể nhận tiêu điểm bằng cách đặt cặp thuộc tính/giá trị `tabindex="0"` vào nó. Như vậy, người dùng có thể tab tới, chế độ đọc sẽ được gọi tự động, và nội dung có thể được đọc ngay.

### Các tính năng JavaScript bắt buộc

Không có, ngoài những gì được yêu cầu bởi các thuộc tính. Ví dụ, nếu `document` có thể thu gọn, thì trạng thái và giá trị của `aria-expanded` phải được duy trì.

## Ví dụ

Một ví dụ là Gmail và chế độ xem cuộc trò chuyện đơn lẻ. Gmail là một ứng dụng web. Khi ở trong Gmail, hầu hết các tương tác của user agent đều bị ứng dụng chiếm dụng. Tuy nhiên, khi tiêu điểm bàn phím được đặt vào tiêu đề bắt đầu của một cuộc trò chuyện đơn lẻ chứa chủ đề cuộc trò chuyện, người dùng trình đọc màn hình có thể dùng các lệnh của chế độ đọc để đọc qua các thư, mở rộng hoặc thu gọn chúng, và thao tác với chúng. Khi tiêu điểm quay lại danh sách thư, bằng cách kích hoạt nút Quay lại hoặc nhấn một phím tắt liên quan, chế độ tương tác trực tiếp với ứng dụng sẽ được kích hoạt lại, và người dùng có thể di chuyển tới một cuộc trò chuyện khác trong danh sách bằng các phím <kbd>mũi tên</kbd>.

## Thực hành tốt nhất

Luôn bảo đảm một mục có vai trò document có thể nhận tiêu điểm bằng cách đặt thuộc tính `tabindex` với giá trị 0. Điều đó cũng sẽ đưa nó vào thứ tự tab.

### Lợi ích bổ sung

Vai trò document là một cách dễ dàng để điều khiển gián tiếp hành vi của công nghệ hỗ trợ bằng cách nói rõ ràng rằng đây là nội dung mà người dùng nên đọc bằng các lệnh chuẩn của trình đọc màn hình.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `widget`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/widget_role)
- [ARIA: vai trò `application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
