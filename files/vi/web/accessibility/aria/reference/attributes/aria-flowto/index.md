---
title: "ARIA: thuộc tính aria-flowto"
short-title: aria-flowto
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-flowto
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-flowto
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-flowto` xác định phần tử tiếp theo trong một thứ tự đọc thay thế của nội dung. Điều này cho phép công nghệ hỗ trợ ghi đè lên thứ tự đọc mặc định chung theo thứ tự nguồn của tài liệu, nếu người dùng muốn.

## Mô tả

Trang web nên có thể điều hướng tuần tự. Vì lý do này, các nhà phát triển được khuyên không nên dùng thuộc tính toàn cục [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex), vì nó có thể thay đổi thứ tự tab, và thuộc tính CSS {{CSSXRef('order')}}, vì nó có thể thay đổi thứ tự hiển thị so với thứ tự DOM. Tuy nhiên, trong một số trường hợp hiếm hoi, cần có một đường đọc khác với thứ tự nguồn. Với những trường hợp như vậy, thuộc tính `aria-flowto` có thể làm cho nội dung dễ tiếp cận hơn với người dùng công nghệ hỗ trợ.

Thuộc tính toàn cục `aria-flowto` cho phép tác giả chỉ ra cho người dùng công nghệ hỗ trợ biết phần tử hay các phần tử nào có thể muốn được tập trung tiếp theo, từ đó cung cấp một thứ tự đọc thay thế cho thứ tự nguồn. Điều này cho phép công nghệ hỗ trợ đọc tài liệu theo một thứ tự khác với thứ tự đọc nguồn mặc định.

Khi `aria-flowto` có một tham chiếu [id](/en-US/docs/Web/HTML/Reference/Global_attributes/id) duy nhất, nó cho phép công nghệ hỗ trợ, theo yêu cầu của người dùng, chuyển đến phần tử được nhắm tới qua `id` đó thay vì đọc tài liệu theo thứ tự DOM. Khi giá trị `aria-flowto` dùng một danh sách nhiều tham chiếu `id` được phân tách bằng khoảng trắng, công nghệ hỗ trợ có thể cung cấp cho người dùng một danh sách các lựa chọn đường đi, trong đó mỗi `id` được tham chiếu là một lựa chọn. Tên của các lựa chọn đường đi được xác định bởi tên khả năng tiếp cận của từng phần tử đích của thuộc tính `aria-flowto`.

> [!NOTE]
> Việc đặt `aria-flowto` không ảnh hưởng đến thứ tự tab của nội dung. Nó chỉ cung cấp cho người dùng tùy chọn theo một đường nội dung không khớp với thứ tự DOM khi dùng công nghệ hỗ trợ có hỗ trợ thuộc tính này.

## Giá trị

- `id`
  - : `id` của phần tử tiếp theo trong thứ tự đọc thay thế.
- `id` list
  - : Danh sách các giá trị được phân tách bằng khoảng trắng, tham chiếu đến các giá trị `id` của những phần tử mà người dùng có thể muốn đi tới tiếp theo trong thứ tự đọc thay thế của nội dung.

## Giao diện liên quan

- {{domxref("Element.ariaFlowToElements")}}
  - : Thuộc tính `ariaFlowToElements` là một phần của giao diện của từng phần tử.
    Giá trị của nó là một mảng các thể hiện của các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-flowto` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaFlowToElements")}}
  - : Thuộc tính `ariaFlowToElements` là một phần của giao diện của từng phần tử tùy chỉnh.
    Giá trị của nó là một mảng các thể hiện của các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-flowto` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- Thuộc tính HTML [id](/en-US/docs/Web/HTML/Reference/Global_attributes/id)
- Thuộc tính HTML [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
- Thuộc tính CSS {{CSSXRef('order')}}
- [WCAG: source order](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.4_—_navigable_provide_ways_to_help_users_navigate_find_content_and_determine_where_they_are)
- [Using aria-flowto](https://www.w3.org/WAI/GL/wiki/Using_aria-flowto) - W3 Wiki
