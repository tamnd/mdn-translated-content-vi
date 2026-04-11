---
title: ElementInternals
slug: Web/API/ElementInternals
page-type: web-api-interface
browser-compat: api.ElementInternals
---

{{APIRef("Web Components")}}

Giao diện **`ElementInternals`** của [Document Object Model](/en-US/docs/Web/API/Document_Object_Model) cung cấp cho các nhà phát triển web một cách để cho phép các phần tử tùy chỉnh tham gia đầy đủ vào các biểu mẫu HTML. Nó cung cấp các tiện ích để làm việc với các phần tử này theo cách tương tự như khi bạn làm việc với bất kỳ phần tử biểu mẫu HTML tiêu chuẩn nào, đồng thời hiển thị [Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html) cho phần tử.

## Hàm tạo

Giao diện này không có hàm tạo. Một đối tượng `ElementInternals` được trả về khi gọi {{domxref("HTMLElement.attachInternals()")}}.

## Thuộc tính phiên bản

- {{domxref("ElementInternals.shadowRoot")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("ShadowRoot")}} được liên kết với phần tử này.
- {{domxref("ElementInternals.form")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("HTMLFormElement")}} được liên kết với phần tử này.
- {{domxref("ElementInternals.states")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("CustomStateSet")}} được liên kết với phần tử này.
- {{domxref("ElementInternals.willValidate")}} {{ReadOnlyInline}}
  - : Một giá trị boolean trả về true nếu phần tử là phần tử có thể gửi và là ứng viên cho
    [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).
