---
title: "CSSValueList: thuộc tính length"
short-title: length
slug: Web/API/CSSValueList/length
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSValueList.length
---

{{APIRef("CSSOM")}}{{Deprecated_header}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("CSSValueList")}} đại diện cho số lượng {{domxref("CSSValue")}} trong danh sách. Phạm vi giá trị chỉ mục hợp lệ là từ `0` đến `length-1` (bao gồm).

> [!NOTE]
> Thuộc tính này là một phần của nỗ lực tạo ra một CSS Object Model có kiểu. Nỗ lực này đã bị bỏ dở và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Giá trị

Một `unsigned long` đại diện cho số lượng {{domxref("CSSValue")}}.

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi bất kỳ nỗ lực tiêu chuẩn hóa nào kể từ đó.

Nó đã được thay thế bởi [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn nhưng không tương thích, hiện đang trong tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}
