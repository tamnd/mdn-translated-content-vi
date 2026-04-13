---
title: CSSValue
slug: Web/API/CSSValue
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.CSSValue
---

{{APIRef("CSSOM")}}{{Deprecated_Header}}

Giao diện **`CSSValue`** đại diện cho giá trị tính toán hiện tại của một thuộc tính CSS.

> [!NOTE]
> Giao diện này là một phần của nỗ lực tạo ra một CSS Object Model có kiểu. Nỗ lực này đã bị bỏ dở và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Thuộc tính phiên bản

- {{DOMxRef("CSSValue.cssText")}} {{Deprecated_Inline}}
  - : Một chuỗi đại diện cho giá trị hiện tại.
- {{DOMxRef("CSSValue.cssValueType")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một `unsigned short` đại diện cho mã xác định kiểu giá trị. Các giá trị có thể là:

    | Hằng số               | Mô tả                                                                                                                                                                                            |
    | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
    | `CSS_CUSTOM`          | Giá trị là một giá trị tùy chỉnh.                                                                                                                                                                |
    | `CSS_INHERIT`         | Giá trị được kế thừa và `cssText` chứa `"inherit"`.                                                                                                                                              |
    | `CSS_PRIMITIVE_VALUE` | Giá trị là một giá trị nguyên thủy và một phiên bản của giao diện {{DOMxRef("CSSPrimitiveValue")}} có thể được lấy bằng cách sử dụng các phương thức cast cụ thể của binding trên phiên bản này. |
    | `CSS_VALUE_LIST`      | Giá trị là một danh sách `CSSValue` và một phiên bản của giao diện {{DOMxRef("CSSValueList")}} có thể được lấy bằng cách sử dụng các phương thức cast cụ thể của binding trên phiên bản này.     |

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi bất kỳ nỗ lực tiêu chuẩn hóa nào kể từ đó.

Nó đã được thay thế bởi [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn nhưng không tương thích, hiện đang trong tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("CSSPrimitiveValue")}}
- {{DOMxRef("CSSValueList")}}
