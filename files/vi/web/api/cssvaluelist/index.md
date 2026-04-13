---
title: CSSValueList
slug: Web/API/CSSValueList
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.CSSValueList
---

{{APIRef("CSSOM")}}{{Deprecated_Header}}

Giao diện **`CSSValueList`** kế thừa từ giao diện {{DOMxRef("CSSValue")}} và cung cấp sự trừu tượng của một tập hợp có thứ tự các giá trị CSS.

> [!NOTE]
> Giao diện này là một phần của nỗ lực tạo ra một CSS Object Model có kiểu. Nỗ lực này đã bị bỏ dở và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn, ít được hỗ trợ hơn và được coi là thử nghiệm.

Một số thuộc tính cho phép một danh sách rỗng trong cú pháp của chúng. Trong trường hợp đó, các thuộc tính này nhận định danh `none`. Vì vậy, một danh sách rỗng có nghĩa là thuộc tính có giá trị `none`.

Các mục trong `CSSValueList` có thể truy cập thông qua chỉ mục nguyên, bắt đầu từ 0.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{DOMxRef("CSSValue")}}._

- {{DOMxRef("CSSValueList.length")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một `unsigned long` đại diện cho số lượng `CSSValue` trong danh sách.

## Phương thức phiên bản

- {{DOMxRef("CSSValueList.item()")}} {{Deprecated_Inline}}
  - : Phương thức này được sử dụng để lấy một {{DOMxRef("CSSValue")}} theo chỉ mục thứ tự. Thứ tự trong tập hợp này đại diện cho thứ tự của các giá trị trong thuộc tính kiểu CSS. Nếu chỉ mục lớn hơn hoặc bằng số lượng giá trị trong danh sách, phương thức này trả về `null`.

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi bất kỳ nỗ lực tiêu chuẩn hóa nào kể từ đó.

Nó đã được thay thế bởi [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn nhưng không tương thích, hiện đang trong tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("CSSPrimitiveValue")}}
- {{DOMxRef("CSSValue")}}