- {{domxref("ElementInternals.validity")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("ValidityState")}} đại diện cho các trạng thái tính hợp lệ khác nhau mà phần tử có thể có, liên quan đến xác thực ràng buộc.
- {{domxref("ElementInternals.validationMessage")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa thông báo xác thực của phần tử này.
- {{domxref("ElementInternals.labels")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("NodeList")}} của tất cả các phần tử nhãn được liên kết với phần tử này.

### Thuộc tính phiên bản kế thừa từ ARIA

Giao diện `ElementInternals` cũng bao gồm các thuộc tính sau.

> [!NOTE]
> Các thuộc tính này được bao gồm để có thể xác định ngữ nghĩa truy cập mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

- {{domxref("ElementInternals.ariaAtomic")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic), cho biết liệu các công nghệ hỗ trợ có trình bày tất cả, hay chỉ một phần của vùng đã thay đổi dựa trên các thông báo thay đổi được xác định bởi thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant).
- {{domxref("ElementInternals.ariaAutoComplete")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete), cho biết liệu việc nhập văn bản có thể kích hoạt hiển thị một hoặc nhiều dự đoán về giá trị mà người dùng định nhập cho combobox, searchbox hoặc textbox và chỉ định cách các dự đoán sẽ được trình bày nếu chúng được thực hiện.
- {{domxref("ElementInternals.ariaBrailleLabel")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-braillelabel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel), xác định nhãn chữ nổi của phần tử.
- {{domxref("ElementInternals.ariaBrailleRoleDescription")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription), xác định mô tả vai trò ARIA chữ nổi của phần tử.
- {{domxref("ElementInternals.ariaBusy")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy), cho biết liệu một phần tử có đang được chỉnh sửa hay không, vì các công nghệ hỗ trợ có thể muốn chờ cho đến khi các chỉnh sửa hoàn tất trước khi hiển thị chúng với người dùng.
- {{domxref("ElementInternals.ariaChecked")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked), cho biết trạng thái "đã chọn" hiện tại của các hộp kiểm, nút radio và các widget khác có trạng thái được chọn.
- {{domxref("ElementInternals.ariaColCount")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount), xác định số cột trong bảng, lưới hoặc treegrid.
- {{domxref("ElementInternals.ariaColIndex")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex), xác định chỉ số cột hoặc vị trí của một phần tử so với tổng số cột trong bảng, lưới hoặc treegrid.
- {{domxref("ElementInternals.ariaColIndexText")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-colindextext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindextext), xác định thay thế văn bản có thể đọc được của aria-colindex.
- {{domxref("ElementInternals.ariaColSpan")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan), xác định số cột được kéo dài bởi một ô hoặc gridcell trong bảng, lưới hoặc treegrid.
- {{domxref("ElementInternals.ariaCurrent")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-current`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-current), cho biết phần tử đại diện cho mục hiện tại trong một vùng chứa hoặc tập hợp các phần tử liên quan.
- {{domxref("ElementInternals.ariaDescription")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description), xác định giá trị chuỗi mô tả hoặc chú thích cho ElementInternals hiện tại.
- {{domxref("ElementInternals.ariaDisabled")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled), cho biết rằng phần tử có thể nhận biết được nhưng bị vô hiệu hóa, do đó không thể chỉnh sửa hoặc thao tác.
- {{domxref("ElementInternals.ariaExpanded")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded), cho biết liệu phần tử nhóm do phần tử này sở hữu hoặc kiểm soát có được mở rộng hay thu gọn.
- {{domxref("ElementInternals.ariaHasPopup")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup), cho biết sự khả dụng và loại phần tử popup tương tác, chẳng hạn như menu hoặc hộp thoại, có thể được kích hoạt bởi một ElementInternals.
- {{domxref("ElementInternals.ariaHidden")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden), cho biết liệu phần tử có được hiển thị với API truy cập hay không.
- {{domxref("ElementInternals.ariaInvalid")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid), cho biết giá trị đã nhập không phù hợp với định dạng mà ứng dụng mong đợi.
- {{domxref("ElementInternals.ariaKeyShortcuts")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-keyshortcuts`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-keyshortcuts), cho biết các phím tắt bàn phím mà tác giả đã triển khai để kích hoạt hoặc đặt tiêu điểm vào một đối tượng.
- {{domxref("ElementInternals.ariaLabel")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), xác định giá trị chuỗi gán nhãn cho đối tượng hiện tại.
- {{domxref("ElementInternals.ariaLevel")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level), xác định mức độ phân cấp của một phần tử trong một cấu trúc.
- {{domxref("ElementInternals.ariaLive")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live), cho biết rằng một phần tử sẽ được cập nhật và mô tả các loại cập nhật mà tác nhân người dùng, công nghệ hỗ trợ và người dùng có thể mong đợi từ vùng trực tiếp.
- {{domxref("ElementInternals.ariaModal")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-modal`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-modal), cho biết liệu một phần tử có phải là modal khi được hiển thị hay không.
- {{domxref("ElementInternals.ariaMultiline")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-multiline`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiline), cho biết liệu hộp văn bản chấp nhận nhiều dòng đầu vào hay chỉ một dòng.
- {{domxref("ElementInternals.ariaMultiSelectable")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable), cho biết rằng người dùng có thể chọn nhiều hơn một mục từ các phần tử con hiện có thể chọn.
- {{domxref("ElementInternals.ariaOrientation")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation), cho biết liệu hướng của phần tử là ngang, dọc hay không xác định/mơ hồ.
- {{domxref("ElementInternals.ariaPlaceholder")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-placeholder`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-placeholder), xác định gợi ý ngắn nhằm hỗ trợ người dùng nhập dữ liệu khi điều khiển chưa có giá trị.
- {{domxref("ElementInternals.ariaPosInSet")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset), xác định số thứ tự hoặc vị trí của một phần tử trong tập hợp listitem hoặc treeitem hiện tại.
- {{domxref("ElementInternals.ariaPressed")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed), cho biết trạng thái "đã nhấn" hiện tại của các nút chuyển đổi.
- {{domxref("ElementInternals.ariaReadOnly")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly), cho biết rằng phần tử không thể chỉnh sửa nhưng vẫn có thể thao tác theo cách khác.
- {{domxref("ElementInternals.ariaRelevant")}} {{Non-standard_Inline}}
  - : Một chuỗi phản ánh thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant), cho biết những thông báo nào tác nhân người dùng sẽ kích hoạt khi cây truy cập trong vùng trực tiếp bị sửa đổi. Điều này được sử dụng để mô tả những thay đổi nào trong vùng `aria-live` là liên quan và cần được thông báo.
- {{domxref("ElementInternals.ariaRequired")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required), cho biết rằng người dùng cần nhập dữ liệu vào phần tử trước khi biểu mẫu có thể được gửi.
- {{domxref("ElementInternals.role")}}
  - : Một chuỗi chứa vai trò ARIA. Danh sách đầy đủ các vai trò ARIA có thể tìm thấy trên [trang kỹ thuật ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques).
- {{domxref("ElementInternals.ariaRoleDescription")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription), xác định mô tả có thể đọc được, được tác giả bản địa hóa cho vai trò của một Phần tử.
- {{domxref("ElementInternals.ariaRowCount")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount), xác định tổng số hàng trong bảng, lưới hoặc treegrid.
- {{domxref("ElementInternals.ariaRowIndex")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex), xác định chỉ số hàng hoặc vị trí của phần tử so với tổng số hàng trong bảng, lưới hoặc treegrid.
- {{domxref("ElementInternals.ariaRowIndexText")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-rowindextext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindextext), xác định thay thế văn bản có thể đọc được của aria-rowindex.
- {{domxref("ElementInternals.ariaRowSpan")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan), xác định số hàng được kéo dài bởi một ô hoặc gridcell trong bảng, lưới hoặc treegrid.
- {{domxref("ElementInternals.ariaSelected")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected), cho biết trạng thái "đã chọn" hiện tại của các phần tử có trạng thái được chọn.
- {{domxref("ElementInternals.ariaSetSize")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), xác định số mục trong tập hợp listitem hoặc treeitem hiện tại.
- {{domxref("ElementInternals.ariaSort")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort), cho biết liệu các mục trong bảng hoặc lưới có được sắp xếp theo thứ tự tăng dần hay giảm dần.
- {{domxref("ElementInternals.ariaValueMax")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-valueMax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax), xác định giá trị tối đa được phép cho widget phạm vi.
- {{domxref("ElementInternals.ariaValueMin")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-valueMin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin), xác định giá trị tối thiểu được phép cho widget phạm vi.
- {{domxref("ElementInternals.ariaValueNow")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-valueNow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow), xác định giá trị hiện tại cho widget phạm vi.
- {{domxref("ElementInternals.ariaValueText")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext), xác định thay thế văn bản có thể đọc được của aria-valuenow cho widget phạm vi.

#### Thuộc tính phiên bản phản ánh từ tham chiếu phần tử ARIA

Các thuộc tính này phản ánh các phần tử được chỉ định bằng tham chiếu `id` trong các thuộc tính tương ứng, nhưng có một số lưu ý. Xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_ để biết thêm thông tin.

- {{domxref("ElementInternals.ariaActiveDescendantElement")}}
  - : Một phần tử đại diện cho phần tử đang hoạt động hiện tại khi tiêu điểm đang ở widget [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role) hoặc [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role).
    Phản ánh thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant).
- {{domxref("ElementInternals.ariaControlsElements")}}
  - : Một mảng các phần tử mà nội dung hoặc sự hiện diện của chúng được kiểm soát bởi phần tử được áp dụng.
    Phản ánh thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls).
- {{domxref("ElementInternals.ariaDescribedByElements")}}
  - : Một mảng các phần tử chứa mô tả truy cập cho phần tử được áp dụng.
    Phản ánh thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).
- {{domxref("ElementInternals.ariaDetailsElements")}}
  - : Một mảng các phần tử cung cấp chi tiết truy cập cho phần tử được áp dụng.
    Phản ánh thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details).
- {{domxref("ElementInternals.ariaErrorMessageElements")}}
  - : Một mảng các phần tử cung cấp thông báo lỗi cho phần tử được áp dụng.
    Phản ánh thuộc tính [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage).
- {{domxref("ElementInternals.ariaFlowToElements")}}
  - : Một mảng các phần tử xác định phần tử tiếp theo (hoặc các phần tử) trong thứ tự đọc thay thế của nội dung, ghi đè thứ tự đọc mặc định chung theo quyết định của người dùng.
    Phản ánh thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto).
- {{domxref("ElementInternals.ariaLabelledByElements")}}
  - : Một mảng các phần tử cung cấp tên truy cập cho phần tử được áp dụng.
    Phản ánh thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).
- {{domxref("ElementInternals.ariaOwnsElements")}}
  - : Một mảng các phần tử được sở hữu bởi phần tử này.
    Được sử dụng để xác định mối quan hệ trực quan, chức năng hoặc ngữ cảnh giữa phần tử cha và các phần tử con khi không thể sử dụng cấu trúc DOM để biểu thị mối quan hệ.
    Phản ánh thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns).

## Phương thức phiên bản

- {{domxref("ElementInternals.setFormValue()")}}
  - : Đặt giá trị gửi và trạng thái của phần tử, truyền đạt những thông tin này đến tác nhân người dùng.
- {{domxref("ElementInternals.setValidity()")}}
  - : Đặt tính hợp lệ của phần tử.
- {{domxref("ElementInternals.checkValidity()")}}
  - : Kiểm tra xem phần tử có đáp ứng bất kỳ quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nào được áp dụng cho nó hay không.
- {{domxref("ElementInternals.reportValidity()")}}
  - : Kiểm tra xem phần tử có đáp ứng bất kỳ quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nào được áp dụng cho nó hay không, đồng thời gửi thông báo xác thực đến tác nhân người dùng.

## Ví dụ

Ví dụ sau đây minh họa cách tạo phần tử tùy chỉnh được liên kết với biểu mẫu bằng {{domxref("HTMLElement.attachInternals")}}.

```js
class CustomCheckbox extends HTMLElement {
  static formAssociated = true;

  constructor() {
    super();
    this.internals_ = this.attachInternals();
  }

  // …
}

window.customElements.define("custom-checkbox", CustomCheckbox);

let element = document.createElement("custom-checkbox");
let form = document.createElement("form");

// Thêm phần tử vào biểu mẫu để liên kết chúng
form.appendChild(element);

console.log(element.internals_.form);
// kết quả mong đợi: <form><custom-checkbox></custom-checkbox></form>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [More capable form controls](https://web.dev/articles/more-capable-form-controls) via web.dev (2019)
- [Creating custom form controls with ElementInternals](https://css-tricks.com/creating-custom-form-controls-with-elementinternals/) via CSS-tricks (2021)
