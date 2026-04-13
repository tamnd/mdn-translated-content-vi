---
title: "ElementInternals: ariaFlowToElements property"
short-title: ariaFlowToElements
slug: Web/API/ElementInternals/ariaFlowToElements
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaFlowToElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaFlowToElements`** của giao diện {{domxref("ElementInternals")}} là một mảng chứa phần tử (hoặc các phần tử) cung cấp thứ tự đọc thay thế của nội dung, ghi đè thứ tự đọc mặc định chung theo quyết định của người dùng.
Nếu chỉ có một phần tử được cung cấp, đó là phần tử tiếp theo trong thứ tự đọc.
Nếu nhiều phần tử được cung cấp, thì mỗi phần tử đại diện cho một đường dẫn có thể chọn được cung cấp cho người dùng.

Chủ đề [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto) chứa thông tin bổ sung về cách sử dụng thuộc tính và thuộc tính này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc.
Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo cho mảng không ảnh hưởng đến giá trị của thuộc tính.

## Mô tả

Thuộc tính là một thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto) để đặt thứ tự đọc thay thế.
Không giống như `aria-flowto`, các phần tử được gán cho thuộc tính này không nhất thiết phải có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Thuộc tính phản ánh thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto) của phần tử khi được xác định, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi.
Nếu thuộc tính được đặt, thuộc tính tương ứng sẽ bị xóa.
Để biết thêm thông tin về tham chiếu phần tử được phản ánh và phạm vi, xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_.

## Ví dụ

Các ví dụ trong các tài liệu sau đây có liên quan:

- {{domxref("Element.ariaFlowToElements")}} là tương đương DOM của thuộc tính này.
  Nó được sử dụng theo cách tương tự, nhưng trong DOM thay vì shadow DOM và/hoặc phần tử tùy chỉnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto)
- {{domxref("Element.ariaFlowToElements")}}
- [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản ánh thuộc tính_.
