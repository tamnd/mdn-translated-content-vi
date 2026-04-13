---
title: HTMLInputElement
slug: Web/API/HTMLInputElement
page-type: web-api-interface
browser-compat: api.HTMLInputElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLInputElement`** cung cấp các thuộc tính và phương thức đặc biệt để thao tác các tùy chọn, bố cục và cách trình bày của các phần tử {{HTMLElement("input")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("HTMLElement")}}._

Một số thuộc tính chỉ áp dụng cho các loại phần tử input hỗ trợ các thuộc tính tương ứng.

- {{domxref("HTMLInputElement.align", "align")}} {{Deprecated_Inline}}
  - : Một chuỗi đại diện cho căn chỉnh của phần tử. _Hãy dùng CSS thay thế._

- {{domxref("HTMLInputElement.alpha", "alpha")}} {{experimental_inline}}
  - : Một giá trị logic đại diện cho thuộc tính [`alpha`](/en-US/docs/Web/HTML/Reference/Elements/input/color#alpha) của phần tử, cho biết liệu thành phần alpha của màu sắc có thể được người dùng cuối thao tác và không nhất thiết phải hoàn toàn trong suốt.

- {{domxref("HTMLInputElement.colorSpace", "colorSpace")}}
  - : Một chuỗi đại diện cho thuộc tính [`colorspace`](/en-US/docs/Web/HTML/Reference/Elements/input/color#colorspace) của phần tử, cho biết {{glossary("color space", "không gian màu")}} của màu CSS được tuần tự hóa (sRGB hoặc display-p3).

- {{domxref("HTMLInputElement.defaultValue", "defaultValue")}}
  - : Một chuỗi đại diện cho giá trị mặc định như ban đầu được chỉ định trong HTML đã tạo đối tượng này.

- {{domxref("HTMLInputElement.dirName", "dirName")}}
  - : Một chuỗi đại diện cho hướng văn bản của phần tử.

- {{domxref("HTMLInputElement.incremental", "incremental")}} {{Non-standard_Inline}}
  - : Một giá trị logic đại diện cho chế độ kích hoạt sự kiện search, nếu là `true`, sẽ kích hoạt trên mỗi lần nhấn phím, hoặc khi nhấp vào nút hủy; ngược lại sẽ kích hoạt khi nhấn <kbd>Enter</kbd>.

- {{domxref("HTMLInputElement.labels", "labels")}} {{ReadOnlyInline}}
  - : Trả về danh sách các phần tử {{ HTMLElement("label") }} là nhãn cho phần tử này.

- {{domxref("HTMLInputElement.list", "list")}} {{ReadOnlyInline}}
  - : Trả về phần tử được trỏ bởi thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list). Thuộc tính này có thể là `null` nếu không tìm thấy phần tử HTML nào trong cùng một cây.

- {{domxref("HTMLInputElement.multiple", "multiple")}}
  - : Một giá trị logic đại diện cho thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple) của phần tử, cho biết liệu có thể chọn nhiều hơn một giá trị (ví dụ: nhiều tệp).

- {{domxref("HTMLInputElement.name", "name")}}
  - : Một chuỗi đại diện cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) của phần tử, chứa một tên định danh phần tử khi gửi biểu mẫu.

- {{domxref("HTMLInputElement.popoverTargetAction", "popoverTargetAction")}}
  - : Lấy và thiết lập hành động sẽ thực hiện (`"hide"`, `"show"`, hoặc `"toggle"`) trên một phần tử popover đang được điều khiển bởi phần tử {{HTMLElement("input")}} có `type="button"`. Nó phản ánh giá trị của thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/input#popovertargetaction).

- {{domxref("HTMLInputElement.popoverTargetElement", "popoverTargetElement")}}
  - : Lấy và thiết lập phần tử popover để điều khiển qua phần tử {{HTMLElement("input")}} có `type="button"`. Phiên bản JavaScript tương đương của thuộc tính HTML [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/input#popovertarget).

- {{domxref("HTMLInputElement.step", "step")}}
  - : Một chuỗi đại diện cho thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) của phần tử, hoạt động cùng với [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để giới hạn các bước tăng/giảm của giá trị số hoặc ngày-tháng. Nó có thể là chuỗi `any` hoặc một số thực dương. Nếu không đặt thành `any`, điều khiển chỉ chấp nhận các giá trị là bội số của giá trị step lớn hơn giá trị minimum.

- {{domxref("HTMLInputElement.type", "type")}}
  - : Một chuỗi đại diện cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) của phần tử, cho biết loại điều khiển sẽ hiển thị. Đối với các giá trị có thể, xem tài liệu cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type).

- {{domxref("HTMLInputElement.useMap", "useMap")}} {{Deprecated_Inline}}
  - : Một chuỗi đại diện cho image map phía client.

- {{domxref("HTMLInputElement.value", "value")}}
  - : Một chuỗi đại diện cho giá trị hiện tại của điều khiển. Nếu người dùng nhập giá trị khác với giá trị dự kiến, nó có thể trả về chuỗi rỗng.

- {{domxref("HTMLInputElement.valueAsDate", "valueAsDate")}}
  - : Một {{jsxref("Date")}} đại diện cho giá trị của phần tử, được hiểu là ngày, hoặc `null` nếu không thể chuyển đổi.

- {{domxref("HTMLInputElement.valueAsNumber", "valueAsNumber")}}
  - : Một số đại diện cho giá trị của phần tử, được hiểu là một trong các giá trị sau, theo thứ tự: giá trị thời gian, một số, hoặc `NaN` nếu không thể chuyển đổi.

### Các thuộc tính thể hiện liên quan đến biểu mẫu cha

- {{domxref("HTMLInputElement.form", "form")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến phần tử {{HTMLElement("form")}} cha.

- {{domxref("HTMLInputElement.formAction", "formAction")}}
  - : Một chuỗi đại diện cho thuộc tính [`formaction`](/en-US/docs/Web/HTML/Reference/Elements/input#formaction) của phần tử, chứa URL của chương trình xử lý thông tin do phần tử gửi. Thuộc tính này ghi đè thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của biểu mẫu cha.

- {{domxref("HTMLInputElement.formEnctype", "formEnctype")}}
  - : Một chuỗi đại diện cho thuộc tính [`formenctype`](/en-US/docs/Web/HTML/Reference/Elements/input#formenctype) của phần tử, chứa loại nội dung được sử dụng để gửi biểu mẫu lên máy chủ. Thuộc tính này ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu cha.

- {{domxref("HTMLInputElement.formMethod", "formMethod")}}
  - : Một chuỗi đại diện cho thuộc tính [`formmethod`](/en-US/docs/Web/HTML/Reference/Elements/input#formmethod) của phần tử, chứa phương thức HTTP mà trình duyệt sử dụng để gửi biểu mẫu. Thuộc tính này ghi đè thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) của biểu mẫu cha.

- {{domxref("HTMLInputElement.formNoValidate", "formNoValidate")}}
  - : Một giá trị logic đại diện cho thuộc tính [`formnovalidate`](/en-US/docs/Web/HTML/Reference/Elements/input#formnovalidate) của phần tử, cho biết biểu mẫu sẽ không được xác thực khi gửi. Thuộc tính này ghi đè thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của biểu mẫu cha.

- {{domxref("HTMLInputElement.formTarget", "formTarget")}}
  - : Một chuỗi đại diện cho thuộc tính [`formtarget`](/en-US/docs/Web/HTML/Reference/Elements/input#formtarget) của phần tử, chứa tên hoặc từ khóa cho biết nơi hiển thị phản hồi nhận được sau khi gửi biểu mẫu. Thuộc tính này ghi đè thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) của biểu mẫu cha.

### Các thuộc tính thể hiện áp dụng cho bất kỳ loại phần tử input nào không phải là hidden

- {{domxref("HTMLInputElement.disabled", "disabled")}}
  - : Một giá trị logic đại diện cho thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/input#disabled) của phần tử, cho biết điều khiển không khả dụng để tương tác. Giá trị input sẽ không được gửi kèm biểu mẫu. Xem thêm [`readonly`](/en-US/docs/Web/HTML/Reference/Elements/input#readonly).

- {{domxref("HTMLInputElement.required", "required")}}
  - : Một giá trị logic đại diện cho thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) của phần tử, cho biết người dùng phải điền giá trị trước khi gửi biểu mẫu.

- {{domxref("HTMLInputElement.validationMessage", "validationMessage")}} {{ReadOnlyInline}}
  - : Trả về một thông báo được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển không thỏa mãn (nếu có). Đây là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc ({{domxref("HTMLInputElement.willValidate", "willValidate")}} là `false`), hoặc nó thỏa mãn các ràng buộc. Giá trị này có thể được đặt bằng phương thức {{domxref("HTMLInputElement.setCustomValidity()", "setCustomValidity()")}}.

- {{domxref("HTMLInputElement.validity", "validity")}} {{ReadOnlyInline}}
  - : Trả về trạng thái hợp lệ hiện tại của phần tử.

- {{domxref("HTMLInputElement.willValidate", "willValidate")}} {{ReadOnlyInline}}
  - : Trả về việc phần tử có phải là ứng viên cho xác thực ràng buộc hay không. Nó là `false` nếu bất kỳ điều kiện nào ngăn nó xác thực ràng buộc, bao gồm: `type` của nó là một trong các giá trị `hidden`, `reset` hoặc `button`, nó có phần tử tổ tiên là {{HTMLElement("datalist")}} hoặc thuộc tính `disabled` của nó là `true`.

### Các thuộc tính thể hiện chỉ áp dụng cho phần tử loại checkbox hoặc radio

- {{domxref("HTMLInputElement.checked", "checked")}}
  - : Một giá trị logic đại diện cho trạng thái hiện tại của phần tử.

- {{domxref("HTMLInputElement.defaultChecked", "defaultChecked")}}
  - : Một giá trị logic đại diện cho trạng thái mặc định của nút radio hoặc checkbox như ban đầu được chỉ định trong HTML đã tạo đối tượng này.

- {{domxref("HTMLInputElement.indeterminate", "indeterminate")}}
  - : Một giá trị logic đại diện cho việc checkbox hoặc nút radio có đang ở trạng thái không xác định hay không. Đối với checkbox, hiệu ứng là giao diện checkbox bị che mờ/xám đi theo cách nào đó để cho biết trạng thái của nó là không xác định (không được chọn nhưng cũng không bỏ chọn). Không ảnh hưởng đến giá trị của thuộc tính `checked`, và việc nhấp vào checkbox sẽ đặt giá trị thành false.

### Các thuộc tính thể hiện chỉ áp dụng cho phần tử loại image

- {{domxref("HTMLInputElement.alt", "alt")}}
  - : Một chuỗi đại diện cho thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/input#alt) của phần tử, chứa văn bản thay thế để sử dụng.

- {{domxref("HTMLInputElement.height", "height")}}
  - : Một chuỗi đại diện cho thuộc tính [`height`](/en-US/docs/Web/HTML/Reference/Elements/input#height) của phần tử, định nghĩa chiều cao của hình ảnh hiển thị cho nút.

- {{domxref("HTMLInputElement.src", "src")}}
  - : Một chuỗi đại diện cho thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/input#src) của phần tử, chỉ định URI cho vị trí của hình ảnh để hiển thị trên nút gửi đồ họa.

- {{domxref("HTMLInputElement.width", "width")}}
  - : Một chuỗi đại diện cho thuộc tính [`width`](/en-US/docs/Web/HTML/Reference/Elements/input#width) của phần tử, định nghĩa chiều rộng của hình ảnh hiển thị cho nút.

### Các thuộc tính thể hiện chỉ áp dụng cho phần tử loại file

- {{domxref("HTMLInputElement.accept", "accept")}}
  - : Một chuỗi đại diện cho thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Elements/input#accept) của phần tử, chứa danh sách các loại tệp được phân tách bằng dấu phẩy có thể được chọn.

- {{domxref("HTMLInputElement.capture", "capture")}}
  - : Một chuỗi đại diện cho thuộc tính [`capture`](/en-US/docs/Web/HTML/Reference/Elements/input#capture) của phần tử, cho biết phương thức nhập phương tiện thu âm trong điều khiển tải tệp lên.

- {{domxref("HTMLInputElement.files", "files")}}
  - : Một {{domxref("FileList")}} đại diện cho các tệp được chọn để tải lên.

- {{domxref("HTMLInputElement.webkitdirectory", "webkitdirectory")}}
  - : Một giá trị logic đại diện cho thuộc tính [`webkitdirectory`](/en-US/docs/Web/HTML/Reference/Elements/input#webkitdirectory). Nếu là `true`, giao diện chọn hệ thống tệp chỉ chấp nhận thư mục thay vì tệp.

- {{domxref("HTMLInputElement.webkitEntries", "webkitEntries")}} {{ReadOnlyInline}}
  - : Mô tả các tệp hoặc thư mục đang được chọn hiện tại.

### Các thuộc tính thể hiện chỉ áp dụng cho các phần tử hiển thị chứa văn bản hoặc số

- {{domxref("HTMLInputElement.autocomplete", "autocomplete")}}
  - : Một chuỗi đại diện cho thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) của phần tử, cho biết liệu giá trị của điều khiển có thể được trình duyệt tự động hoàn thành hay không.

- {{domxref("HTMLInputElement.max", "max")}}
  - : Một chuỗi đại diện cho thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) của phần tử, chứa giá trị tối đa (số hoặc ngày-tháng) cho mục này, không được nhỏ hơn giá trị minimum của nó (thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min)).

- {{domxref("HTMLInputElement.maxLength", "maxLength")}}
  - : Một số đại diện cho thuộc tính [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) của phần tử, chứa số lượng ký tự tối đa (theo mã Unicode) mà giá trị có thể có.

- {{domxref("HTMLInputElement.min", "min")}}
  - : Một chuỗi đại diện cho thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) của phần tử, chứa giá trị tối thiểu (số hoặc ngày-tháng) cho mục này, không được lớn hơn giá trị maximum của nó (thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max)).

- {{domxref("HTMLInputElement.minLength", "minLength")}}
  - : Một số đại diện cho thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength) của phần tử, chứa số lượng ký tự tối thiểu (theo mã Unicode) mà giá trị có thể có.

- {{domxref("HTMLInputElement.pattern", "pattern")}}
  - : Một chuỗi đại diện cho thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) của phần tử, chứa một biểu thức chính quy mà giá trị của điều khiển sẽ được kiểm tra. Sử dụng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để mô tả mẫu nhằm hỗ trợ người dùng. Thuộc tính này chỉ áp dụng khi giá trị của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `text`, `search`, `tel`, `url` hoặc `email`.

- {{domxref("HTMLInputElement.placeholder", "placeholder")}}
  - : Một chuỗi đại diện cho thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) của phần tử, chứa gợi ý cho người dùng về những gì có thể nhập vào điều khiển. Văn bản placeholder không được chứa ký tự xuống dòng hoặc ngắt dòng. Thuộc tính này chỉ áp dụng khi giá trị của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `text`, `search`, `tel`, `url` hoặc `email`.

- {{domxref("HTMLInputElement.readOnly", "readOnly")}}
  - : Một giá trị logic đại diện cho thuộc tính [`readonly`](/en-US/docs/Web/HTML/Reference/Elements/input#readonly) của phần tử, cho biết người dùng không thể sửa đổi giá trị của điều khiển. Thuộc tính này bị bỏ qua nếu [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `hidden`, `range`, `color`, `checkbox`, `radio`, `file`, hoặc một loại nút.

- {{domxref("HTMLInputElement.selectionDirection", "selectionDirection")}}
  - : Một chuỗi đại diện cho hướng mà việc chọn đã xảy ra. Các giá trị có thể là: `forward` (việc chọn được thực hiện theo hướng từ đầu đến cuối của ngôn ngữ hiện tại), `backward` (hướng ngược lại) hoặc `none` (hướng không xác định).

- {{domxref("HTMLInputElement.selectionEnd", "selectionEnd")}}
  - : Một số đại diện cho chỉ mục cuối của văn bản được chọn. Khi không có gì được chọn, nó trả về offset của ký tự ngay sau vị trí con trỏ nhập văn bản hiện tại.

- {{domxref("HTMLInputElement.selectionStart", "selectionStart")}}
  - : Một số đại diện cho chỉ mục bắt đầu của văn bản được chọn. Khi không có gì được chọn, nó trả về vị trí của con trỏ nhập văn bản (caret) bên trong phần tử {{HTMLElement("input")}}.

- {{domxref("HTMLInputElement.size", "size")}}
  - : Một số đại diện cho thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size) của phần tử, chứa kích thước hiển thị của điều khiển. Giá trị này tính bằng pixel trừ khi giá trị của [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `text` hoặc `password`, trong trường hợp đó, nó là số nguyên ký tự. Chỉ áp dụng khi [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành `text`, `search`, `tel`, `url`, `email`, hoặc `password`.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLInputElement.checkValidity()", "checkValidity()")}}
  - : Trả về một giá trị logic là `false` nếu phần tử là ứng viên cho xác thực ràng buộc và nó không thỏa mãn các ràng buộc của nó. Trong trường hợp này, nó cũng kích hoạt sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}} tại phần tử. Nó trả về `true` nếu phần tử không phải là ứng viên cho xác thực ràng buộc, hoặc nếu nó thỏa mãn các ràng buộc của nó.

- {{domxref("HTMLInputElement.reportValidity()", "reportValidity()")}}
  - : Chạy phương thức `checkValidity()`, và nếu nó trả về false (đối với input không hợp lệ hoặc không có thuộc tính pattern), thì nó báo cáo cho người dùng rằng input không hợp lệ theo cách tương tự như khi bạn gửi biểu mẫu.

- {{domxref("HTMLInputElement.select()", "select()")}}
  - : Chọn tất cả văn bản trong phần tử input và tập trung vào nó để người dùng sau đó có thể thay thế toàn bộ nội dung.

- {{domxref("HTMLInputElement.setCustomValidity()", "setCustomValidity()")}}
  - : Đặt thông báo tùy chỉnh hợp lệ cho phần tử. Nếu thông báo này không phải là chuỗi rỗng, thì phần tử đang gặp lỗi tùy chỉnh và không hợp lệ.

- {{domxref("HTMLInputElement.setRangeText()", "setRangeText()")}}
  - : Thay thế một phạm vi văn bản trong phần tử input bằng văn bản mới.

- {{domxref("HTMLInputElement.setSelectionRange()", "setSelectionRange()")}}
  - : Chọn một phạm vi văn bản trong phần tử input (nhưng không tập trung vào nó).

- {{domxref("HTMLInputElement.showPicker()", "showPicker()")}}
  - : Hiển thị bộ chọn trình duyệt cho ngày, giờ, màu sắc và tệp.

- {{domxref("HTMLInputElement.stepDown()", "stepDown()")}}
  - : Giảm [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) đi ([`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) \* n), trong đó n mặc định là 1 nếu không được chỉ định.

