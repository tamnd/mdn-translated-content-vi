---
title: "ARIA: thuộc tính aria-braillelabel"
short-title: aria-braillelabel
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-braillelabel
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-braillelabel` định nghĩa một giá trị chuỗi gắn nhãn cho phần tử hiện tại, với mục đích được chuyển đổi sang chữ Braille.

## Mô tả

Thuộc tính toàn cục `aria-braillelabel` tương tự như thuộc tính toàn cục [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) ở chỗ nó định nghĩa một giá trị chuỗi gắn nhãn cho phần tử hiện tại. Trong khi `aria-label` được trình đọc màn hình đọc ra, nội dung của thuộc tính `aria-braillelabel` được chuyển đổi sang chữ Braille, cung cấp cho người dùng tên có thể nhận ra của đối tượng bằng Braille.

Mục đích của thuộc tính `aria-braillelabel` là ghi đè cách công nghệ hỗ trợ bản địa hóa và biểu đạt tên khả năng tiếp cận của một phần tử trong Braille. Nó chỉ nên được dùng khi, nếu không có thuộc tính này, tên khả năng tiếp cận sẽ không mang lại trải nghiệm người dùng mong muốn khi được chuyển sang Braille.

Khi dùng `aria-braillelabel`, hãy bảo đảm rằng:

- Phần tử mà `aria-braillelabel` được áp dụng có một tên khả năng tiếp cận hợp lệ.
- Giá trị của `aria-braillelabel` có nội dung thực và không rỗng hoặc chỉ là khoảng trắng theo Unicode hay Braille Unicode.
- Giá trị KHÔNG giống với tên khả năng tiếp cận.
- Các giá trị `aria-braillelabel` được bản địa hóa để phù hợp với ngôn ngữ của tài liệu.
- Thông báo cho người dùng rằng thuộc tính này có sẵn, đặc biệt nếu nội dung chứa các mẫu Braille Unicode, để người dùng biết cần thiết lập cài đặt nhằm áp dụng các bản dịch Braille theo ý riêng của họ.

> [!NOTE]
> Công nghệ hỗ trợ có hỗ trợ Braille có thể chuyển đổi tên khả năng tiếp cận sang Braille.
> Vì vậy, chỉ nên dùng `aria-braillelabel` khi tên khả năng tiếp cận không mang lại trải nghiệm người dùng mà bạn muốn.

Dùng chỉ tên khả năng tiếp cận, ví dụ từ nội dung hoặc thông qua `aria-label`, gần như luôn là trải nghiệm tốt hơn, vì vậy đừng dùng `aria-braillelabel` để sao chép `aria-label`. Chỉ dùng `aria-braillelabel` nếu tên khả năng tiếp cận không thể cung cấp biểu diễn Braille phù hợp.

```html
<button aria-braillelabel="***">
  <img alt="3 trên 5 sao" src="three_stars.png" />
</button>
```

Một màn hình Braille có thể hiển thị "btn \*\*\*" bằng Braille thay vì chuỗi dài hơn là "btn gra 3 trên 5 sao".

## Giá trị

- `<string>`
  - : Giá trị là một chuỗi, kiểu giá trị không bị ràng buộc, dự định được chuyển đổi sang Braille.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- {{domxref("Element.ariaBrailleLabel")}}
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
- [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription)
