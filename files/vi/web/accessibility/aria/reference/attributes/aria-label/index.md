---
title: "ARIA: thuộc tính aria-label"
short-title: aria-label
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-label
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-label
sidebar: accessibilitysidebar
---

Thuộc tính `aria-label` định nghĩa một giá trị chuỗi có thể được dùng để đặt tên cho một phần tử, miễn là vai trò của phần tử đó không [cấm đặt tên](#associated_roles).

## Mô tả

Đôi khi, {{Glossary("accessible_name", "tên truy cập")}} mặc định của một phần tử bị thiếu, hoặc tên truy cập không mô tả chính xác nội dung của phần tử và không có nội dung nào nhìn thấy được trong DOM có thể liên kết với đối tượng để tạo ý nghĩa cho nó. Một ví dụ phổ biến là một nút chứa biểu tượng SVG mà không có bất kỳ văn bản nào.

Trong các trường hợp phần tử không nằm trong [danh sách bị cấm](#associated_roles), không có tên truy cập hoặc tên truy cập không chính xác và không có nội dung nào nhìn thấy được trong DOM có thể được tham chiếu qua thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby), thì thuộc tính `aria-label` có thể được dùng để định nghĩa một chuỗi gán nhãn cho phần tử tương tác mà nó được đặt lên. Điều này cung cấp cho phần tử một tên truy cập.

Đoạn mã dưới đây cho thấy ví dụ về cách dùng thuộc tính `aria-label` để cung cấp tên truy cập cho phần tử `<button>`. Nút trong ví dụ này chứa một hình SVG và không có nội dung chữ, vì vậy `aria-label` là rất cần thiết để người dùng trình đọc màn hình hiểu chức năng của nó, trong trường hợp này là "Close".

```html
<button aria-label="Close">
  <svg
    aria-hidden="true"
    focusable="false"
    width="17"
    height="17"
    xmlns="http://www.w3.org/2000/svg">
    <path
      d="m.967 14.217 5.8-5.906-5.765-5.89L3.094.26l5.783 5.888L14.66.26l2.092 2.162-5.766 5.889 5.801 5.906-2.092 2.162-5.818-5.924-5.818 5.924-2.092-2.162Z"
      fill="black" />
  </svg>
</button>
```

```js
document.querySelector("button").addEventListener("click", () => {
  myDialog.close();
});
```

> [!NOTE]
> `aria-label` được dùng để đặt tên cho các phần tử mà vai trò ngầm định hoặc tường minh không cấm việc đặt tên. Nên ưu tiên dùng `aria-labelledby` thay cho `aria-label` nếu có một nhãn hiển thị cho phần tử để tham chiếu và lấy tên từ đó.

Hầu hết nội dung đều có tên truy cập được tạo từ văn bản của phần tử bao bọc trực tiếp nó. Tên truy cập cũng có thể được tạo bởi một số thuộc tính hoặc các phần tử liên kết.

Theo mặc định, tên truy cập của nút là nội dung nằm giữa thẻ mở và thẻ đóng {{HTMLElement('button')}}, tên truy cập của ảnh là nội dung của thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt), và tên truy cập của input biểu mẫu là nội dung của phần tử {{HTMLElement('label')}} liên kết.

Nếu không có tùy chọn nào ở trên, hoặc nếu tên truy cập mặc định không phù hợp, hãy dùng thuộc tính `aria-label` để định nghĩa tên truy cập cho phần tử.

> [!NOTE]
> Mặc dù `aria-label` có thể được dùng trên mọi phần tử có thể có tên truy cập, trong thực tế nó chỉ được hỗ trợ trên các phần tử tương tác, [widget](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#2._widget_roles), [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles), ảnh và iframe.

Khi dùng `aria-label`, bạn cũng cần cân nhắc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby):

- `aria-label` có thể dùng trong các trường hợp văn bản có thể gán nhãn cho phần tử _không_ hiển thị. Nếu có văn bản hiển thị dùng để gán nhãn cho một phần tử, hãy dùng `aria-labelledby` thay thế.
- Mục đích của `aria-label` giống với `aria-labelledby`. Cả hai đều cung cấp tên truy cập cho một phần tử. Nếu không có tên hiển thị nào cho phần tử mà bạn có thể tham chiếu, hãy dùng `aria-label` để cung cấp cho người dùng một tên truy cập dễ nhận biết. Nếu văn bản nhãn có sẵn trong DOM và có thể tham chiếu nó để có trải nghiệm người dùng chấp nhận được, hãy ưu tiên dùng `aria-labelledby`. Đừng dùng cả hai trên cùng một phần tử vì `aria-labelledby` sẽ được ưu tiên hơn `aria-label` nếu cả hai đều được áp dụng.

Hãy ghi nhớ thêm các hướng dẫn sau khi dùng `aria-label`:

- Thuộc tính `aria-label` có thể dùng với các phần tử HTML ngữ nghĩa thông thường; nó không bị giới hạn ở các phần tử đã được gán một [vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles).
- Đừng lạm dụng `aria-label`. Hãy nhớ rằng nó chủ yếu dành cho công nghệ trợ năng. Để cung cấp hướng dẫn bổ sung hoặc làm rõ giao diện, hãy dùng văn bản hiển thị với `aria-describedby` hoặc [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description), không phải `aria-label`. Hướng dẫn nên sẵn có cho mọi người dùng, chứ không chỉ những người dùng trình đọc màn hình. Hoặc tốt hơn nữa, hãy làm giao diện trực quan hơn.

  > [!NOTE]
  > Vì nội dung `aria-label` không hiển thị ra ngoài các công nghệ trợ năng, hãy cân nhắc làm cho thông tin quan trọng hiển thị với mọi người dùng.

- Không phải mọi phần tử đều có thể được gán tên truy cập. Không nên dùng `aria-label` hoặc `aria-labelledby` với các vai trò cấu trúc nội tuyến như `code`, `term`, và `emphasis`, cũng như các vai trò không được ánh xạ tới API trợ năng, bao gồm `none`. Thuộc tính `aria-label` được dùng cho các phần tử như liên kết, video, điều khiển biểu mẫu, và các phần tử có [vai trò landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) hoặc [vai trò widget](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#2._widget_roles); `aria-label` cung cấp tên truy cập khi không có nhãn hiển thị nào trong DOM.
- Nếu bạn gán `title` cho một {{HTMLElement('iframe')}}, định nghĩa thuộc tính `alt` cho một {{HTMLElement('img')}}, hoặc thêm {{HTMLElement('label')}} cho một {{HTMLElement('input')}}, thì `aria-label` là không cần thiết. Tuy nhiên, nếu thuộc tính `aria-label` hiện diện, nó sẽ được ưu tiên hơn `title` của iframe, `alt` của ảnh, hoặc văn bản `<label>` của input như tên truy cập của phần tử đó.

## Giá trị

- `<string>`
  - : Một chuỗi văn bản sẽ là tên truy cập của đối tượng.

## Giao diện liên quan

- {{domxref("Element.ariaLabel")}}
  - : Thuộc tính [`ariaLabel`](/en-US/docs/Web/API/Element/ariaLabel), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-label`.
- {{domxref("ElementInternals.ariaLabel")}}
  - : Thuộc tính [`ariaLabel`](/en-US/docs/Web/API/ElementInternals/ariaLabel), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-label`.

## Vai trò liên quan

Được dùng trong hầu hết các vai trò **trừ** những vai trò mà tác giả không thể cung cấp tên truy cập.

Thuộc tính `aria-label` **KHÔNG** được hỗ trợ trong:

- [`caption`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`code`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`definition`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`deletion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`emphasis`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`generic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role)
- [`insertion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`mark`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/mark_role)
- [`paragraph`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) / [`none`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role)
- [`strong`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`subscript`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`suggestion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/suggestion_role)
- [`superscript`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`term`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role)
- [`time`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{HTMLElement('label')}} element
- [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description)
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [Using HTML landmark roles to improve accessibility](/en-US/blog/aria-accessibility-html-landmark-roles/) on MDN blog (2023)
