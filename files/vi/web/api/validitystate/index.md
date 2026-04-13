---
title: ValidityState
slug: Web/API/ValidityState
page-type: web-api-interface
browser-compat: api.ValidityState
---

{{APIRef("HTML DOM")}}

Giao diện **`ValidityState`** biểu diễn các _trạng thái hợp lệ_ mà một phần tử có thể ở, liên quan đến xác thực ràng buộc. Cùng nhau, chúng giúp giải thích tại sao giá trị của phần tử không hợp lệ, nếu nó không hợp lệ.

## Thuộc tính phiên bản

Mỗi trạng thái hợp lệ được biểu diễn bởi một thuộc tính Boolean. Giá trị `true` chỉ ra rằng ràng buộc xác thực tương ứng đã thất bại, ngoại trừ thuộc tính `valid`, là `true` khi giá trị của phần tử tuân thủ tất cả các ràng buộc.

- {{domxref("ValidityState.badInput", "badInput")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu người dùng đã cung cấp đầu vào mà trình duyệt không thể chuyển đổi.
- {{domxref("ValidityState.customError", "customError")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết liệu thông báo hợp lệ tùy chỉnh của phần tử có được đặt thành chuỗi không rỗng bằng cách gọi phương thức {{domxref('HTMLInputElement.setCustomValidity', 'setCustomValidity()')}} của phần tử hay không.
- {{domxref("ValidityState.patternMismatch", "patternMismatch")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị không khớp với [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) đã chỉ định, và `false` nếu nó khớp. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
- {{domxref("ValidityState.rangeOverflow", "rangeOverflow")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị lớn hơn giá trị tối đa được chỉ định bởi thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max), hoặc `false` nếu nó nhỏ hơn hoặc bằng giá trị tối đa. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
- {{domxref("ValidityState.rangeUnderflow", "rangeUnderflow")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị nhỏ hơn giá trị tối thiểu được chỉ định bởi thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min), hoặc `false` nếu nó lớn hơn hoặc bằng giá trị tối thiểu. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
- {{domxref("ValidityState.stepMismatch", "stepMismatch")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị không phù hợp với các quy tắc được xác định bởi thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) (tức là, nó không chia hết cho giá trị step), hoặc `false` nếu nó phù hợp với quy tắc step. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
- {{domxref("ValidityState.tooLong", "tooLong")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị vượt quá `maxlength` đã chỉ định cho các đối tượng {{domxref("HTMLInputElement")}} hoặc {{domxref("HTMLTextAreaElement")}}, hoặc `false` nếu độ dài của nó nhỏ hơn hoặc bằng độ dài tối đa. _Lưu ý: Thuộc tính này không bao giờ là `true` trong Gecko, vì các giá trị của phần tử bị ngăn không cho dài hơn `maxlength`._ Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
- {{domxref("ValidityState.tooShort", "tooShort")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị không đáp ứng `minlength` đã chỉ định cho các đối tượng {{domxref("HTMLInputElement")}} hoặc {{domxref("HTMLTextAreaElement")}}, hoặc `false` nếu độ dài của nó lớn hơn hoặc bằng độ dài tối thiểu. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
- {{domxref("ValidityState.typeMismatch", "typeMismatch")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu giá trị không có cú pháp bắt buộc (khi [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `email` hoặc `url`), hoặc `false` nếu cú pháp đúng. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
- {{domxref("ValidityState.valid", "valid")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu phần tử đáp ứng tất cả các ràng buộc xác thực của nó, và do đó được coi là hợp lệ, hoặc `false` nếu nó thất bại bất kỳ ràng buộc nào. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":valid")}}; ngược lại là lớp giả CSS {{cssxref(":invalid")}}.
- {{domxref("ValidityState.valueMissing", "valueMissing")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu phần tử có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required), nhưng không có giá trị, hoặc `false` trong trường hợp khác. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Hướng dẫn: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
