---
title: "CSSPrimitiveValue: setStringValue() method"
short-title: setStringValue()
slug: Web/API/CSSPrimitiveValue/setStringValue
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSPrimitiveValue.setStringValue
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Phương thức **`setStringValue()`** của giao diện {{domxref("CSSPrimitiveValue")}} dùng để đặt giá trị chuỗi. Nếu thuộc tính gắn với giá trị này không chấp nhận đơn vị hoặc giá trị chuỗi đã chỉ định, giá trị sẽ không thay đổi và một {{domxref("DOMException")}} sẽ được ném ra.

> [!NOTE]
> Phương thức này là một phần của nỗ lực tạo ra CSS Object Model có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Cú pháp

```js-nolint
setStringValue(stringType, stringValue)
```

### Tham số

- `stringType`
  - : Một `unsigned short` đại diện cho kiểu của giá trị. Các giá trị có thể là:

    | Hằng số      | Mô tả                                               |
    | ------------ | --------------------------------------------------- |
    | `CSS_ATTR`   | Giá trị là hàm {{cssxref("attr", "attr()")}}.       |
    | `CSS_IDENT`  | Giá trị là một định danh.                           |
    | `CSS_STRING` | Giá trị là {{cssxref("&lt;string&gt;")}}.           |
    | `CSS_URI`    | Giá trị là {{cssxref("url_value", "&lt;url&gt;")}}. |

- `stringValue`
  - : Một chuỗi đại diện cho giá trị chuỗi mới.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị CSS không chứa giá trị chuỗi hoặc giá trị chuỗi không thể chuyển đổi sang đơn vị đã chỉ định.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính chỉ đọc.

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng kể từ đó đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa.

Nó đã được thay thế bởi một [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại nhưng không tương thích, hiện đang trong lộ trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}
