---
title: "ElementInternals: ariaDetailsElements property"
short-title: ariaDetailsElements
slug: Web/API/ElementInternals/ariaDetailsElements
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaDetailsElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaDetailsElements`** của giao diện {{domxref("ElementInternals")}} là một mảng chứa phần tử (hoặc các phần tử) cung cấp chi tiết truy cập cho phần tử được áp dụng.
Chi tiết truy cập tương tự như mô tả truy cập (xem {{domxref("ElementInternals/ariaDescribedByElements","ariaDescribedByElements")}}), nhưng cung cấp thông tin chi tiết hơn.

Chủ đề [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) chứa thông tin bổ sung về cách sử dụng thuộc tính và thuộc tính này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}.
Văn bản bên trong của các phần tử này có thể được nối với dấu cách để lấy chi tiết truy cập.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc.
Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo cho mảng không ảnh hưởng đến giá trị của thuộc tính.

## Mô tả

Thuộc tính là một thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) để đặt thông tin chi tiết truy cập.
Không giống như `aria-details`, các phần tử được gán cho thuộc tính này không nhất thiết phải có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Thuộc tính phản ánh thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) của phần tử khi được xác định, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi.
Nếu thuộc tính được đặt, thuộc tính tương ứng sẽ bị xóa.
Để biết thêm thông tin về tham chiếu phần tử được phản ánh và phạm vi, xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_.

## Ví dụ

Các ví dụ trong các tài liệu sau đây có liên quan:

- {{domxref("Element.ariaDetailsElements")}} là tương đương DOM của thuộc tính này.
  Nó được sử dụng theo cách tương tự, nhưng trong DOM thay vì shadow DOM và/hoặc phần tử tùy chỉnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details)
- {{domxref("Element.ariaDetailsElements")}}
- [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản ánh thuộc tính_.
