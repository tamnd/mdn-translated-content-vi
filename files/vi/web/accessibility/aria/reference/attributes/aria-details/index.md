---
title: "ARIA: thuộc tính aria-details"
short-title: aria-details
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-details
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-details
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-details` xác định phần tử (hoặc các phần tử) cung cấp thông tin bổ sung liên quan đến đối tượng.

## Mô tả

Thuộc tính `aria-details` có thể được dùng để cung cấp thông tin bổ sung hoặc mô tả phức tạp cho một đối tượng. Nó được dùng để thông báo cho người dùng công nghệ hỗ trợ về nội dung bằng cách cung cấp thông tin chuyên sâu hơn, dù nội dung đó nằm trong tài liệu hiện tại hay là một liên kết tới tài sản bổ sung.

Có những thuộc tính HTML và WAI-ARIA khác có mục đích tương tự. Phần tử HTML {{HTMLElement('label')}} và các thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) và [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) được dùng để cung cấp nhãn ngắn cho một đối tượng. Thuộc tính HTML `title` và các thuộc tính [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description) và [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) cung cấp các mô tả văn bản thuần dài hơn cho một đối tượng. Tuy nhiên, khi cần và có sẵn thông tin bổ sung, mô tả phức tạp, hoặc nội dung có thể điều hướng liên quan đến đối tượng, thì nên dùng thuộc tính `aria-details`.

Thuộc tính `aria-details` phục vụ mục đích tương tự như thuộc tính `longdesc` của HTML - một URL dẫn tới mô tả dài cho nội dung của một phần tử thay thế - vốn đã bị ngừng dùng do thiếu hỗ trợ và bị lạm dụng.

Thuộc tính `aria-details` nhận giá trị là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id), hoặc danh sách các `id` được phân tách bằng khoảng trắng của các phần tử để lấy thông tin chi tiết hơn. Khi `aria-details` được bao gồm trên một phần tử, công nghệ hỗ trợ sẽ thông báo cho người dùng biết rằng có thông tin mở rộng, cho phép người dùng điều hướng đến nội dung được tham chiếu.

Các phần tử được tham chiếu bởi `aria-details` dự kiến sẽ chứa nhiều thông tin hơn mức thường được cung cấp qua [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

Các phần tử được tham chiếu bởi `aria-details` nên hiển thị cho tất cả người dùng. `aria-details` thông báo cho những người dùng vốn có thể không nhìn lướt toàn bộ màn hình để nhận ra nhanh rằng có nội dung giải thích sẵn sàng.

> [!NOTE]
> `aria-details` không có tác động đến mô tả khả năng tiếp cận.

Không giống `aria-describedby`, các phần tử được tham chiếu bởi `aria-details` không được dùng trong mô tả khả năng tiếp cận và không bị chuyển thành chuỗi thuần khi trình bày cho người dùng công nghệ hỗ trợ. Nếu nội dung liên quan không quá dài và việc làm phẳng nội dung của phần tử được tham chiếu thành một chuỗi văn bản đơn giản sẽ không làm mất thông tin, hãy cân nhắc dùng `aria-describedby` thay thế. Dù vậy, một phần tử vẫn có thể có cả `aria-details` và một mô tả được chỉ định bằng `aria-describedby` hoặc `aria-description`.

## Ví dụ

Khi nói đến vai trò định nghĩa và thuật ngữ, `aria-details` sẽ được bao gồm trên phần tử [`term`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role) cùng với `id` của phần tử có vai trò [`definition`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/definition_role).

```html
<p>
  Ký hiệu hàm <strong>cubic-bezier()</strong> định nghĩa một đường cong
  <span role="term" aria-details="bezier bezImg">Bézier</span> bậc ba. Vì các
  đường cong này là liên tục, chúng thường được dùng để làm mượt phần đầu và
  phần cuối của đường cong và vì thế đôi khi được gọi là hàm easing.
</p>

<p role="definition" id="bezier">
  Một <strong>đường cong Bézier</strong>, (Phát âm \ ˈbe-zē-ˌā \)
  <i aria-description="Phát âm tiếng Anh">BEH-zee-ay</i>) là một đường cong được
  mô tả bằng toán học và được dùng trong đồ họa máy tính và hoạt ảnh. Đường cong
  được định nghĩa bởi một tập các điểm điều khiển với tối thiểu hai điểm. Đồ họa
  và hoạt ảnh liên quan đến web dùng các Bézier bậc ba, là những đường cong có
  bốn điểm điều khiển P<sub>0</sub>, P<sub>1</sub>, P<sub>2</sub>, và
  P<sub>3</sub>.
</p>

<a
  href="bezierExplanation.html"
  id="bezImg"
  aria-label="Giải thích về đường cong Bézier trong các hàm easing của CSS">
  <img
    alt="Đường cong Bézier động cho thấy 4 điểm điều khiển."
    src="bezier.gif" />
</a>
```

## Giá trị

- Danh sách tham chiếu ID
  - : Một `id` hoặc danh sách các `id` được phân tách bằng khoảng trắng của các phần tử cung cấp hoặc liên kết tới thông tin liên quan bổ sung.

## Giao diện liên quan

- {{domxref("Element.ariaDetailsElements")}}
  - : Thuộc tính `ariaDetailsElements` là một phần của giao diện của mỗi phần tử.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-details` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaDetailsElements")}}
  - : Thuộc tính `ariaDetailsElements` là một phần của giao diện của mỗi phần tử tùy chỉnh.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-details` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- Thuộc tính HTML [id](/en-US/docs/Web/HTML/Reference/Global_attributes/id)
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
- [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description)
- Thuộc tính `alt` của hình ảnh](/en-US/docs/Web/API/HTMLImageElement/alt)
- Thuộc tính HTML [title](/en-US/docs/Web/HTML/Reference/Global_attributes/title)
