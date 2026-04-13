---
title: CSSPrimitiveValue
slug: Web/API/CSSPrimitiveValue
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.CSSPrimitiveValue
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Giao diện **`CSSPrimitiveValue`** kế thừa từ giao diện {{DOMxRef("CSSValue")}} và đại diện cho giá trị tính toán hiện tại của một thuộc tính CSS.

> [!NOTE]
> Giao diện này là một phần của nỗ lực tạo ra CSS Object Model có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

Giao diện này đại diện cho một giá trị CSS đơn lẻ. Nó có thể được sử dụng để xác định giá trị của một thuộc tính style cụ thể hiện đang được đặt trong một block hoặc để đặt rõ ràng một thuộc tính style cụ thể trong block. Một đối tượng của giao diện này có thể được lấy từ phương thức {{DOMxRef("CSSStyleDeclaration.getPropertyCSSValue()", "getPropertyCSSValue()")}} của giao diện {{DOMxRef("CSSStyleDeclaration")}}. Một đối tượng `CSSPrimitiveValue` chỉ xuất hiện trong ngữ cảnh của một thuộc tính CSS.

Việc chuyển đổi được cho phép giữa các giá trị tuyệt đối (từ milimet sang centimet, từ độ sang radian, v.v.) nhưng không phải giữa các giá trị tương đối. (Ví dụ, giá trị pixel không thể chuyển đổi sang giá trị centimet.) Giá trị phần trăm không thể chuyển đổi vì chúng tương đối so với giá trị cha (hoặc giá trị thuộc tính khác). Có một ngoại lệ cho giá trị phần trăm màu: vì giá trị phần trăm màu tương đối so với phạm vi 0-255, giá trị phần trăm màu có thể chuyển đổi thành số (xem thêm giao diện {{DOMxRef("RGBColor")}}).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("CSSValue")}}_.

