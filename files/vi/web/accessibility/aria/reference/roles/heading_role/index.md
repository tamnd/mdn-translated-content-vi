---
title: "ARIA: vai trò heading"
short-title: heading
slug: Web/Accessibility/ARIA/Reference/Roles/heading_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#heading
  - https://www.w3.org/WAI/ARIA/apg/practices/structural-roles/#when_to_use_structural_roles
sidebar: accessibilitysidebar
---

Vai trò `heading` xác định phần tử này là một tiêu đề của trang hoặc một phần, với thuộc tính [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level) cung cấp thêm cấu trúc.

## Mô tả

Vai trò heading cho công nghệ hỗ trợ biết rằng phần tử này nên được coi như một tiêu đề. Trình đọc màn hình sẽ đọc văn bản và cho biết rằng nó được định dạng như một tiêu đề. Ngoài ra, mức cấp cho công nghệ hỗ trợ biết phần nào của cấu trúc trang mà tiêu đề này đại diện. Tiêu đề cấp 1, được chỉ ra bằng `aria-level="1"`, thường biểu thị tiêu đề chính của trang, tiêu đề cấp 2, được định nghĩa bằng `aria-level="2"`, là phần phụ đầu tiên, cấp 3 là phần phụ của cấp đó, và cứ thế tiếp tục.

```html
<div role="heading" aria-level="1">Đây là tiêu đề chính của trang</div>
```

Điều này xác định văn bản trong `<div>` là tiêu đề chính của trang, được chỉ ra bằng cấp 1 thông qua thuộc tính `aria-level`. Tốt hơn là hãy dùng phần tử {{HTMLElement("Heading_Elements", "h1")}} (đến {{HTMLElement("Heading_Elements", "h6")}}) thay thế.

```html
<h1>Đây là tiêu đề chính của trang</h1>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level)
  - : Thuộc tính `aria-level` chỉ định cấp tiêu đề trong cấu trúc tài liệu. Thuộc tính này là bắt buộc: tác giả phải chỉ ra mức lồng đúng để bảo đảm các phần tử có vai trò `heading` được tổ chức thành một dàn ý logic. Nếu thuộc tính bị bỏ sót do lỗi, trình duyệt sẽ dùng [giá trị dự phòng là 2](https://w3c.github.io/aria/#authorErrorDefaultValuesTable).

### Tương tác bàn phím

Vai trò này không yêu cầu điều hướng bàn phím đặc biệt nào. Giống như bất kỳ tiêu đề nào, việc gán ID cho nó sẽ giúp có thể tham chiếu từ các liên kết neo, làm cho nó có thể truy cập qua bàn phím.

### Các tính năng JavaScript bắt buộc

- Bộ xử lý sự kiện bắt buộc
  - : Không có.
- Thay đổi giá trị thuộc tính
  - : Thường không cần, trừ khi chèn nội dung động. Trong trường hợp đó, các tiêu đề mới thêm vào cần có thuộc tính `aria-level` với giá trị nhất quán với phần còn lại của cấu trúc tài liệu.

> [!NOTE]
> Thay vì dùng `<div>` hoặc `<span>` với vai trò `heading` và `aria-level`, hãy cân nhắc dùng các phần tử {{HTMLElement("Heading_Elements", "h1")}} đến {{HTMLElement("Heading_Elements", "h6")}} gốc để chỉ ra rằng văn bản này là một tiêu đề, và nó đại diện cho phần nào của cấu trúc.

## Ví dụ

Phần sau cho thấy một cấu trúc trang điển hình.

```html
<div id="container">
  <div role="heading" aria-level="1">Tiêu đề chính của trang</div>
  <p>Bài viết này nói về cách hiển thị cấu trúc trang.</p>
  <div role="heading" aria-level="2">Giới thiệu</div>
  <p>Đoạn mở đầu.</p>
  <div role="heading" aria-level="2">Chương 1</div>
  <p>Văn bản</p>
  <div role="heading" aria-level="3">Chương 1.1</div>
  <p>Thêm văn bản trong một phần phụ.</p>
</div>
```

Tuy nhiên, thay vào đó bạn nên làm như sau:

```html
<div id="container">
  <h1>Tiêu đề chính của trang</h1>
  <p>Bài viết này nói về cách hiển thị cấu trúc trang.</p>
  <h2>Giới thiệu</h2>
  <p>Đoạn mở đầu.</p>
  <h2>Chương 1</h2>
  <p>Văn bản</p>
  <h3>Chương 1.1</h3>
  <p>Thêm văn bản trong một phần phụ.</p>
</div>
```

## Các vấn đề về trợ năng

> [!WARNING]
> Việc dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) sẽ ẩn nội dung của tiêu đề khỏi công nghệ hỗ trợ, và công nghệ sẽ đọc nhãn thay vì tiêu đề.

Nếu bạn buộc phải dùng vai trò `heading` và thuộc tính [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level), đừng vượt quá cấp 6 để nhất quán với HTML. Dù về mặt lý thuyết bạn có thể đặt cao hơn, và một số trình đọc màn hình có thể hỗ trợ, kết quả có thể không thể dự đoán với các kết hợp trình duyệt và trình đọc màn hình khác nhau.

## Thực hành tốt nhất

Cách tốt nhất để dùng vai trò này là **không dùng nó**, và thay vào đó dùng các thẻ tiêu đề gốc {{HTMLElement("Heading_Elements", "h1")}} đến {{HTMLElement("Heading_Elements", "h6")}} như trong ví dụ ở trên. Vai trò `heading` và thuộc tính `aria-level` chỉ nên dùng để bổ sung khả năng truy cập cho mã cũ mà bạn không thể thay đổi lớn.

Thay vì dùng vai trò ARIA `heading`, hãy dùng phần tử HTML ngữ nghĩa:

| Phần tử HTML                              | vai trò `heading`                     |
| ----------------------------------------- | ------------------------------------- |
| {{HTMLElement("Heading_Elements", "h1")}} | `<div role="heading" aria-level="1">` |
| {{HTMLElement("Heading_Elements", "h2")}} | `<div role="heading" aria-level="2">` |
| {{HTMLElement("Heading_Elements", "h3")}} | `<div role="heading" aria-level="3">` |
| {{HTMLElement("Heading_Elements", "h4")}} | `<div role="heading" aria-level="4">` |
| {{HTMLElement("Heading_Elements", "h5")}} | `<div role="heading" aria-level="5">` |
| {{HTMLElement("Heading_Elements", "h6")}} | `<div role="heading" aria-level="6">` |

### Lợi ích bổ sung

Không có.

## Đặc tả

{{Specifications}}

## Thứ tự ưu tiên

Vai trò heading ghi đè ý nghĩa ngữ nghĩa gốc của phần tử mà nó được dùng cho. Ngoài ra, thuộc tính `aria-level` quyết định cấp tiêu đề nào đang được bộc lộ.

## Xem thêm

- [`<h1>` đến `<h6>`: Các phần tử tiêu đề phần của HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
