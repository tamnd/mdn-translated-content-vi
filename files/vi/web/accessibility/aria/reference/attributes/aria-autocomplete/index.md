---
title: "ARIA: thuộc tính aria-autocomplete"
short-title: aria-autocomplete
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete
page-type: aria-attribute
spec-urls:
  - https://w3c.github.io/aria/#aria-autocomplete,
  - https://www.w3.org/WAI/ARIA/apg/patterns/combobox/examples/combobox-autocomplete-both/
sidebar: accessibilitysidebar
---

Thuộc tính `aria-autocomplete` cho biết việc nhập văn bản có thể kích hoạt việc hiển thị một hay nhiều dự đoán về giá trị mà người dùng muốn nhập cho một [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role), hoặc [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role) hay không, và chỉ rõ các dự đoán đó sẽ được trình bày như thế nào nếu có.

## Mô tả

Tự hoàn thành là một tính năng giao diện người dùng mà trong đó các gợi ý nội tuyến được đưa ra khi người dùng đang nhập vào một ô nhập liệu. Văn bản gợi ý để hoàn thành giá trị của trường sẽ xuất hiện động trong trường sau con trỏ nhập liệu, và giá trị được gợi ý sẽ trở thành giá trị thực nếu người dùng thực hiện một hành động, chẳng hạn nhấn Tab, khiến tiêu điểm rời khỏi trường.

Thuộc tính `aria-autocomplete` mô tả kiểu mô hình tương tác tự hoàn thành mà một textbox, searchbox, hoặc combobox sẽ dùng khi hỗ trợ người dùng hoàn tất văn bản nhập vào một cách động. Nó phân biệt giữa hai mô hình: mô hình **nội tuyến** (`aria-autocomplete="inline"`), trong đó hiển thị một giá trị dự đoán duy nhất, và mô hình **danh sách** (`aria-autocomplete="list"`), trong đó hiển thị một tập hợp các giá trị khả dĩ trong một phần tử riêng biệt bật lên bên cạnh hoặc bên dưới ô nhập liệu, tương tự như {{HTMLElement('datalist')}}. Giá trị thứ ba, `aria-autocomplete="both"`, được dùng khi giao diện sẽ hiển thị cả danh sách lẫn giá trị dự đoán. Giá trị mặc định là `none`, nghĩa là textbox, searchbox, hoặc combobox sẽ không cung cấp giá trị tự hoàn thành.

Thuộc tính `aria-autocomplete` chỉ mô tả kiểu hành vi dự đoán của một phần tử nhập liệu đối với công nghệ hỗ trợ; nó không cung cấp chính chức năng đó. Tự hoàn thành thực tế nên được cung cấp bằng các thuộc tính HTML hoặc JavaScript.

Nếu giá trị tự hoàn thành được gợi ý không phụ thuộc vào dữ liệu đầu vào do người dùng cung cấp, hãy cân nhắc không bật autocomplete cho tất cả mọi người. Ví dụ, một trường searchbox hiển thị các cụm từ tìm kiếm gần đây chưa được lọc có thể hữu ích cho nhóm marketing trên trang thương mại điện tử, nhưng có lẽ không hữu ích cho người dùng trình đọc màn hình. Khi tốt nhất là không chỉ định giá trị cho `aria-autocomplete` hoặc đặt giá trị về mặc định `none`, rất có thể người dùng không dùng công nghệ hỗ trợ của bạn cũng không cần trải nghiệm đó.

Khi triển khai chức năng autocomplete, hãy bảo đảm phần gợi ý của giá trị được trình bày dưới dạng văn bản được chọn để có thể phân biệt giữa đầu vào của người dùng và phần gợi ý. Hãy bảo đảm rằng khi giá trị được gợi ý không phải là giá trị mong muốn, người dùng có thể dễ dàng xóa phần gợi ý hoặc thay thế nó bằng cách tiếp tục nhập.

Khi triển khai danh sách các giá trị, tiêu điểm DOM nên vẫn nằm trên ô nhập văn bản trong khi danh sách gợi ý được hiển thị.

- bao gồm [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) với giá trị là `id` của danh sách giá trị được gợi ý.
- bao gồm [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) khớp với vai trò của phần tử chứa tập hợp các giá trị được gợi ý.
- quản lý tiêu điểm, nếu cần, bao gồm cả việc dùng [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) nếu vùng chứa hỗ trợ.
- dùng trạng thái [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) trên phần tử có vai trò [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role) để truyền đạt rằng danh sách đang được hiển thị.

Nếu một giá trị trong danh sách autocomplete được tự động chấp nhận khi trường mất tiêu điểm, danh sách phải nằm trong một vai trò hỗ trợ `aria-activedescendant`, và giá trị `aria-activedescendant` trên trường nhập liệu phải được điều chỉnh động để tham chiếu đến phần tử chứa gợi ý đã được chọn.

## Giá trị

- `none` (mặc định)
  - : Khi người dùng đang nhập, không có gợi ý tự động nào được hiển thị.
- `inline`
  - : `aria-autocomplete="inline"` văn bản gợi ý một cách hoàn thành đầu vào đã cho có thể được chèn động ngay sau con trỏ nhập liệu.
- `list`
  - : `aria-autocomplete="list"` khi người dùng đang nhập, một phần tử chứa tập hợp các giá trị có thể hoàn thành đầu vào đã cho có thể được hiển thị.
- `both`
  - : `aria-autocomplete="both"` cung cấp cả hai mô hình cùng lúc. Khi người dùng đang nhập, một phần tử chứa tập hợp các giá trị có thể hoàn thành đầu vào đã cho có thể được hiển thị. Nếu được hiển thị, một giá trị trong tập hợp sẽ được chọn tự động, và văn bản cần để hoàn thành giá trị đã được chọn sẽ xuất hiện sau con trỏ trong trường nhập liệu.

## Vai trò liên quan

Được dùng trong các vai trò:

- vai trò [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- vai trò [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- kế thừa từ vai trò [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- vai trò [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- vai trò [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- vai trò [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- phần tử {{HTMLElement('datalist')}} và thuộc tính [`<input> list`](/en-US/docs/Web/HTML/Reference/Elements/input#list)
- thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- thuộc tính [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup)
- thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
- thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
- [Editable Combobox With Both List and Inline Autocomplete Example](https://www.w3.org/WAI/ARIA/apg/patterns/combobox/examples/combobox-autocomplete-both/)
- [Event.ariaAutoComplete](/en-US/docs/Web/API/Element/ariaAutoComplete)