- {{DOMxRef("CSSPrimitiveValue.primitiveType")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một `unsigned short` đại diện cho kiểu của giá trị. Các giá trị có thể là:

    | Hằng số          | Mô tả                                                                                                                                                      |
    | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `CSS_ATTR`       | Giá trị là hàm {{CSSxRef("attr", "attr()")}}. Giá trị có thể lấy bằng phương thức `getStringValue()`.                                                      |
    | `CSS_CM`         | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng centimet. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                        |
    | `CSS_COUNTER`    | Giá trị là hàm [counter hoặc counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters). Giá trị có thể lấy bằng phương thức `getCounterValue()`. |
    | `CSS_DEG`        | Giá trị là {{CSSxRef("&lt;angle&gt;")}} tính bằng độ. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                               |
    | `CSS_DIMENSION`  | Giá trị là {{CSSxRef("&lt;number&gt;")}} với kích thước không xác định. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                             |
    | `CSS_EMS`        | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng đơn vị em. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                       |
    | `CSS_EXS`        | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng đơn vị ex. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                       |
    | `CSS_GRAD`       | Giá trị là {{CSSxRef("&lt;angle&gt;")}} tính bằng grad. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                             |
    | `CSS_HZ`         | Giá trị là {{CSSxRef("&lt;frequency&gt;")}} tính bằng Hertz. Giá trị có thể lấy bằng phương thức getFloatValue.                                            |
    | `CSS_IDENT`      | Giá trị là một định danh. Giá trị có thể lấy bằng phương thức `getStringValue()`.                                                                          |
    | `CSS_IN`         | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng inch. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                            |
    | `CSS_KHZ`        | Giá trị là {{CSSxRef("&lt;frequency&gt;")}} tính bằng Kilohertz. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                    |
    | `CSS_MM`         | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng milimet. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                         |
    | `CSS_MS`         | Giá trị là {{CSSxRef("&lt;time&gt;")}} tính bằng miligiây. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                          |
    | `CSS_NUMBER`     | Giá trị là {{CSSxRef("&lt;number&gt;")}} đơn giản. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                                  |
    | `CSS_PC`         | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng pica. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                            |
    | `CSS_PERCENTAGE` | Giá trị là {{CSSxRef("&lt;percentage&gt;")}}. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                                       |
    | `CSS_PT`         | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng điểm. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                            |
    | `CSS_PX`         | Giá trị là {{CSSxRef("&lt;length&gt;")}} tính bằng pixel. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                           |
    | `CSS_RAD`        | Giá trị là {{CSSxRef("&lt;angle&gt;")}} tính bằng radian. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                           |
    | `CSS_RECT`       | Giá trị là hàm {{CSSxRef("shape", "rect()", "#Syntax")}}. Giá trị có thể lấy bằng phương thức `getRectValue()`.                                            |
    | `CSS_RGBCOLOR`   | Giá trị là {{CSSxRef("&lt;color&gt;")}}. Giá trị có thể lấy bằng phương thức `getRGBColorValue()`.                                                         |
    | `CSS_S`          | Giá trị là {{CSSxRef("&lt;time&gt;")}} tính bằng giây. Giá trị có thể lấy bằng phương thức `getFloatValue()`.                                              |
    | `CSS_STRING`     | Giá trị là {{CSSxRef("&lt;string&gt;")}}. Giá trị có thể lấy bằng phương thức `getStringValue()`.                                                          |
    | `CSS_UNKNOWN`    | Giá trị không phải là giá trị CSS2 được nhận dạng. Giá trị chỉ có thể lấy bằng thuộc tính {{DOMxRef("CSSValue.cssText", "cssText")}}.                      |
    | `CSS_URI`        | Giá trị là {{cssxref("url_value", "&lt;url&gt;")}}. Giá trị có thể lấy bằng phương thức `getStringValue()`.                                                |

## Phương thức phiên bản

- {{DOMxRef("CSSPrimitiveValue.getCounterValue()")}} {{Deprecated_Inline}}
  - : Phương thức này dùng để lấy giá trị [counter](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters). Nếu giá trị CSS này không chứa giá trị counter, một {{DOMxRef("DOMException")}} sẽ được ném ra. Việc sửa đổi thuộc tính style tương ứng có thể được thực hiện bằng giao diện {{DOMxRef("Counter")}}.
- {{DOMxRef("CSSPrimitiveValue.getFloatValue()")}} {{Deprecated_Inline}}
  - : Phương thức này dùng để lấy giá trị float theo đơn vị đã chỉ định. Nếu giá trị CSS này không chứa giá trị float hoặc không thể chuyển đổi sang đơn vị đã chỉ định, một {{DOMxRef("DOMException")}} sẽ được ném ra.
- {{DOMxRef("CSSPrimitiveValue.getRGBColorValue()")}} {{Deprecated_Inline}}
  - : Phương thức này dùng để lấy giá trị màu RGB. Nếu giá trị CSS này không chứa giá trị màu RGB, một {{DOMxRef("DOMException")}} sẽ được ném ra. Việc sửa đổi thuộc tính style tương ứng có thể được thực hiện bằng giao diện {{DOMxRef("RGBColor")}}.
- {{DOMxRef("CSSPrimitiveValue.getRectValue()")}} {{Deprecated_Inline}}
  - : Phương thức này dùng để lấy giá trị Rect. Nếu giá trị CSS này không chứa giá trị rect, một {{DOMxRef("DOMException")}} sẽ được ném ra. Việc sửa đổi thuộc tính style tương ứng có thể được thực hiện bằng giao diện {{DOMxRef("Rect")}}.
- {{DOMxRef("CSSPrimitiveValue.getStringValue()")}} {{Deprecated_Inline}}
  - : Phương thức này dùng để lấy giá trị chuỗi. Nếu giá trị CSS không chứa giá trị chuỗi, một {{DOMxRef("DOMException")}} sẽ được ném ra.
- {{DOMxRef("CSSPrimitiveValue.setFloatValue()")}} {{Deprecated_Inline}}
  - : Phương thức đặt giá trị float với đơn vị đã chỉ định. Nếu thuộc tính gắn với giá trị này không chấp nhận đơn vị hoặc giá trị float đã chỉ định, giá trị sẽ không thay đổi và một {{DOMxRef("DOMException")}} sẽ được ném ra.
- {{DOMxRef("CSSPrimitiveValue.setStringValue()")}} {{Deprecated_Inline}}
  - : Phương thức đặt giá trị chuỗi với đơn vị đã chỉ định. Nếu thuộc tính gắn với giá trị này không chấp nhận đơn vị hoặc giá trị chuỗi đã chỉ định, giá trị sẽ không thay đổi và một {{DOMxRef("DOMException")}} sẽ được ném ra.

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng kể từ đó đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa.

Nó đã được thay thế bởi một [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại nhưng không tương thích, hiện đang trong lộ trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("CSSValue")}}
- {{DOMxRef("CSSValueList")}}
