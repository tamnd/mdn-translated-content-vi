---
title: "ElementInternals: ariaOwnsElements property"
short-title: ariaOwnsElements
slug: Web/API/ElementInternals/ariaOwnsElements
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaOwnsElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaOwnsElements`** của giao diện {{domxref("ElementInternals")}} là một mảng chứa phần tử (hoặc các phần tử) xác định mối quan hệ trực quan, chức năng hoặc ngữ cảnh giữa phần tử cha được áp dụng và các phần tử con của nó.
Điều này được sử dụng khi cấu trúc phân cấp shadow DOM không thể biểu thị mối quan hệ và nó sẽ không có sẵn cho công nghệ hỗ trợ.

Chủ đề [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) chứa thông tin bổ sung về cách sử dụng thuộc tính và thuộc tính này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc.
Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo cho mảng không ảnh hưởng đến giá trị của thuộc tính.

## Mô tả

Thuộc tính là một thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) để chỉ ra quyền sở hữu của một phần tử.
Không giống như `aria-owns`, các phần tử được gán cho thuộc tính này không nhất thiết phải có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Thuộc tính phản ánh thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) của phần tử khi được xác định, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi.
Nếu thuộc tính được đặt, thuộc tính tương ứng sẽ bị xóa.
Để biết thêm thông tin về tham chiếu phần tử được phản ánh và phạm vi, xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_.

## Ví dụ

Các ví dụ trong các tài liệu sau đây có liên quan:

- {{domxref("Element.ariaOwnsElements")}} là tương đương DOM của thuộc tính này.
  Nó được sử dụng theo cách tương tự, nhưng trong DOM thay vì shadow DOM và/hoặc phần tử tùy chỉnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
- {{domxref("Element.ariaOwnsElements")}}
- [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản ánh thuộc tính_.
