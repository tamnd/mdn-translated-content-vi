---
title: "ElementInternals: setValidity() method"
short-title: setValidity()
slug: Web/API/ElementInternals/setValidity
page-type: web-api-instance-method
browser-compat: api.ElementInternals.setValidity
---

{{APIRef("Web Components")}}

Phương thức **`setValidity()`** của giao diện {{domxref("ElementInternals")}} đặt tính hợp lệ của phần tử.

## Cú pháp

```js-nolint
setValidity(flags)
setValidity(flags, message)
setValidity(flags, message, anchor)
```

### Tham số

- `flags` {{Optional_Inline}}
  - : Một đối tượng từ điển chứa một hoặc nhiều cờ chỉ ra trạng thái tính hợp lệ của phần tử:
    - `valueMissing`
      - : Một giá trị boolean là `true` nếu phần tử có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) nhưng không có giá trị, hoặc `false` nếu có. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
    - `typeMismatch`
      - : Một giá trị boolean là `true` nếu giá trị không theo cú pháp yêu cầu (khi [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `email` hoặc `url`), hoặc `false` nếu cú pháp đúng. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
    - `patternMismatch`
      - : Một giá trị boolean là `true` nếu giá trị không khớp với [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) đã chỉ định, và `false` nếu khớp. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
    - `tooLong`
      - : Một giá trị boolean là `true` nếu giá trị vượt quá `maxlength` được chỉ định cho các đối tượng {{domxref("HTMLInputElement")}} hoặc {{domxref("HTMLTextAreaElement")}}, hoặc `false` nếu độ dài nhỏ hơn hoặc bằng độ dài tối đa. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
    - `tooShort`
      - : Một giá trị boolean là `true` nếu giá trị không đáp ứng `minlength` được chỉ định cho các đối tượng {{domxref("HTMLInputElement")}} hoặc {{domxref("HTMLTextAreaElement")}}, hoặc `false` nếu độ dài lớn hơn hoặc bằng độ dài tối thiểu. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
    - `rangeUnderflow`
      - : Một giá trị boolean là `true` nếu giá trị nhỏ hơn giá trị tối thiểu được chỉ định bởi thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min), hoặc `false` nếu lớn hơn hoặc bằng giá trị tối thiểu. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
    - `rangeOverflow`
      - : Một giá trị boolean là `true` nếu giá trị lớn hơn giá trị tối đa được chỉ định bởi thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max), hoặc `false` nếu nhỏ hơn hoặc bằng giá trị tối đa. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
    - `stepMismatch`
      - : Một giá trị boolean là `true` nếu giá trị không phù hợp với các quy tắc được xác định bởi thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) (tức là, không chia hết cho giá trị bước), hoặc `false` nếu phù hợp. Nếu `true`, phần tử khớp với các lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
    - `badInput`
      - : Một giá trị boolean là `true` nếu người dùng đã cung cấp đầu vào mà trình duyệt không thể chuyển đổi.
    - `customError`
      - : Một giá trị boolean cho biết liệu thông báo tính hợp lệ tùy chỉnh của phần tử có được đặt thành chuỗi không rỗng bằng cách gọi phương thức {{domxref('HTMLInputElement.setCustomValidity', 'setCustomValidity()')}} của phần tử hay không.

    > [!NOTE]
    > Để đặt tất cả các cờ thành `false`, cho biết phần tử này vượt qua tất cả xác thực ràng buộc, hãy truyền vào một đối tượng rỗng `{}`. Trong trường hợp này, bạn không cần truyền thêm `message`.

- `message` {{Optional_Inline}}
  - : Một chuỗi chứa thông báo, sẽ được đặt nếu bất kỳ `flags` nào là `true`. Tham số này chỉ là tùy chọn nếu tất cả `flags` đều là `false`.
- `anchor` {{Optional_Inline}}
  - : Một {{domxref("HTMLElement")}} mà tác nhân người dùng có thể sử dụng để báo cáo các vấn đề với lần gửi biểu mẫu này.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không có thuộc tính `formAssociated` được đặt thành `true`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu một hoặc nhiều `flags` là `true`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu `anchor` được cung cấp, nhưng anchor không phải là phần tử con bao gồm bóng của phần tử.

## Ví dụ

Trong ví dụ sau, `setValidity` được gọi với tham số `flags` rỗng để chỉ ra rằng phần tử đáp ứng các quy tắc xác thực ràng buộc.

```js
this.internals_.setValidity({});
```

Trong ví dụ sau, `setValidity` được gọi với cờ `valueMissing` được đặt thành `true`. Khi đó tham số `message` cũng phải được truyền kèm thông báo.

```js
this.internals_.setValidity({ valueMissing: true }, "my message");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
