---
title: HTMLFieldSetElement
slug: Web/API/HTMLFieldSetElement
page-type: web-api-interface
browser-compat: api.HTMLFieldSetElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLFieldSetElement`** cung cấp các thuộc tính và phương thức đặc biệt (bên cạnh giao diện {{domxref("HTMLElement")}} thông thường mà nó cũng có được thông qua kế thừa) để thao tác bố cục và cách trình bày của các phần tử {{ HTMLElement("fieldset") }}.

{{InheritanceDiagram}}

## Thuộc tính instance

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLFieldSetElement.disabled")}}
  - : Một giá trị logic phản ánh thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/fieldset#disabled), cho biết liệu người dùng có thể tương tác với điều khiển hay không.
- {{domxref("HTMLFieldSetElement.elements")}} {{ReadOnlyInline}}
  - : Các phần tử thuộc field set này. Kiểu của thuộc tính này phụ thuộc vào phiên bản đặc tả kỹ thuật mà trình duyệt triển khai.
- {{domxref("HTMLFieldSetElement.form")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLFormControlsCollection")}} hoặc {{domxref("HTMLCollection")}} tham chiếu đến phần tử form chứa, nếu phần tử này nằm trong một form.
    Nếu field set không phải là con cháu của phần tử form nào, thì thuộc tính này có thể là ID của bất kỳ phần tử form nào trong cùng tài liệu mà nó liên quan, hoặc giá trị `null` nếu không có phần tử nào phù hợp.
- {{domxref("HTMLFieldSetElement.name")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`name`](/en-US/docs/Web/HTML/Reference/Elements/fieldset#name), chứa tên của field set. Có thể sử dụng khi truy cập field set trong JavaScript. Đây _không_ phải là một phần của dữ liệu được gửi đến máy chủ.
- {{domxref("HTMLFieldSetElement.type")}} {{ReadOnlyInline}}
  - : Chuỗi `"fieldset"`.
- {{domxref("HTMLFieldSetElement.validationMessage")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho thông báo đã bản địa hóa mô tả các ràng buộc xác thực mà phần tử không đáp ứng (nếu có). Đây là chuỗi rỗng nếu phần tử không phải là ứng viên cho xác thực ràng buộc (`willValidate` là `false`), hoặc nó đáp ứng các ràng buộc của mình.
- {{domxref("HTMLFieldSetElement.validity")}} {{ReadOnlyInline}}
  - : Một {{domxref("ValidityState")}} đại diện cho các trạng thái hợp lệ mà phần tử này đang có.
- {{domxref("HTMLFieldSetElement.willValidate")}} {{ReadOnlyInline}}
  - : Một giá trị logic `false`, vì các đối tượng {{HTMLElement("fieldset")}} không bao giờ là ứng viên cho xác thực ràng buộc.

## Phương thức instance

_Kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLFieldSetElement.checkValidity()")}}
  - : Luôn trả về `true` vì các đối tượng {{HTMLElement("fieldset")}} không bao giờ là ứng viên cho xác thực ràng buộc.
- {{domxref("HTMLFieldSetElement.reportValidity()")}}
  - : Luôn trả về `true` vì các đối tượng {{HTMLElement("fieldset")}} không bao giờ là ứng viên cho xác thực ràng buộc.
- {{domxref("HTMLFieldSetElement.setCustomValidity()")}}
  - : Đặt một thông báo lỗi tùy chỉnh cho field set. Nếu thông báo này không phải là chuỗi rỗng, thì field set đang mắc lỗi tùy chỉnh và không hợp lệ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("fieldset") }}.
