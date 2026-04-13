---
title: "ElementInternals: ariaControlsElements property"
short-title: ariaControlsElements
slug: Web/API/ElementInternals/ariaControlsElements
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaControlsElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaControlsElements`** của giao diện {{domxref("ElementInternals")}} là một mảng chứa phần tử (hoặc các phần tử) được kiểm soát bởi phần tử được áp dụng.
Ví dụ, thuộc tính này có thể được đặt trên [combobox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role) để chỉ ra phần tử mà nó bật lên, hoặc trên [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role) để chỉ ra ID của phần tử mà nó kiểm soát.

Chủ đề [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) chứa thông tin bổ sung về cách sử dụng thuộc tính và thuộc tính này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}, đại diện cho các phần tử được kiểm soát bởi phần tử này.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc.
Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo cho mảng không ảnh hưởng đến giá trị của thuộc tính.

## Mô tả

Thuộc tính là một thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) để đặt các phần tử được kiểm soát.
Không giống như `aria-controls`, các phần tử được gán cho thuộc tính này không nhất thiết phải có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Thuộc tính phản ánh thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) khi được xác định, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi.
Nếu thuộc tính được đặt, thuộc tính tương ứng sẽ bị xóa.
Để biết thêm thông tin về tham chiếu phần tử được phản ánh và phạm vi, xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- {{domxref("Element.ariaControlsElements")}}
- [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản ánh thuộc tính_
