---
title: HTMLButtonElement
slug: Web/API/HTMLButtonElement
page-type: web-api-interface
browser-compat: api.HTMLButtonElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLButtonElement`** cung cấp các thuộc tính và phương thức đặc biệt để thao tác các phần tử {{HTMLElement("button")}}, ngoài những gì giao diện {{domxref("HTMLElement")}} thông thường đã có sẵn thông qua kế thừa.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLButtonElement.command")}}
  - : Một chuỗi cho biết hành động sẽ được thực hiện trên phần tử do nút này điều khiển.
- {{domxref("HTMLButtonElement.commandForElement")}}
  - : Tham chiếu đến một {{domxref("Element")}} hiện có mà nút điều khiển.
- {{domxref("HTMLButtonElement.disabled")}}
  - : Một giá trị boolean cho biết điều khiển có bị vô hiệu hóa hay không, nghĩa là nó không nhận bất kỳ lần nhấp nào.
- {{domxref("HTMLButtonElement.form")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLFormElement")}} phản ánh biểu mẫu mà nút này được liên kết. Nếu nút là phần tử con của một biểu mẫu, thuộc tính này là tham chiếu đến `HTMLFormElement` của biểu mẫu đó. Nếu nút không là phần tử con của biểu mẫu, thuộc tính có thể tham chiếu đến bất kỳ phần tử `HTMLFormElement` nào trong cùng tài liệu mà nó liên quan, hoặc `null` nếu không có phần tử phù hợp.
- {{domxref("HTMLButtonElement.formAction")}}
  - : Một chuỗi phản ánh URI của tài nguyên xử lý thông tin do nút gửi. Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của phần tử {{HTMLElement("form")}} sở hữu phần tử này.
- {{domxref("HTMLButtonElement.formEnctype")}}
  - : Một chuỗi phản ánh kiểu nội dung được dùng để gửi biểu mẫu lên máy chủ. Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của phần tử {{HTMLElement("form")}} sở hữu phần tử này.
- {{domxref("HTMLButtonElement.formMethod")}}
  - : Một chuỗi phản ánh phương thức HTTP mà trình duyệt dùng để gửi biểu mẫu. Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) của phần tử {{HTMLElement("form")}} sở hữu phần tử này.
- {{domxref("HTMLButtonElement.formNoValidate")}}
  - : Một giá trị boolean cho biết biểu mẫu sẽ không được xác thực khi được gửi. Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của phần tử {{HTMLElement("form")}} sở hữu phần tử này.
- {{domxref("HTMLButtonElement.formTarget")}}
  - : Một chuỗi phản ánh tên hoặc từ khóa cho biết nơi hiển thị phản hồi nhận được sau khi gửi biểu mẫu. Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) của phần tử {{HTMLElement("form")}} sở hữu phần tử này.
- {{domxref("HTMLButtonElement.interestForElement")}} {{experimental_inline}} {{non-standard_inline}}
  - : Lấy hoặc đặt phần tử đích của một interest invoker, trong trường hợp phần tử {{htmlelement("button")}} liên quan được chỉ định là một [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#creating_an_interest_invoker).
- {{domxref("HTMLButtonElement.labels")}} {{ReadOnlyInline}}
  - : Một {{domxref("NodeList")}} đại diện cho danh sách các phần tử {{HTMLElement("label")}} là nhãn cho nút này.
- {{domxref("HTMLButtonElement.name")}}
  - : Một chuỗi đại diện cho tên của đối tượng khi được gửi cùng biểu mẫu. Nếu được chỉ định, nó không được là chuỗi rỗng.
- {{domxref("HTMLButtonElement.popoverTargetAction")}}
  - : Lấy và đặt hành động sẽ được thực hiện (`"hide"`, `"show"`, hoặc `"toggle"`) trên phần tử popover đang được điều khiển bởi nút điều khiển. Nó phản ánh giá trị của thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction).
- {{domxref("HTMLButtonElement.popoverTargetElement")}}
  - : Lấy và đặt phần tử popover để điều khiển qua một nút. Đây là bản tương đương trong JavaScript của thuộc tính HTML [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget).
- {{domxref("HTMLButtonElement.type")}}
  - : Một chuỗi cho biết hành vi của nút. Đây là thuộc tính liệt kê với các giá trị có thể sau:
    - `submit`: Nút gửi biểu mẫu. Đây là giá trị mặc định nếu thuộc tính không được chỉ định, hoặc nếu nó được đổi động thành giá trị rỗng hay không hợp lệ.
    - `reset`: Nút đặt lại biểu mẫu.
    - `button`: Nút không làm gì.
    - `menu`: Nút hiển thị một menu. {{experimental_inline}}

- {{domxref("HTMLButtonElement.willValidate")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết nút có phải là ứng viên cho xác thực ràng buộc hay không. Nó là `false` nếu bất kỳ điều kiện nào ngăn nó xác thực ràng buộc, bao gồm: thuộc tính `type` là `reset` hoặc `button`; nó có một phần tử tổ tiên {{HTMLElement("datalist")}}; hoặc thuộc tính `disabled` được đặt thành `true`.
- {{domxref("HTMLButtonElement.validationMessage")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho thông báo đã được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển không thỏa mãn (nếu có). Thuộc tính này là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc (`willValidate` là `false`), hoặc nó thỏa mãn các ràng buộc của mình.
- {{domxref("HTMLButtonElement.validity")}} {{ReadOnlyInline}}
  - : Một {{domxref("ValidityState")}} đại diện cho các trạng thái hợp lệ mà nút này đang ở.
- {{domxref("HTMLButtonElement.value")}}
  - : Một chuỗi đại diện cho giá trị hiện tại của điều khiển biểu mẫu là nút.

## Phương thức thể hiện

_Kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLButtonElement.checkValidity()")}}
  - : Trả về `true` nếu giá trị của phần tử không có vấn đề về tính hợp lệ; ngược lại trả về `false`.
- {{domxref("HTMLButtonElement.reportValidity()")}}
  - : Thực hiện cùng hành động như `checkValidity()`, nhưng cũng báo cáo kết quả cho người dùng nếu sự kiện `invalid` không bị hủy.
- {{domxref("HTMLButtonElement.setCustomValidity()")}}
  - : Đặt thông báo hợp lệ tùy chỉnh cho phần tử. Dùng chuỗi rỗng để cho biết phần tử _không_ có lỗi hợp lệ tùy chỉnh.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("button")}}