- {{domxref("HTMLInputElement.stepUp()", "stepUp()")}}
  - : Tăng [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) lên ([`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) \* n), trong đó n mặc định là 1 nếu không được chỉ định.

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha, {{domxref("HTMLElement")}}._

Nghe các sự kiện này bằng cách sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này:

- Sự kiện {{domxref("HTMLInputElement/cancel_event", "cancel")}}
  - : Được kích hoạt khi người dùng hủy hộp thoại chọn tệp qua phím <kbd>Esc</kbd> hoặc nút hủy và khi người dùng chọn lại các tệp giống như đã chọn trước đó.
- Sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}}
  - : Được kích hoạt khi một phần tử không thỏa mãn các ràng buộc của nó trong quá trình xác thực ràng buộc.
- Sự kiện {{domxref("HTMLInputElement/search_event", "search")}} {{Non-standard_Inline}}
  - : Được kích hoạt khi một tìm kiếm được khởi tạo trên {{HTMLElement("input")}} có `type="search"`.
- Sự kiện {{domxref("HTMLInputElement/select_event", "select")}}
  - : Được kích hoạt khi một số văn bản đã được chọn.
- Sự kiện {{domxref("HTMLInputElement/selectionchange_event", "selectionchange")}}
  - : Được kích hoạt khi việc chọn văn bản trong phần tử {{HTMLElement("input")}} đã thay đổi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("input")}}
