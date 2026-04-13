---
title: "ValidityState: thuộc tính patternMismatch"
short-title: patternMismatch
slug: Web/API/ValidityState/patternMismatch
page-type: web-api-instance-property
browser-compat: api.ValidityState.patternMismatch
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`patternMismatch`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}}, sau khi đã được người dùng chỉnh sửa, có tuân theo các ràng buộc được đặt bởi thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) của phần tử hay không.

Thuộc tính `patternMismatch` sẽ là true khi và chỉ khi tất cả các điều kiện sau đây đều đúng:

- trường hỗ trợ thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) — có nghĩa là {{HTMLElement("input")}} có `type` là {{HTMLElement("input/text", "text")}}, {{HTMLElement("input/tel", "tel")}}, {{HTMLElement("input/email", "email")}}, {{HTMLElement("input/url", "url")}}, {{HTMLElement("input/password", "password")}}, hoặc {{HTMLElement("input/search", "search")}}
- thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) chứa biểu thức chính quy hợp lệ
- giá trị {{HTMLElement("input")}} không tuân theo các ràng buộc được đặt bởi giá trị [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern).

## Giá trị

Một giá trị boolean là `true` nếu đối tượng `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

Cho những đầu vào sau:

```html
<p>
  <label
    >Enter your phone number in the format (123)456-7890 (<input
      name="tel1"
      type="tel"
      pattern="[0-9]{3}"
      placeholder="###"
      aria-label="3-digit area code"
      size="2" />)-
    <input
      name="tel2"
      type="tel"
      pattern="[0-9]{3}"
      placeholder="###"
      aria-label="3-digit prefix"
      size="2" />
    -
    <input
      name="tel3"
      type="tel"
      pattern="[0-9]{4}"
      placeholder="####"
      aria-label="4-digit number"
      size="3" />
  </label>
</p>
```

Đây chúng ta có 3 phần cho số điện thoại Bắc Mỹ với nhãn ngầm bao gồm cả ba thành phần của số điện thoại, kỳ vọng lần lượt là 3 chữ số, 3 chữ số và 4 chữ số, như được xác định bởi thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) được đặt trên mỗi trường.

Nếu các giá trị quá dài hoặc quá ngắn, hoặc chứa các ký tự không phải chữ số, `patternMismatch` sẽ là true. Khi `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}}.

```css
input:invalid {
  border: red solid 3px;
}
```

{{EmbedLiveSample("Examples", 300, 87)}}

Lưu ý, trong trường hợp này, chúng ta nhận được `patternMismatch` chứ không phải {{domxref('validityState.tooLong')}} hoặc {{domxref('validityState.tooShort')}} nếu các giá trị quá dài hoặc quá ngắn vì chính pattern đang xác đ���nh độ dài của giá trị. Nếu thay vào đó chúng ta dùng thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength), chúng ta có thể thấy {{domxref('validityState.tooLong')}} hoặc {{domxref('validityState.tooShort')}} là true.

> [!NOTE]
> Kiểu đầu vào `{{HTMLElement("input/email", "email")}}` yêu cầu tối thiểu khớp với `x@y` và kiểu `{{HTMLElement("input/url", "url")}}` yêu cầu tối thiểu khớp với x:, không có thuộc tính pattern nào. Khi không hợp lệ, {{domxref('validityState.typeMismatch')}} sẽ là true, nếu không có thuộc tính pattern (hoặc thuộc tính pattern không hợp lệ cho kiểu đầu vào đó).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
