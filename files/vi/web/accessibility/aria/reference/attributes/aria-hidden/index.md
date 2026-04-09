---
title: "ARIA: thuộc tính aria-hidden"
short-title: aria-hidden
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-hidden
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-hidden
sidebar: accessibilitysidebar
---

Thuộc tính `aria-hidden` cho biết một phần tử và tất cả các phần tử con của nó không được công nghệ hỗ trợ trình bày cho người dùng.

## Mô tả

Khi một phần tử được đánh dấu bằng `aria-hidden="true"`, nó sẽ bị ẩn khỏi cây khả năng tiếp cận. Điều đó có nghĩa là công nghệ hỗ trợ sẽ không trình bày nội dung đó cho người dùng. Điều này hữu ích khi bạn có nội dung chỉ mang tính trình bày hoặc dư thừa, chẳng hạn biểu tượng trang trí, và không muốn trình đọc màn hình đọc nó ra.

Khác với `hidden` của HTML, `aria-hidden` không làm phần tử biến mất khỏi DOM hoặc khỏi hiển thị trực quan. Nó chỉ ảnh hưởng đến cách công nghệ hỗ trợ nhìn thấy nội dung.

Đừng đặt `aria-hidden="true"` lên các phần tử có thể nhận tiêu điểm hoặc chứa nội dung cần thiết cho việc sử dụng trang. Nếu một phần tử đang hiển thị và có thể được người dùng tương tác, việc ẩn nó khỏi công nghệ hỗ trợ có thể tạo ra trải nghiệm không nhất quán.

Không dùng `aria-hidden="true"` trên nội dung mà người dùng không nhìn thấy sẽ bỏ lỡ thông tin quan trọng. Nếu nội dung cần bị ẩn với tất cả người dùng, hãy cân nhắc dùng CSS `display: none` hoặc thuộc tính HTML `hidden` thay thế.

## Giá trị

- `true`
  - : Phần tử và các phần tử con của nó bị ẩn khỏi công nghệ hỗ trợ.
- `false`
  - : Phần tử và các phần tử con của nó được công nghệ hỗ trợ bộc lộ.
- `undefined` (mặc định)
  - : Trạng thái ẩn không được chỉ định.

## Giao diện liên quan

- {{domxref("Element.ariaHidden")}}
  - : Thuộc tính [`ariaHidden`](/en-US/docs/Web/API/Element/ariaHidden), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-hidden`.
- {{domxref("ElementInternals.ariaHidden")}}
  - : Thuộc tính [`ariaHidden`](/en-US/docs/Web/API/ElementInternals/ariaHidden), là một phần của giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-hidden`.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden)
- [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display)
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
