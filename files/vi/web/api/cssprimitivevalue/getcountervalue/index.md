---
title: "CSSPrimitiveValue: getCounterValue() method"
short-title: getCounterValue()
slug: Web/API/CSSPrimitiveValue/getCounterValue
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSPrimitiveValue.getCounterValue
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Phương thức **`getCounterValue()`** của giao diện {{domxref("CSSPrimitiveValue")}} dùng để lấy giá trị [counter](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters). Nếu giá trị CSS này không chứa giá trị counter, một {{domxref("DOMException")}} sẽ được ném ra. Việc sửa đổi thuộc tính style tương ứng có thể được thực hiện bằng giao diện {{domxref("Counter")}}.

> [!NOTE]
> Phương thức này là một phần của nỗ lực tạo ra CSS Object Model có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Cú pháp

```js-nolint
getCounterValue()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("Counter")}} đại diện cho giá trị counter.

### Ngoại lệ

| **Kiểu**       | **Mô tả**                                                                                                                   |
| -------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `DOMException` | Một `INVALID_ACCESS_ERR` được ném ra nếu giá trị CSS không chứa giá trị `Counter` (ví dụ: đây không phải là `CSS_COUNTER`). |

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng kể từ đó đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa.

Nó đã được thay thế bởi một [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại nhưng không tương thích, hiện đang trong lộ trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}
