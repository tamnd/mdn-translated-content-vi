---
title: "CSSValueList: phương thức item()"
short-title: item()
slug: Web/API/CSSValueList/item
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSValueList.item
---

{{APIRef("CSSOM")}}{{Deprecated_header}}

Phương thức **`item()`** của giao diện {{domxref("CSSValueList")}} được sử dụng để lấy một {{domxref("CSSValue")}} theo chỉ mục thứ tự.

Thứ tự trong tập hợp này đại diện cho thứ tự của các giá trị trong thuộc tính kiểu CSS. Nếu chỉ mục lớn hơn hoặc bằng số lượng giá trị trong danh sách, phương thức này trả về `null`.

> [!NOTE]
> Phương thức này là một phần của nỗ lực tạo ra một CSS Object Model có kiểu. Nỗ lực này đã bị bỏ dở và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Một `unsigned long` đại diện cho chỉ mục của giá trị CSS trong tập hợp.

### Giá trị trả về

Một đối tượng {{domxref("CSSValue")}} tại vị trí `index` trong `CSSValueList`, hoặc `null` nếu đó không phải là chỉ mục hợp lệ.

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi bất kỳ nỗ lực tiêu chuẩn hóa nào kể từ đó.

Nó đã được thay thế bởi [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn nhưng không tương thích, hiện đang trong tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}
