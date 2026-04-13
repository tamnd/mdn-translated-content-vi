---
title: HTMLSelectElement
slug: Web/API/HTMLSelectElement
page-type: web-api-interface
browser-compat: api.HTMLSelectElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLSelectElement`** đại diện cho một phần tử HTML {{HTMLElement("select")}}. Các phần tử này cũng chia sẻ tất cả các thuộc tính và phương thức của các phần tử HTML khác thông qua giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này kế thừa các thuộc tính của {{domxref("HTMLElement")}}, cũng như của {{domxref("Element")}} và {{domxref("Node")}}._

- {{domxref("HTMLSelectElement.autocomplete")}}
  - : Một giá trị chuỗi phản ánh thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/select#autocomplete), cho biết trình duyệt có thể tự động hoàn thành giá trị của điều khiển hay không.
- {{domxref("HTMLSelectElement.disabled")}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/select#disabled), cho biết điều khiển có bị vô hiệu hóa hay không. Nếu bị vô hiệu hóa, nó không nhận lần nhấp.
- {{domxref("HTMLSelectElement.form")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLFormElement")}} tham chiếu đến biểu mẫu mà phần tử này được liên kết. Nếu phần tử không được liên kết với phần tử {{HTMLElement("form")}}, nó trả về `null`.
- {{domxref("HTMLSelectElement.labels")}} {{ReadOnlyInline}}
  - : Một {{domxref("NodeList")}} gồm các phần tử {{HTMLElement("label")}} được liên kết với phần tử.
- {{domxref("HTMLSelectElement.length")}}
  - : Một `unsigned long` cho biết số lượng phần tử {{HTMLElement("option")}} trong phần tử `select` này.
- {{domxref("HTMLSelectElement.multiple")}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/select#multiple), cho biết có thể chọn nhiều mục hay không.
- {{domxref("HTMLSelectElement.name")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`name`](/en-US/docs/Web/HTML/Reference/Elements/select#name), chứa tên của điều khiển này được máy chủ và các hàm tìm kiếm DOM sử dụng.
- {{domxref("HTMLSelectElement.options")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLOptionsCollection")}} đại diện cho tập hợp các phần tử {{HTMLElement("option")}} ({{domxref("HTMLOptionElement")}}) có trong phần tử này.
- {{domxref("HTMLSelectElement.required")}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`required`](/en-US/docs/Web/HTML/Reference/Elements/select#required), cho biết người dùng có bắt buộc phải chọn một giá trị trước khi gửi biểu mẫu hay không.
- {{domxref("HTMLSelectElement.selectedIndex")}}
  - : Một `long` phản ánh chỉ số của phần tử {{HTMLElement("option")}} đầu tiên được chọn. Giá trị `-1` cho biết không có phần tử nào được chọn.
- {{domxref("HTMLSelectElement.selectedOptions")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLCollection")}} đại diện cho tập hợp các phần tử {{HTMLElement("option")}} đang được chọn.
- {{domxref("HTMLSelectElement.size")}}
  - : Một `long` phản ánh thuộc tính HTML [`size`](/en-US/docs/Web/HTML/Reference/Elements/select#size), chứa số lượng mục hiển thị trong điều khiển. Mặc định là 1, trừ khi `multiple` là `true`, khi đó là 4.
- {{domxref("HTMLSelectElement.type")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho kiểu của điều khiển biểu mẫu. Khi `multiple` là `true`, nó trả về `"select-multiple"`; ngược lại, nó trả về `"select-one"`.
- {{domxref("HTMLSelectElement.validationMessage")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho thông báo đã được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển không thỏa mãn (nếu có). Thuộc tính này là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc (`willValidate` là `false`), hoặc nó thỏa mãn các ràng buộc của mình.
- {{domxref("HTMLSelectElement.validity")}} {{ReadOnlyInline}}
  - : Một {{domxref("ValidityState")}} phản ánh trạng thái hợp lệ mà điều khiển này đang ở.
- {{domxref("HTMLSelectElement.value")}}
  - : Một chuỗi phản ánh giá trị của điều khiển biểu mẫu. Trả về thuộc tính `value` của phần tử tùy chọn được chọn đầu tiên nếu có, nếu không thì là chuỗi rỗng.
- {{domxref("HTMLSelectElement.willValidate")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết nút có phải là ứng viên cho xác thực ràng buộc hay không. Nó là `false` nếu bất kỳ điều kiện nào ngăn nó xác thực ràng buộc.

## Phương thức thể hiện

_Giao diện này kế thừa các phương thức của {{domxref("HTMLElement")}}, cũng như của {{domxref("Element")}} và {{domxref("Node")}}._

- {{domxref("HTMLSelectElement.add()")}}
  - : Thêm một phần tử vào tập hợp các phần tử `option` của phần tử `select` này.
- {{domxref("HTMLSelectElement.checkValidity()")}}
  - : Kiểm tra xem phần tử có bất kỳ ràng buộc nào hay không và nó có thỏa mãn chúng hay không. Nếu phần tử không thỏa mãn các ràng buộc của nó, trình duyệt sẽ kích hoạt sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}} có thể hủy tại phần tử đó (và trả về `false`).
- {{domxref("HTMLSelectElement.item()")}}
  - : Lấy một mục từ tập hợp tùy chọn của phần tử {{HTMLElement("select")}} này. Bạn cũng có thể truy cập một mục bằng cách chỉ định chỉ số trong dấu ngoặc vuông hoặc ngoặc đơn mà không cần gọi phương thức này trực tiếp.
- {{domxref("HTMLSelectElement.namedItem()")}}
  - : Lấy mục trong tập hợp tùy chọn có tên được chỉ định. Chuỗi tên có thể khớp với thuộc tính `id` hoặc `name` của một nút option. Bạn cũng có thể truy cập một mục bằng cách chỉ định tên trong dấu ngoặc vuông hoặc ngoặc đơn mà không cần gọi phương thức này trực tiếp.
- {{domxref("HTMLSelectElement.remove()")}}
  - : Xóa phần tử tại chỉ số được chỉ định khỏi tập hợp tùy chọn của phần tử `select` này.
- {{domxref("HTMLSelectElement.reportValidity()")}}
  - : Phương thức này báo cáo các vấn đề về ràng buộc của phần tử, nếu có, cho người dùng. Nếu có vấn đề, nó kích hoạt sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}} có thể hủy tại phần tử và trả về `false`; nếu không có vấn đề, nó trả về `true`.
- {{domxref("HTMLSelectElement.setCustomValidity()")}}
  - : Đặt thông báo hợp lệ tùy chỉnh cho phần tử selection thành thông báo được chỉ định. Dùng chuỗi rỗng để cho biết phần tử _không_ có lỗi hợp lệ tùy chỉnh.
- {{domxref("HTMLSelectElement.showPicker()", "showPicker()")}}
  - : Hiển thị trình chọn tùy chọn.

## Sự kiện

_Giao diện này kế thừa các sự kiện của {{domxref("HTMLElement")}}, cũng như của {{domxref("Element")}} và {{domxref("Node")}}._

Lắng nghe các sự kiện này bằng {{domxref("EventTarget/addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này:

- {{domxref("HTMLElement/change_event", "change")}} event
  - : Được kích hoạt khi người dùng chọn một tùy chọn.
- {{domxref("Element/input_event", "input")}} event
  - : Được kích hoạt khi giá trị `value` của phần tử {{HTMLElement("input")}}, {{HTMLElement("select")}}, hoặc {{HTMLElement("textarea")}} đã thay đổi.

## Ví dụ

### Lấy thông tin về tùy chọn đã chọn

```js
/* assuming we have the following HTML
<select id='s'>
    <option>First</option>
    <option selected>Second</option>
    <option>Third</option>
</select>
*/

const select = document.getElementById("s");

// return the index of the selected option
console.log(select.selectedIndex); // 1

// return the value of the selected option
console.log(select.options[select.selectedIndex].value); // Second
```

Cách tốt hơn để theo dõi thay đổi trong lựa chọn của người dùng là lắng nghe sự kiện {{domxref("HTMLElement/change_event", "change")}} xảy ra trên `<select>`. Điều này sẽ cho bạn biết khi nào giá trị thay đổi, sau đó bạn có thể cập nhật bất kỳ thứ gì cần thiết. Xem [ví dụ được cung cấp](/en-US/docs/Web/API/HTMLElement/change_event#select_element) trong tài liệu của sự kiện `change` để biết chi tiết.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("select")}}, phần tử triển khai giao diện này.
