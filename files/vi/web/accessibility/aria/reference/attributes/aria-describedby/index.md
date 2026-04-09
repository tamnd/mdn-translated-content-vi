---
title: "ARIA: thuộc tính aria-describedby"
short-title: aria-describedby
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-describedby
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-describedby
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-describedby` xác định phần tử (hoặc các phần tử) mô tả phần tử mà thuộc tính này được đặt lên.

## Mô tả

Thuộc tính `aria-describedby` liệt kê các giá trị [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của những phần tử mô tả đối tượng. Nó được dùng để thiết lập mối quan hệ giữa widget hoặc nhóm phần tử và phần văn bản mô tả chúng.

Thuộc tính `aria-describedby` không chỉ giới hạn ở các điều khiển biểu mẫu. Nó cũng có thể được dùng để liên kết văn bản tĩnh với widget, nhóm phần tử, các vùng có tiêu đề, định nghĩa, và nhiều thứ khác. Thuộc tính `aria-describedby` có thể được dùng với các phần tử HTML ngữ nghĩa cũng như với các phần tử có [vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) ARIA.

Thuộc tính `aria-describedby` rất giống với thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Trong khi `aria-labelledby` liệt kê các `id` của nhãn hoặc các phần tử mô tả bản chất của một đối tượng, `aria-describedby` liệt kê các `id` của phần mô tả hoặc các phần tử cung cấp thêm thông tin mà người dùng có thể cần. Cả `aria-labelledby` lẫn `aria-describedby` đều tham chiếu các phần tử khác để tính toán một văn bản thay thế, nhưng nhãn nên ngắn gọn, còn mô tả nhằm cung cấp thông tin dài hơn; nhãn mô tả bản chất của một đối tượng, còn mô tả cung cấp thêm thông tin mà người dùng có thể cần.

Các phần tử được liên kết qua `aria-describedby` không cần phải hiển thị. Có thể tham chiếu tới một phần tử ngay cả khi phần tử đó bị ẩn. Ví dụ, một điều khiển biểu mẫu có thể có mô tả được ẩn theo mặc định và chỉ hiện ra khi người dùng yêu cầu bằng một widget mở rộng như biểu tượng "thêm thông tin". Người dùng nhìn thấy có thể nhấp vào biểu tượng để xem mô tả, trong khi người dùng công nghệ hỗ trợ có thể truy cập ngay mô tả đó vì phần tử điều khiển biểu mẫu tham chiếu nó qua `aria-describedby`.

Thuộc tính `aria-describedby` phù hợp khi nội dung liên kết chứa văn bản thuần túy. Nếu nội dung dài, chứa ngữ nghĩa hữu ích, hoặc có cấu trúc phức tạp cần điều hướng, hãy dùng [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) thay thế. `aria-details` cho phép người dùng công nghệ hỗ trợ truy cập nội dung có cấu trúc liên quan và cung cấp các lệnh điều hướng bổ sung, giúp hiểu cấu trúc hoặc tiếp nhận thông tin thành từng phần nhỏ dễ hơn.

> [!NOTE]
> Nội dung của `aria-describedby` chỉ nên là một chuỗi văn bản. Nếu nội dung có những ngữ nghĩa nền tảng quan trọng, hãy cân nhắc dùng [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details).

## Ví dụ

```html
<button aria-describedby="trash-desc">Move to trash</button>
…
<p id="trash-desc">
  Items in the trash will be permanently removed after 30 days.
</p>
```

> [!NOTE]
> Thuộc tính `aria-describedby` không được thiết kế để tham chiếu các phần mô tả từ tài nguyên bên ngoài. Vì giá trị của nó là một hoặc nhiều `id` (phân tách bằng khoảng trắng nếu có nhiều), nó phải tham chiếu các phần tử trong cùng một tài liệu DOM.

## Giá trị

- Danh sách tham chiếu ID
  - : `id` hoặc danh sách các `id` phần tử được phân tách bằng khoảng trắng mô tả phần tử hiện tại.

## Giao diện liên quan

- {{domxref("Element.ariaDescribedByElements")}}
  - : Thuộc tính `ariaDescribedByElements` là một phần của giao diện của mỗi phần tử.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-describedby` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaDescribedByElements")}}
  - : Thuộc tính `ariaDescribedByElements` là một phần của giao diện của mỗi phần tử tùy chỉnh.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-describedby` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong **tất cả** vai trò. Cũng có thể dùng trên mọi phần tử HTML.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description)
- [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details)
- [Browser and AT support for `aria-describedby`](https://a11ysupport.io/tech/aria/aria-describedby_attribute)
